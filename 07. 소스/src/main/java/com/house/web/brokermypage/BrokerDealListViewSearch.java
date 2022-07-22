package com.house.web.brokermypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//중개사 거래목록 검색어받아서 결과 출력해주는 서블릿
@WebServlet("/web/brokermypage/brokerDealListViewSearch")
public class BrokerDealListViewSearch extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//date, category, word
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		String date = req.getParameter("date");
		String category = req.getParameter("category");
		String word = req.getParameter("word");
		
		//System.out.println("date:"  + date);
		System.out.println(category);
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("id", id);
		map.put("date", date);
		map.put("category", category);
		map.put("word", word);
		
		//System.out.println(map.get("category"));
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		ArrayList<BrokerDealListViewDTO> list = dao.getDealListSearch(map);
		
		System.out.println(list);
		
		
		//json으로 값 보내기
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		
		String temp = "";
		
		temp += "[";
		
		for (BrokerDealListViewDTO dto : list) {
			temp += "{";
			temp += String.format("\"seq\": %s,", dto.getContractSeq());
			temp += String.format("\"contractDocSeq\": %s,", dto.getContractDocSeq());
			temp += String.format("\"deposit\": \"%s\",", dto.getDeposit());
			temp += String.format("\"price\": %s,", dto.getPrice());
			temp += String.format("\"category\": \"%s\",", dto.getContractCategory());
			temp += String.format("\"addr\": \"%s\",", dto.getRealestateAddr());
			temp += String.format("\"realestateSeq\": \"%s\",", dto.getRealEstateSeq());
			temp += String.format("\"reviewSeq\": \"%s\",", dto.getReviewSeq());
			temp += String.format("\"date\": \"%s\"", dto.getContractDate());
			temp += "},";
		}
		
		if (list.size() > 0) {
			temp = temp.substring(0, temp.length() - 1);
		}
		
		temp += "]";
		
		System.out.println(temp);
		
		writer.print(temp);
		
		writer.close();		
	}
		
		
		
//		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/views/web/brokermypage/name.jsp");
//
//		dispatcher.forward(req, resp);

}


