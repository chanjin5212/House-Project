package com.house.web.adminmanage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.house.web.brokermain.BrokerMainDAO;
import com.house.web.brokermain.BrokerMainDTO;


@WebServlet("/adminmanage/manage")
public class Manage extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
//		
//		int pageNum = 1;
//		int amount = 10;
		
		if(req.getParameter("pageNum") != null && req.getParameter("amount") != null) {
			int pageNum = Integer.parseInt(req.getParameter("pageNum"));
			int amount = Integer.parseInt(req.getParameter("amount"));
		}
		
		ManageMemDAO dao = new ManageMemDAO();
		
		ArrayList<ManageMemDTO> list = dao.getList(1,10);
		int total = dao.getTotal();
		PageDTO dto = new PageDTO(1,10,total);
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/adminmanage/manage.jsp");

		dispatcher.forward(req, resp);
	}

}