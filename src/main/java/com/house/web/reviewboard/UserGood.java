package com.house.web.reviewboard;

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

@WebServlet("/reviewboard/userGood")
public class UserGood extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();

        String id = (String)session.getAttribute("auth");

        String seq = req.getParameter("seq");

        UserReviewBoardDAO dao = new UserReviewBoardDAO();
        
        int result = 0;
        int check = dao.checkGood(seq, id);
        if (check == 1) {
        	result = 2;
        	resp.setCharacterEncoding("UTF-8");
            resp.setContentType("application/json");

            PrintWriter writer = resp.getWriter();
            
            writer.print("{");
            writer.printf("\"result\": %d", result);
            writer.print("}");

            writer.close();
            return;
        }

        result = dao.goodCount(seq, id);
        

        int good = dao.getGood(seq);
        
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        PrintWriter writer = resp.getWriter();
        
        writer.print("{");
        writer.printf("\"result\": %d,", result);
        writer.printf("\"good\": %d", good);
        writer.print("}");

        writer.close();
		
	}

}