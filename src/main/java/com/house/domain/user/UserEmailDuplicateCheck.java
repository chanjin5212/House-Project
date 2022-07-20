package com.house.domain.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.domain.sign.SignDAO;

@WebServlet("/domain/user/userEmailDuplicateCheck")
public class UserEmailDuplicateCheck extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		//이메일 중복 검사
		String email = req.getParameter("email");
		System.out.println(email);
		
		
		SignDAO dao = new SignDAO();
		
		
		//이메일 중복 체크 -> DB 접속 후 result 반환
		//0 = 사용가능, 1 = 중복으로 인한 사용 불가
		
		int result = dao.checkEmailDuplicate(email);
		
		//확인용
		if(result == 1 ) {
			System.out.println("이미 존재하는 이메일 ");
		}else if(result == 0) {
			
			System.out.println("사용 가능한 이메일");
		}
		
		//결과전송
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"result\": %d }", result);
		writer.close();
	}
	
}
