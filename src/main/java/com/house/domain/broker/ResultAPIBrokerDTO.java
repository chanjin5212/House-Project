package com.house.domain.broker;

import java.util.ArrayList;

import lombok.Data;

@Data
public class ResultAPIBrokerDTO {

	
	private String query;
	private String total;
	private ArrayList<BrokerDTO> list;
		
}
