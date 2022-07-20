package com.house.web.brokeralarm;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.house.web.brokermypage.BrokerDealListViewDTO;
import com.house.web.brokermypage.BrokerMyPageDAO;

@WebServlet("/web/brokeralarm/brokerContractRequest")
public class BrokerContractRequest extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("auth");
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		
		
		ArrayList<BrokerDealListViewDTO> list = dao.getContractList(id);
		
		System.out.println(list);
		
		
		
		req.setAttribute("list", list);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokeralarm/brokerContractRequest.jsp");

		dispatcher.forward(req, resp);

	}
}

