package com.house.web.userrealestate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

import com.house.util.DBUtil;

public class CounselDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public int addCounsel(CounselDTO dto) {
		
		try {
			String sql = "insert into tblCounsel(seq, memberid, realestateseq, content, state) values(SEQCOUNSEL.nextval, ?, ?, ?, '처리중')";
			
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getRealestateseq());
			pstmt.setString(3, dto.getContent());
			
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

	public ArrayList<ReportCategoryDTO> getReportCategory() {
		
		try {
			String sql = "select * from tblreporttype";
			
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<ReportCategoryDTO> category = new ArrayList<ReportCategoryDTO>();
			
			while(rs.next()) {
				ReportCategoryDTO reportCategoryDTO = new ReportCategoryDTO();
				reportCategoryDTO.setSeq(rs.getString("seq"));
				reportCategoryDTO.setCategory(rs.getString("name"));
				
				category.add(reportCategoryDTO);
			}
			
			return category;
			
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

	public String addReportContent(Map<String, String> data) {
		
		String reportSeq = null;
		try {
			String sql1 = "insert into tblreport(seq, id, realestateseq, content, state) "
					+ "values(seqreport.nextval, ?, ?, ?, '대기중')";
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, data.get("id"));
			pstmt.setString(2, data.get("seq"));
			pstmt.setString(3, data.get("text"));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pstmt.close();
				String sql2 = "select seqreport.currval as reportSeq from dual";
				pstmt = conn.prepareStatement(sql2);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					reportSeq = rs.getString("reportSeq");
					String sql3 = "insert into tblreportlist(seq, reportseq, reporttypeseq) values(seqreportlist.nextval, ?, ?)";
					pstmt.close();
					pstmt = conn.prepareStatement(sql3);
					pstmt.setString(1, reportSeq);
					pstmt.setString(2, data.get("category"));
					rs = pstmt.executeQuery();
					
					if(rs.next()) {
						return reportSeq;			
					}	
				}
			}
	
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

	public int addReportFiles(String reportSeq, ArrayList<String> saveFiles) {
		try {
			String sql = "insert into tblreportpicture(seq, reportseq, jpg) values(seqreportpicture.nextval, ?, ?)";
			conn = DBUtil.open();
			conn.setAutoCommit(false);
			pstmt = conn.prepareStatement(sql);
			
			for(String file : saveFiles) {
				pstmt.setString(1, reportSeq);
				pstmt.setString(2, file);
				pstmt.addBatch();
				pstmt.clearParameters();//파라미터 초기화
			}
			pstmt.executeBatch();
			pstmt.clearParameters();//배치 초기화
			conn.commit();
			return 1;
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
