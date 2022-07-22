package com.house.domain.sign;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/*로그인 화면*/
@WebServlet("/domain/sign/login")
public class Login extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		
		//'아이디 찾기' 하고 난 후 가져오는 id
		String id = req.getParameter("id");
		
		//selectUser와 findIdResult에서 넘어온 check ->로그인할 때 중개사인지 회원인지 체크하기 위해서
		String check = req.getParameter("check");
		
		
				
		
		SignDTO dto = new SignDTO();
		
		dto.setId(id);
		
		//System.out.println("id: " + dto.getId());
		
		
		if(check.equals("user")) {
			String user = "1";
			
			session.setAttribute("lv", user);
		
		}else if(check.equals("broker")) {
			
			String broker = "2";
			
			session.setAttribute("lv", broker);
			
		}
		
		String lv = (String)session.getAttribute("lv");
		
		
		
		//dto에 저장한거 넘겨주기
		req.setAttribute("lv", lv);
		req.setAttribute("dto", dto);
		
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/sign/login.jsp");

		dispather.forward(req, resp);

	}
}
