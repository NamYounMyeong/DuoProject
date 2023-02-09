package com.kh.sdm;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.sdm.entity.CertDto;
import com.kh.sdm.repository.CertDao;
import com.kh.sdm.service.EmailService;

@SpringBootTest
public class CheckCertTest2 {
	
	@Autowired
	private EmailService emailService;
	
	String email = "dbsaud3112@naver.com";
	String serial = "449373";
	
	@Test
	public void test() {
		CertDto certDto = CertDto.builder().certId(email).certSerial(serial).build();
		
		boolean result = emailService.checkCert(certDto);
		
		System.out.println(result);
		if(result) {
			System.out.println("인증 성공");
		}//if end
		else {
			System.out.println("인증 실패");
		}//else end
	}

}
