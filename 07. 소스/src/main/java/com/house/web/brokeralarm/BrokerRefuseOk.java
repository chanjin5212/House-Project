package com.house.web.brokeralarm;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.web.brokermypage.BrokerMyPageDAO;

@WebServlet("/web/brokeralarm/brokerRefuseOk")
public class BrokerRefuseOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		
		
		
		String contractSeq = req.getParameter("contractSeq");
		String refuseContent = req.getParameter("refuseContent");
		
		System.out.println("거절 번호:" + contractSeq);
		System.out.println("거절 내용:" + refuseContent);
		
		
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("contractSeq", contractSeq);
		map.put("refuseContent", refuseContent);
		
		int result1 = dao.writeRefuse(map);
		
		int result2 = 0;
		if(result1 > 0) {
			
			//사유 작성되면 상태 거절로 바꾸기
			result2 = dao.refuseContract(contractSeq);
			
		}
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		
		PrintWriter writer = resp.getWriter();
		
		writer.printf("{\"result2\":\"%d\"}", result2);
		
		
		/*
		 * RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/WEB-INF/views/path/name.jsp");
		 * 
		 * dispatcher.forward(req, resp);
		 */

	}
}
