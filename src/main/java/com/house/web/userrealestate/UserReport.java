package com.house.web.userrealestate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/userReport")
public class UserReport extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String coordinateX = req.getParameter("coordinateX");
		String coordinateY = req.getParameter("coordinateY");
		
		//매물번호
		req.setAttribute("seq", seq);
		req.setAttribute("coordinateX", coordinateX);
		req.setAttribute("coordinateY", coordinateY);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/user/goods/userReport.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
