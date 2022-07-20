package com.house.web.brokermypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/brokermypage/showContractDoc")
public class ShowContractDoc extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		//계약서 seq
		String contractSeq = req.getParameter("contractseq");
		String category = req.getParameter("category");
		
		System.out.println(contractSeq);
		System.out.println(category);
		
		req.setAttribute("contractSeq", contractSeq);
		req.setAttribute("category", category);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokermypage/showContractDoc.jsp");

		dispatcher.forward(req, resp);

	}
}

