package com.house.domain.useralarm;

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

@WebServlet("/useralarm/showContractDoc")
public class ShowContractDoc extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("auth");
		String seq = req.getParameter("seq");
		
		UserAlarmDAO dao = new UserAlarmDAO();
		
		UserAlarmDTO dto = dao.getContract(id, seq);
		
		req.setAttribute("dto", dto);
		req.setAttribute("seq", seq);
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/useralarm/showContractDoc.jsp");

		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		
		String deputyAddress = req.getParameter("deputyAddress");
		String deputySsn = req.getParameter("deputySsn");
		String deputyName = req.getParameter("deputyName");
		
		UserAlarmDAO dao = new UserAlarmDAO();
		UserAlarmDTO dto = new UserAlarmDTO();
		
		dto.setSeq(seq);
		dto.setDeputyAddress(deputyAddress);
		dto.setDeputySsn(deputySsn);
		dto.setDeputyName(deputyName);
		
		ArrayList<String> getInfo = dao.getSeq();
		
		dto.setReseq(getInfo.get(0));
		dto.setId(getInfo.get(1));
		
		int result = dao.updateContract(dto);
		
		if (result == 1) {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("opener.parent.location.reload();");
            writer.println("window.close();");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		
	
	}

}
