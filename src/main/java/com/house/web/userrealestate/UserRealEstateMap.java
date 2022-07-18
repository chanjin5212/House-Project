package com.house.web.userrealestate;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//user 메인 지도화면
@WebServlet("/web/userRealEstateMap")
public class UserRealEstateMap extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/user/goods/userRealEstateMap.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
