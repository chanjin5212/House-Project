package com.house.web.adminreport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;
import com.house.web.adminmanage.ManageMemDTO;

public class ReportDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public ReportDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<ReportDTO> getList() {
		try {

			String sql = "select * from vwReport";

			stat = conn.createStatement();

			rs = stat.executeQuery(sql);

			ArrayList<ReportDTO> list = new ArrayList<ReportDTO>();

			while (rs.next()) {
				ReportDTO dto = new ReportDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setBuildingTypeSeq(rs.getString("buildingTypeSeq"));
				dto.setRealEstateAddr(rs.getString("realEstateAddr"));
				dto.setId(rs.getString("id"));
				dto.setState(rs.getString("state"));
				list.add(dto);
			}
			return list;

		} catch (Exception e) {
			System.out.println("ReportDAO.list");
			e.printStackTrace();
		}

		return null;

	}

	public ReportDTO getDetail(int num) {

		ReportDTO dto = null;

		String sql = "select * from vwReport where seq=?";

		try {

			pstat = conn.prepareStatement(sql);
			pstat.setInt(1, num);

			rs = pstat.executeQuery();

			if (rs.next()) {
				dto = new ReportDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setBuildingTypeSeq(rs.getString("buildingtypeseq"));
				dto.setRealEstateAddr(rs.getString("realEstateAddr"));
				dto.setId(rs.getString("id"));
				dto.setState(rs.getString("state"));
			}
			return dto;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


}
