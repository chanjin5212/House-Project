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

@WebServlet("/web/brokermypage/brokerDealListView")
public class BrokerDealListView extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//거래목록 가져오기
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("auth");
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		
		
		ArrayList<BrokerDealListViewDTO> list = dao.getDealList(id);
		
		//System.out.println(list);
		
		
		
		
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokermypage/brokerDealListView.jsp");

		dispatcher.forward(req, resp);

	}
}

