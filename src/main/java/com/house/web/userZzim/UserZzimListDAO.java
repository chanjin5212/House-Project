package com.house.web.userZzim;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;


public class UserZzimListDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserZzimListDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<UserZzimListDTO> getMyList(String id) {

		try {
			
			String sql = "select w.seq, w.id, re.dealstate, re.realestateaddr, re.coordinatex, re.coordinatey, re.seq as reseq, re.price, d.deposit, c.name, (select jpg from tblRealEstatepicture where seq = (select min(seq) from tblRealEstatepicture where realestateseq = re.seq) and realestateseq = re.seq) as img from tblWish w inner join tblRealEstate re on w.realestateseq = re.seq inner join tblContract c on c.seq = re.contractseq left outer join tblDeposit d on re.seq = d.realestateseq where w.id = ? order by seq desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			ArrayList<UserZzimListDTO> list = new ArrayList<UserZzimListDTO>();
			while(rs.next()) {
				UserZzimListDTO dto = new UserZzimListDTO();
				if(rs.getString("dealstate").equals("거래완료")) continue;
				dto.setReSeq(rs.getString("reseq"));
				dto.setSeq(rs.getString("seq"));
				dto.setRealEstateAddr(rs.getString("realestateaddr"));
				dto.setCoordinateX(rs.getString("coordinatex"));
				dto.setCoordinateY(rs.getString("coordinatey"));
				
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
			System.out.println("UserZzimListDAO.getMyList");
			e.printStackTrace();
		}
		
		return null;
	}

	public String getListCount(String id) {
		
		try {
			
			String sql = "select count(*) as cnt from tblWish w inner join tblRealEstate re on w.realestateseq = re.seq inner join tblContract c on c.seq = re.contractseq left outer join tblDeposit d on re.seq = d.realestateseq where w.id = ? order by w.seq desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			if (rs.next()) {
				return rs.getString("cnt");				
			}
			
		} catch (Exception e) {
			System.out.println("UserZzimListDAO.getListCount");
			e.printStackTrace();
		}
		
		return null;
	}

	public int delZzim(String seq) {

		try {
			
			String sql = "delete from tblWish where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
 			
		} catch (Exception e) {
			System.out.println("UserZzimListDAO.delZzim");
			e.printStackTrace();
		}
		
		return 0;
	}

}
