package com.kh.sdm.repository;

import com.kh.sdm.entity.AttachmentDto;

public interface AttachmentDao {
	public int sequence();
	public void insert(AttachmentDto attachmentDto);
	public AttachmentDto find(int attachmentNo);
}
