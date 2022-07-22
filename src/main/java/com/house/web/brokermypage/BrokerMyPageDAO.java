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
	public ArrayList<BrokerDealListViewDTO> getDealList(HashMap<String, String> map) {
		
		try {
			
			
			String sql = "";
			
			
			
			
			//검색어 없을 때(기본값)
			sql = "select * from (select a.*, rownum as rnum from (select * from vwBrokerContractDoneList where brokerid = ? and state='완료' order by contractDate desc) a) where rnum between ? and ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("id"));
			pstat.setString(2, map.get("begin"));
			pstat.setString(3, map.get("end"));
			
			
			
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
				
				//여기서 contractSeq 는 contractDocSeq
				dto.setContractDocSeq(rs.getString("contractDocSeq"));
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
				
				dto.setContractDocSeq(rs.getString("contractDocSeq"));
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

	public ArrayList<BrokerCounselDTO> getCousel(HashMap<String, String> map) {
		
		try {
			
			String sql = "select * from (select a.*, rownum as rnum from vwcousellist a where brokerid=?) where rnum between ? and ? order by writedate desc";
			//String sql = "select * from vwcousellist where brokerid=? order by writedate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("id"));
			pstat.setString(2, map.get("begin"));
			pstat.setString(3, map.get("end"));
			
			
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
				dto.setStar(rs.getString("star"));
				
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

	public ArrayList<BrokerDealListViewDTO> getContractList(HashMap<String, String> map) {
		
		try {
			
		System.out.println(map);	
			
		String sql = "";

		//검색어 없을 때(기본값)
		//select * from (select a.*, rownum as rnum from vwBrokerContractList a) where rnum between 1 and 10 and brokerid='hong9';
		
		
//		sql = String.format("select * from (select a.*, rownum as rnum from vwBrokerContractList a) where rnum between 1 and 10 and brokerid='hong9'", );
//		
//		stat
//		
		
		
		sql = "select * from (select a.*, rownum as rnum from (select * from vwBrokerContractList where brokerid = ? order by contractSeq desc) a) where rnum between ? and ?";
		
		pstat = conn.prepareStatement(sql);
		
		pstat.setString(1, map.get("id"));
		pstat.setString(2, map.get("begin"));
		pstat.setString(3, map.get("end"));
		
		
		
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
			dto.setBrokerId(map.get("id"));
			
			dto.setState(rs.getString("state"));
			dto.setBrokerCheck(rs.getString("brokerCheck"));
			
			dto.setContractDocSeq(rs.getString("contractDocSeq"));
			
			list.add(dto);
		}
		
		return list;
		
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getDealList");
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<BrokerDealListViewDTO> getContractListNew(String id) {
		
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

	public ContractDocDto getContractDoc(String contractSeq) {
		try {
			
			String sql = "select * from vwContract where seq =? and state = '대기중'";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, contractSeq);
			
			
			rs = pstat.executeQuery();
			
			ContractDocDto dto = new ContractDocDto();
			
			if(rs.next()) {
				
				dto.setUserId(rs.getString("userId"));
				dto.setBrokerId(rs.getString("brokerId"));
				
				dto.setContractSeq(contractSeq);
				dto.setRealestateAddr(rs.getString("realestateaddr"));
				dto.setRealestateSeq(rs.getString("realestateSeq"));
				dto.setMainUse(rs.getString("mainuse"));
				dto.setGywidth(rs.getString("gywidth"));
				dto.setJywidth(rs.getString("jywidth"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setPrice(rs.getString("price"));
				
				
				//계약 작성시 입력되는 값
				dto.setToji(rs.getString("toji"));
				dto.setDownpayment(rs.getString("downpayment")); //계약금
				dto.setBalanceDate(rs.getString("balanceDate")); //잔금날짜
				//dto.setBorrowedMoney(rs.getString("borrowedMoney")); //차임금날짜
				//dto.setEndDate(rs.getString("endDate")); //계약종료
				dto.setContractDate(rs.getString("contractDate")); //계약날짜
				
				//dto.setLoanAmount(rs.getString("loanAmount")); //융자금
				//dto.setRentalDeposit(rs.getString("rentalDeposit")); //임대보증금
				//
				
				
				dto.setCheckInDate(rs.getString("checkindate"));
				
				//임대인정보
				dto.setOwnerName(rs.getString("ownerName"));
				dto.setOwnerAddr(rs.getString("ownerAddr"));
				dto.setOwnerSsn(rs.getString("ownerSsn"));
				dto.setOwnerTel(rs.getString("ownerTel"));
				//임대인 대리인
				dto.setOwnerDeputyAddr(rs.getString("ownerDeputyAddr"));
				dto.setOwnerDeputyName(rs.getString("ownerDeputyName"));
				dto.setOwnerDeputySsn(rs.getString("ownerDeputySsn"));
				
				//임차인
				dto.setUserName(rs.getString("userName"));
				dto.setUserAddr(rs.getString("userAddr"));
				dto.setUserSsn(rs.getString("userSsn"));
				dto.setUserTel(rs.getString("userTel"));
				//임차인 대리인
				dto.setUserDeputyAddr(rs.getString("userDeputyAddr"));
				dto.setUserDeputySsn(rs.getString("userDeputyssn"));
				dto.setUserDeputyName(rs.getString("userDeputyName"));
				
				//중개사
				dto.setBrokerAddr(rs.getString("brokerAddr"));
				dto.setBrokerName(rs.getString("brokerName"));
				dto.setBrokerRepresentName(rs.getString("brokerRepresentName"));
				dto.setFirmNum(rs.getString("firmNum"));
				dto.setBrokerTel(rs.getString("brokerTel"));
				
				return dto;
				
			}
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getTbl1");
			e.printStackTrace();
		}
		return null;
	}
	
	public ContractDocDto getContractDocDone(String contractSeq) {
		try {
			
			String sql = "select * from vwContract where contractDocSeq =?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, contractSeq);
			
			
			rs = pstat.executeQuery();
			
			ContractDocDto dto = new ContractDocDto();
			
			if(rs.next()) {
				
				dto.setUserId(rs.getString("userId"));
				dto.setBrokerId(rs.getString("brokerId"));
				
				dto.setContractDocSeq(rs.getString("contractDocSeq")); //계약서번호
				dto.setContractSeq(rs.getString("seq")); //계약요청번호
				
				dto.setRealestateAddr(rs.getString("realestateaddr"));
				dto.setRealestateSeq(rs.getString("realestateSeq"));
				dto.setMainUse(rs.getString("mainuse"));
				dto.setGywidth(rs.getString("gywidth"));
				dto.setJywidth(rs.getString("jywidth"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setPrice(rs.getString("price"));
				
				
				//계약 작성시 입력되는 값
				dto.setToji(rs.getString("toji"));
				dto.setDownpayment(rs.getString("downpayment")); //계약금
				dto.setBalanceDate(rs.getString("balanceDate")); //잔금날짜
				dto.setBorrowedMoney(rs.getString("borrowedMoney")); //차임금날짜
				
				dto.setContractDate(rs.getString("contractDate").substring(0,10)); //계약날짜
				
				dto.setLoanAmount(rs.getString("loanAmount")); //융자금
				dto.setRentalDeposit(rs.getString("rentalDeposit")); //임대보증금
				//
				//private String monthEndDate;
				//private String charterEndDate;
				
				
				//계약종료날짜
				dto.setMonthEndDate(rs.getString("monthEndDate"));
				dto.setCharterEndDate(rs.getString("charterEndDate"));
				
				dto.setCheckInDate(rs.getString("checkindate"));
				
				//임대인정보
				dto.setOwnerName(rs.getString("ownerName"));
				dto.setOwnerAddr(rs.getString("ownerAddr"));
				dto.setOwnerSsn(rs.getString("ownerSsn"));
				dto.setOwnerTel(rs.getString("ownerTel"));
				//임대인 대리인
				dto.setOwnerDeputyAddr(rs.getString("ownerDeputyAddr"));
				dto.setOwnerDeputyName(rs.getString("ownerDeputyName"));
				dto.setOwnerDeputySsn(rs.getString("ownerDeputySsn"));
				
				//임차인
				dto.setUserName(rs.getString("userName"));
				dto.setUserAddr(rs.getString("userAddr"));
				dto.setUserSsn(rs.getString("userSsn"));
				dto.setUserTel(rs.getString("userTel"));
				//임차인 대리인
				dto.setUserDeputyAddr(rs.getString("userDeputyAddr"));
				dto.setUserDeputySsn(rs.getString("userDeputyssn"));
				dto.setUserDeputyName(rs.getString("userDeputyName"));
				
				//중개사
				dto.setBrokerAddr(rs.getString("brokerAddr"));
				dto.setBrokerName(rs.getString("brokerName"));
				dto.setBrokerRepresentName(rs.getString("brokerRepresentName"));
				dto.setFirmNum(rs.getString("firmNum"));
				dto.setBrokerTel(rs.getString("brokerTel"));
				
				return dto;
				
			}
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getTbl1");
			e.printStackTrace();
		}
		return null;
	}

	public int insertDoc(ContractDocDto dto) {
		
		try {
			
			/*
			 	dto.setContractSeq(contractSeq);
				dto.setCategory(category);
				dto.setRealestateSeq(realestateSeq);
				
				dto.setToji(toji);
				dto.setDownpayment(downpayment);
				dto.setBalanceDate(balanceDate);
				dto.setContractDate(contractDate);
				
				dto.setEndDate(endDate);
				dto.setBorrowedMoney(borrowedMoney);
				
				dto.setLoanAmount(loanAmount);
				dto.setRentalDeposit(rentalDeposit);
			 */
			
			
			String sql = "insert into tblcontractdoc(seq, realestateseq, id, balancedate, contractdate, land, structural, downpayment) values (seqContractDoc.nextVal, ?,?,?,?,?,?,? )";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getRealestateSeq());
			pstat.setString(2, dto.getUserId());
			pstat.setString(3, dto.getBalanceDate());
			pstat.setString(4, dto.getContractDate());
			pstat.setString(5, dto.getToji());
			pstat.setString(6, dto.getMainUse());
			pstat.setString(7, dto.getDownpayment());
			
			
			
			
			
			
			return  pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.insertDoc");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int insertCategory(ContractDocDto dto) {
			
		try {
			
					String sql = "";
						
					/*
					 
					 	dto.setContractSeq(contractSeq);
						dto.setCategory(category);
						dto.setRealestateSeq(realestateSeq);
						
						dto.setToji(toji);
						dto.setDownpayment(downpayment);
						dto.setBalanceDate(balanceDate);
						dto.setContractDate(contractDate);
						
						dto.setEndDate(endDate);
						dto.setBorrowedMoney(borrowedMoney);
						
						dto.setLoanAmount(loanAmount);
						dto.setRentalDeposit(rentalDeposit);
					 
					 */
					
					
						if(dto.getCategory().equals("매매")) {
							
							sql = "insert into tbltrading (seq, contractdocseq, loanamount, rentaldeposit) values(SEQTRADING.nextval, (select max(seq) from tblcontractdoc), ?, ?)";
							
							pstat = conn.prepareStatement(sql);
							
							pstat.setString(1, dto.getLoanAmount());
							pstat.setString(2, dto.getRentalDeposit());
							
							
						}else if(dto.getCategory().equals("월세")) {
							
							sql = "insert into tblmontly (seq, contractdoc, borrowedmoney, enddate) values (seqMontly.nextVal, (select max(seq) from tblcontractdoc),?,?)";
							pstat = conn.prepareStatement(sql);
							
							pstat.setString(1, dto.getBorrowedMoney());
							pstat.setString(2, dto.getEndDate());
							
						}else if(dto.getCategory().equals("전세")) {
							
							sql = "insert into tblcharter (seq, contractdoc, enddate) values (SEQCHARTER.nextval, (select max(seq) from tblcontractdoc),?)";
							
							pstat = conn.prepareStatement(sql);
							
							pstat.setString(1, dto.getEndDate());
						}
						
						
						return pstat.executeUpdate();
						
					} catch (Exception e) {
						System.out.println("BrokerMyPageDAO.insertCategory");
						e.printStackTrace();
					}
					
					return 0;
				}

	public int updateRequest(String contractSeq) {
	
		try {
			
			String sql = "update tblcontractrequest set brokercheck = '승인완료'  where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, contractSeq);
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.updateRequest");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String countNewContract(String id) {
		
		
		try {
			
			String sql = "select count(*) as count from vwBrokerContractList where brokerid = ? and brokercheck = '대기중'";
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			String count = "";
			
			if(rs.next()) {
				
				count = rs.getString("count");
				
				System.out.println();
				
				return count;
			}
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.countNewContract");
			e.printStackTrace();
		}
		
		return null;
	}

	public int refuseContract(String contractSeq) {

		try {
			
			String sql = "update tblcontractrequest set brokercheck = '거절'  where seq = ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, contractSeq);
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.refuseContract");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int writeRefuse(HashMap<String, String> map) {
		
		
		try {
			
			String sql = "insert into tblrefusal (seq, field) values(?, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("contractSeq"));
			pstat.setString(2, map.get("refuseContent"));
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.writeRefuse");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int getCountContractRequest(HashMap<String, String> map) {
		try {
			
			String sql = "select count(*) as cnt from vwBrokerContractList where brokerid= ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("id"));
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getCountContractRequest");
			e.printStackTrace();
		}
		return 0;
	}

	public String getCounselCount(String id) {
	
		try {
			
			String sql = "select count(*) as cnt from vwcousellist where brokerid=? and state='처리중'";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			String count = "";
			
			if(rs.next()) {
				
				count = rs.getString("cnt");
				
				System.out.println();
				
				return count;
			}
			
			
			
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getCounselCount");
			e.printStackTrace();
		}
		return null;
	}

	public int getDealListCount(HashMap<String, String> map) {
		
		try {
			
			String sql = "select count(*) as cnt from vwBrokerContractDoneList where brokerid = ? and state='완료'";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("id"));
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getDealListCount");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int getCountCounsel(HashMap<String, String> map) {
		
		try {
			
			String sql = "select count(*) as cnt from vwcousellist where brokerid= ?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, map.get("id"));
			
			rs = pstat.executeQuery();
			
			if(rs.next()) {
				return rs.getInt("cnt");
			}
			
		} catch (Exception e) {
			System.out.println("BrokerMyPageDAO.getDealListCount");
			e.printStackTrace();
		}
		
		return 0;
	}

}
