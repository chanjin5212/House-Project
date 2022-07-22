package com.house;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet("/main")
public class Main extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		String id = (String)session.getAttribute("auth");
		String address = "강남구";
		MainDAO dao = new MainDAO();
		if (id != null) {
			address = dao.getAddress(id);
		}
		
		ArrayList<MainDTO> list = dao.getMyList(address);
		
		MainDTO dto = dao.getCount();
		Calendar cal = Calendar.getInstance();
		int month = cal.get(Calendar.MONTH) + 1;


		req.setAttribute("month", month);
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		req.setAttribute("address", address);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/index.jsp");

		dispatcher.forward(req, resp);
	}

}