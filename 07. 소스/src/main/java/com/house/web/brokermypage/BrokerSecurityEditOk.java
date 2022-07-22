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

@WebServlet("/web/brokermypage/brokerSecurityEditOk")
//비밀번호 변경
public class BrokerSecurityEditOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		String id = (String) session.getAttribute("auth");
		
		//새비밀번호와 새비밀번호확인 값이 같으면 비밀번호 변경
		
		String newpw = req.getParameter("newpw");
		String checkpw = req.getParameter("checkpw");
		
		System.out.println(newpw);
		System.out.println(checkpw);
		
		
		BrokerMyPageDAO dao = new BrokerMyPageDAO();
		BrokerLoginInfoDTO dto = new BrokerLoginInfoDTO();
		
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html");
		
		//비밀번호 일치할 때
		if(newpw.equals(checkpw)) {
			
			System.out.println("일치");
			
			dto.setId(id);
			dto.setPw(newpw);
			
			
			int result = dao.upatePw(dto);
			
			if(result > 0) {
				
				//변경 성공
				
				
				PrintWriter writer = resp.getWriter();
				
				
				writer.println("<html>");
				writer.println("<body>");
				writer.println("<script>");
				writer.println("alert('비밀번호가 변경되었습니다.');");
				writer.println("location.href='/house/web/brokermypage/brokerSecurity'");
				writer.println("</script>");
				writer.println("</body>");
				writer.println("</html>");
				
				writer.close();
				
				
			}else {
				//변경 실패
				
				
				PrintWriter writer = resp.getWriter();
				
				
				writer.println("<html>");
				writer.println("<body>");
				writer.println("<script>");
				writer.println("alert('비밀번호 변경을 실패하였습니다.');");
				writer.println("location.href='/house/web/brokermypage/brokerSecurityEdit'");
				writer.println("</script>");
				writer.println("</body>");
				writer.println("</html>");
				
				writer.close();
			}
			
			
		//비밀번호 다르게 입력했을 때	
		}else {
			System.out.println("불일치");
			
			//실패
			
			
			
			
			PrintWriter writer = resp.getWriter();
			
			
			writer.println("<html>");
			writer.println("<body>");
			writer.println("<script>");
			writer.println("alert('새 비밀번호가 일치하지 않습니다.');");
			writer.println("location.href='/house/web/brokermypage/brokerSecurityEdit'");
			writer.println("</script>");
			writer.println("</body>");
			writer.println("</html>");
			
			writer.close();
			
			
			
			
		}
		
		

		/*
		 * RequestDispatcher dispatcher =
		 * req.getRequestDispatcher("/WEB-INF/views/path/name.jsp");
		 * 
		 * dispatcher.forward(req, resp);
		 */

	}
}

