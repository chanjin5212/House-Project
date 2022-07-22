package com.house.domain.sign;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.house.domain.broker.BrokerDTO;
import com.house.util.DBUtil;



public class SignDAO {

	private Connection conn;
	private Statement stat;
	private PreparedStatement pstat;
	private ResultSet rs;
	
	
	
	public SignDAO() {
		conn = DBUtil.open();
	}

	
	
	//LoginOk > 회원 로그인
	public SignDTO login(SignDTO dto) {
		
		try {
			
			String sql = "select * from tblMember where id = ? and pw = ? and active = '활동중' and lv = '1'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			
			//조회한 결과들 저장
			rs = pstat.executeQuery();
			
			
			if(rs.next()) {
				
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setSsn(rs.getString("ssn"));
				dto.setTel(rs.getString("tel"));
				dto.setAddress(rs.getString("address"));
				//dto.setLv(rs.getString("lv"));
				dto.setX(rs.getString("x"));
				dto.setY(rs.getString("y"));
				
				return dto;
			}
			
			
			
		} catch (Exception e) {
			System.out.println("SignDAO.login");
			e.printStackTrace();
		}
		
		
		
		return null;
	}





	//LoginOk > 중개사 로그인
	public SignDTO brokerLogin(SignDTO dto) {
		
		try {
			
			String sql = "select * from tblMember where id = ? and pw = ? and active = '활동중' and lv = '2'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			
			
			//조회한 결과들 저장
			rs = pstat.executeQuery();
			
			
			if(rs.next()) {
				
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
			System.out.println("SignDAO.brokerLogin");
			e.printStackTrace();
		}
		
		
		return null;
	}

	

	

	//FindResult > 회원 ID 찾기
	public SignDTO findUserId(String name, String email) {
		
		try {
			
			String sql = "select id from tblMember where name = ? and email = ? and lv='1'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, name);
			pstat.setString(2, email);
			
			rs = pstat.executeQuery();
			
			SignDTO dto = new SignDTO();
			
			if(rs.next()) {
				
				dto.setId(rs.getString("id"));
				
				
				return dto;
				
				
			}
			
			
			
		} catch (Exception e) {
			System.out.println("SignDAO.findId");
			e.printStackTrace();
		}
		
		
		
		return null;
	}


	//FindResult > 중개사 ID 찾기
	public SignDTO finBrokerId(String name, String email) {

		
		try {
			
			String sql = "select id from tblMember where name = ? and email = ? and lv='2'";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, name);
			pstat.setString(2, email);
			
			rs = pstat.executeQuery();
			
			SignDTO dto = new SignDTO();
			
			if(rs.next()) {
				
				dto.setId(rs.getString("id"));
				
				
				return dto;
				
				
			}
			
			
			
		} catch (Exception e) {
			System.out.println("SignDAO.finBrokerId");
			e.printStackTrace();
		}
		
		return null;
	}


	//아이디 중복확인
	public Integer checkId(String id) {
		
		try {
			
			String sql = "select * from tblMember where id = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			
			rs = pstat.executeQuery();
			
			
			//아이디가 이미 있는 경우
			if(rs.next()) {
				
				return 0;
				
			}else {
				
				
				return 1;
			}
			
			
			
		} catch (Exception e) {
			System.out.println("SignDAO.checkId");
			e.printStackTrace();
		}
		
		
		return null;
	}


	//userRegisterOk > 일반회원 회원가입
	public int userAdd(SignDTO dto) {
		
		try {
			
			
			String sql = "insert into tblMember(id, name, email, ssn, tel, address, pw, active, lv, x, y) values (?, ?, ?, ?, ?, ?, ?, '활동중', '1', ?, ?)";
			
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getEmail());
			pstat.setString(4, dto.getSsn());
			pstat.setString(5, dto.getTel());
			pstat.setString(6, dto.getAddress());
			pstat.setString(7, dto.getPw());
			pstat.setString(8, dto.getX());
			pstat.setString(9, dto.getY());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SignDAO.userAdd");
			e.printStackTrace();
		}
		
		return 0;
	}


	//이메일 중복확인
	public int checkEmailDuplicate(String email) {
		
		try {
			
			String sql = "select * from tblMember where email = ?";
			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, email);
			
			rs = pstat.executeQuery();
			
			
			//이메일이 이미 있는 경우
			if(rs.next()) {
				
				return 1;
				
			}else {
				
				
				return 0;
			}
			
			
		} catch (Exception e) {
			System.out.println("SignDAO.checkEmail");
			e.printStackTrace();
		}
		
		
		
		return 0;
	}


	//등록된 이메일 정보인지 확인  
	public int checkEmail(String id, String email) {
		
		
		try {
			
			String sql = "select * from tblMember where id=? and email=?";

			
			pstat = conn.prepareStatement(sql);
			pstat.setString(1, id);
			pstat.setString(2, email);
			
			
			rs = pstat.executeQuery();
			
			
			//존재하는 정보
			if(rs.next()) {
				
				return 0;
				
			}else {
				
				
				return 1;
			}
			
			
		} catch (Exception e) {
			System.out.println("SignDAO.checkEmail");
			e.printStackTrace();
		}
		
		
		
		return 0;
	}


	//비밀번호 찾기 기능 > 비밀번호 변경
	public int editPw(SignDTO dto) {
		
		try {
			
			
			String sql = "update tblMember set pw = ? where id =?";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getPw());
			pstat.setString(2, dto.getId());
			
			return pstat.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("SignDAO.editPw");
			e.printStackTrace();
		}
		
		
		
		return 0;
	}


	//중개사 > 회원가입
	public int brokerBasicAdd(BrokerDTO dto) {
		
		try {
			
			String sql = "insert into tblMember(id, name, email, ssn, tel, address, pw, active, lv, x, y) values (?, ?, ?, ?, ?, ?, ?, '활동중', '2', ?, ?)";
			
			
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getName());
			pstat.setString(3, dto.getEmail());
			pstat.setString(4, dto.getSsn());
			pstat.setString(5, dto.getTel());
			pstat.setString(6, dto.getAddress());
			pstat.setString(7, dto.getPw());
			pstat.setString(8, dto.getX());
			pstat.setString(9, dto.getY());
			
			
			
			System.out.println("기본 정보 넣음");
			
			return pstat.executeUpdate();
			
			
			
			
			
		} catch (Exception e) {
			System.out.println("SignDAO.brokerAdd");
			e.printStackTrace();
		}
		
		
		
		return 0;
	}



	public int brokerInfoAdd(BrokerDTO dto) {
		
		
		try {
			
			String sql = "insert into tblBroker(seq, id, firmName, firmNum, corporateNum, firmAddress, representName, firmTel, profileImg) values (seqBroker.nextVal, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstat = conn.prepareStatement(sql);
			
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getFirmName());
			pstat.setString(3, dto.getFirmNum());
			pstat.setString(4, dto.getCorporateNum());
			pstat.setString(5, dto.getFirmAddress());
			pstat.setString(6, dto.getRepresentName());
			pstat.setString(7, dto.getFirmTel());
			pstat.setString(8, dto.getFilename());
			
			System.out.println("디테일 정보 넣음");
			
			return pstat.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("SignDAO.brokerInfoAdd");
			e.printStackTrace();
		}
		
		
		return 0;
	}



		
}
