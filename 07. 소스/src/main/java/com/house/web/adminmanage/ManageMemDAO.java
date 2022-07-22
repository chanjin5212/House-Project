package com.house.web.adminmanage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;

public class ManageMemDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ManageMemDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<ManageMemDTO> getList(int pageNum, int amout) {
		
		ArrayList<ManageMemDTO> list = new ArrayList<>();

		try {

			String sql = "SELECT * FROM (SELECT ROWNUM RN, a.* FROM (SELECT * FROM tblmember) A) WHERE RN > ? AND RN <= ?";

			pstat = conn.prepareStatement(sql);
			int amount=0;
			pstat.setInt(1, (pageNum - 1) * amount);
			pstat.setInt(2, pageNum * amount);
			rs = pstat.executeQuery();

			while (rs.next()) {
				ManageMemDTO dto = new ManageMemDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setSsn(rs.getString("ssn"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				dto.setTel(rs.getString("tel"));
				dto.setActive(rs.getString("active"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int getTotal() {
		int result = 0;
		
		String sql = "select count(*) as total from tblMember";
		
		try {
			pstat = conn.prepareStatement(sql);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("total");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	
	

	/*
	 * public ArrayList<ManageMemDTO> getList() { try {
	 * 
	 * String sql = "select * from tblMember";
	 * 
	 * stat = conn.createStatement();
	 * 
	 * rs = stat.executeQuery(sql);
	 * 
	 * ArrayList<ManageMemDTO> list = new ArrayList<ManageMemDTO>();
	 * 
	 * while (rs.next()) { ManageMemDTO dto = new ManageMemDTO();
	 * dto.setSeq(rs.getString("seq")); dto.setName(rs.getString("name"));
	 * dto.setId(rs.getString("id")); dto.setSsn(rs.getString("ssn"));
	 * dto.setEmail(rs.getString("email")); dto.setAddress(rs.getString("address"));
	 * dto.setTel(rs.getString("tel")); dto.setActive(rs.getString("active"));
	 * list.add(dto); } return list;
	 * 
	 * } catch (Exception e) { System.out.println("ManageMemDAO.list");
	 * e.printStackTrace(); }
	 * 
	 * return null;
	 * 
	 * }
	 */

	/*
	 * public int getNext() { //새 번호 부여 String SQL =
	 * "select seq from tblmember orderby seq desc";
	 * 
	 * try { pstat = conn.createStatement(SQL); rs = pstat.executeQuery();
	 * 
	 * if(rs.next()) { return rs.getInt(1)+1; } return 1;
	 * 
	 * }catch (exception e) { e.printStackTrace(); } return -1;
	 * 
	 * 
	 * }
	 */
	/*
	 * public ArrayList<ManageMemDTO> getList(int pageNumber) {
	 * 
	 * try {
	 * 
	 * String SQL = "select * from tblmember where seq < ? order by desc";
	 * 
	 * pstat = conn.createStatement(SQL); pstat.setInt(1, getNext() - (pageNumber -
	 * 1) * 10); rs = pstat.executeQuery();
	 * 
	 * ArrayList<ManageMemDTO> list = new ArrayList<ManageMemDTO>(); while
	 * (rs.next()) { ManageMemDTO dto = new ManageMemDTO();
	 * dto.setSeq(rs.getString("seq")); dto.setName(rs.getString("name"));
	 * dto.setId(rs.getString("id")); dto.setSsn(rs.getString("ssn"));
	 * dto.setAddress(rs.getString("address")); dto.setTel(rs.getString("tel"));
	 * dto.setActive(rs.getString("active")); list.add(dto); }
	 * 
	 * } catch (Exception e) { e.printStackTrace(); }
	 * 
	 * return list; }
	 */

	/*
	 * public boolean nextPage(int pageNumber) { String sql =
	 * "select * from tblmember where seq < ?"; try { pstat =
	 * conn.prepareStatement(sql); pstat.setInt(1, getNext() - (pageNumber - 1)*10);
	 * rs = pstat.executeQuery();
	 * 
	 * if(rs.next()) { return true; } }catch (Exception e) { e.printStackTrace(); }
	 * return false; }
	 */

}
