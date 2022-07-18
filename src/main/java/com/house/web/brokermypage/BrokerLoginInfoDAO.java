package com.house.web.brokermypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.house.util.DBUtil;

public class BrokerLoginInfoDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BrokerLoginInfoDAO() {
		conn = DBUtil.open();
	}

	public BrokerLoginInfoDTO getLogInfo(String id) {

		try {
			
			BrokerLoginInfoDTO dto = new BrokerLoginInfoDTO();
			
			String sql = "select * from tblMember where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				dto.setLv(rs.getString("lv"));
				dto.setSsn(rs.getString("ssn"));
				dto.setPw(rs.getString("pw"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("BrokerLoginInfoDAO.getLogInfo");
			e.printStackTrace();
		}
		
		return null;
	}

	//brokerSecurityEditOk
	//비밀번호 변경
	public int upatePw(BrokerLoginInfoDTO dto) {
		
		
		try {
			
			String sql = "update tblMember set pw = ? where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getId());
			
			return pstat.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println("BrokerLoginInfoDAO.upatePw");
			e.printStackTrace();
		}
		return 0;
	}

	//BrokerDeactive > 회원탈퇴
	public int brokerDeactive(String id) {
		
		try {
			
			String sql = "update tblMember set active = '탈퇴' where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerLoginInfoDAO.brokerDeactive");
			e.printStackTrace();
		}
		
		return 0;
	}

}
