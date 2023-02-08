<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div>
	<div>
		<span>로그인</span>
	</div>
	<form method="post" action="member/lgoin" autocomplete="off" class="login-form">
		<div>
			<input type="text" name="memberId" placeholder="이메일">
		</div>
		<div>
			<input type="text" name="memberPw" placeholder="비밀번호">
		</div>
		<div>
			<button type="button">로그인</button>
		</div>
	</form>
	<p>
		<span>간편 로그인</span>
	</p>
	<div>
		<a href="#">카카오 계정으로 로그인</a>
	</div>
	<div>
		<a href="join">회원가입</a>
		<a href="pw-search">아이디/비밀번호 찾기</a>
	</div>
</div>


<script type="text/javascript">
	$(function(){
		
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>