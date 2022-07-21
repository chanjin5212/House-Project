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

@WebServlet("/useralarm/userContractRequest")
public class UserContractRequest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("auth");
		if (id == null) {
			
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('로그인을 해주세요');");
            writer.println("location.href='/house/domain/sign/selectUser'");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
           
			
		}
		UserAlarmDAO dao = new UserAlarmDAO();
		ArrayList<UserAlarmDTO> list = dao.getList(id);
		
		req.setAttribute("list", list);
		
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/useralarm/userContractRequest.jsp");

		dispatcher.forward(req, resp);
	}

}
