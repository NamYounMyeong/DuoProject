package com.kh.sdm;

import java.util.Properties;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@SpringBootTest
public class EmailTest {
	
	@Test
	public void test() {
		//메일 전송을 하려면 전송 도구와 메세지가 있어야 한다
		//전송 도구 - JavaMailSender(Impl)
		
		//도구 생성 및 정보 설정
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost("smtp.gmail.com");//이메일 전송 대행업체의 HOST
		sender.setPort(587);//이메일 전송 대행업체의 PORT(port번호는 업체마다 다름 - 587은 구글의 포트번호)
		sender.setUsername("dbsaud9307@gmail.com");//이메일 전송 대행업체의 로그인 ID
		sender.setPassword("mvvbhnuimcdvrpse");//이메일 전송 대행업체의 로그인 PW(앱 비밀번호)
		
		//추가 정보 설정
		Properties props = new Properties();//Map<String, String> 형태의 저장소
		props.setProperty("mail.smtp.auth", "true");//인증 여부 설정(필수)
		props.setProperty("mail.smtp.debug", "true");//디버깅 사용 여부 설정(선택)
		props.setProperty("mail.smtp.starttls.enable", "true");//TLS 사용 여부(필수)
		props.setProperty("mail.smtp.ssl.protocols", "TLSv1.2");//TLS 버전 설정(필수)
		props.setProperty("mail.smtp.ssl.trust", "smtp.gmail.com");//신뢰할 수 있는 대상으로 추가(필수)
		
		sender.setJavaMailProperties(props);
		
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
