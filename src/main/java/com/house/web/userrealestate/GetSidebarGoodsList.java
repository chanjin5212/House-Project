package com.house.web.userrealestate;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/web/getSidebarGoodsList")
public class GetSidebarGoodsList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String realestateSeq = req.getParameter("seq");
		
		UserGoodsDAO dao = new UserGoodsDAO();
		SidebarGoodsDTO sidebarGoodsDTO = new SidebarGoodsDTO();
		sidebarGoodsDTO.setRealEstateSeq(realestateSeq);
		SidebarGoodsDTO sidebarGoods = dao.getGoodsList(sidebarGoodsDTO);	
		
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		
		//결과가 있는경우에만 전송
		PrintWriter writer = resp.getWriter();
		if(sidebarGoods != null) {
			
			String temp = "";
			temp += "{";
			temp += String.format("\"realEstateSeq\": \"%s\",", sidebarGoods.getRealEstateSeq());
			temp += String.format("\"img\": \"%s\",", sidebarGoods.getImg());
			temp += String.format("\"price\": \"%s\",", sidebarGoods.getPrice());
			temp += String.format("\"deposit\": \"%s\",", sidebarGoods.getDeposit());
			temp += String.format("\"contractType\": \"%s\",", sidebarGoods.getContractType());
			temp += String.format("\"coordinateX\": \"%s\",", sidebarGoods.getCoordinateX());
			temp += String.format("\"coordinateY\": \"%s\",", sidebarGoods.getCoordinateY());
			temp += String.format("\"address\": \"%s\",", sidebarGoods.getAddress());
			temp += String.format("\"buildingType\": \"%s\",", sidebarGoods.getBuildingType());
			temp += String.format("\"theFloor\": \"%s\",", sidebarGoods.getTheFloor());
			temp += String.format("\"buldingFloor\": \"%s\",", sidebarGoods.getBuldingFloor());
			temp += String.format("\"supplyArea\": \"%s\",", sidebarGoods.getSupplyArea());
			temp += String.format("\"introduce\": \"%s\"", sidebarGoods.getIntroduce());
			temp += "}";
			
			writer.print(temp);
			writer.close();		
		}
		
	}
	
}
