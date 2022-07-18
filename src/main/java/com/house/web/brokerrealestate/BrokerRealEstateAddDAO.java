package com.house.web.brokerrealestate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;

public class BrokerRealEstateAddDAO {
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BrokerRealEstateAddDAO() {
		conn = DBUtil.open();
	}

	public ArrayList<BrokerRealEstateAddDTO> cGetList() {

		try {
			
			String sql = "select * from tblContract";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			ArrayList<BrokerRealEstateAddDTO> list = new ArrayList<BrokerRealEstateAddDTO>();
			while (rs.next()) {
				BrokerRealEstateAddDTO dto = new BrokerRealEstateAddDTO();
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

	public ArrayList<BrokerRealEstateAddDTO> bGetList() {
			
		try {
			
			String sql = "select * from tblBuildingType";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			ArrayList<BrokerRealEstateAddDTO> list = new ArrayList<BrokerRealEstateAddDTO>();
			while (rs.next()) {
				BrokerRealEstateAddDTO dto = new BrokerRealEstateAddDTO();
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

	public ArrayList<BrokerRealEstateAddDTO> rGetList() {
		
		try {
			
			String sql = "select * from tblRoomType";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			ArrayList<BrokerRealEstateAddDTO> list = new ArrayList<BrokerRealEstateAddDTO>();
			while (rs.next()) {
				BrokerRealEstateAddDTO dto = new BrokerRealEstateAddDTO();
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

	public ArrayList<BrokerRealEstateAddDTO> mGetList() {

		try {
			
			String sql = "select * from tblMainUse";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			ArrayList<BrokerRealEstateAddDTO> list = new ArrayList<BrokerRealEstateAddDTO>();
			while (rs.next()) {
				BrokerRealEstateAddDTO dto = new BrokerRealEstateAddDTO();
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

	public void setDeputy(BrokerRealEstateAddDTO dto) {

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

	public void setOwner(BrokerRealEstateAddDTO dto, String maxSeq) {

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

	public void setRealEstate(BrokerRealEstateAddDTO dto) {

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

	public void setDeposit(BrokerRealEstateAddDTO dto, String maxSeq) {

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

	public void setStructure(BrokerRealEstateAddDTO dto, String maxSeq) {

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

	public void setOption(BrokerRealEstateAddDTO dto, String maxSeq) {

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

	public void setManagementFee(BrokerRealEstateAddDTO dto, String maxSeq) {

		
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

	public int setParking(BrokerRealEstateAddDTO dto, String maxSeq) {

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

	public ArrayList<BrokerRealEstateAddDTO> getMyList(String id) {

		try {
			
			String sql = "select re.seq, re.memberid, re.realestateaddr, re.price, cr.brokercheck, cr.state, c.name, d.deposit, (select count(*) from tblWish where seq = re.seq) as wish from tblRealEstate re left outer join tblContractRequest cr on re.seq = cr.realestateseq inner join tblContract c on re.contractseq = c.seq left outer join tblDeposit d on re.seq = d.realestateseq where re.memberid = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			ArrayList<BrokerRealEstateAddDTO> list = new ArrayList<BrokerRealEstateAddDTO>();
			while(rs.next()) {
				BrokerRealEstateAddDTO dto = new BrokerRealEstateAddDTO();
				if (rs.getString("state") == null) {
					dto.setContractCheck("판매중");
				} else if(rs.getString("state").equals("대기중")) {
					dto.setContractCheck("계약중");
				} else {
					continue;
				}
				dto.setSeq(rs.getString("seq"));
				dto.setRealEstateAddr(rs.getString("realestateaddr"));
				dto.setPrice(rs.getString("price"));
				dto.setName(rs.getString("name"));
				dto.setWish(rs.getString("wish"));
				if (rs.getString("deposit") != null) {
					dto.setDeposit(rs.getString("deposit"));
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
}
