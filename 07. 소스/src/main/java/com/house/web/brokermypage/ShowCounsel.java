package com.house.web.brokermypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/brokermypage/showCounsel")
//상담 상세내용  팝업창
public class ShowCounsel extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		
		System.out.println(seq);
		
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		BrokerCounselDTO dto = dao.getCouselDetail(seq);
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokermypage/showCounsel.jsp");

		dispatcher.forward(req, resp);

	}
}

