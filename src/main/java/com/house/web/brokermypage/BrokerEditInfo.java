package com.house.web.brokermypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/web/brokermypage/brokerEditInfo")

//중개사개인정보페이지
public class BrokerEditInfo extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//세션 가져오기
		HttpSession session = req.getSession();
		
		//System.out.println(session.getAttribute("auth"));
		String id = (String) session.getAttribute("auth");
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		BrokerLoginInfoDTO dto = dao.getLogInfo(id);
		
		
		//전화번호, 이메일, 주소, 중개사 정보 가져오기
		
		System.out.println(dto);
		
		req.setAttribute("dto", dto);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokermypage/brokerEditInfo.jsp");

		dispatcher.forward(req, resp);

	}
}

