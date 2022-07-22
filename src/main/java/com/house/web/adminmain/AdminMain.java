package com.house.web.adminmain;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.house.web.adminmanage.ManageMemDAO;
import com.house.web.brokermain.BrokerMainDTO;

@WebServlet("/adminmain/adminMain")
public class AdminMain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");

		HttpSession session = req.getSession();

		AdminMainDAO dao = new AdminMainDAO();

		int count = dao.getCount();
		int cnt = dao.getMemCount();
	
		
		req.setAttribute("count", count);
		req.setAttribute("cnt", cnt);
		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/adminmain/adminMain.jsp");
		dispatcher.forward(req, resp);
	}

}
