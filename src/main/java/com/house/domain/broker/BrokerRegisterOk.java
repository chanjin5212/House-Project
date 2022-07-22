package com.house.domain.broker;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.domain.sign.SignDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/domain/broker/brokerRegisterOk")
public class BrokerRegisterOk extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String path = req.getRealPath("/files");
		int size = 1024 * 1024 * 100;
		
		System.out.println(path);
		
		MultipartRequest multi = null;
		
		try {
			multi = new MultipartRequest (
											req,
											path,
											size,
											"UTF-8",
											new DefaultFileRenamePolicy()
					
					
											);
					
		}catch(Exception e) {
			System.out.println("brokerRegisterOk.doPost");
			e.printStackTrace();
		}
		
		
		String id = multi.getParameter("id");
		String pw = multi.getParameter("pw");
		String name = multi.getParameter("name");
		String email = multi.getParameter("email");
		String ssn = multi.getParameter("ssn");
		String address = multi.getParameter("address");
		String addressPlus = multi.getParameter("addressPlus");
		String tel = multi.getParameter("tel");
		String x = multi.getParameter("x");
		String y = multi.getParameter("y");
		
		
		String firmName = multi.getParameter("firmName");
		String firmNum = multi.getParameter("firmNum");
		String corporateNum1 = multi.getParameter("corporateNum1");
		String corporateNum2 = multi.getParameter("corporateNum2");
		String corporateNum3 = multi.getParameter("corporateNum3");
		String firmAddress = multi.getParameter("firmAddress");
		String representName = multi.getParameter("representName");
		String firmTel = multi.getParameter("firmTel");
		String filename = multi.getFilesystemName("profileImg");
		String orgfilename = multi.getOriginalFileName("profileImg");
		
		BrokerDTO dto = new BrokerDTO();
		
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setEmail(email);
		dto.setSsn(ssn);
		dto.setAddress(address + " " + addressPlus);
		dto.setTel(tel);
		dto.setX(x);
		dto.setY(y);
		
		dto.setFirmName(firmName);
		dto.setFirmNum(firmNum);
		dto.setCorporateNum(corporateNum1 + corporateNum2 + corporateNum3);
		dto.setFirmAddress(firmAddress);
		dto.setRepresentName(representName);
		dto.setFirmTel(firmTel);
		dto.setFilename(filename);
		dto.setOrgfilename(orgfilename);
		
		SignDAO dao = new SignDAO();
		
		int result = dao.brokerBasicAdd(dto);
		
		
		if(result == 1) {
			
			System.out.println("중개사 정보 입력하러 들어옴");
			result = dao.brokerInfoAdd(dto);
			
		}else {
			
			System.out.println("중개사 기초 정보 못넣음");
			result = 0;
		}
		
		System.out.println("모든 정보 다 넣음!");
		
		req.setAttribute("result", result);
		
		
		
		RequestDispatcher dispather = req.getRequestDispatcher("/WEB-INF/view/domain/broker/brokerRegisterOk.jsp");

		dispather.forward(req, resp);

	}
}
