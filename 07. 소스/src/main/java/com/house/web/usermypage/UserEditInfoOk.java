package com.house.web.usermypage;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





@WebServlet("/web/usermypage/userEditInfoOk")
public class UserEditInfoOk  extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//EditOk.java
		//인코딩
		//데이터 가져오기(subject,content,seq)
		//db작업>dao위임>update
		//결과
		//jsp호출하기
		HttpSession session = req.getSession();
		
	
		//hong1
		//UserMyPageDTO(id=hong1, name=김철수, email=hong1@naver.com, ssn=801011-1231641, tel=010-1111-1111, address=서울특별시 강남구 역삼동 봉강빌딩, pw=null, active=null, lv=1, x=37.499940, y=127.039173)

		                                                                                                                                      
		req.setCharacterEncoding("UTF-8");
		
		String tel = req.getParameter("tel");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		String id = req.getParameter("id");
		
		UserMyPageDTO dto = new UserMyPageDTO();
		
		dto.setTel(tel);
		dto.setEmail(email);
		dto.setAddress(address);
		dto.setId((String)session.getAttribute("auth"));
		
		UserMyPageDAO dao = new UserMyPageDAO();
		
	/*
		//뒷구멍 막기
		int temp=0;
		
		if(session.getAttribute("auth")== null) {
			temp=1;//익명사용자
		}else  
			temp=2;//실명사용자
		
		}
	
	int result = 0;
	
	
	if(temp==2) {
		result=	dao.edit(dto);
	}
	*/
		
		
		int result=	dao.edit(dto);	
	
	req.setAttribute("result", result);//피드백하기위해 넘긴거고 1 또는 0
	req.setAttribute("id",id);//피드백작업중일부인 view로 가는글번호로써야하니까 
			
		System.out.println(id);
		System.out.println(result);
	



		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userEditInfoOk.jsp");
		dispatcher.forward(req, resp);
	}

}

