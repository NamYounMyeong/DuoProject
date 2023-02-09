package com.kh.sdm;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

@SpringBootTest
public class EmailTest2 {

	@Autowired
	private JavaMailSender sender;
	
	@Test
	public void test() {
		//메세지 작성
		SimpleMailMessage message = new SimpleMailMessage();
		
		message.setTo("dbsaud3112@naver.com");//받는사람
		//message.setCc("");//참조
		//message.setBcc("");//숨은참조
		
		message.setSubject("테스트 이메일");//메일 제목
		message.setText("테스트 내용");//메일 내용
		
		//전송
		sender.send(message);
		
	}
	
}
