package com.house.web.brokerrealestate;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/brokerrealestate/brokerRealEstateCancel")
public class BrokerRealEstateCancel extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		String seq = req.getParameter("seq");
		
		BrokerRealEstateDAO dao = new BrokerRealEstateDAO();

		String getSeq = dao.getSeq(seq);
		

		dao.cancelRefusal(getSeq);
		
		int result = dao.cancelContract(getSeq);
		System.out.println(result);
		
		if (result == 1) {
			resp.sendRedirect("/house/brokerrealestate/brokerRealEstateManage");
		} else {
			resp.setContentType("text/html;charset=UTF-8");
            PrintWriter writer = resp.getWriter();

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("alert('계약 취소에 실패하셨습니다.');");
            writer.println("history.back();");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
		}
		
		
	}

}