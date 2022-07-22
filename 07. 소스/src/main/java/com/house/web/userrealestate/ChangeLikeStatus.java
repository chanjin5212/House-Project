package com.house.web.userrealestate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/changeLikeStatus")
public class ChangeLikeStatus extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String seq = req.getParameter("seq");
		String id = req.getParameter("id");
		String like = req.getParameter("like");
		int result = 0;
		
		UserLikeDAO userLikeDAO = new UserLikeDAO();
		UserLikeDTO userLikeDTO = new UserLikeDTO();
		userLikeDTO.setSeq(seq);
		userLikeDTO.setId(id);
		
		
		if("1".equals(like)) {
			//삭제
			result = userLikeDAO.deleteLikeStatus(userLikeDTO);
		} else if ("0".equals(like)) {
			//추가
			result = userLikeDAO.addLikeStatus(userLikeDTO);
		}	
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"result\": %d }", result);
		writer.close();
		
		
	}
	
}
