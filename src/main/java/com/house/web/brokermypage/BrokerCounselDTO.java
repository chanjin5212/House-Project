package com.house.web.brokermypage;

import lombok.Data;

@Data
public class BrokerCounselDTO {

 /*
  
  create or replace view vwCouselList
as
select 
    c.seq,
    c.memberid,
    content,
    state,
    writedate,
    completedate,
    c.realestateseq,
    r.realestateaddr,
    r.memberid as brokerid
from tblCounsel c
    inner join tblrealestate r
        on c.realestateseq = r.seq
    ;
  
  
  */
	
	private String seq;
	private String memberId;
	private String realestateSeq;
	private String content;
	private String state;
	private String writeDate;
	private String completedate;
	private String realestateaddr;
	private String brokerid;
	private String reviewSeq;
	
	private String tel;
	private String name;
	//후기별점
	private String star;
	private String avg;
	
}
