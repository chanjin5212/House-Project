package com.house.web.userrealestate;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@WebServlet("/web/userReportOk")
public class UserReportOk extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		req.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		String memberId = (String)session.getAttribute("auth");
		String realPath = "";
		String savePath = "files/report";
		String type = "utf-8";
		int maxSize = 10*1024*1024;
		int result = 0;
		ServletContext context = req.getServletContext();
		realPath = context.getRealPath(savePath);
		Map<String, String> data = new HashMap<String, String>();
		ArrayList<String> saveFiles = new ArrayList<>();
		
		
		System.out.println(realPath);
		
		//유저 아이디 세션에서 얻어옴
		data.put("id", memberId);
		
		try {
			DiskFileItemFactory diskFileItemFactory = new DiskFileItemFactory();
			diskFileItemFactory.setRepository(new File(realPath));
			diskFileItemFactory.setSizeThreshold(maxSize);
			diskFileItemFactory.setDefaultCharset(type);
			ServletFileUpload fileUpload = new ServletFileUpload(diskFileItemFactory);

			List<FileItem> items = fileUpload.parseRequest(req);
			for (FileItem item : items) {
				if (item.isFormField()) {
					//item.getFieldName() - 파라미터명
					//item.getString() - 파일명
					//item.getSize() - 파일크기
					//item.getName() - 파일이름
					data.put(item.getFieldName(), item.getString());
				} else {
					if (item.getSize() > 0) {
						String separator = File.separator;
						int index = item.getName().lastIndexOf(separator);
						String fileName = item.getName().substring(index + 1);
						File uploadFile = new File(realPath + separator + fileName);
						item.write(uploadFile);
						saveFiles.add(item.getName());
					}
				}
			}
		} catch (FileUploadException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		 CounselDAO dao = new CounselDAO();
		 String reportSeq = dao.addReportContent(data);
		 
		 if(reportSeq != null) {
			 result = dao.addReportFiles(reportSeq, saveFiles);
		 }
		 
		 req.setAttribute("result", result);
		 req.setAttribute("coordinateX", data.get("coordinateX"));
		 req.setAttribute("coordinateY", data.get("coordinateY"));
		 req.setAttribute("seq", data.get("seq"));
		 
		 RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/user/goods/userReportOk.jsp");
		 dispatcher.forward(req, resp);

	}
	
}
