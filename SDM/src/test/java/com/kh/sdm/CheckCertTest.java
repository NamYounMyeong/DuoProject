package com.kh.sdm;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.kh.sdm.entity.CertDto;
import com.kh.sdm.repository.CertDao;

@SpringBootTest
public class CheckCertTest {
	
	@Autowired
	private CertDao certDao;
	
	String email = "dbsaud3112@naver.com";
	String serial = "449373";
	
	@Test
	public void test() {
		CertDto certDto = CertDto.builder().certId(email).certSerial(serial).build();
		
		boolean result = certDao.check(certDto);
		
		System.out.println(result);
		if(result) {
			System.out.println("인증 성공");
			certDao.delete(email);
		}//if end
		else {
			System.out.println("인증 실패");
		}//else end
	}

}
