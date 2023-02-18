<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- css 불러옴  -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/join.css">

<!-- js 불러옴 -->
<script src="${pageContext.request.contextPath}/js/join.js"></script>

<style>
	
	
</style>

<div>
	<div>
		<span>회원가입</span>
	</div>
	
	<div class="place-bar">
        <div class="inner"></div>
        <div class="inner"></div>
        <div class="inner"></div>
        <div class="inner"></div>
        <div class="inner"></div>
        <div class="inner"></div>
        <div class="inner"></div>
    </div>
	<form method="post" action="join" autocomplete="off" class="join-form">
		<!-- ID 입력 -->
		<div class="input-id-area">
			<div>
				<span>아이디로 사용할 이메일 주소를 입력해 주세요</span>
			</div>
			<div>
				<input type="text" name="memberId" placeholder="이메일" class="w-100 join-input">
				<button class="request-btn btn w-100" type="button">인증번호 요청</button>
				<div>
					<span class="confirm-text"></span>
				</div>
			</div>
			<div class="verification">
				<input id="verificationInput" type="text" placeholder="인증번호 입력" class="w-100 join-input">
				<button class="verification-btn btn w-100" type="button">확인</button>
				<span></span>
			</div>
			
		</div>
		
		<!-- 비밀번호 입력 -->
		<div class="input-pw-area hide">
			<div>
				<span>영문 소문자/숫자/특수문자를 조합하여 8~20자로 입력해 주세요</span>
			</div>
			<div>
				<input name="memberPw" type="password" placeholder="비밀번호" class="w-100 join-input">
				<div>
					<span class="confirm-text"></span>
				</div>
			</div>
			<div>
				<input type="password" id="memberPwConfirm" placeholder="비밀번호 확인" class="w-100 join-input">
				<div>
					<span class="confirm-text"></span>
				</div>
			</div>
		</div>
		
		<!-- 닉네임 입력 -->
		<div class="input-nick-area hide">
			<div>
				<span>한글/영문 소문자/숫자를 사용하여 2~10자로 입력해 주세요</span>
			</div>
			<div>
				<input type="text" name="memberNick" placeholder="닉네임" class="w-100 join-input">
				<div>
					<span class="confirm-text"></span>
				</div>
			</div>
		</div>
		
		<!-- 전화번호 입력 -->
		<div class="input-phone-area hide">
			<div>
				<span>휴대폰 번호를 입력해 주세요</span>
			</div>
			<div>
				<input type="tel" name="memberPhone" class="w-100 join-input">
				<div>
					<span class="confirm-text"></span>
				</div>
			</div>
		</div>
		
		<!-- 생년월일 입력 -->
		<div class="input-birth-area hide">
			<div>
				<span>생년월일을 선택해 주세요</span>
			</div>
			<div>
				<input type="date" name="memberBirth">
	<!-- 			<input type="text" class="member-birth-y" placeholder="YYYY">년  -->
	<!-- 			<input type="text" class="member-birth-m" placeholder="MM">월  -->
	<!-- 			<input type="text" class="member-birth-d" placeholder="DD">일 -->
			</div>
		</div>
		
		<!-- 결혼예정일 입력 -->
		<div class="input-third-area hide">
			<div>
				<span>결혼예정일을 선택해 주세요</span>
			</div>
			<div>
				<input type="date" name="memberDueDate">
			</div>
		</div>
		
		<!-- 성별 입력 -->
		<div class="input-gender-area hide">
			<div>
				<span>성별을 선택해 주세요</span>
			</div>
			<div>
				<label for="memberGenderM">남자</label>
				<input id="memberGenderM" type="radio" name="memberGender" value="M">
				<label for="memberGenderF">여자</label>
				<input id="memberGenderF" type="radio" name="memberGender" value="F">
			</div>
			
			<div>
				<button class="send-form-btn w-100 btn btn-positive" type="submit" disabled="disabled">회원가입</button>
			</div>
		</div>
	</form>
	<div class="btn-box">
		<button type="button" class="prev-btn hide btn w-100">이전</button>
		<button type="button" disabled="disabled" class="next-btn btn w-100">다음</button>
	</div>
	<div class="login-btn-box">
		<a href="login">로그인 하기</a>
	</div>
</div>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>