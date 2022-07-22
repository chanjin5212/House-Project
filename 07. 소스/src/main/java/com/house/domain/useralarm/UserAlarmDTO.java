package com.house.domain.useralarm;

import lombok.Data;

@Data
public class UserAlarmDTO {
	
	private String seq;
	private String id;
	private String state;
	private String address;
	private String price;
	private String deposit;
	
	private String reseq;
	private String name;
	
	//계약서
	private String ownerAddress;
	private String ownerSsn;
	private String ownerTel;
	private String ownerName;
	private String deputyAddress;
	private String deputySsn;
	private String deputyName;
	private String memberAddress;
	private String memberSsn;
	private String memberTel;
	private String memberName;
	private String firmaddress;
	private String firmname;
	private String representname;
	private String firmnum;
	private String firmtel;
	private String balancedate;
	private String contractdate;
	private String land;
	private String structural;
	private String downPayment;
	private String loanamount;
	private String rentaldeposit;
	private String borrowedmoney;
	private String moEnddate;
	private String chEnddate;
	private String contractName;
	private String realestateaddr;
	private String dedicatedArea;
	private String supplyArea;
	


}
