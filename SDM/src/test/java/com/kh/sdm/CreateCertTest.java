package com.kh.sdm;

import java.text.DecimalFormat;
import java.text.Format;
import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

import com.kh.sdm.component.RandomGenerator;
import com.kh.sdm.entity.CertDto;
import com.kh.sdm.repository.CertDao;

@SpringBootTest
public class CreateCertTest {

	@Autowired
	private CertDao certDao;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	@Autowired
	private RandomGenerator randomGenerator;
	
	String email = "dbsaud3112@naver.com";//사용자가 입력할 정보
	
	@Test
	public void certTest() {

//		Random r = new Random();
//		int number = r.nextInt(1000000);
//		System.out.println("number= "+number);
//		
//		Format f = new DecimalFormat("000000");
//		String serial = f.format(number);
//		System.out.println(serial);
		
		String serial = randomGenerator.generateSerial(6);
		
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email);
		message.setSubject("[SDM] 이메일 인증번호입니다");
		message.setText("인증번호: " + serial);
		javaMailSender.send(message);
		
		certDao.delete(email);
		CertDto certDto = CertDto.builder().certId(email).certSerial(serial).build();
		certDao.insert(certDto);
		
	}
	
}
