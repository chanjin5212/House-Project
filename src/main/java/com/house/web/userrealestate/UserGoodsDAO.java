package com.house.web.userrealestate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;

public class UserGoodsDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public ArrayList<UserGoodsDTO> getGoodsList(LocationDTO locationDTO) {
		try {
			String sql = "select * from tblrealestate"
					+ "  where dealstate = '거래전'"
					+ " and coordinatex between ? and ?"
					+ " and coordinatey between ? and ?";
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, locationDTO.getLng1());
			pstmt.setString(2, locationDTO.getLng2());
			pstmt.setString(3, locationDTO.getLat1());
			pstmt.setString(4, locationDTO.getLat2());
			rs= pstmt.executeQuery();
			
			ArrayList<UserGoodsDTO> goodsList = new ArrayList<UserGoodsDTO>();
			while(rs.next()) {
				UserGoodsDTO dto = new UserGoodsDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setCoordinateX(rs.getString("coordinatex"));
				dto.setCoordinateY(rs.getString("coordinatey"));
				
				goodsList.add(dto);
			}
			
			return goodsList;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		return null;
	}
	
	
	
}
