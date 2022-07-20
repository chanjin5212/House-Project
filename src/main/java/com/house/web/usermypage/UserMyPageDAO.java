package com.house.web.usermypage;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import com.house.util.DBUtil;





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
			
		
			
			if(rs.next()) {
				
				
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
		
		String sql="select*from vwUserdeallist where id=?";
		
		pstat = conn.prepareStatement(sql);
		
		pstat.setString(1, id);
		
		
		rs = pstat.executeQuery();
		

		
		if(rs.next()) {
			
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
			
			
			String sql ="update tblMember set tel=?,email=?,address=? where id=?";
				
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
			
			
//			ContractViewDTO dto = new ContractViewDTO();
			
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
	
	//public static void main(String[] args) {
		//방금만든리스트메세지를 여기서 호출하기
		//여기서 테스트가능
		
	
	//	 UserMyPageDAO dao= new  UserMyPageDAO();
		
	//	ArrayList<ContractViewDTO> list = dao.List();
		
	//	System.out.println(list);
		
//	}

	public ArrayList<ContractViewDTO> Counselinfo() {
		try {
			
			
			String sql="select*from  vwCounselinfo";
			
			

			
			stat = conn.createStatement();
			


			rs = stat.executeQuery(sql);
			
			ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();
			
	
			
		     while(rs.next()) {
		    	 
		    	 ContractViewDTO dto = new ContractViewDTO();
		    	 
		    	//dto.setId(id);
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
	
	String sql="select*from  vwContractviewe where id=? ";
	
	pstat = conn.prepareStatement(sql);
	
	pstat.setString(1,id);

	
	//stat = conn.createStatement();
	

	rs = pstat.executeQuery();
	
	// int i=0;
	//  int j=0;

	//rs = stat.executeQuery(sql);
	
	ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();
	
	ContractViewDTO dto=null;
	
     while(rs.next()) {
    	 
    	 dto = new ContractViewDTO();
    	 
  
    	   	dto.setId(id);
    	//dto.setId(rs.getString("id"));
    	 dto.setSeq(rs.getString("seq"));
 		dto.setName(rs.getString("name"));
 		dto.setPrice(rs.getString("price"));
 		dto.setRealestateaddr(rs.getString("realestateaddr"));
 		dto.setMoveindate(rs.getString("moveindate"));
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
		
		
		String sql="select*from  vwCounselistl where id=? ";
		
		pstat = conn.prepareStatement(sql);
		
		pstat.setString(1,id);

		
		//stat = conn.createStatement();
		

		rs = pstat.executeQuery();
		
		// int i=0;
		//  int j=0;

		//rs = stat.executeQuery(sql);
		
		ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();
		
		ContractViewDTO dto=null;
		
	     while(rs.next()) {
	    	 
	    	 dto = new ContractViewDTO();
	    	 
	  
		    	dto.setId(id);
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				dto.setPrice(rs.getString("price"));
				dto.setRealestateaddr(rs.getString("realestateaddr"));
				dto.setFirmname(rs.getString("firmname"));
			
			list.add(dto);
		}
		
		return list;
		
		
		
		
		
		
	} catch (Exception e) {
		System.out.println("UserMyPageDAO.getList");
		e.printStackTrace();
	}
		return null;
	}

	public ArrayList<ContractViewDTO> getCounselinfo(String id) {
	try {
String sql="select*from  vwCounselinfo where id=? ";
		
		pstat = conn.prepareStatement(sql);
		
		pstat.setString(1,id);

		
		//stat = conn.createStatement();
		

		rs = pstat.executeQuery();
		
		// int i=0;
		//  int j=0;

		//rs = stat.executeQuery(sql);
		
		ArrayList<ContractViewDTO> list = new ArrayList<ContractViewDTO>();
		
		ContractViewDTO dto=null;
		
	     while(rs.next()) {
	    	 
	    	 dto = new ContractViewDTO();
	    	 
	  
	    	dto.setId(id);
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
		System.out.println("UserMyPageDAO.getCounselinfo");
		e.printStackTrace();
	}
		return null;
	}

	
}

















