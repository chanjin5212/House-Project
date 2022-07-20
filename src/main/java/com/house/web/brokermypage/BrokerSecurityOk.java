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

@WebServlet("/web/brokermypage/brokerSecurityOk")
//비밀번호 확인
public class BrokerSecurityOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		
		String pw = req.getParameter("pw");
		System.out.println(pw);
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		BrokerLoginInfoDTO dto = dao.getLogInfo((String) session.getAttribute("auth"));
		
		//System.out.println(dto.getPw());
		
		
		//비밀번호 일치하는 지 확인
		if(dto.getPw().equals(pw)) {
			
			//System.out.println("확인");
			resp.sendRedirect("/house/web/brokermypage/brokerSecurityEdit");
			
			
		}else {
			
			 //System.out.println("실패");
			//실패
			
			//인코딩
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html");
			
			PrintWriter writer = resp.getWriter();
			
			
			writer.println("<html>");
			writer.println("<body>");
			writer.println("<script>");
			writer.println("alert('비밀번호가 일치하지 않습니다.');");
			writer.println("history.back();");
			writer.println("</script>");
			writer.println("</body>");
			writer.println("</html>");
			
			writer.close();
		}
		
		
		/*
		 * RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/WEB-INF/views/web/name.jsp");
		 * 
		 * dispatcher.forward(req, resp);
		 */
	}
}

