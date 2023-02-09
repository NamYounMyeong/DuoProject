package com.kh.sdm.service;

import com.kh.sdm.entity.CertDto;

public interface EmailService {
	void sendCertMail(String email);
	boolean checkCert(CertDto certDto);
}
