package com.house.web.userrealestate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/getLikeStatus")
public class GetLikeStatus extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String id = req.getParameter("id");
		String seq = req.getParameter("seq");
		
		UserLikeDTO userLikeDTO = new UserLikeDTO();
		userLikeDTO.setSeq(seq);
		userLikeDTO.setId(id);
		
		UserLikeDAO userLikeDAO = new UserLikeDAO();
		int result = userLikeDAO.getLikeStatus(userLikeDTO);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"result\": %d }", result);
		writer.close();
		
	}
	
}
