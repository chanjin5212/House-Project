package com.house.domain.broker;

import lombok.Data;

@Data
public class BrokerDTO {
	
	private String id;
	private String name;
	private String email;
	private String ssn;
	private String tel;
	private String address;
	private String pw;
	private String active;
	private String lv;
	private String x;
	private String y;

	private String seq;
	private String firmName;  //중개업소명
	private String firmNum;   //중개등록번호
	private String corporateNum;  //사업자등록번호
	private String firmAddress; //중개업소주소
	private String representName; //사업자 대표명
	private String firmTel; //유선전화번호
	private String filename;
	private String orgfilename;

}

