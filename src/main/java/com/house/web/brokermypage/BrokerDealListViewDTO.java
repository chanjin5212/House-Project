package com.house.web.brokermypage;

import lombok.Data;

@Data
//vwBrokerContractDoneList
public class BrokerDealListViewDTO {
	
	private String contractSeq;
	private String realEstateSeq;
	private String userId;
	private String contractCategory;
	private String contractDate;
	private String realestateAddr;
	private String deposit;
	private String price;
	private String brokerId;
	
	private String reviewSeq;
	
	private String state;
	private String brokerCheck;
	
	private String contractDocSeq;

}


/*
   		c.seq as contractSeq, 
        c.realestateseq, 
        c.id as userid, 
       (select tblcontract.name from tblcontract where tblcontract.seq = r.contractseq) as contractCategory, 
       c.contractdate,
        r.realestateaddr,
        ( r.brokerreward ||' / ' || r.price) as title, 
        r.memberid as brokerid
 
 */
