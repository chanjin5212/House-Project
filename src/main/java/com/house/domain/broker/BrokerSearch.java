package com.house.domain.broker;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/domain/broker/brokerSearch")
public class BrokerSearch extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		String query = req.getParameter("query");
		
		OpenAPIBrokerDAO dao = new OpenAPIBrokerDAO();
		
		HashMap<String, String> map = new HashMap<String,String>();
		map.put("query", query);
		
		
		ResultAPIBrokerDTO rdto = dao.search(map);
		
		if(rdto!=null) {
			rdto.setQuery(query);
		
			req.setAttribute("rdto", rdto);
		}
			
			
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/broker/brokerSearch.jsp");

		dispather.forward(req, resp);

	}
}
