package com.house.domain.sign;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/domain/sign/loginOk")
public class LoginOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		HttpSession session = req.getSession();
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		
		SignDTO dto = new SignDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		
		SignDAO dao = new SignDAO();
		
		SignDTO result = dao.login(dto);
		
		
		if(result != null) {
			//인증 티켓 발급
			session.setAttribute("auth", id);
			
			session.setAttribute("name", result.getName());
			session.setAttribute("lv", result.getLv());
			
			
		}
		
		
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/sign/loginOk.jsp");

		dispather.forward(req, resp);

	}
}
