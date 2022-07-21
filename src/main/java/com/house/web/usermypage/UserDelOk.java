package com.house.web.usermypage;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




@WebServlet("/web/usermypage/userDelOk")
public class UserDelOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		//DelOk.java
		//데이터가져오기
		//db작업>dao위임>seq
		//결과
		//jsp호출하기
		
		
		HttpSession session = req.getSession();
		
		String seq = req.getParameter("seq");
		
		UserMyPageDAO dao = new UserMyPageDAO();
		
	
        System.out.println(seq);

		int result=	dao.delete(seq);	
		int result1= dao.delete1(seq);
		int result2= dao.delete2(seq);
		
		req.setAttribute("result", result2);

		System.out.println(result);
	
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userDelOk.jsp");
		dispatcher.forward(req, resp);
	}

}

