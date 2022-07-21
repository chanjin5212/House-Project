package com.house.domain.sign;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/domain/sign/editPw")
public class EditPw extends HttpServlet {
	@Override
	
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		
		//입력한 id값 넘어오는지 테스트용 
		System.out.println(id);
		
		req.setAttribute("id", id);
		
		
		
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/sign/editPw.jsp");

		dispather.forward(req, resp);

	}
}
