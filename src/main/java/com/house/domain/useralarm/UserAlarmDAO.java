package com.house.domain.useralarm;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;

public class UserAlarmDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserAlarmDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<UserAlarmDTO> getList(String id) {

		try {
			
			String sql = "select cr.seq, cr.id, cr.state, cr.brokercheck ,re.seq as reseq, re.realestateaddr, re.price, d.deposit, c.name from tblContractRequest cr inner join tblrealestate re on cr.realestateseq = re.seq inner join tblContract c on re.contractseq = c.seq left outer join tblDeposit d on d.realestateseq = re.seq where cr.id = ? order by seq desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs = pstat.executeQuery();
			
			ArrayList<UserAlarmDTO> list = new ArrayList<UserAlarmDTO>();
			
			while (rs.next()) {
				UserAlarmDTO dto = new UserAlarmDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				if (rs.getString("state").equals("완료")) continue;
				if (rs.getString("brokercheck").equals("대기중")) continue;
				dto.setState(rs.getString("state"));
				dto.setAddress(rs.getString("realestateaddr"));
				dto.setReseq(rs.getString("reseq"));
				dto.setName(rs.getString("name"));
				String price = rs.getString("price");
				if (price.length() > 4) {
					if (price.substring(price.length()-4, price.length()).equals("0000")) {
						price = price.substring(0, price.length()-4) + "억";
					} else {
						price = price.substring(0, price.length()-4) + "억" + price.subSequence(price.length()-4, price.length());
					}				
				}
				dto.setPrice(price);
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
			System.out.println("UserAlarmDAO.getList");
			e.printStackTrace();
		}
		
		return null;
	}

	public String getContent(String seq) {

		try {
			
			String sql = "select * from tblRefusal where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				String content = rs.getString("field");
				content = content.replace("<", "&lt;").replace(">", "&gt;");
				content = content.replace("\r\n", "<br>");
				
				return content;
			}
			
		} catch (Exception e) {
			System.out.println("UserAlarmDAO.getContent");
			e.printStackTrace();
		}
		
		return null;
	}

	public int delRefusal(String seq) {

		try {
			
			String sql = "delete from tblRefusal where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.executeUpdate();
			
			sql = "delete from tblContractRequest where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UserAlarmDAO.delRefusal");
			e.printStackTrace();
		}
		
		return 0;
	}

	public UserAlarmDTO getContract(String id, String seq) {

		try {
			
			String sql = "select \r\n"
					+ "o.address as ownerAddress, \r\n"
					+ "o.ssn as ownerSsn,\r\n"
					+ "o.tel as ownerTel,\r\n"
					+ "o.name as ownerName,\r\n"
					+ "c.name as contractName,\r\n"
					+ "d.address as deputyAddress,\r\n"
					+ "d.ssn as deputySsn,\r\n"
					+ "d.name as deputyName,\r\n"
					+ "m.address as memberAddress,\r\n"
					+ "m.ssn as memberSsn,\r\n"
					+ "m.tel as memberTel,\r\n"
					+ "m.name as memberName,\r\n"
					+ "b.firmaddress,\r\n"
					+ "b.firmname,\r\n"
					+ "b.representname,\r\n"
					+ "b.firmnum,\r\n"
					+ "b.firmtel,\r\n"
					+ "cd.balancedate,\r\n"
					+ "cd.contractdate,\r\n"
					+ "cd.land,\r\n"
					+ "cd.structural,\r\n"
					+ "cd.downpayment,\r\n"
					+ "d.deposit,\r\n"
					+ "t.loanamount,\r\n"
					+ "t.rentaldeposit,\r\n"
					+ "mo.borrowedmoney,\r\n"
					+ "mo.enddate as moEnddate,\r\n"
					+ "ch.enddate as chEnddate,\r\n"
					+ "re.realestateaddr,\r\n"
					+ "sc.dedicatedArea,\r\n"
					+ "sc.supplyArea\r\n"
					+ "from tblContractRequest cr \r\n"
					+ "        inner join tblrealestate re on cr.realestateseq = re.seq \r\n"
					+ "            inner join tblContract c on re.contractseq = c.seq \r\n"
					+ "                inner join tblbroker b on b.id = re.memberid inner join tblOwner o on re.ownerseq = o.seq \r\n"
					+ "                    inner join tblDeputy d on o.deputyseq = d.seq inner join tblmember m on cr.id = m.id \r\n"
					+ "                        inner join tblContractDoc cd on cd.realestateseq = re.seq \r\n"
					+ "                            inner join tblContractDoc cd on cr.realestateseq = cd.realestateseq and cr.id = cd.id \r\n"
					+ "                            inner join tblStructure sc on sc.realestateseq = re.seq\r\n"
					+ "                                left outer join tblDeposit d on re.seq = d.realestateseq\r\n"
					+ "                                    left outer join tblTrading t on t.contractdocseq = cd.seq\r\n"
					+ "                                        left outer join tblMontly mo on mo.contractdoc = cd.seq\r\n"
					+ "                                            left outer join tblCharter ch on ch.contractdoc = cd.seq where cd.id = ? and cr.seq = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				UserAlarmDTO dto = new UserAlarmDTO();
				
				dto.setOwnerAddress(rs.getString("ownerAddress"));
				dto.setOwnerSsn(rs.getString("ownerSsn"));
				dto.setOwnerTel(rs.getString("ownerTel"));
				dto.setOwnerName(rs.getString("ownerName"));
				dto.setContractName(rs.getString("contractName"));
				dto.setDeputyAddress(rs.getString("deputyAddress"));
				dto.setDeputySsn(rs.getString("deputySsn"));
				dto.setDeputyName(rs.getString("deputyName"));
				dto.setMemberAddress(rs.getString("memberAddress"));
				dto.setMemberSsn(rs.getString("memberSsn"));
				dto.setMemberTel(rs.getString("memberTel"));
				dto.setMemberName(rs.getString("memberName"));
				dto.setFirmaddress(rs.getString("firmaddress"));
				dto.setFirmname(rs.getString("firmname"));
				dto.setRepresentname(rs.getString("representname"));
				dto.setFirmnum(rs.getString("firmnum"));
				dto.setFirmtel(rs.getString("firmtel"));
				dto.setBalancedate(rs.getString("balancedate"));
				dto.setContractdate(rs.getString("contractdate"));
				dto.setLand(rs.getString("land"));
				dto.setStructural(rs.getString("structural"));
				dto.setDownPayment(rs.getString("downpayment"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setDedicatedArea(rs.getString("dedicatedArea"));
				dto.setSupplyArea(rs.getString("supplyArea"));
				if (rs.getString("deposit") != null) dto.setDeposit(rs.getString("deposit"));
				if (rs.getString("loanamount") != null) dto.setLoanamount(rs.getString("loanamount"));
				if (rs.getString("rentaldeposit") != null) dto.setRentaldeposit(rs.getString("rentaldeposit"));
				if (rs.getString("borrowedmoney") != null) dto.setBorrowedmoney(rs.getString("borrowedmoney"));
				if (rs.getString("moEnddate") != null) dto.setMoEnddate(rs.getString("moEnddate"));
				if (rs.getString("chEnddate") != null) dto.setChEnddate(rs.getString("chEnddate"));
				return dto;
			}
			
		} catch (Exception e) {
			System.out.println("UserAlarmDAO.getContract");
			e.printStackTrace();
		}
		
		return null;
	}

	public int updateContract(UserAlarmDTO dto) {

		try {
			
			String sql = "update tblcontractdoc set name = ?, address = ?, ssn = ? where id = ? and realestateseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getDeputyName());
			pstat.setString(2, dto.getDeputyAddress());
			pstat.setString(3, dto.getDeputySsn());
			pstat.setString(4, dto.getId());
			pstat.setString(5, dto.getReseq());
			
			pstat.executeUpdate();
			sql = "update tblContractRequest set state = '완료' where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getSeq());
			
			pstat.executeUpdate();
			
			sql = "update tblrealestate set dealstate = '거래완료' where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getReseq());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UserAlarmDAO.updateContract");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<String> getSeq() {

		try {
			
			String sql = "select * from tblContractRequest";
			stat = conn.createStatement();
			rs = stat.executeQuery(sql);
			
			ArrayList<String> list = new ArrayList<String>();
			if (rs.next()) {
				list.add(rs.getString("realestateseq"));
				list.add(rs.getString("id"));
				return list;
			}
			
		} catch (Exception e) {
			System.out.println("UserAlarmDAO.getSeq");
			e.printStackTrace();
		}
		
		return null;
	}
	
}
