package com.house.web.userrealestate;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//유저 상담페이지
@WebServlet("/web/userCounsel")
public class UserCounsel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String image = req.getParameter("image");
		String coordinateX = req.getParameter("coordinateX");
		String coordinateY = req.getParameter("coordinateY");
		String status = req.getParameter("status");
		
		//매물번호
		req.setAttribute("seq", seq);
		req.setAttribute("image", image);
		req.setAttribute("coordinateX", coordinateX);
		req.setAttribute("coordinateY", coordinateY);
		req.setAttribute("status", status);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/user/goods/userCounsel.jsp");
		dispatcher.forward(req, resp);
	}
	
}
