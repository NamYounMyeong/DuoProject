package com.kh.sdm.configuration;

import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class EmailConfiguration {
	
	@Autowired
	private EmailProperties emailProperties;
	
	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost(emailProperties.getHost());//이메일 전송 대행업체의 HOST
		sender.setPort(emailProperties.getPort());//이메일 전송 대행업체의 PORT(port번호는 업체마다 다름 - 587은 구글의 포트번호)
		sender.setUsername(emailProperties.getUsername());//이메일 전송 대행업체의 로그인 ID
		sender.setPassword(emailProperties.getPassword());//이메일 전송 대행업체의 로그인 PW(앱 비밀번호)
		
		//추가 정보 설정
		Properties props = new Properties();//Map<String, String> 형태의 저장소
		props.setProperty("mail.smtp.auth", "true");//인증 여부 설정(필수)
		props.setProperty("mail.smtp.debug", "true");//디버깅 사용 여부 설정(선택)
		props.setProperty("mail.smtp.starttls.enable", "true");//TLS 사용 여부(필수)
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");//TLS 버전 설정(필수)
		props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");//신뢰할 수 있는 대상으로 추가(필수)
		
		sender.setJavaMailProperties(props);
		
		return sender;
	}
	
	
}
