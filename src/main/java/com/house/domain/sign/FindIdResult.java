package com.house.domain.sign;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/domain/sign/findIdResult")
public class FindIdResult extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		//System.out.println("이름: "+ name);
		//System.out.println("이메일: "+ email);
		
		String lv = (String) session.getAttribute("lv");
		
		//System.out.println("findResult.java lv: " + lv);
		
		SignDAO dao = new SignDAO();
		
		SignDTO dto = new SignDTO();
		
		if(lv.equals("1")) {
			//회원 ID 찾기
			dto = dao.findUserId(name, email);
			
		}else if(lv.equals("2")) {
			//중개사 ID 찾기
			dto = dao.finBrokerId(name, email);
		}
		
		
		req.setAttribute("lv", lv);
		
		req.setAttribute("dto", dto);
		
		
		
		
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/sign/findIdResult.jsp");

		dispather.forward(req, resp);

	}
}
