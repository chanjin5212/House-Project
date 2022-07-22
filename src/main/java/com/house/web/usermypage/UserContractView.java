package com.house.web.usermypage;


import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.house.domain.useralarm.UserAlarmDAO;
import com.house.domain.useralarm.UserAlarmDTO;





		@WebServlet("/web/usermypage/userContractView")
		public class UserContractView  extends HttpServlet {
			@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				
				


			HttpSession session = req.getSession();		
		
			
			String id = (String) session.getAttribute("auth");
			
			UserMyPageDAO dao = new UserMyPageDAO();
			ArrayList<ContractViewDTO> list = dao.getContract(id);
				
		System.out.println(id);//hong2
			
			req.setAttribute("list", list);
				
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userContractView.jsp");
				
				dispatcher.forward(req, resp);
			}

		}

