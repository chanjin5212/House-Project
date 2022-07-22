package com.house.web.adminreport;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.web.brokermain.BrokerMainDTO;

@WebServlet("/adminreport/AllowReport")
public class AllowReport extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		ReportDAO reportDAO = new ReportDAO();
		ReportDTO report = new ReportDTO();
		
		int num = Integer.parseInt(req.getParameter("num"));
		report = reportDAO.getDetail(num);
		
		req.setAttribute("report",report);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/adminreport/allowReport.jsp");
		dispatcher.forward(req, resp);
	}

}
