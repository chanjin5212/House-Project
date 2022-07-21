package com.house.domain.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/damin/admin/adminLogout")
public class AdminLogout extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
HttpSession session = req.getSession();
		
		
		session.removeAttribute("adminAuth");
		
		
		if(session.getAttribute("adminAuth").equals(null)) {
			
			resp.sendRedirect("/house/main");
		}
		
		
//		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/damin/admin/adminLogout.jsp");
//
//		dispather.forward(req, resp);

	}
}
