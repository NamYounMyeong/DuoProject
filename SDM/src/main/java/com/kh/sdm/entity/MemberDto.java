package com.kh.sdm.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @AllArgsConstructor @NoArgsConstructor @Builder
public class MemberDto {
	private String memberId, memberNick, memberPw, memberPhone, memberGender;
	private int attachmentNo;
	private Date memberBirth, memberDueDate, memberJoin, memberLogin;
}
