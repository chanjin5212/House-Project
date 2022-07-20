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
	
	//TODO POST로 받아야함... 분명 POST로 보냈는데 GET으로 인식돼서 온다. 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		
		
		
		System.out.println(id);
		System.out.println(email);
		
		
		req.setAttribute("id", id);
		req.setAttribute("email", email);
		
		
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/sign/editPw.jsp");

		dispather.forward(req, resp);

	}
}
