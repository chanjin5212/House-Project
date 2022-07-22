
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





		@WebServlet("/web/usermypage/userStarScopeOk")
		public class UserStarScopeOk  extends HttpServlet {

			@Override
			protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

				
				//평점등록 
				/*
		      HttpSession session = req.getSession();
				
				
				String id = (String) session.getAttribute("auth");
				
		
				UserMyPageDAO dao = new UserMyPageDAO();
				UserMyPageDTO dto = dao.getStar(id);
				
				------
				*/
				//세션 가져오고
				HttpSession session = req.getSession();
				
				//1.
				req.setCharacterEncoding("UTF-8");
				
				//2.
				String star = req.getParameter("star");
				String counselseq = req.getParameter("seq");
			
				//3.
				ContractViewDTO dto = new ContractViewDTO();
				
				//받은 별내용과 상담번호를 dto에 넘기기
				//아이디랑 상담번호 외래키
				//content pseq 왜래키
				//받은 댓글내용과 부모글번호 포장해서 dto에 넘기기
				dto.setStar(star);
				dto.setCounselseq(counselseq);
				//세션아이디 인증티켓 가져오기
				dto.setId((String)session.getAttribute("auth"));
	
				//star입장에서 건네받은 변수는 counselseq
				UserMyPageDAO dao = new UserMyPageDAO();
				
				int result = dao.star(dto);
				
				
				req.setAttribute("result", result);	
				req.setAttribute("counselseq", counselseq);	
	
				
				/*
				
				if(result==1) {
					
					//중개사별점번호주소로?
					                  // 별점번호  상담내역번호
					resp.sendRedirect("/?seq="+counselseq);
				} else {
					
					PrintWriter writer = resp.getWriter();
					
					writer.println("<html>");
					writer.println("<body>");
					writer.println("<script>");
					writer.println("alert('failed');");
					writer.println("history.back();");
					writer.println("</script>");
					writer.println("</body>");
					writer.println("</html>");
					
					writer.close();			
				}
					
				}
			}
*/
		
			req.setAttribute("result", result);	
				
				
				
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userStarScopeOk.jsp");
				
				dispatcher.forward(req, resp);
			}

		}
