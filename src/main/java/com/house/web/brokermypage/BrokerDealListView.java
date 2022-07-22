package com.house.web.brokermypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/web/brokermypage/brokerDealListView")
public class BrokerDealListView extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		//거래목록 가져오기
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("auth");
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		
		//페이징
		
			HashMap<String,String> map = new HashMap<String,String>();
				
				int nowPage = 0;  //현재 페이지 번호
				int begin = 0;   
				int end = 0;
				int pageSize = 10;   //한 페이지 당 출력 게시물 수
				
				//list.do > list.do?page=1
				//list.do?page=1
				
				
				String page = req.getParameter("page");
				
				//넘어온 페이지가 없으면 1페이지로 이동
				if(page == null || page == "") nowPage = 1;
				else nowPage = Integer.parseInt(page);
				
				System.out.println("현재페이지: " + nowPage);
				
				//page=1 -> 1 and 10 
				//page=2 -> 11 and 20 
				begin = ((nowPage -1) * pageSize) + 1;
				end = begin + pageSize -1;
				
				map.put("begin", begin + "");
				map.put("end", end + "");
				map.put("id", id);
				
				
				
				int totalPage = 0;
				int totalCount = 0;

				//2.6 총 페이지 수 구하기
				//- 총 게시물 수 > 267
				//totalCount = dao.getCountContractRequest(map);
				totalCount = dao.getDealListCount(map);
				//- 총 페이지 수 > 267 / 10 = 26.7 > 무조건 반올림
				totalPage = (int)Math.ceil((double)totalCount / pageSize);
				
				
				String pagebar = "";
				int blockSize = 10; //한번에 보여질 페이지 개수
				int n = 0;			//페이지 번호
				int loop = 0;		//루프
				
				pagebar = "";
				
				
				loop = 1;
				n = 1;
				
				pagebar +="<ul class=\"pagination\">";
				
				
				loop = 1;
				n = ((nowPage-1)/blockSize)*blockSize + 1;

				
				if(n ==1) {
					pagebar += String.format("<li class=\"page-item\">\r\n"
							+ "					      <a class=\"page-link\" href=\"#!\" aria-label=\"Previous\">\r\n"
							+ "					        <span aria-hidden=\"true\">&laquo;</span>\r\n"
							+ "					      </a>\r\n"
							+ "					    </li>");
					
				}else {
					pagebar += String.format("<li class=\"page-item\">\r\n"
							+ "					      <a class=\"page-link\" href=\"/house/web/brokermypage/brokerDealListView?page=%d\" aria-label=\"Previous\">\r\n"
							+ "					        <span aria-hidden=\"true\">&laquo;</span>\r\n"
							+ "					      </a>\r\n"
							+ "					    </li>", n-1);
					
				}
				
				

				while(!(loop > blockSize || n > totalPage)) {
					
					//현재 페이지 표시 + 링크 제거
					if(n == nowPage) {
						pagebar += String.format(" <li class=\"page-item active\"><a class=\"page-link\" href=\"#!\">%d</a></li>", n, n);
						
					}else {
						
							pagebar += String.format(" <li class=\"page-item\"><a class=\"page-link\" href=\"/house/web/brokermypage/brokerDealListView?page=%d\">%d</a></li>", n, n);
						
						
					}
					
					loop++;
					n++;
					
				}
				
				//다음 10페이지
				

				
				if(n > totalPage) {
					//클릭 못하게하기
					//pagebar += String.format("<a href='#!'>[다음%d페이지]</a>",blockSize);
					//없애기
					
					pagebar += String.format(" <li class=\"page-item\">\r\n"
							+ "					      <a class=\"page-link\" href=\"#!\" aria-label=\"Next\">\r\n"
							+ "					        <span aria-hidden=\"true\">&raquo;</span>\r\n"
							+ "					      </a>\r\n"
							+ "					    </li>\r\n"
							+ "					 ");
					
					
				}else {
					
					pagebar += String.format(" <li class=\"page-item\">\r\n"
							+ "					      <a class=\"page-link\" href=\"/house/web/brokermypage/brokerDealListView?page=%d\" aria-label=\"Next\">\r\n"
							+ "					        <span aria-hidden=\"true\">&raquo;</span>\r\n"
							+ "					      </a>\r\n"
							+ "					    </li>\r\n"
							+ "					 ", n);
					
				}
				
				pagebar += " </ul>";
				
				
				//페이징 끝
		
		
		
		
				ArrayList<BrokerDealListViewDTO> list = dao.getDealList(map);
		
		
		
		//System.out.println(list);
		
		
		
		
		req.setAttribute("list", list);
		
		req.setAttribute("map", map);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("pagebar", pagebar);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokermypage/brokerDealListView.jsp");

		dispatcher.forward(req, resp);

	}
}

