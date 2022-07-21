package com.house.web.brokeralarm;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.web.brokermypage.BrokerMyPageDAO;

@WebServlet("/web/brokeralarm/brokerRefuseContract")
public class BrokerRefuseContract extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String contractSeq = req.getParameter("contractSeq");

		System.out.println(contractSeq);

		BrokerMyPageDAO dao = new BrokerMyPageDAO();

		//int result = dao.refuseContract(contractSeq);
		
		
//		if(result > 0) {
//			
//			System.out.println("확인");
//			resp.sendRedirect("/house/web/brokeralarm/brokerContractRequest");
//			
//			
//		}else {
//			
//			 System.out.println("실패");
//			//실패
//			
//			//인코딩
//			resp.setCharacterEncoding("UTF-8");
//			resp.setContentType("text/html");
//			
//			PrintWriter writer = resp.getWriter();
//			
//			
//			writer.println("<html>");
//			writer.println("<body>");
//			writer.println("<script>");
//			writer.println("alert('실패');");
//			writer.println("history.back();");
//			writer.println("</script>");
//			writer.println("</body>");
//			writer.println("</html>");
//			
//			writer.close();
//		}
		
		

		/*
		 * if(dto.getPw().equals(pw)) {
		 * 
		 * //System.out.println("확인");
		 * resp.sendRedirect("/house/web/brokermypage/brokerSecurityEdit");
		 * 
		 * 
		 * }else {
		 * 
		 * //System.out.println("실패"); //실패
		 * 
		 * //인코딩 resp.setCharacterEncoding("UTF-8"); resp.setContentType("text/html");
		 * 
		 * PrintWriter writer = resp.getWriter();
		 * 
		 * 
		 * writer.println("<html>"); writer.println("<body>");
		 * writer.println("<script>"); writer.println("alert('비밀번호가 일치하지 않습니다.');");
		 * writer.println("history.back();"); writer.println("</script>");
		 * writer.println("</body>"); writer.println("</html>");
		 * 
		 * writer.close(); }
		 */

		req.setAttribute("contractSeq",contractSeq);
		
		 RequestDispatcher dispatcher =
		 req.getRequestDispatcher("/WEB-INF/view/web/brokeralarm/brokerRefuseContract.jsp");
		 
		 dispatcher.forward(req, resp);
		 
	}
}
