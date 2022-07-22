package com.house.web.userrealestate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/userMoveIn")
public class UserMoveIn extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String realEstateSeq = req.getParameter("seq");
		String id = req.getParameter("id");
		String checkInDate = req.getParameter("date");
		
		UserMoveInDAO userMoveInDAO = new UserMoveInDAO();
		UserMoveInDTO userMoveInDTO = new UserMoveInDTO();
		userMoveInDTO.setRealEstateSeq(realEstateSeq);
		userMoveInDTO.setId(id);
		userMoveInDTO.setCheckInDate(checkInDate);
		
		int result = userMoveInDAO.addUserMoveIn(userMoveInDTO);
	
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"result\": %d }", result);
		writer.close();
	}
	
}
