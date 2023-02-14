package com.kh.sdm.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sdm.entity.CertDto;
import com.kh.sdm.entity.MemberDto;
import com.kh.sdm.repository.MemberDao;
import com.kh.sdm.service.EmailService;

import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.extern.slf4j.Slf4j;

@RestController
@Tag(name = "회원 컨트롤러")
@CrossOrigin(origins = "http://127.0.0.1:5500")
@RequestMapping("/rest")
@Slf4j
public class MemberRestController {
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private EmailService emailService;

	@PostMapping("/member")
	public String login(@RequestBody MemberDto memberDto) {
		String findPw = memberDao.findPw(memberDto.getMemberId());
		return "YYYY";
	}
	
	//이메일 전송
	@PostMapping("/send-email")
	public void sendEmail(@RequestParam String memberId) {
		emailService.sendCertMail(memberId);
	}
	
	//인증번호 확인
	@PostMapping("/check-verification")
	public String check(@ModelAttribute CertDto certDto) {
		boolean confirm = emailService.checkCert(certDto);
		if(confirm) {
			return "Y";
		}//if end
		else {
			return "N";
		}//else end
	}
	
	
}
