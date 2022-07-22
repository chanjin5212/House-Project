package com.house.web.userrealestate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.house.util.DBUtil;

public class UserGoodsDAO {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	public ArrayList<UserGoodsDTO> getGoodsList(LocationDTO locationDTO) {
		try {
			String sql = "select * from vwSimpleGoodsStatus"
					+ "  where dealstate = '거래전'"
					+ " and coordinatex between ? and ?"
					+ " and coordinatey between ? and ?";
			
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, locationDTO.getLng1());
			pstmt.setString(2, locationDTO.getLng2());
			pstmt.setString(3, locationDTO.getLat1());
			pstmt.setString(4, locationDTO.getLat2());
			rs= pstmt.executeQuery();
			
			ArrayList<UserGoodsDTO> goodsList = new ArrayList<UserGoodsDTO>();
			while(rs.next()) {
				UserGoodsDTO dto = new UserGoodsDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setPrice(rs.getInt("price"));
				dto.setDeposit(rs.getInt("deposit"));
				dto.setCoordinateX(rs.getString("coordinatex"));
				dto.setCoordinateY(rs.getString("coordinatey"));
				dto.setCategory(rs.getString("category"));
				dto.setType(rs.getString("type"));
				
				goodsList.add(dto);
			}
			
			return goodsList;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		return null;
	}


	public UserGoodsDTO getGoodsView(String seq) {
		try {
			
			String sql = "";
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
			
			//데이터 넣고리턴
			if(rs.next()) {
				UserGoodsDTO userGoodsDTO = new UserGoodsDTO();
				return userGoodsDTO;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		return null;
		
	}

	//이거 아무리봐도 아닌데 그냥 seq로 각 파트 여러번 db 접근하는게 나은게 아닐까?
	public RealEstateInfoDTO getRealEstateView(String seq) {

		try {
			String sql = "select ct.name as contract, bt.name as buildingtype,"
					+ " re.realestateaddr as buildingaddress, re.brokerreward as brokerreward,"
					+ " re.updatedate as updatedate, re.createdate as createdate, re.price as price,"
					+ " re.dealstate as dealstate, re.introduce as introduce, re.moveindate as moveindate,"
					+ " re.petok as petok, re.loanok as loanok, dp.deposit as deposit,"
					+ " pk.parkingstatus as parkingstatus, pk.numparkspace as numparkspace, ot.television as tv,"
					+ " ot.airconditioner as aircon, ot.refrigerator as refrigerator, ot.dryer as dryer,"
					+ " ot.induction as induction, ot.gasrange as gasrange, ot.desk as desk, ot.bed as bed,"
					+ " ot.closet as closet, ot.dishwasher as dishwasher, ot.shoecloset as shoecloset, st.numroom as numroom,"
					+ " st.numtoilets as numtoilets, st.numbalcony as numbalcony, st.heatingtype as heatingtype,"
					+ " st.direction as direction, st.built as built, st.buildingfloor as buildingfloor, st.thefloor as thefloor,"
					+ " st.dedicatedarea as dedicatedarea, st.supplyarea as supplyarea, st.elevatorstatus as elevatorsstatus,"
					+ " rt.name as roomtype, mu.name as mainuse, mf.amount as amountmanagementfee, mf.electricitybill as electricitybill,"
					+ " mf.gasbill as gasbill, mf.internetbill as internetbill, mf.parkingbill as parkingbill,"
					+ " mf.televisionbill as televisionbill, mf.waterbill as waterbill, mb.name as brokername,"
					+ " bs.star as brokerscore, bk.firmname as firmname, bk.corporatenum as corporatenum, bk.firmaddress as firmaddress,"
					+ " bk.profileimg as brokerprofileimg"
					+ " from (select * from tblRealEstate where seq = ?) re inner join tblcontract ct on re.contractseq = ct.seq"
					+ " inner join tblbuildingtype bt on re.buildingTypeSeq = bt.seq"
					+ " left join tbldeposit dp on re.seq = dp.realestateseq"
					+ " inner join tblparking pk on re.seq = pk.realestateseq"
					+ " inner join tbloption ot on re.seq = ot.realestateseq"
					+ " inner join tblstructure st on re.seq = st.realestateseq"
					+ " inner join tblroomtype rt on st.roomtypeseq = rt.seq"
					+ " inner join tblmainuse mu on st.mainuseseq = mu.seq"
					+ " inner join tblmanagementfee mf on re.seq = mf.realestateseq"
					+ " inner join tblmember mb on re.memberid = mb.id"
					+ " left join tblbrokerscore bs on mb.id = bs.id"
					+ " inner join tblbroker bk on mb.id = bk.id";
			
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
			
			RealEstateInfoDTO realEstateInfoDTO = new RealEstateInfoDTO();
			if(rs.next()) {
				realEstateInfoDTO.setContract(rs.getString("contract"));
				realEstateInfoDTO.setBuildingtype(rs.getString("buildingtype"));
				realEstateInfoDTO.setBuildingaddress(rs.getString("buildingaddress"));
				realEstateInfoDTO.setBrokerreward(rs.getString("brokerreward"));
				realEstateInfoDTO.setUpdatedate(rs.getString("updatedate"));
				realEstateInfoDTO.setCreatedate(rs.getString("createdate"));
				realEstateInfoDTO.setPrice(rs.getString("price"));
				realEstateInfoDTO.setDealstate(rs.getString("dealstate"));
				realEstateInfoDTO.setIntroduce(rs.getString("introduce"));
				realEstateInfoDTO.setMoveindate(rs.getString("moveindate"));
				realEstateInfoDTO.setPetok(rs.getString("petok"));
				realEstateInfoDTO.setLoanok(rs.getString("loanok"));
				realEstateInfoDTO.setDeposit(rs.getString("deposit"));
				realEstateInfoDTO.setParkingstatus(rs.getString("parkingstatus"));
				realEstateInfoDTO.setNumparkspace(rs.getString("numparkspace"));
				realEstateInfoDTO.setTv(rs.getString("tv"));
				realEstateInfoDTO.setAircon(rs.getString("aircon"));
				realEstateInfoDTO.setRefrigerator(rs.getString("refrigerator"));
				realEstateInfoDTO.setDryer(rs.getString("dryer"));
				realEstateInfoDTO.setInduction(rs.getString("induction"));
				realEstateInfoDTO.setGasrange(rs.getString("gasrange"));
				realEstateInfoDTO.setDesk(rs.getString("desk"));
				realEstateInfoDTO.setBed(rs.getString("bed"));
				realEstateInfoDTO.setCloset(rs.getString("closet"));
				realEstateInfoDTO.setDishwasher(rs.getString("dishwasher"));
				realEstateInfoDTO.setShoecloset(rs.getString("shoecloset"));
				realEstateInfoDTO.setNumroom(rs.getString("numroom"));
				realEstateInfoDTO.setRoomtype(rs.getString("roomtype"));
				realEstateInfoDTO.setMainuse(rs.getString("mainuse"));
				realEstateInfoDTO.setThefloor(rs.getString("thefloor"));
				realEstateInfoDTO.setNumtoilets(rs.getString("numtoilets"));
				realEstateInfoDTO.setNumbalcony(rs.getString("numbalcony"));
				realEstateInfoDTO.setHeatingtype(rs.getString("heatingtype"));
				realEstateInfoDTO.setDirection(rs.getString("direction"));
				realEstateInfoDTO.setBuilt(rs.getString("built"));
				realEstateInfoDTO.setBuildingfloor(rs.getString("buildingfloor"));
				realEstateInfoDTO.setDedicatedarea(rs.getString("dedicatedarea"));
				realEstateInfoDTO.setSupplyarea(rs.getString("supplyarea"));
				realEstateInfoDTO.setElevatorsstatus(rs.getString("elevatorsstatus"));
				realEstateInfoDTO.setAmountmanagementfee(rs.getString("amountmanagementfee"));
				realEstateInfoDTO.setElectricitybill(rs.getString("electricitybill"));
				realEstateInfoDTO.setGasbill(rs.getString("gasbill"));
				realEstateInfoDTO.setInternetbill(rs.getString("internetbill"));
				realEstateInfoDTO.setParkingbill(rs.getString("parkingbill"));
				realEstateInfoDTO.setTelevisionbill(rs.getString("televisionbill"));
				realEstateInfoDTO.setWaterbill(rs.getString("waterbill"));
				realEstateInfoDTO.setBrokername(rs.getString("brokername"));
				realEstateInfoDTO.setBrokerscore(rs.getString("brokerscore"));
				realEstateInfoDTO.setFirmname(rs.getString("firmname"));
				realEstateInfoDTO.setCorporatenum(rs.getString("corporatenum"));
				realEstateInfoDTO.setFirmaddress(rs.getString("firmaddress"));
				realEstateInfoDTO.setBrokerprofileimg(rs.getString("brokerprofileimg"));
				
				return realEstateInfoDTO;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		return null;
	}


	public ArrayList<String> getRealEstateImg(String seq) {
		try {
			String sql = "select jpg as img from tblrealestatepicture where realestateseq = ?";
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
			
			ArrayList<String> imgList = new ArrayList<String>();
			
			while(rs.next()) {
				imgList.add(rs.getString("img"));
			}
			
			return imgList;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		return null;
	}


	public String getGoodsImg(String seq) {
		try {
			String sql = "select jpg as img from tblrealestatepicture where realestateseq = ? and rownum = 1";
			
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, seq);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getString("img");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		return null;
	}


	public SidebarGoodsDTO getGoodsList(SidebarGoodsDTO sidebarGoodsDTO) {
		
		try {
			//이미지 먼저 얻어오기
			String sql = "select jpg as img from tblrealestatepicture where realestateseq = ? and rownum=1";
			conn = DBUtil.open();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, sidebarGoodsDTO.getRealEstateSeq());
			rs = pstmt.executeQuery();
			if(rs.next()) {
				sidebarGoodsDTO.setImg(rs.getString("img"));
				pstmt.close();
				//TODO view로 만들기
				String sql2 = "select rs.coordinatex as coordinatex,"
						+ " rs.coordinatey as coordinatey, rs.introduce as introduce,"
						+ " rs.price as price, rs.realestateaddr as realestateaddr,"
						+ " ct.name as contractType, bt.name as buildingType,"
						+ " st.thefloor as thefloor, st.buildingfloor as buildingfloor,"
						+ " st.supplyarea, dp.deposit as deposit"
						+ " from tblrealestate rs"
						+ " inner join tblcontract ct on ct.seq = rs.contractseq"
						+ " left join tbldeposit dp on dp.realestateseq = rs.seq"
						+ " inner join tblbuildingtype bt on bt.seq = rs.buildingtypeseq"
						+ " inner join tblstructure st on st.realestateseq = rs.seq"
						+ " where rs.seq = ?";
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, sidebarGoodsDTO.getRealEstateSeq());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					sidebarGoodsDTO.setCoordinateX(rs.getString("coordinatex"));
					sidebarGoodsDTO.setCoordinateY(rs.getString("coordinatey"));
					sidebarGoodsDTO.setIntroduce(rs.getString("introduce"));
					sidebarGoodsDTO.setPrice(rs.getString("price"));
					sidebarGoodsDTO.setAddress(rs.getString("realestateaddr"));
					sidebarGoodsDTO.setContractType(rs.getString("contractType"));
					sidebarGoodsDTO.setBuildingType(rs.getString("buildingType"));
					sidebarGoodsDTO.setTheFloor(rs.getString("thefloor"));
					sidebarGoodsDTO.setBuldingFloor(rs.getString("buildingfloor"));
					sidebarGoodsDTO.setSupplyArea(rs.getString("supplyarea"));
					sidebarGoodsDTO.setDeposit(rs.getString("deposit"));
					
					return sidebarGoodsDTO;
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {if(conn != null) conn.close();} catch (Exception e) {e.printStackTrace();}
			try {if(pstmt != null) pstmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(stmt != null) stmt.close();} catch (Exception e) {e.printStackTrace();}
			try {if(rs != null) rs.close();} catch (Exception e) {e.printStackTrace();}
		}
		
		return null;
	}
	
	
	
}
