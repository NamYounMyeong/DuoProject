package com.kh.sdm.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public String findPw(String memberId) {
		return sqlSession.selectOne("member.findPw", memberId);
	}
	
}
