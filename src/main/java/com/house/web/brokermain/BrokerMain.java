package com.house.web.brokermain;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/brokermain/brokerMain")
public class BrokerMain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		BrokerMainDAO dao = new BrokerMainDAO();
		
		ArrayList<BrokerMainDTO> list = dao.getList();
		
		BrokerMainDTO dto = dao.getCount();
		
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/brokermain/brokerMain.jsp");

		dispatcher.forward(req, resp);
	}

}
