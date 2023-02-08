package com.kh.sdm.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sdm.entity.MemberDto;
import com.kh.sdm.repository.MemberDao;

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

	@PostMapping("/member")
	public String login(@RequestBody MemberDto memberDto) {
		String findPw = memberDao.findPw(memberDto.getMemberId());
//		이거 어케 쓰더라
//		log.debug("findPw = {}",findPw);
		return "YYYY";
	}
}
