package com.house.domain.sign;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.house.util.DBUtil;



public class SignDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public SignDAO() {
		conn = DBUtil.open();
	}

	
	
	//로그인
	public SignDTO login(SignDTO dto) {
		
		try {
			
			String sql = "select * from tblMember where id = ? and pw = ? and active = '활동중'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			//조회한 결과들 저장
			rs = pstat.executeQuery();
			
			
			if(rs.next()) {
				
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setSsn(rs.getString("ssn"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				dto.setLv(rs.getString("lv"));
				dto.setX(rs.getString("x"));
				dto.setY(rs.getString("y"));
				
				return dto;
			}
			
			
			
		} catch (Exception e) {
			System.out.println("SignDAO.login");
			e.printStackTrace();
		}
		
		
		
		return null;
	}

	

	

	

		
}
