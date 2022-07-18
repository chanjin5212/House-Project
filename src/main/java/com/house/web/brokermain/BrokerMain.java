package com.house.web.brokermain;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/brokermain/brokerMain")
public class BrokerMain extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute("auth") == null) {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('중개사 로그인을 해주세요');");
            writer.println("location.href='/house/main'");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		
		BrokerMainDAO dao = new BrokerMainDAO();
		
		ArrayList<BrokerMainDTO> list = dao.getList();
		
		BrokerMainDTO dto = dao.getCount();
		
		for (BrokerMainDTO bdto : list) {
			bdto.setRegdate(bdto.getRegdate().substring(0, 10));
		}
		
		req.setAttribute("dto", dto);
		req.setAttribute("list", list);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/brokermain/brokerMain.jsp");

		dispatcher.forward(req, resp);
	}

}
