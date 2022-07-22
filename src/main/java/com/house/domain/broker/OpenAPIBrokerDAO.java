package com.house.domain.broker;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;     

public class OpenAPIBrokerDAO {

	public ResultAPIBrokerDTO search(HashMap<String, String> map) throws IOException {

		StringBuilder urlBuilder = new StringBuilder("http://openapi.nsdi.go.kr/nsdi/EstateBrkpgService/attr/getEBOfficeInfo"); /* URL */   
        StringBuilder parameter  = new StringBuilder();   
        parameter.append("?" + URLEncoder.encode("authkey","UTF-8") + "=4ca8da1af1b5a90ad610b927d18ab748"); /*authkey Key*/     
        parameter.append("&" + URLEncoder.encode("bsnmCmpnm","UTF-8") + "=" + URLEncoder.encode("맑은공인", "UTF-8")); /* 사업자상호 */  
  
        parameter.append("&" + URLEncoder.encode("format","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /* 응답결과 형식(xml 또는 json) */  

    
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
		
		
		return null;
	}

	
	
	
}
