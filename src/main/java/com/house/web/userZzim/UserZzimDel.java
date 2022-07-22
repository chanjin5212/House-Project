package com.house.web.userZzim;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/userZzim/userZzimDel")
public class UserZzimDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		String seq = req.getParameter("seq");
		
		UserZzimListDAO dao = new UserZzimListDAO();
		int result = dao.delZzim(seq);
		
		if (result == 1) {
			resp.sendRedirect("/house/userZzim/userZzimList");
		} else {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('삭제에 실패하셨습니다.');");
            writer.println("location.href='/house/main'");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		
	}

}
