package com.house.web.userrealestate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.house.util.DBUtil;

public class UserMoveInDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public int addUserMoveIn(UserMoveInDTO userMoveInDTO) {
	
		try {
			String sql = "insert into tblcontractrequest(seq, realestateseq, id, checkinddate, brokercheck, state)"
					+ " values(seqcontractrequest.nextval, ?, ?, to_date(?), '대기중', '대기중')";
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userMoveInDTO.getRealEstateSeq());
			pstmt.setString(2, userMoveInDTO.getId());
			pstmt.setString(3, userMoveInDTO.getCheckInDate());
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		return 0;
	}
}
