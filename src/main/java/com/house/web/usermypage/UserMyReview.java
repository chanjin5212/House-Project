
package com.house.web.usermypage;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.house.web.brokermypage.BrokerLoginInfoDAO;
import com.house.web.brokermypage.BrokerLoginInfoDTO;




		@WebServlet("/web/usermypage/userMyReview")
		public class UserMyReview  extends HttpServlet {

			@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

				
				
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userMyReview.jsp");
				
				dispatcher.forward(req, resp);
			}

		}

