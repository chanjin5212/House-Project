package com.house.web.usermypage;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/usermypage/userDel")
public class UserDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//Del.java
		
		//데이터가져오기
		//jsp호출하기
		
		
	String seq=req.getParameter("seq");

		
		req.setAttribute("seq", seq);
		
		
		System.out.println(seq);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userDel.jsp");
		dispatcher.forward(req, resp);
	}

}







