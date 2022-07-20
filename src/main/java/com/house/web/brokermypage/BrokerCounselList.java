package com.house.web.brokermypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/web/brokermypage/brokerCounselList")
public class BrokerCounselList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		
		
		ArrayList<BrokerCounselDTO> list = dao.getCousel(id);
		
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokermypage/brokerCounselList.jsp");

		dispatcher.forward(req, resp);

	}
}
