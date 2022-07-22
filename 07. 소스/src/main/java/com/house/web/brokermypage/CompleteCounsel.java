package com.house.web.brokermypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/brokermypage/completeCounsel")
public class CompleteCounsel extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		System.out.println(seq);
		
		
		//상담완료 상태로 바꾸기
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		int result = dao.completeCounsel(seq);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("{");
		writer.printf("\"result\":\"%s\"", result);
		writer.print("}");
		
		writer.close();
		
		/*
		 * RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/WEB-INF/views/web/brokermypage/.jsp");
		 * 
		 * dispatcher.forward(req, resp);
		 */

	}
}

