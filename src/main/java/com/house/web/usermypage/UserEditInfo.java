package com.house.web.usermypage;




import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





		@WebServlet("/web/usermypage/userEditInfo")
		public class UserEditInfo  extends HttpServlet {

			@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

				HttpSession session = req.getSession();
				
				
				String id = (String) session.getAttribute("auth");
				
		
				UserMyPageDAO dao = new UserMyPageDAO();
				UserMyPageDTO dto = dao.getEdit(id);
				
				
		
				
			//	System.out.println(dto);
				
				req.setAttribute("dto", dto);
				
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userEditInfo.jsp");
				
				dispatcher.forward(req, resp);
			}

		}

