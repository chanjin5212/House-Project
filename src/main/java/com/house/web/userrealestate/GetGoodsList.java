package com.house.web.userrealestate;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MulticastSocket;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/getGoodsList")
public class GetGoodsList extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		
		LocationDTO locationDTO = new LocationDTO();
		locationDTO.setLat1(req.getParameter("lat1"));
		locationDTO.setLng1(req.getParameter("lng1"));
		locationDTO.setLat2(req.getParameter("lat2"));
		locationDTO.setLng2(req.getParameter("lng2"));
		//TODO 가져온 level값으로 출력되는 데이터 수 조절하려고 했으나, 더미데이터가 그리 많지 나중에 추가해보려고함 사실 where절 조건만 추가하면 끝
		locationDTO.setLevel(req.getParameter("level"));
		
		UserGoodsDAO dao = new UserGoodsDAO();
		ArrayList<UserGoodsDTO> goodsList = dao.getGoodsList(locationDTO);	
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		//결과가 있는경우에만 전송
		PrintWriter writer = resp.getWriter();
		if(goodsList != null) {
			
			String temp = "";

			temp += "[";
			
			for(UserGoodsDTO dto : goodsList) {
				temp += "{";
				temp += String.format("\"seq\": \"%s\",", dto.getSeq());
				temp += String.format("\"price\": %d,", dto.getPrice());
				temp += String.format("\"deposit\": %d,", dto.getDeposit());
				temp += String.format("\"category\": \"%s\",", dto.getCategory());
				temp += String.format("\"type\": \"%s\",", dto.getType());
				temp += String.format("\"coordinateX\": \"%s\",", dto.getCoordinateX());
				temp += String.format("\"coordinateY\": \"%s\"", dto.getCoordinateY());
				temp += "},";
			}
			
			if (goodsList.size() > 0) {
				temp = temp.substring(0, temp.length() - 1);
			}
			
			temp += "]";
			writer.print(temp);
			writer.close();		
		}

	}
	
}
























