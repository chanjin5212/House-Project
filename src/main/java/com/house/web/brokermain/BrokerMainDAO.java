package com.house.web.brokermain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;


public class BrokerMainDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BrokerMainDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<BrokerMainDTO> getList() {

		
		try {
			
			String sql = "select * from tblStayReview where regdate > sysdate - 7 order by views desc";
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<BrokerMainDTO> list = new ArrayList<BrokerMainDTO>();
			while (rs.next()) {
				BrokerMainDTO dto = new BrokerMainDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("BrokerMainDAO.getList");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public BrokerMainDTO getCount() {

		try {
			
			String sql = "select \r\n"
					+ "(select count(*) from tblContractDoc cd inner join tblRealEstate re on cd.realestateseq = re.seq inner join tblContract c on re.contractseq = c.seq where c.name = '전세') as jeonse,\r\n"
					+ "(select count(*) from tblContractDoc cd inner join tblRealEstate re on cd.realestateseq = re.seq inner join tblContract c on re.contractseq = c.seq where c.name = '매매') as sales,\r\n"
					+ "(select count(*) from tblContractDoc cd inner join tblRealEstate re on cd.realestateseq = re.seq inner join tblContract c on re.contractseq = c.seq where c.name = '월세') as monthly\r\n"
					+ "from dual";
			
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				BrokerMainDTO dto = new BrokerMainDTO();
				dto.setSales(rs.getString("sales"));
				dto.setJeonse(rs.getString("jeonse"));
				dto.setMonthly(rs.getString("monthly"));
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("BrokerMainDAO.getCount");
			e.printStackTrace();
		}
		
		return null;
	}

}
