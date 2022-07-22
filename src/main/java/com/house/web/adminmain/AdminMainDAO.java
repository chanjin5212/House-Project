package com.house.web.adminmain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.house.util.DBUtil;

public class AdminMainDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public AdminMainDAO() {
		conn = DBUtil.open();
	}

	public int getCount() {

		int count = 0;

		try {
			String sql = "select count(*) as total from tblReport";
			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {
				count = rs.getInt("total");
			}
			rs.close();

		} catch (Exception e) {
			System.out.println("AdminMainDAO.getCount");
			e.printStackTrace();
		}
		return count;

	}
	
	public int getMemCount() {

		int cnt = 0;

		try {
			String sql = "select count(*) as memcount from tblMember";
			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			if (rs.next()) {
				cnt = rs.getInt("memcount");
			}
			rs.close();

		} catch (Exception e) {
			System.out.println("AdminMainDAO.getMemCount");
			e.printStackTrace();
		}
		return cnt;

	}

}
