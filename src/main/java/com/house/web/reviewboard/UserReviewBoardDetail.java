package com.house.web.reviewboard;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/reviewboard/userReviewBoardDetail")
public class UserReviewBoardDetail extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		String seq = req.getParameter("seq");
		
		int check = 0;
		UserReviewBoardDAO dao = new UserReviewBoardDAO();
		if (id != null) {
			check = dao.getMember(id);
		}
		
		ArrayList<String> list = dao.getImg(seq);
		int countImg = dao.getCountImg(seq);
		
		//조회수 증가
		if (session.getAttribute("read") == null || session.getAttribute("read").toString().equals("n")) {
			dao.updateViews(seq);
			session.setAttribute("read", "y");
		}
		UserReviewBoardDTO dto = dao.getPost(seq);
		
		String address = dao.getAddr(dto.getRealSeq());
		
		
		dto.setTitle(dto.getTitle().replace("<", "&lt;").replace(">", "&gt;"));
		dto.setContent(dto.getContent().replace("<", "&lt;").replace(">", "&gt;"));
		
		//- 출력 데이터 조작하기
		dto.setContent(dto.getContent().replace("\r\n", "<br>"));
		
		double a = Integer.parseInt(dto.getCleanStar());
		double b = Integer.parseInt(dto.getPriceStar());
		double c = Integer.parseInt(dto.getLocationStar());
		double d = Integer.parseInt(dto.getOptionStar());
		
		double sum = (a + b + c + d) / 4;
		
		String avg = String.format("%.1f", sum);
		
		int good = dao.getGood(seq);
		
		req.setAttribute("address", address);
		req.setAttribute("count", countImg);
		req.setAttribute("good", good);
		req.setAttribute("avg", avg);
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		req.setAttribute("check", check);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/reviewboard/userReviewBoardDetail.jsp");

		dispatcher.forward(req, resp);
	}

}
