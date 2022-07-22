package com.house.web.reviewboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/reviewboard/userEdit")
public class UserEdit extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		int check = 0;
		UserReviewBoardDAO dao = new UserReviewBoardDAO();
		if (id != null) {
			check = dao.getMember(id);
		}
		String seq = req.getParameter("seq");
		ArrayList<UserReviewBoardDTO> list = dao.getImgSeq(seq);
		
		UserReviewBoardDTO dto = dao.getPost(seq);
		
		req.setAttribute("list", list);
		req.setAttribute("check", check);
		req.setAttribute("dto", dto);
		req.setAttribute("seq", seq);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/reviewboard/userEdit.jsp");

		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		String path = req.getRealPath("/files");
		
		int size = 1024 * 1024 * 100;
		
		String txt = ""; 		
		String num = ""; 		
		
		ArrayList<String> filename = new ArrayList<String>();	
		ArrayList<String> orgfilename = new ArrayList<String>();
		
		MultipartRequest multi = null;
		
		try {
			
			multi = new MultipartRequest(
				  	req, 
				  	path,	 
				  	size, 	 
				  	"UTF-8", 
				  	new DefaultFileRenamePolicy() 
				 );
			
			txt = multi.getParameter("txt");
			num = multi.getParameter("num");
			
			//첨부파일들
			//<input type="file" name="attach1">
			//<input type="file" name="attach2">
			//<input type="file" name="attach3">
			
			Enumeration e = multi.getFileNames();
			
			while(e.hasMoreElements()) {
				String file = (String)e.nextElement();
				//System.out.println(file);
				
				//하드에 저장된 이름
				filename.add(multi.getFilesystemName(file));
				
				//사용자가 올린 이름
				orgfilename.add(multi.getOriginalFileName(file));
			}
			
			
			
		} catch(Exception e) {
			System.out.println(e);
		}
		String seq = multi.getParameter("seq");
		UserReviewBoardDAO dao = new UserReviewBoardDAO();
		if (filename.get(0) != null) {
			for (String name : filename) {
				dao.setPicture(name, seq);
			}			
		}
		
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		String cleanStar = multi.getParameter("cleanStar");
		String priceStar = multi.getParameter("priceStar");
		String locationStar = multi.getParameter("locationStar");
		String optionStar = multi.getParameter("optionStar");
		
		if (cleanStar == null) cleanStar = "0";
		if (priceStar == null) priceStar = "0";
		if (locationStar == null) locationStar = "0";
		if (optionStar == null) optionStar = "0";
		
		UserReviewBoardDTO dto = new UserReviewBoardDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCleanStar(cleanStar);
		dto.setPriceStar(priceStar);
		dto.setLocationStar(locationStar);
		dto.setOptionStar(optionStar);
		dto.setId(id);
		
		int result = dao.updatePost(dto, seq);
		
		if (result == 1) {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            String location = String.format("location.href='/house/reviewboard/userReviewBoardDetail?seq=%s'", seq);
            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('글을 수정하였습니다.');");
            writer.println(location);
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
			
		} else {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();
            String location = String.format("location.href='/house/reviewboard/userReviewBoardDetail?seq=%s'", seq);
            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('글 수정에 실패하셨습니다.');");
            writer.println(location);
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		
	
	}

}