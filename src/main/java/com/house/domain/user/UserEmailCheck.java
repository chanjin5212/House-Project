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


//존재하는 이메일 정보인지 검사
@WebServlet("/domain/user/userEmailCheck")
public class UserEmailCheck extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		req.setCharacterEncoding("UTF-8");
		
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		
		SignDAO dao = new SignDAO();
		
		System.out.println(id);
		System.out.println(email);
		
		//0 = 존재하는 정보 , 1 = 존재하지 않은 정보
		
		int result = dao.checkEmail(id, email);
		
		
		if(result == 0 ) {
			System.out.println("존재하는 정보 ");
		}else if(result == 1) {
			
			System.out.println("존재하지 않은 정보");
		}
		
		//결과전송
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"result\": %d }", result);
		writer.close();
		
		
		
		
		

	}
}
