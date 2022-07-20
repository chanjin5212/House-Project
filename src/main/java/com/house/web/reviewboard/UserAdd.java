package com.house.web.reviewboard;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/reviewboard/userAdd")
public class UserAdd extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		int check = 0;
		UserReviewBoardDAO dao = new UserReviewBoardDAO();
		if (id != null) {
			check = dao.getMember(id);
		}
		
		ArrayList<UserReviewBoardDTO> addressList = dao.getAddress(id); 
		
		int count = dao.getAddressCount(id);
		
		if (count == 0) {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('후기를 남길 수 있는 매물이 없습니다.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
			
		}
		
		req.setAttribute("addressList", addressList);
		req.setAttribute("check", check);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/reviewboard/userAdd.jsp");

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
		
		String choice = multi.getParameter("choice");
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
		dto.setChoice(choice);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setCleanStar(cleanStar);
		dto.setPriceStar(priceStar);
		dto.setLocationStar(locationStar);
		dto.setOptionStar(optionStar);
		dto.setId(id);
		
		UserReviewBoardDAO dao = new UserReviewBoardDAO();
		
		
		int result = dao.addPost(dto);
		String maxSeq = dao.getSeq();
		
		//사진
		for (String name : filename) {
			dao.setPicture(name, maxSeq);
		}
		
		if (result == 1) {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('글을 등록하였습니다.');");
            writer.println("location.href='/house/reviewboard/userReviewBoardView'");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
			
		} else {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('글 등록을 실패하셨습니다.');");
            writer.println("location.href='/house/reviewboard/userReviewBoardView'");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		
	
	}

}