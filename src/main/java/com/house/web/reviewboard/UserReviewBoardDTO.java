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
}
