package com.house.web.userZzim;

import lombok.Data;

@Data
public class UserZzimListDTO {
		//기본 정보
		private String seq;
		private String contractName;
		
		private String buildingTypeName;
		
		private String roomTypeName;
		
		private String mainUseName;
		
		//집주인 - 대리인
		private String deputyName;
		private String deputySsn;
		private String deputyAddress;
		
		//집주인
		private String ownerName;
		private String ownerSsn;
		private String ownerAddress;
		private String ownerTel;
		
		//매물정보
		private String id;
		private String ownerSeq;
		private String buildingTypeSeq;
		private String contractSeq;
		private String realEstateAddr;
		private String brokerReward;
		private String price;
		private String introduce;
		private String moveInDate;
		private String petOk;
		private String loanOk;
		private String coordinateX;
		private String coordinateY;
		
		//보증금
		private String deposit;
		
		//구조
		private String roomTypeSeq;
		private String mainUseSeq;
		private String numRoom;
		private String numToilets;
		private String numBalcony;
		private String heatingType;
		private String direction;
		private String built;
		private String buildingFloor;
		private String theFloor;
		private String dedicatedArea;
		private String supplyArea;
		private String elevatorStatus;
		
		//옵션정보
		private String television;
		private String airConditioner;
		private String refrigerator;
		private String washingMachine;
		private String dryer;
		private String induction;
		private String gasRange;
		private String desk;
		private String bookshelf;
		private String bed;
		private String closet;
		private String dishWasher;
		private String shoeCloset;
		
		//관리비
		private String amount;
		private String electricityBill;
		private String gasBill;
		private String waterBill;
		private String televisionBill;
		private String internetBill;
		private String parkingBill;
		 
		//주차
		private String parkingStatus;
		private String numParkSpace;
		
		
		//내 매물 목록
		private String contractCheck;
		private String name;
		private String wish;

		
		//사진
		private String filename;
		
		private String reSeq;
		

}
