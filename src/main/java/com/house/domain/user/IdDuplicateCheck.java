package com.house.domain.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.domain.sign.SignDAO;

@WebServlet("/domain/user/idDuplicateCheck")
public class IdDuplicateCheck extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		
		//userRegister에서 받아온 값
		String id = req.getParameter("id");
		
		System.out.println("받아온 값: " + id);
		
		SignDAO dao = new SignDAO();
		
		int result = dao.checkId(id);
		
		
		
		
		//확인용
		if(result == 0 ) {
			System.out.println("이미 존재하는 아이디 ");
		}else if(result == 1) {
			
			System.out.println("생성 가능한 아이디");
		}
		
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");

		
		PrintWriter writer = resp.getWriter();
		
		writer.print("{");
		writer.printf("\"result\":\"%d\"", result);
		writer.print("}");
		
		writer.close();
		
		


	}
}
