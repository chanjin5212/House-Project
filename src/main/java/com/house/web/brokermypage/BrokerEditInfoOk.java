package com.house.web.brokermypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/web/brokermypage/brokerEditInfoOk")
public class BrokerEditInfoOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		req.setCharacterEncoding("UTF-8");
		
		
		//회원가입 정보 수정
		//전화번호, 이메일, 주소
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String address = req.getParameter("address") + " "+ req.getParameter("addressDetail");
		//String addressDetail = req.getParameter("addressDetail");
		
		System.out.println(tel + email + address);
		
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		
		BrokerLoginInfoDTO dto = new BrokerLoginInfoDTO();
		
		dto.setId((String)session.getAttribute("auth"));
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setAddress(address);
		
		
		int result = dao.editLoginInfo(dto);
		
		//인코딩
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json"); //MIME
		
		//수정 성공하면 바뀐 값 돌려보내주기
		if(result > 0) {
			
			System.out.println("수정성공");
			
			BrokerLoginInfoDTO resultDto = dao.getLogInfo(dto.getId());
			
			
			
			//JSON 반환
			
			
			PrintWriter writer = resp.getWriter();

			
			writer.print("{");
			writer.printf("\"tel\": \"%s\",",dto.getTel());
			writer.printf("\"email\": \"%s\",",dto.getEmail());
			writer.printf("\"address\": \"%s\"",dto.getAddress());
			writer.print("}");
			
			writer.close();
			
			
		}else {
			
			System.out.println("수정실패");
		}
		
		
		
		/*
		 * RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/WEB-INF/views/web/name.jsp");
		 * 
		 * dispatcher.forward(req, resp);
		 */

	}
}

