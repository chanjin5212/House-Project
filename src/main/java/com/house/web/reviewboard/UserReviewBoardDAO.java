package com.house.web.reviewboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;

public class UserReviewBoardDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserReviewBoardDAO() {
		conn = DBUtil.open();
	}

	public int getMember(String id) {

		try {
			
			String sql = "select count(*) as cnt from tblMember m inner join tblBroker b on m.id = b.id where m.id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getMember");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<UserReviewBoardDTO> getList(String recent) {

		try {
			
			String order = "";
			if (recent.equals("0")) {
				order = "order by seq desc";
			} else if (recent.equals("1")) {
				order = "order by views desc";
			}
			
			String sql = "select * from tblStayReview " + order;
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<UserReviewBoardDTO> list = new ArrayList<UserReviewBoardDTO>();
			
			while (rs.next()) {
				UserReviewBoardDTO dto = new UserReviewBoardDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setViews(rs.getString("views"));
				dto.setSeq(rs.getString("seq"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getList");
			e.printStackTrace();
		}
		
		return null;
	}

}
