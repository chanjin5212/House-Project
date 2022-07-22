package com.house.domain.broker;

import java.io.InputStreamReader;     
import java.net.HttpURLConnection;     
import java.net.URL;     
import java.net.URLEncoder;     
import java.io.BufferedReader;     
import java.io.IOException;     
     
public class BrokerAPI {     
    public static void main(String[] args) throws IOException {     
        StringBuilder urlBuilder = new StringBuilder("http://openapi.nsdi.go.kr/nsdi/EstateBrkpgService/attr/getEBOfficeInfo"); /* URL */   
        StringBuilder parameter  = new StringBuilder();   
        parameter.append("?" + URLEncoder.encode("authkey","UTF-8") + "=인증키"); /*authkey Key*/     
        parameter.append("&" + URLEncoder.encode("ldCode","UTF-8") + "=" + URLEncoder.encode("11110", "UTF-8")); /* 시군구코드(2~5자리) */  
        parameter.append("&" + URLEncoder.encode("bsnmCmpnm","UTF-8") + "=" + URLEncoder.encode("맑은공인", "UTF-8")); /* 사업자상호 */  
        parameter.append("&" + URLEncoder.encode("brkrNm","UTF-8") + "=" + URLEncoder.encode("홍길동", "UTF-8")); /* 중개업자명 */  
        parameter.append("&" + URLEncoder.encode("sttusSeCode","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 상태구분코드(1:영업중,2:휴업,3:휴업연정,4:실효5:폐업,6:전출,7:등록취소,8:업무정지) */  
        parameter.append("&" + URLEncoder.encode("format","UTF-8") + "=" + URLEncoder.encode("xml", "UTF-8")); /* 응답결과 형식(xml 또는 json) */  
        parameter.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /* 검색건수 */  
        parameter.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */  
    
        URL url = new URL(urlBuilder.toString() + parameter.toString());     
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();     
        conn.setRequestMethod("GET");     
        conn.setRequestProperty("Content-type", "application/json");     
        System.out.println("Response code: " + conn.getResponseCode());     
        BufferedReader rd;     
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