package com.house.web.usermypage;


import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





		@WebServlet("/web/usermypage/userSecurityOk")
		public class UserSecurityOk  extends HttpServlet {

			@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				

				req.setCharacterEncoding("UTF-8");
				HttpSession session = req.getSession();
				
				String pw = req.getParameter("pw");
				System.out.println(pw);
				
		
				
				UserMyPageDAO dao = new UserMyPageDAO();
				UserMyPageDTO dto = dao.getPwcheck((String) session.getAttribute("auth"));
				
				
				if(dto.getPw().equals(pw)) {
					
					resp.sendRedirect("/house/web/usermypage/userSecurityEdit");
			
					
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

