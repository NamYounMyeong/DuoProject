package com.kh.sdm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.kh.sdm.component.RandomGenerator;
import com.kh.sdm.entity.CertDto;
import com.kh.sdm.repository.CertDao;

@Service
public class GmailService implements EmailService {

	@Autowired
	private RandomGenerator randomGenerator;
	
	@Autowired
	private CertDao certDao;
	
	@Autowired
	private JavaMailSender javaMailSender;
	
	//이메일 전송 기능
	@Override
	public void sendCertMail(String email) {
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
	
	//인증번호 확인 기능
	@Override
	public boolean checkCert(CertDto certDto) {
		
		if(certDao.check(certDto)) {
			certDao.delete(certDto.getCertId());
			return true;
		}//if end
		return false;
		
	}
	
	
}
