package com.kh.sdm.repository;

import com.kh.sdm.entity.CertDto;

public interface CertDao {
	void insert(CertDto certDto);
	boolean check(CertDto certDto);
	boolean delete(String certId);

}
