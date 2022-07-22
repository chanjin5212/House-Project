package com.house.web.adminreport;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.house.web.brokermain.BrokerMainDTO;

@WebServlet("/adminreport/ReportList")
public class ReportList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//HttpSession session = req.getSession();		

		req.setCharacterEncoding("UTF-8");
			
		ReportDAO dao = new ReportDAO();
		ArrayList<ReportDTO> list = dao.getList();

		req.setAttribute("list", list);

		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/adminreport/reportList.jsp");
		dispatcher.forward(req, resp);
	}

}
