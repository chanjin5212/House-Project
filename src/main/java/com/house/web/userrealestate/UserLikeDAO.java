package com.house.web.userrealestate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.house.util.DBUtil;

public class UserLikeDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int getLikeStatus(UserLikeDTO userLikeDTO) {
		try {
			String sql = "select count(*) as cnt from tblwish where realestateseq=? and id=?";
			int result = 0;
			
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userLikeDTO.getSeq());
			pstmt.setString(2, userLikeDTO.getId());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
			
			return result;
			
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

	public int deleteLikeStatus(UserLikeDTO userLikeDTO) {
		
		try {
			String sql = "delete from tblwish where realestateseq=? and id=?";
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userLikeDTO.getSeq());
			pstmt.setString(2, userLikeDTO.getId());
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
	
	public int addLikeStatus(UserLikeDTO userLikeDTO) {
		
		try {
			String sql = "insert into tblwish(seq, realestateseq, id) values(seqwish.nextval, ?, ?)";
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userLikeDTO.getSeq());
			pstmt.setString(2, userLikeDTO.getId());
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
