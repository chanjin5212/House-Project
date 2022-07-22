package com.house.domain.sign;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/domain/sign/editPwOk")
public class EditPwOk extends HttpServlet {
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

      HttpSession session = req.getSession();
      req.setCharacterEncoding("UTF-8");
      String id = req.getParameter("id");
      String pw = req.getParameter("pw");
      
      //확인용
      System.out.println("EditPwOk에서 확인하는 아이디:" + id);
      System.out.println("EditPwOk에서 확인하는 비밀번호:" + pw);
      
      SignDTO dto = new SignDTO();
      
      dto.setId(id);
      dto.setPw(pw);
      
      SignDAO dao = new SignDAO();
      
      int result = dao.editPw(dto);
      resp.setContentType("text/html; charset=UTF-8");
      PrintWriter writer = resp.getWriter();
      
      if(result == 1) {
         
         
         writer.println("<script>");
         writer.println("alert('비밀번호가 변경되었습니다.')");
         writer.println("location.href='/house/main'");
         writer.println("</script>");
         
         
         return;
         
      } else {
         
         writer.println("<html>");
         writer.println("<body>");
         writer.println("<script>");
         writer.println("alert('비밀번호 변경에 실패하였습니다.')");
         writer.println("history.back();");
         writer.println("</script>");
         writer.println("</body>");
         writer.println("</html>");
         
         writer.close();
         
      }
      

   }
}