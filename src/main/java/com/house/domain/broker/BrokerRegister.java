package com.house.domain.broker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/domain/broker/brokerRegister")
public class BrokerRegister extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		
		
		String firmName = req.getParameter("firmName");
		String firmNum = req.getParameter("firmNum");
		String firmAddress = req.getParameter("firmAddress");
		String representName = req.getParameter("representName");
		
		System.out.println(firmName);
		System.out.println(firmNum);
		System.out.println(firmAddress);
		System.out.println(representName);
		
		BrokerDTO dto = new BrokerDTO();
		
		dto.setFirmName(firmName);
		dto.setFirmNum(firmNum);
		dto.setFirmAddress(firmAddress);
		dto.setRepresentName(representName);
		
		
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/broker/brokerRegister.jsp");

		dispather.forward(req, resp);

	}
}
