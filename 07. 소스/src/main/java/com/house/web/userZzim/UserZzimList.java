package com.house.web.userZzim;

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



@WebServlet("/userZzim/userZzimList")
public class UserZzimList extends HttpServlet {

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
		
		UserZzimListDAO dao = new UserZzimListDAO();
		
		ArrayList<UserZzimListDTO> list = dao.getMyList(id);
		
		
		String count = dao.getListCount(id);
		
		
		req.setAttribute("count", count);
		
		req.setAttribute("list", list);
		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/web/userZzim/userZzimList.jsp");

		dispatcher.forward(req, resp);
	}

}
