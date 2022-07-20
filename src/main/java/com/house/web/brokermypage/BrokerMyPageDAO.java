package com.house.web.brokermypage;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.house.util.DBUtil;
import com.house.web.brokeralarm.ContractDocDto;

public class BrokerMyPageDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public BrokerMyPageDAO() {
		conn = DBUtil.open();
	}

	public BrokerLoginInfoDTO getLogInfo(String id) {

		try {
			
			BrokerLoginInfoDTO dto = new BrokerLoginInfoDTO();
			
			String sql = "select * from tblMember where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				dto.setLv(rs.getString("lv"));
				dto.setSsn(rs.getString("ssn"));
				dto.setPw(rs.getString("pw"));
				dto.setTel(rs.getString("tel"));
				dto.setEmail(rs.getString("email"));
				dto.setAddress(rs.getString("address"));
				
				
			}
			
			return dto;
			
		} catch (Exception e) {
			System.out.println("BrokerLoginInfoDAO.getLogInfo");
			e.printStackTrace();
		}
		
		return null;
	}

	//brokerSecurityEditOk
	//비밀번호 변경
	public int upatePw(BrokerLoginInfoDTO dto) {
		
		
		try {
			
			String sql = "update tblMember set pw = ? where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getId());
			
			return pstat.executeUpdate();
			
			
			
		} catch (Exception e) {
			System.out.println("BrokerLoginInfoDAO.upatePw");
			e.printStackTrace();
		}
		return 0;
	}

	//BrokerDeactive > 회원탈퇴
	public int brokerDeactive(String id) {
		
		try {
			
			String sql = "update tblMember set active = '탈퇴' where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerLoginInfoDAO.brokerDeactive");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int editLoginInfo(BrokerLoginInfoDTO dto) {
		
		try {
			
			String sql = "update tblMember set tel=?, email=?, address=? where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getTel());
			pstat.setString(2, dto.getEmail());
			pstat.setString(3, dto.getAddress());
			pstat.setString(4, dto.getId());
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.editLoginInfo");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	//거래목록 가져오기
	public ArrayList<BrokerDealListViewDTO> getDealList(String id) {
		
		try {
			
			
			String sql = "";
			
			
			
			
			//검색어 없을 때(기본값)
			sql = "select * from vwBrokerContractDoneList where brokerid=? and state='완료' order by contractdate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			
			
			ArrayList<BrokerDealListViewDTO> list = new ArrayList<BrokerDealListViewDTO>();
			
			rs = pstat.executeQuery();
			
			
			while(rs.next()) {
				
				BrokerDealListViewDTO dto = new BrokerDealListViewDTO();
				/*
				 	private String contractSeq;
					private String realEstateSeq;
					private String userId;
					private String contractCategory;
					private String contractDate;
					private String realestateAddr;
					private String deposit;
					private String price;
					private String brokerId;
				 */
				
				//왜인지 모르겠지만 갑자기 2022-07-13 00:00:00 이렇게 나와서 날짜만 나오게substring..
				//System.out.println(rs.getString("contractDate").substring(0,10));
				
				dto.setContractSeq(rs.getString("contractSeq"));
				dto.setRealEstateSeq(rs.getString("realEstateSeq"));
				dto.setUserId(rs.getString("userId"));
				dto.setContractCategory(rs.getString("contractCategory"));
				dto.setContractDate(rs.getString("contractDate").substring(0,10));
				dto.setRealestateAddr(rs.getString("realestateAddr"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setPrice(rs.getString("price"));
				dto.setBrokerId(id);
				dto.setReviewSeq(rs.getString("reviewSeq"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getDealList");
			e.printStackTrace();
		}
		
		return null;
	}

	//거래목록 출력 메소드 오버라이드
	public ArrayList<BrokerDealListViewDTO> getDealListSearch(HashMap<String, String> map) {
		try {
			
			String sql = "";
			/*
			 * //검색어 있을 때 //날짜 최신순 sql =
			 * "select * from vwBrokerContractDoneList where brokerid=? and state='완료' order by contractdate desc"
			 * ; //날짜 등록순 sql =
			 * "select * from vwBrokerContractDoneList where brokerid=? and state='완료' order by contractdate asc"
			 * ; //계약종류 sql =
			 * "select * from vwBrokerContractDoneList where brokerid=? and state='완료' and contractCategory='매매'"
			 * ; //단어검색 sql =
			 * "select * from vwBrokerContractDoneList where brokerid=? and state='완료' and realestateaddr='단어'"
			 * ;
			 */
			
			
			//날짜
			String date = "";
			if(!map.get("date").equals("default") && !map.get("date").equals("")) {
				date = " order by contractdate " + map.get("date");
			}
			
			//계약종류
			String category = "";
			if(!map.get("category").equals("default") && !map.get("category").equals("")) {
				category = " and contractCategory='" + map.get("category") + "' ";
			}
			
			
			//단어
			String word = "";
			if(!map.get("word").equals(null) && !map.get("word").equals("")) {
				
				word = " and realestateaddr like '%"+ map.get("word").replace(" ", "%") +"%' ";
			}
			
			sql = String.format("select * from vwBrokerContractDoneList where brokerid='%s' and state='완료' %s %s %s", map.get("id"), category, word, date);
			
			System.out.println(sql);
			
			ArrayList<BrokerDealListViewDTO> list = new ArrayList<BrokerDealListViewDTO>();
			
			//명령문 날리기
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			while(rs.next()) {
				
				BrokerDealListViewDTO dto = new BrokerDealListViewDTO();
				/*
				 	private String contractSeq;
					private String realEstateSeq;
					private String userId;
					private String contractCategory;
					private String contractDate;
					private String realestateAddr;
					private String deposit;
					private String price;
					private String brokerId;
				 */
				
				//왜인지 모르겠지만 갑자기 2022-07-13 00:00:00 이렇게 나와서 날짜만 나오게substring..
				//System.out.println(rs.getString("contractDate").substring(0,10));
				
				dto.setContractSeq(rs.getString("contractSeq"));
				dto.setRealEstateSeq(rs.getString("realEstateSeq"));
				dto.setUserId(rs.getString("userId"));
				dto.setContractCategory(rs.getString("contractCategory"));
				dto.setContractDate(rs.getString("contractDate").substring(0,10));
				dto.setRealestateAddr(rs.getString("realestateAddr"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setPrice(rs.getString("price"));
				dto.setBrokerId(map.get("id"));
				dto.setReviewSeq(rs.getString("reviewSeq"));
				
				list.add(dto);
			}
			
			return list;
			
		
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getDealList");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<BrokerCounselDTO> getCousel(String id) {
		
		try {
			
			String sql = "select * from vwcousellist where brokerid=? order by writedate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			
			rs = pstat.executeQuery();
			
			ArrayList<BrokerCounselDTO> list = new ArrayList<BrokerCounselDTO>();
			
			
			/*
			 
			private String seq;
			private String memberId;
			private String realestateSeq;
			private String content;
			private String state;
			private String writeDate;
			private String completedate;
			private String realestateaddr
			brokerid
			  
			  
			 */
			
			while(rs.next()) {
				
				BrokerCounselDTO dto = new BrokerCounselDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setMemberId(rs.getString("memberid"));
				dto.setRealestateSeq(rs.getString("realestateSeq"));
				dto.setContent(rs.getString("content"));
				dto.setState(rs.getString("state"));
				dto.setWriteDate(rs.getString("writeDate").substring(0,10));
				if(rs.getString("completedate") != null) {
					
					dto.setCompletedate(rs.getString("completedate").substring(0,10));
				}
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setBrokerid(rs.getString("brokerid"));
				dto.setReviewSeq(rs.getString("reviewSeq"));
				
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getCousel");
			e.printStackTrace();
		}
		
		return null;
	}

	public BrokerCounselDTO getCouselDetail(String seq) {

		try {
			
			String sql = "select * from vwcousellist where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				
				BrokerCounselDTO dto = new BrokerCounselDTO();
				
				dto.setSeq(rs.getString("seq"));
				dto.setMemberId(rs.getString("memberid"));
				dto.setRealestateSeq(rs.getString("realestateSeq"));
				dto.setContent(rs.getString("content"));
				dto.setState(rs.getString("state"));
				dto.setWriteDate(rs.getString("writeDate").substring(0,10));
				if(rs.getString("completedate") != null) {
					
					dto.setCompletedate(rs.getString("completedate").substring(0,10));
				}
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setBrokerid(rs.getString("brokerid"));
				dto.setReviewSeq(rs.getString("reviewSeq"));
				
				dto.setTel(rs.getString("tel"));
				dto.setName(rs.getString("name"));
				
				dto.setStar(rs.getString("star"));
				
				return dto;
			}
			
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getCouselDetail");
			e.printStackTrace();
		}
		return null;
	}

	public int completeCounsel(String seq) {
		try {
			
			String sql = "update tblCounsel set state='처리완료', completedate = sysdate where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, seq);

			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.completeCounsel");
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<BrokerDealListViewDTO> getContractList(String id) {
		
		try {
			
		System.out.println(id);	
			
		String sql = "";

		//검색어 없을 때(기본값)
		sql = "select * from vwBrokerContractList  where brokerid=?";
		
		pstat = conn.prepareStatement(sql);
		
		pstat.setString(1, id);
		
		
		
		ArrayList<BrokerDealListViewDTO> list = new ArrayList<BrokerDealListViewDTO>();
		
		rs = pstat.executeQuery();
		
		
		while(rs.next()) {
			
			BrokerDealListViewDTO dto = new BrokerDealListViewDTO();
			/*
			 	private String contractSeq;
				private String realEstateSeq;
				private String userId;
				private String contractCategory;
				private String contractDate;
				private String realestateAddr;
				private String deposit;
				private String price;
				private String brokerId;
				
				 r.seq as contractSeq, 
		        c.realestateseq, 
		        c.checkinddate, 
		        c.brokercheck, 
		        c.state, 
		        c.id as userid, 
		        (select tblcontract.name from tblcontract where tblcontract.seq = r.contractseq) as contractCategory, 
		        r.realestateaddr,
		        d.deposit,
		        r.price,
		        r.memberid as brokerid
		        from tblcontractrequest c
				
				
			 */
			
			//왜인지 모르겠지만 갑자기 2022-07-13 00:00:00 이렇게 나와서 날짜만 나오게substring..
			//System.out.println(rs.getString("contractDate").substring(0,10));
			
			dto.setContractSeq(rs.getString("contractSeq"));
			dto.setRealEstateSeq(rs.getString("realEstateSeq"));
			dto.setState(rs.getString("state"));
			dto.setUserId(rs.getString("userId"));
			dto.setContractCategory(rs.getString("contractCategory"));
			dto.setRealestateAddr(rs.getString("realestateAddr"));
			dto.setDeposit(rs.getString("deposit"));
			dto.setPrice(rs.getString("price"));
			dto.setBrokerId(id);
			
			dto.setState(rs.getString("state"));
			dto.setBrokerCheck(rs.getString("brokerCheck"));
			
			list.add(dto);
		}
		
		return list;
		
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getDealList");
			e.printStackTrace();
		}
		return null;
	}

	public ContractDocDto getTbl1(String contractSeq) {
		try {
			
			String sql = "select * from vwContract where seq =? and state = '대기중'";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, contractSeq);
			
			
			rs = pstat.executeQuery();
			
			ContractDocDto dto = new ContractDocDto();
			
			if(rs.next()) {
				
				dto.setRealestateAddr(rs.getString("realestateaddr"));
				dto.setMainUse(rs.getString("mainuse"));
				dto.setGywidth(rs.getString("gywidth"));
				dto.setJywidth(rs.getString("jywidth"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setPrice(rs.getString("price"));
				
				
				return dto;
				
			}
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getTbl1");
			e.printStackTrace();
		}
		return null;
	}

}
