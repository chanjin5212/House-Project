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


@WebServlet("/reviewboard/userReviewBoardView")
public class UserReviewBoardView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		String column = req.getParameter("column");
		String word = req.getParameter("word");
		
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
	
		ArrayList<UserReviewBoardDTO> list = dao.getList(recent);
		
		req.setAttribute("check", check);
		
		req.setAttribute("list", list);
		
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/reviewboard/userReviewBoardView.jsp");

		dispatcher.forward(req, resp);
	}

}