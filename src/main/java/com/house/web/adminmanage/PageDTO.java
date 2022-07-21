package com.house.web.adminmanage;

public class PageDTO {

	private int startPage; 
	private int endPage;
	private boolean prev, next;
	
	private int pageNum; 
	private int amount = 10; 
	private int total;
	
	public PageDTO(int pageNum, int amount, int total) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.total = total;
		
		this.endPage = (int)Math.ceil(this.pageNum * 0.1) * 10;
		this.startPage = this.endPage - 10 + 1;
		int realEnd = (int)Math.ceil(this.total / (double)this.amount);
		
		if(this.endPage > realEnd) {
			this.endPage = realEnd;
		}
	
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
		
		
		System.out.println("시작페이지:" + this.startPage + ", 끝페이지:" + this.endPage);
		
	}
}