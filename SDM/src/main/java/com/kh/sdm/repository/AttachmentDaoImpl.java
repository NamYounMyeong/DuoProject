package com.kh.sdm.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.sdm.entity.AttachmentDto;

@Repository
public class AttachmentDaoImpl implements AttachmentDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public int sequence() {
		return session.selectOne("attachment.sequence");
	}

	@Override
	public void insert(AttachmentDto attachmentDto) {
		session.insert("attachment.insert", attachmentDto);
	}

	@Override
	public AttachmentDto find(int attachmentNo) {
		return session.selectOne("attachment.find", attachmentNo);
	}

}
