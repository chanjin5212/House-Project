package com.house.web.brokeralarm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.web.brokermypage.BrokerMyPageDAO;

@WebServlet("/web/brokeralarm/brokweWriteContractOk")
public class BrokerWriteContractOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		//toji=%EB%8C%80&downpayment=&balanceDate=&borrowedMoney=&endDate=&contractDate=
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		String category = req.getParameter("category");
		String contractSeq = req.getParameter("contractSeq");
		String realestateSeq = req.getParameter("realestateSeq");
		String mainUse = req.getParameter("mainUse");
		String userId = req.getParameter("userId");
		String brokerId = req.getParameter("brokerId");
		String brokerName = req.getParameter("brokerName");
		String ownerName = req.getParameter("ownerName");
		String userName = req.getParameter("userName");
		
		System.out.println("계약요청 번호: " + contractSeq);
		
		//tblContractDoc에 insert
		String toji = req.getParameter("toji");
		String downpayment = req.getParameter("downpayment");
		String balanceDate = req.getParameter("balanceDate");
		String contractDate = req.getParameter("contractDate");
		
		
		
		//tblMonthly, tblCharter에 insert(월세, 전세)
		String endDate = req.getParameter("endDate");
		//tblMonthly에 insert
		String borrowedMoney = req.getParameter("borrowedMoney");
		
		//tblTrading에 insert
		String loanAmount = req.getParameter("loanAmount"); //융자금
		String rentalDeposit = req.getParameter("rentalDeposit"); //임대보증금
		
		ContractDocDto dto = new ContractDocDto();
		
		dto.setUserId(userId);
		dto.setBrokerId(brokerId);
		
		dto.setContractSeq(contractSeq);
		dto.setCategory(category);
		dto.setRealestateSeq(realestateSeq);
		
		dto.setMainUse(mainUse);
		dto.setToji(toji);
		dto.setDownpayment(downpayment);
		dto.setBalanceDate(balanceDate);
		dto.setContractDate(contractDate);
		
		dto.setEndDate(endDate);
		dto.setBorrowedMoney(borrowedMoney);
		
		dto.setLoanAmount(loanAmount);
		dto.setRentalDeposit(rentalDeposit);

		
		System.out.println("dto : " + dto);
		
		
		int result1 = 0;
		int result2 = 0;
		int result3 = 0;
		
		result1 = dao.insertDoc(dto);
		
		if(result1 > 0) {
			
			result2= dao.insertCategory(dto);
			
			if(result2 > 0) {
				 result3 = dao.updateRequest(contractSeq);
				
			}
			
		}
		
		
		
		
		
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		writer.print("{");
		writer.printf("\"result1\":\"%s\",",result1);
		writer.printf("\"result2\":\"%s\",",result2);
		writer.printf("\"result3\":\"%s\",",result3);
		writer.printf("\"ownerName\":\"%s\",",ownerName);
		writer.printf("\"userName\":\"%s\",",userName);
		writer.printf("\"brokerName\":\"%s\"",brokerName);
		writer.print("");
		writer.print("}");
		
		
		writer.close();
		
		/*
		 * RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/WEB-INF/views/web/name.jsp");
		 * 
		 * dispatcher.forward(req, resp);
		 */

	}
}

