package com.house.web.usermypage;


import java.io.IOException;

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
				


               RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userSecurityOk.jsp");
				
				dispatcher.forward(req, resp);
			}

		}


