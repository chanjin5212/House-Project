package com.house.domain.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.house.domain.sign.SignDAO;
import com.house.domain.sign.SignDTO;

@WebServlet("/domain/user/userRegisterOk")
public class UserRegisterOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//회원가입 submit 버튼 클릭이후 모든 유효성 검사가 완료되면 오는 페이지
		//ID DB insert하는 페이지입니다.
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String ssn = req.getParameter("ssn");
		String address = req.getParameter("address");
		String addressPlus = req.getParameter("addressPlus");
		String tel = req.getParameter("tel");
		String x = req.getParameter("x");
		String y = req.getParameter("y");
		
		SignDTO dto = new SignDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setEmail(email);
		dto.setSsn(ssn);
		dto.setAddress(address + " " + addressPlus);
		dto.setTel(tel);
		dto.setX(x);
		dto.setY(y);
		
		SignDAO dao = new SignDAO();
		
		int result = dao.userAdd(dto);
		
		
		req.setAttribute("result", result);
		
		
		
		
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/user/userRegisterOk.jsp");

		dispather.forward(req, resp);
		
		
		
		/*
		 * if (result == 1) { //일반회원 로그인화면으로 session.setAttribute("lv", "1");
		 * resp.sendRedirect("/house/domain/sign/login"); } else {
		 * 
		 * 
		 * resp.setContentType("text/html; charset=UTF-8"); PrintWriter out =
		 * resp.getWriter(); out.
		 * println("<script>alert('회원가입에 실패하였습니다.'); location.href='/house/main';</script>"
		 * ); out.flush();
		 * 
		 * }
		 */
		
	}
	
}
