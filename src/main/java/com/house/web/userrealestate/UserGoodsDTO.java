package com.house.web.userrealestate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserGoodsDTO {

	//간단히 화면에 표시하기 위한 데이터
	private String seq;
	private String memberId;
	private String realEstateAddr;
	private String brokerReward;
	private String createDate;
	private String updateDate;
	private int price;
	private String dealState;
	private String introduce;
	private String moveInDate;
	private String petOk;
	private String loanOk;
	private String coordinateX;
	private String coordinateY;
	private String image;
	private String category;
	private String type;
	private int deposit;
	
}
