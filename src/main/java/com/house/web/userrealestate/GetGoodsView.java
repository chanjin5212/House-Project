package com.house.web.userrealestate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/getGoodsView")
public class GetGoodsView extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//받은데이터 인코딩
		req.setCharacterEncoding("UTF-8");
		
		UserGoodsDAO userGoodsDAO = new UserGoodsDAO();
		UserGoodsDTO userGoodsDTO = userGoodsDAO.getGoodsView(req.getParameter("seq"));
		
		//결과값이 있는경우
		if(userGoodsDTO != null) {
			//보낼데이터 인코딩
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("application/json");
			
			PrintWriter writer = resp.getWriter();
			writer.close();		
		} else {
			//없는경우
		}
		
		
	}
	
}
