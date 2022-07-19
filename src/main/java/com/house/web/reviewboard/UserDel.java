package com.house.web.reviewboard;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/reviewboard/userDel")
public class UserDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		String seq = req.getParameter("seq");
		
		if (id == null) {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('삭제 권한이 없습니다.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		UserReviewBoardDAO dao = new UserReviewBoardDAO();
		
		
		int result = dao.getUser(seq, id);
		
		if (result == 1) {
			
			result = dao.delPost(seq);
			
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('삭제 완료되었습니다.');");
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
            writer.println("alert('삭제 권한이 없습니다.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		
		
	}

}
