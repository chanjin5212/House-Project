package com.house.web.brokerrealestate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/brokerrealestate/brokerRealEstateDel")
public class BrokerRealEstateDel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String seq = req.getParameter("seq");
		
		BrokerRealEstateDAO dao = new BrokerRealEstateDAO();
		
		int check = dao.report(seq);
		
		if (check != 0) {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('신고 당한 매물은 삭제가 불가능합니다.');");
            writer.println("location.href='/house/main'");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}

		dao.delAll(seq);
		
		int result = dao.delRealEstate(seq);
		
		if (result == 1) {
			resp.sendRedirect("/house/brokerrealestate/brokerRealEstateManage");
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
