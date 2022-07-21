package com.house.web.brokeralarm;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.web.brokermypage.BrokerMyPageDAO;

@WebServlet("/web/brokeralarm/brokerWriteContractDoc")
public class BrokerWriteContractDoc extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

			req.setCharacterEncoding("UTF-8");
		
				//계약요청 seq
				String contractSeq = req.getParameter("contractseq");
				String category = req.getParameter("category");
				String realestateSeq = req.getParameter("realestateSeq");
				
				System.out.println(contractSeq);
				System.out.println(category);
				System.out.println(realestateSeq);
				
				
				//첫번째 테이블 채우기
				// 소재지(매물주소), 토지
				BrokerMyPageDAO dao = new BrokerMyPageDAO();
				
				ContractDocDto dto = dao.getContractDoc(contractSeq);
				
				System.out.println(dto);
				System.out.println(dto.getMainUse());
				System.out.println(dto.getPrice());
				
				req.setAttribute("contractSeq", contractSeq);
				req.setAttribute("category", category);
				req.setAttribute("realestateSeq", realestateSeq);
				req.setAttribute("dto", dto);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokeralarm/brokerWriteContractDoc.jsp");

		dispatcher.forward(req, resp);

	}
}

