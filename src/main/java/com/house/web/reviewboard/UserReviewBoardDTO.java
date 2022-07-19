package com.house.web.reviewboard;

import lombok.Data;

@Data
public class UserReviewBoardDTO {
	private String seq;
	private String title;
	private String content;
	private String id;
	private String regdate;
	private String views;
	
	private String address;
	
	private String choice;
	private String cleanStar;
	private String priceStar;
	private String locationStar;
	private String optionStar;
	
	private String jpg;
	
	//매물 번호
	private String realSeq; 
}
