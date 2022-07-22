package com.house.web.usermypage;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.house.domain.useralarm.UserAlarmDTO;
import com.house.util.DBUtil;
import com.house.web.brokermypage.BrokerCounselDTO;
import com.house.web.brokermypage.BrokerDealListViewDTO;



public class UserMyPageDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;

	public UserMyPageDAO() {
		conn = DBUtil.open();
	}

	public UserMyPageDTO getEdit(String id) {
		try {

			UserMyPageDTO dto = new UserMyPageDTO();

			String sql = "select * from tblMember where id=?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);


			rs = pstat.executeQuery();



			if (rs.next()) {


				dto.setId(id);
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setSsn(rs.getString("ssn"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				dto.setLv(rs.getString("lv"));
				dto.setX(rs.getString("x"));
				dto.setY(rs.getString("y"));

				return dto;
			}

		} catch (Exception e) {
			System.out.println("UserMyPageDAO.getEdit");
			e.printStackTrace();
		}
		return null;
	}



	public ContractViewDTO getDeallist(String id) {
		try {
			ContractViewDTO dto = new ContractViewDTO();

			String sql = "select*from vwUserdeallist where id=?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);


			rs = pstat.executeQuery();



			if (rs.next()) {

				dto.setId(id);
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setContractdate(rs.getString("contractdate"));


				return dto;
			}



		} catch (Exception e) {
			System.out.println("UserMyPageDAO.getDeallist");
			e.printStackTrace();
		}
		return null;
	}

	public int edit(UserMyPageDTO dto) {
		try {


			String sql = "update tblMember set tel=?,email=?,address=? where id=?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getTel());
			pstat.setString(2, dto.getEmail());
			pstat.setString(3, dto.getAddress());
			pstat.setString(4, dto.getId());


			return pstat.executeUpdate();



		} catch (Exception e) {
			System.out.println("UserMyPageDAO.edit");
			e.printStackTrace();
		}
		return 0;
	}



	public ArrayList<ContractViewDTO> list() {
		try {


			// ContractViewDTO dto = new ContractViewDTO();

			String sql = "select*from  vwCounselistl";



			stat = conn.createStatement();



			rs = stat.executeQuery(sql);

			ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();



			while (rs.next()) {

				ContractViewDTO dto = new ContractViewDTO();

				// dto.setId(id);
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setFirmname(rs.getString("firmname"));


				list.add(dto);
			}

			return list;



		} catch (Exception e) {
			System.out.println("UserMyPageDAO.list");
			e.printStackTrace();
		}
		return null;
	}



	public int upatePw(UserMyPageDTO dto) {
		try {


			String sql = "update tblMember set pw = ? where id=?";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getId());

			return pstat.executeUpdate();



		} catch (Exception e) {
			System.out.println("UserMyPageDAO.upatePw");
			e.printStackTrace();
		}
		return 0;
	}

	// public static void main(String[] args) {
	// 방금만든리스트메세지를 여기서 호출하기
	// 여기서 테스트가능


	// UserMyPageDAO dao= new UserMyPageDAO();

	// ArrayList<ContractViewDTO> list = dao.List();

	// System.out.println(list);

	// }

	public ArrayList<ContractViewDTO> Counselinfo() {
		try {


			String sql = "select*from  vwCounselinfo";



			stat = conn.createStatement();



			rs = stat.executeQuery(sql);

			ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();



			while (rs.next()) {

				ContractViewDTO dto = new ContractViewDTO();

				// dto.setId(id);
				dto.setContractname(rs.getString("contractname"));
				dto.setPrice(rs.getString("price"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));


				list.add(dto);
			}

			return list;



		} catch (Exception e) {
			System.out.println("UserMyPageDAO.Counselinfo");
			e.printStackTrace();
		}
		return null;
	}


	public ArrayList<ContractViewDTO> getContract(String id) {
		try {

			String sql = "select cr.seq, cr.id, cr.state, re.seq as reseq, re.realestateaddr, re.price, d.deposit, c.name,cr.checkinddate,cr.brokercheck,cr.state from tblContractRequest \r\n"
					+ "cr inner join tblrealestate re on cr.realestateseq = re.seq inner join \r\n"
					+ "tblContract c on re.contractseq = c.seq left outer join tblDeposit d on d.realestateseq = re.seq where cr.id = ? order by seq desc";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			rs = pstat.executeQuery();
			
			ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();
			
			while (rs.next()) {
				
				/*
				private String seq;
	private String id;
	private String state;
	private String address;
	private String price;
	private String deposit;
	
	private String reseq;
	private String name;
	
				 */
				ContractViewDTO dto = new ContractViewDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setId(rs.getString("id"));
				dto.setReseq(rs.getString("reseq"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setPrice(rs.getString("price"));
				dto.setName(rs.getString("name"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setCheckinddate(rs.getString("checkinddate"));
				dto.setBrokercheck(rs.getString("brokercheck"));
				dto.setState(rs.getString("state"));

				list.add(dto);
			}
			return list;



		} catch (Exception e) {
			System.out.println("UserMyPageDAO.getContract");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ContractViewDTO> getList(String id) {
		try {
			/*
			String sql="select*from  vwCounselistl";
			
			
			
			
			stat = conn.createStatement();
			
			
			
			rs = stat.executeQuery(sql);
			
			ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();
			
			
			
			 while(rs.next()) {
				 
				 ContractViewDTO dto = new ContractViewDTO();
				 
				//dto.setId(id);
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setFirmname(rs.getString("firmname"));
			
				
				list.add(dto);
			}
			
			return list;
			
			*/


			String sql = "select c.name as contractname, d.deposit, re.price, re.realestateaddr, b.firmname, co.seq, m.name, m.tel, co.content , me.name as brokername, (select count(*) from tblBrokerScore where co.seq = counselseq and m.id = id) as cnt\r\n"
					+ "from tblrealestate re\r\n"
					+ "        inner join tblcontract c on re.contractseq = c.seq\r\n"
					+ "            inner join tblBroker b on b.id = re.memberid\r\n"
					+ "                inner join tblCounsel co on co.realestateseq = re.seq\r\n"
					+ "                inner join tblMember m on co.memberid = m.id\r\n"
					+ "                inner join tblMember me on me.id = b.id\r\n"
					+ "                    left outer join tbldeposit d on re.seq = d.realestateseq where co.memberid = ? and co.state = '처리완료'";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);


			// stat = conn.createStatement();


			rs = pstat.executeQuery();

			// int i=0;
			// int j=0;

			// rs = stat.executeQuery(sql);

			ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();

			ContractViewDTO dto = null;

			while (rs.next()) {

				dto = new ContractViewDTO();

				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				if (rs.getString("deposit") != null) dto.setDeposit(rs.getString("deposit"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setFirmname(rs.getString("firmname"));
				dto.setContractname(rs.getString("contractname"));
				if (rs.getString("cnt").equals("1")) continue;

				list.add(dto);
			}

			return list;



		} catch (Exception e) {
			System.out.println("UserMyPageDAO.getList");
			e.printStackTrace();
		}
		return null;
	}

	public ContractViewDTO getCounselinfo(String seq) {
		try {
			
			String sql = "select c.name as contractname, d.deposit, re.price, re.realestateaddr, b.firmname, co.seq, m.name, m.tel, co.content , me.name as brokername\r\n"
					+ "from tblrealestate re\r\n"
					+ "        inner join tblcontract c on re.contractseq = c.seq\r\n"
					+ "            inner join tblBroker b on b.id = re.memberid\r\n"
					+ "                inner join tblCounsel co on co.realestateseq = re.seq\r\n"
					+ "                inner join tblMember m on co.memberid = m.id\r\n"
					+ "                inner join tblMember me on me.id = b.id\r\n"
					+ "                    left outer join tbldeposit d on re.seq = d.realestateseq where co.seq = ? and co.state = '처리완료'";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, seq);


			// stat = conn.createStatement();


			rs = pstat.executeQuery();

			// int i=0;
			// int j=0;

			// rs = stat.executeQuery(sql);

			ContractViewDTO dto = null;

			if(rs.next()) { 

				dto = new ContractViewDTO();


				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				if (rs.getString("deposit") != null) dto.setDeposit(rs.getString("deposit"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setFirmname(rs.getString("firmname"));
				dto.setContractname(rs.getString("contractname"));
				dto.setContent(rs.getString("content"));
				dto.setTel(rs.getString("tel"));
				dto.setBrokername(rs.getString("brokername"));

				return dto;
			}

			



		} catch (Exception e) {
			System.out.println("UserMyPageDAO.getCounselinfo");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<UserDealListViewDTO> getDeal(String id) {
		try {
			
		

			
			
			
			
			
			String sql = "select * from vwBrokerContractDoneList where userid=? order by contractdate desc";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			
			
			ArrayList<UserDealListViewDTO> list = new ArrayList<UserDealListViewDTO>();
			
			rs = pstat.executeQuery();
			
			
			while(rs.next()) {
				
				UserDealListViewDTO dto = new UserDealListViewDTO();

				
				dto.setContractSeq(rs.getString("contractSeq"));
				dto.setRealEstateSeq(rs.getString("realEstateSeq"));
				dto.setUserId(id);
				dto.setContractCategory(rs.getString("contractCategory"));
				dto.setContractDate(rs.getString("contractDate").substring(0,10));
				dto.setRealestateAddr(rs.getString("realestateAddr"));
				dto.setDeposit(rs.getString("deposit"));
				dto.setPrice(rs.getString("price"));
				dto.setBrokerId("brokerId");
				dto.setReviewSeq(rs.getString("reviewSeq"));
				
				list.add(dto);

				
		
			}
			
			return list;
			
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("UserMyPageDAO.getDeal");
			e.printStackTrace();
		}
		return null;
	}

	public ArrayList<ContractViewDTO> getReview(String id) {
		try {
			
			String sql = "select*from vwReviewe where id=? ";

			pstat = conn.prepareStatement(sql);

			pstat.setString(1, id);


			// stat = conn.createStatement();


			rs = pstat.executeQuery();

			// int i=0;
			// int j=0;

			// rs = stat.executeQuery(sql);

			ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();

			ContractViewDTO dto = null;

			while (rs.next()) {

				dto = new ContractViewDTO();


				dto.setId(id);
				dto.setSeq(rs.getString("seq"));
				dto.setTitle(rs.getString("title"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setRegdate(rs.getString("regdate"));

				list.add(dto);
			}

			return list;
			
			
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("UserMyPageDAO.getReview");
			e.printStackTrace();
		}
		return null;
	}



	public int star(ContractViewDTO dto) {//별점 추개하저
	
		try {

			String sql = "insert into tblBrokerScore (seq, id, counselseq, star) values (seqBrokerScore.nextVal, ?,?, ?)";
			
			pstat = conn.prepareStatement(sql);
			
		
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getCounselseq());
			pstat.setString(3, dto.getStar());
			
			return pstat.executeUpdate();	
			
			
			
			
		} catch (Exception e) {
			System.out.println("UserMyPageDAO.star");
			e.printStackTrace();
		}	
		
		return 0;
	}

	public UserMyPageDTO getPwcheck(String id) {
	
		try {
			UserMyPageDTO dto = new UserMyPageDTO();
			
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
			System.out.println("UserMyPageDAO.getPwcheck");
			e.printStackTrace();
		}
		
		
		
		
		
		
		return null;
	}



	public int delete(String seq) {
	
		try {
			
			
			String sql ="delete from tblLike where stayReviewSeq= ?";

			

			
			pstat = conn.prepareStatement(sql);


		pstat.setString(1,seq);

		return pstat.executeUpdate();
			
			
		
			
			
			
		} catch (Exception e) {
			System.out.println("UserMyPageDAO.delete");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delete1(String seq) {
try {
			
			
			String sql ="delete from tblReviewPicture where stayReviewSeq= ?";
				

			
			
			

			
			pstat = conn.prepareStatement(sql);


		pstat.setString(1,seq);

		return pstat.executeUpdate();
			
			
		
			
			
			
		} catch (Exception e) {
			System.out.println("UserMyPageDAO.delete");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int userDeactive(String id) {
		try {
			
          String sql = "update tblMember set active = '탈퇴' where id=?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, id);
			
			return pstat.executeUpdate();
			
			
			
			
		} catch (Exception e) {
			System.out.println("UserMyPageDAO.userDeactive");
			e.printStackTrace();
		}
		return 0;
	}

	public int delete2(String seq) {
		try {
			
			String sql = "delete from tblStayReview where seq = ?";
			
			pstat = conn.prepareStatement(sql);


			pstat.setString(1,seq);

			return pstat.executeUpdate();
				
			
			
		} catch (Exception e) {
			System.out.println("UserMyPageDAO.delete2");
			e.printStackTrace();
		}
		return 0;
	}
	

}


