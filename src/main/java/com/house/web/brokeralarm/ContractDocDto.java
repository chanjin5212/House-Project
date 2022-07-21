package com.house.web.brokeralarm;

import lombok.Data;

@Data
public class ContractDocDto {
	
	private String contractSeq;

	private String userId;
	private String brokerId;
	private String contractDocSeq;
	//1.
	private String category; //매매, 전세, 월세
	private String realestateAddr; //매물 주소
	private String realestateSeq; //매물 번호
	private String toji; //토지
	private String tojiwidth;  //토지면적
	private String mainUse;  //구조용도
	private String gywidth;  //공용면적
	private String jywidth;  //전용면적
	
	//2.
	private String deposit; //보증금
	private String downpayment; //계약금
	private String price; //계약금
	private String balanceDate; //잔금날짜
	private String balance; //잔금날짜
	//잔금은 price - downpayment
	
	private String borrowedMoney; //차임금 지불날짜
	private String endDate; //계약종료날짜
	private String contractDate; //계약날짜
	private String checkInDate;
	
	private String monthEndDate;
	private String charterEndDate;
	
	//매매일때만
	private String loanAmount; //융자금
	private String rentalDeposit; //임대보증금
	
	//3.
	//임대인
	private String ownerAddr;
	private String ownerName;
	private String ownerSsn;
	private String ownerTel;
	private String ownerDeputyAddr;
	private String ownerDeputySsn;
	private String ownerDeputyName;
	
	//임차인
	private String userAddr;
	private String userName;
	private String userSsn;
	private String userTel;
	private String userDeputyAddr;
	private String userDeputySsn;
	private String userDeputyName;
	
	//중개사
	private String brokerAddr; //중개사 주소
	private String brokerName; //중개사이름
	private String brokerRepresentName; //대표
	private String firmNum; //중개사 등록번호
	private String brokerTel; //중개사 전화번호
	
	
}
