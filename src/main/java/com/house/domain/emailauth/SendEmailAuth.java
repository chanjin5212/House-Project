package com.house.domain.emailauth;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.house.domain.emailauth.GmailVO;

@WebServlet("/domain/emailauth/sendEmailAuth")
public class SendEmailAuth extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		
		String email = req.getParameter("email");	
		
		//인증코드 생성
		String key = authKeyMaker();
		
		//메일 서버 설정
		String host = "smtp.gmail.com";
		String user = GmailVO.getId(); 	// 자신의 구글 계정
		String password = GmailVO.getPw();// 자신의 구글 패스워드
		
		//메일 받을 주소
		String to_email = email;
		
		// SMTP 서버 정보를 설정한다.
		Properties prop = System.getProperties();
		prop.put("mail.smtp.host", host);
		//google - TLS : 587, SSL: 465
		prop.put("mail.smtp.port", 465);
		prop.put("mail.smtp.starttls.enable", "true");
		prop.put("mail.smtp.auth", "true");
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		prop.put("mail.debug", "true");
		
		Session session = Session.getDefaultInstance(prop, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});
		
		MimeMessage msg = new MimeMessage(session);
		
		//이메일 전송
		try {
			//보내는 사람
			msg.setFrom(new InternetAddress(user));
			//받는 사람
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
			//메일 제목
			msg.setSubject("빠방 메일인증 서비스입니다.", "UTF-8");
			//메일 내용
			msg.setText("인증 번호 : " + key);
			//메시지 전송
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//인코딩
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		/*
		 { "key": "%s" }
		 */
		PrintWriter writer = resp.getWriter();
		writer.printf("{ \"key\": \"%s\" }", key);
		writer.close();
		
	}

	//인증코드 생성기
	private String authKeyMaker() {
		String key = null;
		
		StringBuffer temp = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 7; i++) {
			int rIndex = rnd.nextInt(3);
			switch (rIndex) {
			case 0:
				// a-z
				temp.append((char) ((int) (rnd.nextInt(26)) + 97));
				break;
			case 1:
				// A-Z
				temp.append((char) ((int) (rnd.nextInt(26)) + 65));
				break;
			case 2:
				// 0-9
				temp.append((rnd.nextInt(10)));
				break;
			}
		}
		
		key = temp.toString();		
		return key;
	}
	
}
