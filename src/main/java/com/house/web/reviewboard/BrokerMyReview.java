package com.house.web.reviewboard;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/reviewboard/brokerMyReview")
public class BrokerMyReview extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		
		String add = "";
		if (column != null && word != null) {
			add = String.format("&column=%s&word=%s", column, word);
		}
		
		
		
		
		map.put("column", column);
		map.put("word", word);
		
		int check = 0;
		UserReviewBoardDAO dao = new UserReviewBoardDAO();
		if (id != null) {
			check = dao.getMember(id);
		}
		
		String recent = req.getParameter("recent");
		if (recent == null) {
			recent = "0";
		}
		
		String addRecent = String.format("&recent=%s", recent);
		
		
		
		//페이징
		int nowPage = 0; 	//현재 페이지 번호(= page)
		int begin = 0;
		int end = 0;
		int pageSize = 10;	//한페이지 당 출력할 게시물 수
		
		int totalCount = 0; //총 게시물 수
		int totalPage = 0;	//총 페이지 수
		
		
		
		//list.do > list.do?page=1
		//list.do?page=3		
		
		String page = req.getParameter("page");
		
		if (page == null || page == "") nowPage = 1;
		else nowPage = Integer.parseInt(page);
		
		
		//nowPage > 현재 보게될 페이지 번호
		//list.do?page=1 > where rnum between 1 and 10
		//list.do?page=2 > where rnum between 11 and 20
		//list.do?page=3 > where rnum between 21 and 30
		
		begin = ((nowPage - 1) * pageSize) + 1;
		end = begin + pageSize - 1;

		
		map.put("begin", begin + "");
		map.put("end", end + "");
		map.put("id", id);
		
		
		map.put("recent", recent);
		
		ArrayList<UserReviewBoardDTO> list = dao.getBrokerList(map);
		Calendar now = Calendar.getInstance();
		String strNow = String.format("%tF", now);// "2022-06-29"
		
		for (UserReviewBoardDTO dto : list) {
			
			//시분초 자르기
			if (dto.getRegdate().startsWith(strNow)) {
				//오늘
				dto.setRegdate(dto.getRegdate().substring(11));
			} else {
				//어제 이전
				dto.setRegdate(dto.getRegdate().substring(0, 10));
			}
			
			
			//제목이 길면 자르기
			if (dto.getTitle().length() > 25) {
				dto.setTitle(dto.getTitle().substring(0, 25) + "..");
			}
			
			//태그 비활성화
			dto.setTitle(dto.getTitle().replace("<", "&lt;").replace(">", "&gt;"));
			
		}
		
		totalCount = dao.getbrokerTotalCount(map);
		totalPage = (int)Math.ceil((double)totalCount / pageSize);

		
		String pagebar = "";
		
		int blockSize = 10;	//한번에 보여질 페이지 개수
		int n = 0;			//페이지 번호
		int loop = 0;		//루프
		
		pagebar = "";
			
		
		loop = 1;
		n = ((nowPage - 1) / blockSize) * blockSize + 1;
		
		
		pagebar += "<ul class=\"pagination\">";
		
		
		
		if (n == 1) {
			pagebar += String.format(" <li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#!\" aria-label=\"Previous\">\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li> "
					);
		} else {
			pagebar += String.format(" <li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"/house/reviewboard/brokerMyReview?page=%d%s%s\" aria-label=\"Previous\">\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li> "
					, n - 1
					, add
					, addRecent
					);
		}
		
		
		
		while (!(loop > blockSize || n > totalPage)) {
			
			if (n == nowPage) {
				pagebar += String.format(" <li class=\"page-item active\"><a class=\"page-link\" href=\"#!\">%d</a></li> "
						, n);
			} else {
				pagebar += String.format(" <li class=\"page-item\"><a class=\"page-link\" href=\"/house/reviewboard/brokerMyReview?page=%d%s%s\">%d</a></li> "
						, n
						, add
						, addRecent
						, n);
			}
			
			loop++;
			n++;
		}
		
		
		if (n > totalPage) {
			pagebar += String.format(" <li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#!\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li> "
					);
		} else {
			pagebar += String.format(" <li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"/house/reviewboard/brokerMyReview?page=%d%s%s\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li> "
					, n
					, add
					, addRecent
					);
		}
		
		
		pagebar += "</ul>";
		//새로고침 조회수 증가 방지
		session.setAttribute("read", "n");
		
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("check", check);
		req.setAttribute("recent", recent);
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/reviewboard/brokerMyReview.jsp");

		dispatcher.forward(req, resp);
	}

}