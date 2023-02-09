package com.kh.sdm.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.sdm.constant.SessionConstant;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	
	@GetMapping("/join")
	public String join() {
		return "member/join";
	}
	
	@GetMapping("/pw-search")
	public String pwSearch() {
		return "member/pwSearch";
	}
	
	@GetMapping("/mypage")
	public String mypage(
			HttpSession session,
			RedirectAttributes attr) {
		String loginId = (String)session.getAttribute(SessionConstant.ID);
		attr.addAttribute("memberId", loginId);
		return "member/mypage";
	}
}
