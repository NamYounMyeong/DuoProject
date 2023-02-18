package com.kh.sdm.repository;

import com.kh.sdm.entity.MemberDto;

public interface MemberDao {
	public String findPw(String memberId);
	
	//회원가입
	void join(MemberDto memberDto);
	
	//아이디 중복 확인
	MemberDto checkId(String memberId);
	
}
