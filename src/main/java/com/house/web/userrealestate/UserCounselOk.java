package com.house.web.userrealestate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/web/userCounselOk")
public class UserCounselOk extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		req.setCharacterEncoding("UTF-8");
		//물품번호
		String seq = req.getParameter("seq");
		//멤버 아이디
		String memberId = (String)session.getAttribute("auth");
		//내용
		String content = req.getParameter("content");
		
		CounselDAO dao = new CounselDAO();
		
		CounselDTO dto = new CounselDTO();
		dto.setId(memberId);
		dto.setRealestateseq(seq);
		dto.setContent(content);
		
		int result = dao.addCounsel(dto);
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"result\": %d }", result);
		writer.close();
		
	}
}
