package com.kh.sdm.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sdm.entity.CertDto;

@Repository
public class CertDaoImpl implements CertDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insert(CertDto certDto) {
		sqlSession.insert("cert.insert", certDto);
		
	}
	
	@Override
	public boolean check(CertDto certDto) {
		CertDto result = sqlSession.selectOne("cert.check", certDto);
		return result != null;
	}
	
	@Override
	public boolean delete(String certId) {
		int count = sqlSession.delete("cert.delete", certId);
		return count > 0;
	}

}
