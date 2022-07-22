package com.house.web.userrealestate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//매물상세보기 페이지로 이동
@WebServlet("/web/userRealEstateView")
public class UserRealEstateView extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String seq = req.getParameter("seq");
		String coordinateX = req.getParameter("coordinateX");
		String coordinateY = req.getParameter("coordinateY");
		
		UserGoodsDAO userGoodsDAO = new UserGoodsDAO();
		ArrayList<String> realEstateImgList = userGoodsDAO.getRealEstateImg(seq);
		RealEstateInfoDTO realEstateInfoDTO = userGoodsDAO.getRealEstateView(seq);		
		
		//매물번호
		req.setAttribute("seq", seq);
		req.setAttribute("coordinateX", coordinateX);
		req.setAttribute("coordinateY", coordinateY);
		req.setAttribute("realEstateInfo", realEstateInfoDTO);
		req.setAttribute("realEstateImgList", realEstateImgList);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/view/user/goods/userRealEstateView.jsp");
		dispatcher.forward(req, resp);
		
	}
	
}
