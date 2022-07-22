package com.house;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;

public class MainDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public MainDAO() {
		conn = DBUtil.open();
	}

	public String getAddress(String id) {

		try {
			
			String sql = "select REGEXP_SUBSTR(address, '[^ ]+', 1, 2) as address from tblMember where id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("address");
			}
			
		} catch (Exception e) {
			System.out.println("MainDAO.getAddress");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<MainDTO> getMyList(String address) {

		try {
			String where = String.format("'%%%s%%'", address);
			
			String sql = String.format("select re.seq, re.memberid, re.coordinatex, re.coordinatey,re.realestateaddr,re.price,cr.brokercheck,cr.state,bt.name as bname, c.name, d.deposit,(select count(*) from tblWish where realestateseq = re.seq) as wish, (select jpg from tblRealEstatepicture where seq = (select min(seq) from tblRealEstatepicture where realestateseq = re.seq) and realestateseq = re.seq) as img from tblRealEstate re left outer join tblContractRequest cr on re.seq = cr.realestateseq inner join tblContract c on re.contractseq = c.seq left outer join tblDeposit d on re.seq = d.realestateseq inner join tblBuildingType bt on bt.seq = re.buildingtypeseq where re.realestateaddr like %s order by wish desc", where);
			stat = conn.createStatement();
			
			
			rs = stat.executeQuery(sql);
			ArrayList<MainDTO> list = new ArrayList<MainDTO>();
			while(rs.next()) {
				MainDTO dto = new MainDTO();
				if (rs.getString("state") == null) {
					dto.setContractCheck("판매중");
				} else {
					continue;
				}
				dto.setSeq(rs.getString("seq"));
				dto.setRealEstateAddr(rs.getString("realestateaddr"));
				dto.setCoordinateX(rs.getString("coordinatex"));
				dto.setCoordinateY(rs.getString("coordinatey"));
				dto.setBname(rs.getString("bname"));
				String price = rs.getString("price");
				if (price.length() > 4) {
					if (price.substring(price.length()-4, price.length()).equals("0000")) {
						price = price.substring(0, price.length()-4) + "억";
					} else {
						price = price.substring(0, price.length()-4) + "억" + price.subSequence(price.length()-4, price.length());
					}				
				}
				dto.setPrice(price);
				dto.setName(rs.getString("name"));
				dto.setWish(rs.getString("wish"));
				if (rs.getString("img") != null) {
					dto.setFilename(rs.getString("img"));					
				}
				if (rs.getString("deposit") != null) {
					String deposit = rs.getString("deposit");
					if (deposit.length() > 4) {
						if (deposit.substring(deposit.length()-4, deposit.length()).equals("0000")) {
							deposit = deposit.substring(0, deposit.length()-4) + "억";
						} else {
							deposit = deposit.substring(0, deposit.length()-4) + "억" + deposit.substring(deposit.length()-4, deposit.length());
						}
					}
					dto.setDeposit(deposit);
				}
				list.add(dto);
			}
			return list;
			
			
		} catch (Exception e) {
			System.out.println("MainDAO.getMyList");
			e.printStackTrace();
		}
		
		return null;
	}

	public MainDTO getCount() {

		try {
			
			String sql = "select\r\n"
					+ "(select count(*) from tblContractDoc cd inner join tblRealEstate re on cd.realestateseq = re.seq inner join tblContract c on re.contractseq = c.seq where c.name = '전세' and to_char(cd.contractdate, 'mm') = to_char(sysdate, 'mm')) as jeonse,\r\n"
					+ "(select count(*) from tblContractDoc cd inner join tblRealEstate re on cd.realestateseq = re.seq inner join tblContract c on re.contractseq = c.seq where c.name = '매매' and to_char(cd.contractdate, 'mm') = to_char(sysdate, 'mm')) as sales,\r\n"
					+ "(select count(*) from tblContractDoc cd inner join tblRealEstate re on cd.realestateseq = re.seq inner join tblContract c on re.contractseq = c.seq where c.name = '월세' and to_char(cd.contractdate, 'mm') = to_char(sysdate, 'mm')) as monthly\r\n"
					+ "from dual";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				MainDTO dto = new MainDTO();
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
