package com.house.web.usermypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/web/usermypage/userDeactive")
public class UserDeactive extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("auth");
		
		
		UserMyPageDAO dao = new UserMyPageDAO();
		
		int result = dao.userDeactive(id);
		
		
		
		if(result > 0) {
			
			//탈퇴 성공
			
			session.removeAttribute("auth");
			session.removeAttribute("name");
			session.removeAttribute("lv");
			
			resp.sendRedirect("/house/main");
			
		} else {
			
			//실패
			//인코딩
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html");
			
			PrintWriter writer = resp.getWriter();
			
			
			writer.println("<html>");
			writer.println("<body>");
			writer.println("<script>");
			writer.println("alert('예기치 못한 오류로 탙퇴를 실패하였습니다.');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.println("</body>");
			writer.println("</html>");
			
			writer.close();
			
		}
		


	}
}

