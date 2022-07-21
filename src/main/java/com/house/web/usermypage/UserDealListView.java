
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




		@WebServlet("/web/usermypage/userDealListView")
		public class UserDealListView  extends HttpServlet {

			@Override
			protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
/*
		
				req.setCharacterEncoding("UTF-8");
				
				HttpSession session = req.getSession();
				String id = (String)session.getAttribute("auth");
				String seq = req.getParameter("seq");
				
				String brokername = req.getParameter("brokername");
				
				req.setAttribute("id", id);
				req.setAttribute("seq", seq);
				req.setAttribute("brokername", brokername);
				
 */

				
				
				
				
			
				HttpSession session = req.getSession();		
				
				String id = (String) session.getAttribute("auth");
			
				
				
				UserMyPageDAO dao = new UserMyPageDAO();
				ArrayList<ContractViewDTO> list = dao.getDeal(id);
				
				
				for(ContractViewDTO dto: list) {
					dto.setContractdate(dto.getContractdate().substring(0,10));
					
				}
				
					
			//System.out.println(id);//hong2
				
				req.setAttribute("list", list);
				
				
				
				
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/usermypage/userDealListView.jsp");
				
				dispatcher.forward(req, resp);
			}

		}

