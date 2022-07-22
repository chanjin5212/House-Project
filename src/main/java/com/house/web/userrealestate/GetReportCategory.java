package com.house.web.userrealestate;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/getReportCategory")
public class GetReportCategory extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CounselDAO dao = new CounselDAO();
		ArrayList<ReportCategoryDTO> category = dao.getReportCategory();
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		PrintWriter writer = resp.getWriter();
		if(category != null) {
			
			String temp = "";

			temp += "[";
			
			for(ReportCategoryDTO dto : category) {
				temp += "{";
				temp += String.format("\"seq\": \"%s\",", dto.getSeq());
				temp += String.format("\"name\": \"%s\"", dto.getCategory());
				temp += "},";
			}		
			if (category.size() > 0) {
				temp = temp.substring(0, temp.length() - 1);
			}
			
			temp += "]";
			writer.print(temp);
			writer.close();		
		}
		
	}
	
}
