package com.house.web.userrealestate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/getGoodsImg")
public class GetGoodsImg extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		
		UserGoodsDAO dao = new UserGoodsDAO();
		String img = dao.getGoodsImg(seq);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		// { "img": "%s" }
		
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"img\": \"%s\" }", img);
		writer.close();
		
	}
	
}
