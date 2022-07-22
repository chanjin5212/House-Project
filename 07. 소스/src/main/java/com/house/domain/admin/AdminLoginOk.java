package com.house.domain.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/domain/admin/adminLoginOk")
public class AdminLoginOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		AdminDTO dto = new AdminDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		AdminDAO dao = new AdminDAO();
		
		int result = dao.login(dto);
		
		if(result == 0) {
			//인증 티켓 발급
			
			session.setAttribute("adminAuth", id);
		
		}
		
		
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/admin/adminLoginOk.jsp");

		dispather.forward(req, resp);

	}
}
