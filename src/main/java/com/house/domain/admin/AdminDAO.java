package com.house.domain.admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.house.util.DBUtil;

public class AdminDAO {

	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	
	
	public AdminDAO() {
		conn = DBUtil.open();
	}


	//관리자 로그인
	public Integer login(AdminDTO dto) {
		
		try {
			
			String sql = "select * from tblManager where id = ? and pw = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			rs = pstat.executeQuery();
			
			
			//로그인 정보 있으면
			if(rs.next()) {
				
				return 0;
				
			}else {
				return 1;
			}
			
			
		} catch (Exception e) {
			System.out.println("AdminDAO.login");
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	
	
}
