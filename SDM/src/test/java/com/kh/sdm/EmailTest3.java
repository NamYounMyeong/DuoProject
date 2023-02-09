package com.kh.sdm;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.sdm.service.EmailService;

@SpringBootTest
public class EmailTest3 {

	@Autowired
	private EmailService emailService;
	
	String email = "dbsaud3112@naver.com";
	
	@Test
	public void test() {
		emailService.sendCertMail(email);
	}
	
}
