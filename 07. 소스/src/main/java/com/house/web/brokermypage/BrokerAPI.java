package com.house.web.brokermypage;

import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.io.BufferedReader;
import java.io.IOException;

public class BrokerAPI {

	
	public static void main(String[] args) throws IOException {
		//http://openapi.seoul.go.kr:8088/sample/xml/landBizInfo/1/5/1135010300
		StringBuilder urlBuilder = new StringBuilder("http://openapi.seoul.go.kr:8088"); /*URL*/
		urlBuilder.append("/" +  URLEncoder.encode("636e51784468753335366e78654754","UTF-8") ); /*인증키 (sample사용시에는 호출시 제한됩니다.)*/
		urlBuilder.append("/" +  URLEncoder.encode("json","UTF-8") ); /*요청파일타입 (xml,xmlf,xls,json) */
		urlBuilder.append("/" + URLEncoder.encode("landBizInfo","UTF-8")); /*서비스명 (대소문자 구분 필수입니다.)*/
		urlBuilder.append("/" + URLEncoder.encode("1","UTF-8")); /*요청시작위치 (sample인증키 사용시 5이내 숫자)*/
		urlBuilder.append("/" + URLEncoder.encode("5","UTF-8")); /*요청종료위치(sample인증키 사용시 5이상 숫자 선택 안 됨)*/
		// 상위 5개는 필수적으로 순서바꾸지 않고 호출해야 합니다.
		
		// 서비스별 추가 요청 인자이며 자세한 내용은 각 서비스별 '요청인자'부분에 자세히 나와 있습니다.
		//urlBuilder.append("/" + URLEncoder.encode("","UTF-8")); /* 서비스별 추가 요청인자들*/
		
		/*
		 
		Response code: 200
<?xml version="1.0" encoding="UTF-8"?><landBizInfo><list_total_count>1</list_total_count><RESULT><CODE>INFO-000</CODE><MESSAGE>정상 처리되었습니다</MESSAGE></RESULT><row><SYS_REGNO>113502018000029</SYS_REGNO><SGG_CD>11350</SGG_CD><BJDONG_CD>1135010300</BJDONG_CD><SGG_NM>노원구</SGG_NM><BJDONG_NM>공릉동</BJDONG_NM><LAND_GBN>1</LAND_GBN><BOBN>0670</BOBN><BUBN>0020</BUBN><ADDRESS>서울특별시 노원구 동일로 986 101동 118호(공릉동,노원프레미어스엠코)</ADDRESS><RA_REGNO>11350-2018-00030</RA_REGNO><RDEALER_NM>김상엽</RDEALER_NM><CMP_NM>히어로공인중개사사무소</CMP_NM><TELNO>975-8989</TELNO><STS_GBN>업무정지</STS_GBN><BEGIN_DE>2022.05.11</BEGIN_DE><END_DE>2022.08.10</END_DE><RNUM>791</RNUM><ROAD_CD>113503000001</ROAD_CD><BLDG_LOC>0</BLDG_LOC><BLDG_BOBN>986</BLDG_BOBN><BLDG_BUBN>0</BLDG_BUBN></row></landBizInfo>

		 
		 */
		
		

		
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode()); /* 연결 자체에 대한 확인이 필요하므로 추가합니다.*/
		BufferedReader rd;

		// 서비스코드가 정상이면 200~300사이의 숫자가 나옵니다.
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
				sb.append(line);
		}
		rd.close();
		conn.disconnect();
		System.out.println(sb.toString());
	}
}
