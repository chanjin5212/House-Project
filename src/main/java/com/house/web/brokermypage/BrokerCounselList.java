package com.house.web.brokermypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/web/brokermypage/brokerCounselList")
public class BrokerCounselList extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		
		ArrayList<BrokerCounselDTO> list = dao.getCousel(id);
		
		int num = 0;
		String star = "";
		int total = 0;
		String avg = "";
		
		
		
		for(BrokerCounselDTO dto : list) {
			
			star = "";
			System.out.println( "별 갯수 : " + dto.getStar());
			
			num = Integer.parseInt(dto.getStar());  //별 갯수 int로 변환
			
			for(int i=0; i< num; i++) {  //별 갯수만큼 
				
				star += "★";
				
				
			}
			
			for(int i=0; i< 5 - num; i++) {  //남은 별 갯수 만큼 
				
				star += "☆";
				
				
			}
			
			total += num;
			System.out.println("total:" + total);
			dto.setStar(star);
			
			
		}
		
		//총점평균구하기
		avg = String.format("%.1f", (double)total/list.size());
		
		System.out.println("total :" + String.format("%.1f", (double)total/list.size() ));
		
		System.out.println(list);
		
		
		req.setAttribute("list", list);
		req.setAttribute("avg", avg);
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokermypage/brokerCounselList.jsp");

		dispatcher.forward(req, resp);

	}
}
