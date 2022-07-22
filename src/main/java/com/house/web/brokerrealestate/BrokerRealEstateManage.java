package com.house.web.brokerrealestate;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/brokerrealestate/brokerRealEstateManage")
public class BrokerRealEstateManage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		BrokerRealEstateDAO dao = new BrokerRealEstateDAO();
		
		ArrayList<BrokerRealEstateDTO> list = dao.getMyList(id);
		

		
		String count = dao.getListCount(id);
		
		
		req.setAttribute("count", count);
		
		req.setAttribute("list", list);
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokerrealestate/brokerRealEstateManage.jsp");

		dispatcher.forward(req, resp);
	}

}