package com.house.web.brokermypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.web.brokeralarm.ContractDocDto;

@WebServlet("/web/brokermypage/showContractDoc")
public class ShowContractDoc extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		//contractdoc seq 계약서 번호
		
		
		//String contractSeq = req.getParameter("contractseq");
		String contractSeq = req.getParameter("contractDocSeq");
		String category = req.getParameter("category");
		
		
		
		System.out.println(contractSeq);
		System.out.println(category);
		
		req.setAttribute("contractSeq", contractSeq);
		req.setAttribute("category", category);
		
		
		
		//String realestateSeq = req.getParameter("realestateSeq");
		
		System.out.println(contractSeq);
		System.out.println(category);
		//System.out.println(realestateSeq);
		
		
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		//계약서 가져오기
		ContractDocDto dto = dao.getContractDocDone(contractSeq);
		
		//잔금계산
		String balance = (Integer.parseInt(dto.getPrice())-Integer.parseInt(dto.getDownpayment())) + "";
		dto.setBalance(balance);
		
		System.out.println(dto);
		System.out.println(dto.getMainUse());
		System.out.println(dto.getPrice());
		
		req.setAttribute("contractSeq", contractSeq);
		req.setAttribute("category", category);
		
		req.setAttribute("dto", dto);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokermypage/showContractDoc.jsp");

		dispatcher.forward(req, resp);

	}
}

