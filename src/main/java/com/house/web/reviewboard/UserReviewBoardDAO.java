package com.house.web.reviewboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import com.house.util.DBUtil;

public class UserReviewBoardDAO {
	
	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	public UserReviewBoardDAO() {
		conn = DBUtil.open();
	}

	public int getMember(String id) {

		try {
			
			String sql = "select count(*) as cnt from tblMember m inner join tblBroker b on m.id = b.id where m.id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getMember");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<UserReviewBoardDTO> getList(HashMap<String, String> map) {

		try {
			
			String order = "";
			if (map.get("recent").equals("0")) {
				order = "order by seq desc";
			} else if (map.get("recent").equals("1")) {
				order = "order by views desc";
			}
			
			String where = "";
			if(map.get("column") != null) {
				where = String.format("where %s like '%%%s%%'", map.get("column"), map.get("word"));
			}
			
			String sql = String.format("select * from (select a.*, rownum as rnum from (select * from vwReview r %s %s) a) where rnum between %s and %s", where, order, map.get("begin"), map.get("end"));
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<UserReviewBoardDTO> list = new ArrayList<UserReviewBoardDTO>();
			
			while (rs.next()) {
				UserReviewBoardDTO dto = new UserReviewBoardDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setViews(rs.getString("views"));
				dto.setSeq(rs.getString("seq"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getList");
			e.printStackTrace();
		}
		
		return null;
	}

	public int getTotalCount(HashMap<String, String> map) {

		try {
			
			String order = "";
			if (map.get("recent").equals("0")) {
				order = "order by seq desc";
			} else if (map.get("recent").equals("1")) {
				order = "order by views desc";
			}
			
			String where = "";
			if(map.get("column") != null) {
				where = String.format("where %s like '%%%s%%'", map.get("column"), map.get("word"));
			}
			
			String sql = String.format("select count(*) as cnt from (select a.*, rownum as rnum from (select * from vwReview r %s %s) a)", where, order);
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getTotalCount");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<UserReviewBoardDTO> getAddress(String id) {

		try {
			
			String sql = "select cd.realestateseq, re.realestateaddr as address from tblContractDoc cd inner join tblrealestate re on cd.realestateseq = re.seq where id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			ArrayList<UserReviewBoardDTO> list = new ArrayList<UserReviewBoardDTO>();
			
			while(rs.next()) {
				UserReviewBoardDTO dto = new UserReviewBoardDTO();
				dto.setSeq(rs.getString("realestateseq"));
				dto.setAddress(rs.getString("address"));
				
				list.add(dto);
			}
			return list;
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getAddress");
			e.printStackTrace();
		}
		
		return null;
	}

	public int getAddressCount(String id) {
		
		try {
			
			String sql = "select count(*) as cnt from tblContractDoc where id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
			
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getAddress");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int addPost(UserReviewBoardDTO dto) {

		try {
			
			String sql = "insert into tblStayReview values (seqStayReview.nextVal, ?, ?, sysdate, ?, ?, ?, ?, ?, ?, 0)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getChoice());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getContent());
			pstat.setString(5, dto.getCleanStar());
			pstat.setString(6, dto.getPriceStar());
			pstat.setString(7, dto.getLocationStar());
			pstat.setString(8, dto.getOptionStar());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.addPost");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<String> getImg(String seq) {

		try {
			
			String sql = "select * from tblReviewPicture where stayReviewseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<String> list = new ArrayList<String>();
			
			while (rs.next()) {
				list.add(rs.getString("jpg"));
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getImg");
			e.printStackTrace();
		}
		
		return null;
	}

	public String getSeq() {

		try {
			
			String sql = "select max(seq) as seq from tblStayReview";
			
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			if (rs.next()) {
				return rs.getString("seq");
			}
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getSeq");
			e.printStackTrace();
		}
		
		return null;
	}

	public void setPicture(String name, String maxSeq) {

		try {
			
			String sql = "insert into tblReviewPicture values (seqReviewPicture.nextVal, ?, ?)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, maxSeq);
			pstat.setString(2, name);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("BrokerRealEstateAddDAO.setRealEstatePicture");
			e.printStackTrace();
		}
		
		
	}

	public UserReviewBoardDTO getPost(String seq) {

		try {
			
			String sql = "select * from tblStayReview where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				UserReviewBoardDTO dto = new UserReviewBoardDTO();
				dto.setTitle(rs.getString("title"));
				dto.setSeq(rs.getString("seq"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setContent(rs.getString("content"));
				dto.setCleanStar(rs.getString("trafficStarRate"));
				dto.setPriceStar(rs.getString("surroundingsStarRate"));
				dto.setLocationStar(rs.getString("residentialStarRate"));
				dto.setOptionStar(rs.getString("apartmentStarRate"));
				dto.setId(rs.getString("id"));
				dto.setViews(rs.getString("views"));
				dto.setRealSeq(rs.getString("realEstateSeq"));
				
				return dto;
				
			}
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getPost");
			e.printStackTrace();
		}
		
		
		return null;
	}

	public void updateViews(String seq) {

		try {
			
			String sql = "update tblStayReview set views = views + 1 where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.updateViews");
			e.printStackTrace();
		}
		
	}

	public void deleteGood(String seq, String id) {

		try {
			
			String sql = "delete from tblLike where id = ? and stayReviewSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, seq);
			
			pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.deleteGood");
			e.printStackTrace();
		}
		
	}

	public int goodCount(String seq, String id) {

		try {
			
			String sql = "insert into tblLike values(seqLike.nextVal, ?, ?, 1)";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.deleteGood");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int getGood(String seq) {

		try {
			
			String sql = "select count(*) as cnt from tblLike where stayReviewSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getGood");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int getUser(String seq, String id) {

		try {
			
			String sql = "select count(*) as cnt from tblStayReview where seq = ? and id = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.setString(2, id);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getUser");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int delPost(String seq) {

		try {
			
			String sql = "delete from tblReviewPicture where stayReviewSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.executeUpdate();
			
			sql = "delete from tblLike where stayReviewSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			pstat.executeUpdate();
			
			sql = "delete from tblStayReview where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.delPost");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int checkGood(String seq, String id) {

		try {
			
			String sql = "select count(*) as cnt from tblLike where id = ? and stayReviewSeq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, seq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.deleteGood");
			e.printStackTrace();
		}
		
		
		return 0;
	}

	public int getCountImg(String seq) {
		
		try {
			
			String sql = "select count(*) as cnt from tblReviewPicture where stayReviewseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}
			

			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getImg");
			e.printStackTrace();
		}
		
		return 0;
	}

	public ArrayList<UserReviewBoardDTO> getImgSeq(String seq) {
		
		try {
			
			String sql = "select * from tblReviewPicture where stayReviewseq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			rs = pstat.executeQuery();
			
			ArrayList<UserReviewBoardDTO> list = new ArrayList<UserReviewBoardDTO>();
			
			while (rs.next()) {
				UserReviewBoardDTO dto = new UserReviewBoardDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setJpg(rs.getString("jpg"));
				list.add(dto);
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getImg");
			e.printStackTrace();
		}
		
		return null;
	}

	public int imgDel(String seq) {

		try {
			
			String sql = "delete from tblReviewPicture where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, seq);
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.imgDel");
			e.printStackTrace();
		}
		
		return 0;
	}

	public int updatePost(UserReviewBoardDTO dto, String seq) {
		
		try {
			
			String sql = "update tblStayReview set title = ?, content = ?, trafficStarRate = ?, surroundingsStarRate = ?, residentialStarRate = ?, apartmentStarRate = ? where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getTitle());
			pstat.setString(2, dto.getContent());
			pstat.setString(3, dto.getCleanStar());
			pstat.setString(4, dto.getPriceStar());
			pstat.setString(5, dto.getLocationStar());
			pstat.setString(6, dto.getOptionStar());
			pstat.setString(7, seq);
			
			return pstat.executeUpdate();


		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.updatePost");
			e.printStackTrace();
		}
		
		return 0;
		
	}

	public ArrayList<UserReviewBoardDTO> getBrokerList(HashMap<String, String> map) {

		try {
			
			String order = "";
			if (map.get("recent").equals("0")) {
				order = "order by r.seq desc";
			} else if (map.get("recent").equals("1")) {
				order = "order by views desc";
			}
			
			String where = "";
			if(map.get("column") != null) {
				where = String.format("and %s like '%%%s%%'", map.get("column"), map.get("word"));
			}
			
			String sql = String.format("select * from (select a.*, re.memberid , rownum as rnum from (select r.* from vwReview r inner join tblrealestate re on r.realestateseq = re.seq where memberid = '%s' %s %s) a inner join tblrealestate re on a.realestateseq = re.seq) where rnum between %s and %s", map.get("id"), where, order, map.get("begin"), map.get("end"));
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			
			ArrayList<UserReviewBoardDTO> list = new ArrayList<UserReviewBoardDTO>();
			
			while (rs.next()) {
				UserReviewBoardDTO dto = new UserReviewBoardDTO();
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setViews(rs.getString("views"));
				dto.setSeq(rs.getString("seq"));
				
				list.add(dto);
				
			}
			
			return list;
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getList");
			e.printStackTrace();
		}
		
		return null;
	}

	public int getbrokerTotalCount(HashMap<String, String> map) {

		try {
			
			String order = "";
			if (map.get("recent").equals("0")) {
				order = "order by r.seq desc";
			} else if (map.get("recent").equals("1")) {
				order = "order by views desc";
			}
			
			String where = "";
			if(map.get("column") != null) {
				where = String.format("and %s like '%%%s%%'", map.get("column"), map.get("word"));
			}
			
			String sql = String.format("select count(*) as cnt from (select a.*, re.memberid, rownum as rnum from (select r.* from vwReview r inner join tblrealestate re on r.realestateseq = re.seq where memberid = '%s' %s %s) a inner join tblrealestate re on a.realestateseq = re.seq) where rnum between %s and %s", map.get("id"), where, order, map.get("begin"), map.get("end"));
			stat = conn.createStatement();
			
			rs = stat.executeQuery(sql);
			

			
			if (rs.next()) {
				return Integer.parseInt(rs.getString("cnt"));
			}

			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getList");
			e.printStackTrace();
		}
		
		return 0;
	}

	public String getAddr(String realSeq) {

		try {
			
			String sql = "select * from tblrealEstate where seq = ?";
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, realSeq);
			
			rs = pstat.executeQuery();
			
			if (rs.next()) {
				return rs.getString("realestateaddr");
			}
			
		} catch (Exception e) {
			System.out.println("UserReviewBoardDAO.getAddr");
			e.printStackTrace();
		}
		
		
		return null;
	}

	

}
