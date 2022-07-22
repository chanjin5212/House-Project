package com.house.web.userrealestate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SidebarGoodsDTO {
	private String realEstateSeq;	//매물번호
	private String img;				//이미지
	private String price;			//가격
	private String deposit;			//보증금
	private String contractType;	//월세 등
	private String coordinateX;		//지도 좌표
	private String coordinateY;		//지도 좌표
	private String address;			//주소
	private String buildingType;	//빌딩타입
	private String theFloor;		//현재층
	private String buldingFloor;	//건물층
	private String supplyArea;		//전용면적
	private String introduce;		//소개글
}

//보증금, 전용면적