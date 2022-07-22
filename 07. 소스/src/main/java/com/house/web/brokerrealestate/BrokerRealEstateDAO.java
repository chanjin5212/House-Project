package com.house.web.brokerrealestate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;

public class BrokerRealEstateDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BrokerRealEstateDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<BrokerRealEstateDTO> cGetList() {

		try {
			
			String sql = "select * from tblContract";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			ArrayList<BrokerRealEstateDTO> list = new ArrayList<BrokerRealEstateDTO>();
			while (rs.next()) {
				BrokerRealEstateDTO dto = new BrokerRealEstateDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setContractName(rs.getString("name"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.cGetList");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<BrokerRealEstateDTO> bGetList() {
			
		try {
			
			String sql = "select * from tblBuildingType";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			ArrayList<BrokerRealEstateDTO> list = new ArrayList<BrokerRealEstateDTO>();
			while (rs.next()) {
				BrokerRealEstateDTO dto = new BrokerRealEstateDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setBuildingTypeName(rs.getString("name"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.cGetList");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<BrokerRealEstateDTO> rGetList() {
		
		try {
			
			String sql = "select * from tblRoomType";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			ArrayList<BrokerRealEstateDTO> list = new ArrayList<BrokerRealEstateDTO>();
			while (rs.next()) {
				BrokerRealEstateDTO dto = new BrokerRealEstateDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setRoomTypeName(rs.getString("name"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.cGetList");
			e.printStackTrace();
		}
		
		return null;
	}

	public ArrayList<BrokerRealEstateDTO> mGetList() {

		try {
			
			String sql = "select * from tblMainUse";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			ArrayList<BrokerRealEstateDTO> list = new ArrayList<BrokerRealEstateDTO>();
			while (rs.next()) {
				BrokerRealEstateDTO dto = new BrokerRealEstateDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setMainUseName(rs.getString("name"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.cGetList");
			e.printStackTrace();
		}
		
		return null;
	}

	public void setDeputy(BrokerRealEstateDTO dto) {

		try {
			
			String sql = "INSERT INTO tblDeputy VALUES (seqDeputy.nextVal, ?, ?, ?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getDeputyName());
			pstat.setString(2, dto.getDeputyAddress());
			pstat.setString(3, dto.getDeputySsn());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setDeputy");
			e.printStackTrace();
		}
		
		
	}

	public void setOwner(BrokerRealEstateDTO dto, String maxSeq) {

		try {
			
			String sql = "INSERT INTO tblOwner VALUES (seqOwner.nextVal,?, ?, ?, ?, ?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, maxSeq);
			pstat.setString(2, dto.getOwnerName());
			pstat.setString(3, dto.getOwnerSsn());
			pstat.setString(4, dto.getOwnerAddress());
			pstat.setString(5, dto.getOwnerTel());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setOwner");
			e.printStackTrace();
		}
	}

	public String getDeputySeq() {

		try {
			
			String sql = "select max(seq) as seq from tblDeputy";
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.getSeq");
			e.printStackTrace();
		}
		
		return null;
	}

	public String getOwnerSeq() {

		try {
			
			String sql = "select max(seq) as seq from tblOwner";
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.getOwnerSeq");
			e.printStackTrace();
		}
		
		return null;
	}

	public void setRealEstate(BrokerRealEstateDTO dto) {

		try {
			
			String sql = "INSERT INTO tblRealEstate VALUES(seqRealEstate.nextVal, ?, ?, ?, ?, ?, ?, default, default, ?, '거래전', ?, ?, ?, ?, ?, ?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getOwnerSeq());
			pstat.setString(3, dto.getBuildingTypeSeq());
			pstat.setString(4, dto.getContractSeq());
			pstat.setString(5, dto.getRealEstateAddr());
			pstat.setString(6, dto.getBrokerReward());
			pstat.setString(7, dto.getPrice());
			pstat.setString(8, dto.getIntroduce());
			pstat.setString(9, dto.getMoveInDate());
			pstat.setString(10, dto.getPetOk());
			pstat.setString(11, dto.getLoanOk());
			pstat.setString(12, dto.getCoordinateX());
			pstat.setString(13, dto.getCoordinateY());
			
			pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setRealEstate");
			e.printStackTrace();
		}
		
		
	}

	public String getRealEstate() {

		try {
			
			String sql = "select max(seq) as seq from tblRealEstate";
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.getRealEstate");
			e.printStackTrace();
		}
		
		return null;
	}

	public void setDeposit(BrokerRealEstateDTO dto, String maxSeq) {

		try {
			
			String sql = "insert into tblDeposit values(seqDeposit.nextVal,?,?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, maxSeq);
			pstat.setString(2, dto.getDeposit());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setDeposit");
			e.printStackTrace();
		}
		
		
	}

	public void setStructure(BrokerRealEstateDTO dto, String maxSeq) {

		try {
			
			String sql = "insert into tblStructure values(seqStructure.nextVal,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, maxSeq);
			pstat.setString(2, dto.getRoomTypeSeq());
			pstat.setString(3, dto.getMainUseSeq());
			pstat.setString(4, dto.getNumRoom());
			pstat.setString(5, dto.getNumToilets());
			pstat.setString(6, dto.getNumBalcony());
			pstat.setString(7, dto.getHeatingType());
			pstat.setString(8, dto.getDirection());
			pstat.setString(9, dto.getBuilt());
			pstat.setString(10, dto.getBuildingFloor());
			pstat.setString(11, dto.getTheFloor());
			pstat.setString(12, dto.getDedicatedArea());
			pstat.setString(13, dto.getSupplyArea());
			pstat.setString(14, dto.getElevatorStatus());
			
			pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setStructure");
			e.printStackTrace();
		}
		
		
	}

	public void setOption(BrokerRealEstateDTO dto, String maxSeq) {

		try {
			
			String sql = "INSERT INTO tblOption values(seqOption.nextVal, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, maxSeq);
			pstat.setString(2, dto.getTelevision());
			pstat.setString(3, dto.getAirConditioner());
			pstat.setString(4, dto.getRefrigerator());
			pstat.setString(5, dto.getWashingMachine());
			pstat.setString(6, dto.getDryer());
			pstat.setString(7, dto.getInduction());
			pstat.setString(8, dto.getGasRange());
			pstat.setString(9, dto.getDesk());
			pstat.setString(10, dto.getBookshelf());
			pstat.setString(11, dto.getBed());
			pstat.setString(12, dto.getCloset());
			pstat.setString(13, dto.getDishWasher());
			pstat.setString(14, dto.getShoeCloset());
			
			pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setOption");
			e.printStackTrace();
		}
		
		
	}

	public void setManagementFee(BrokerRealEstateDTO dto, String maxSeq) {

		
		try {
			
			String sql = "insert into tblManagementFee(seq, realEstateSeq, amount, electricityBill, gasBill, waterBill, televisionBill, internetBill, parkingBill) values(seqManagementFee.nextVal, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, maxSeq);
			pstat.setString(2, dto.getAmount());
			pstat.setString(3, dto.getElectricityBill());
			pstat.setString(4, dto.getGasBill());
			pstat.setString(5, dto.getWaterBill());
			pstat.setString(6, dto.getTelevisionBill());
			pstat.setString(7, dto.getInternetBill());
			pstat.setString(8, dto.getParkingBill());
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setManagementFee");
			e.printStackTrace();
		}
		
	}

	public int setParking(BrokerRealEstateDTO dto, String maxSeq) {

		try {
			
			String sql = "insert into tblParking values(seqParking.nextVal,?,?,?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, maxSeq);
			pstat.setString(2, dto.getParkingStatus());
			pstat.setString(3, dto.getNumParkSpace());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setParking");
			e.printStackTrace();
		}
		return 0;
		
	}

	public void setRealEstatePicture(String name, String maxSeq) {

		try {
			
			String sql = "insert into tblRealEstatePicture values (seqRealEstatePicture.nextVal, ?, ?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, maxSeq);
			pstat.setString(2, name);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setRealEstatePicture");
			e.printStackTrace();
		}
		
	}

	public ArrayList<BrokerRealEstateDTO> getMyList(String id) {

		try {
			
			String sql = "select re.seq, re.memberid, re.realestateaddr, re.price, c.name,(select state from tblContractRequest where seq = (select max(seq) from tblContractRequest where realestateseq = re.seq)) as state, d.deposit, (select count(*) from tblWish where realestateseq = re.seq) as wish, (select jpg from tblRealEstatepicture where seq = (select min(seq) from tblRealEstatepicture where realestateseq = re.seq) and realestateseq = re.seq) as img from tblRealEstate re inner join tblContract c on re.contractseq = c.seq left outer join tblDeposit d on re.seq = d.realestateseq where re.memberid = ? order by re.seq desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			ArrayList<BrokerRealEstateDTO> list = new ArrayList<BrokerRealEstateDTO>();
			while(rs.next()) {
				BrokerRealEstateDTO dto = new BrokerRealEstateDTO();
				if (rs.getString("state") == null || rs.getString("state").equals("거절")) {
					dto.setContractCheck("판매중");
				} else if(rs.getString("state").equals("대기중")) {
					dto.setContractCheck("계약중");
				} else {
					continue;
				}
				dto.setSeq(rs.getString("seq"));
				dto.setRealEstateAddr(rs.getString("realestateaddr"));
				
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
			System.out.println("BrokerRealEstateAddDAO.getMyList");
			e.printStackTrace();
		}
		
		return null;
	}

	public String getListCount(String id) {
		
		try {
			
			String sql = "select count(*) as cnt from tblRealEstate re left outer join tblContractRequest cr on re.seq = cr.realestateseq inner join tblContract c on re.contractseq = c.seq left outer join tblDeposit d on re.seq = d.realestateseq where re.memberid = ? and state is null or state = '대기중'";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			if (rs.next()) {
				return rs.getString("cnt");				
			}
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.getListCount");
			e.printStackTrace();
		}
		
		return null;
	}

	public void cancelRefusal(String seq) {

		try {
			
			String sql = "delete from tblRefusal where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();

		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.cancel");
			e.printStackTrace();
		}
		

	}

	public String getSeq(String seq) {

		try {
			
			String sql = "select * from tblContractRequest where realestateseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.getSeq");
			e.printStackTrace();
		}
		
		return null;
	}

	public int cancelContract(String getSeq) {

		try {
			
			
			String sql = "delete from tblContractRequest where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, getSeq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.cancelContract");
			e.printStackTrace();
		}
		
		return 0;
	}

	public void delAll(String seq) {

		try {
			
			String sql = "delete from tblDeposit where realEstateSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
			sql = "delete from tblParking where realEstateSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
			sql = "delete from tblStructure where realEstateSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
			sql = "delete from tblOption where realEstateSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
			sql = "delete from tblManagementFee where realEstateSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
			sql = "delete from tblRealEstatePicture where realEstateSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
			sql = "delete from tblWish where realEstateSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
			sql = "delete from tblCounsel where realEstateSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			

		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.delAll");
			e.printStackTrace();
		}
		
		
	}

	public int delRealEstate(String seq) {

		try {
			
			String sql = "delete from tblRealEstate where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.delRealEstate");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int report(String seq) {

		try {
			
			String sql = "select count(*) as cnt from tblReport where realEstateSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
			
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.report");
			e.printStackTrace();
		}
		
		return 0;
	}
}
