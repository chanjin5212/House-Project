
package com.house.web.usermypage;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





		@WebServlet("/web/usermypage/userStarScope")
		public class UserStarScope  extends HttpServlet {

			@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

				
				req.setCharacterEncoding("UTF-8");
				
				HttpSession session = req.getSession();
				String id = (String)session.getAttribute("auth");
				String seq = req.getParameter("seq");
				
				String brokername = req.getParameter("brokername");
				
				req.setAttribute("id", id);
				req.setAttribute("seq", seq);
				req.setAttribute("brokername", brokername);
				
				
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userStarScope.jsp");
				
				dispatcher.forward(req, resp);
			}

		}

