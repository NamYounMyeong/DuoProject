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
			<button type="button" class="login-btn">로그인</button>
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
		<a href="pw-search">비밀번호 찾기</a>
	</div>
</div>


<script type="text/javascript">
	$(function(){
		/* 로그인 시 비동기 정보 비교 */
		$('.login-btn').click(function(){
			var memberId = $('[name=memberId]').val();
			var memberPw = $('[name=memberPw]').val();
			var loginInfo = {
				memberId : memberId,
				memberPw : memberPw
			};
			$.ajax({
				url: '${pageContext.request.contextPath}/rest/member',
				method: 'post',
				contentType: 'application/json',
				data: JSON.stringify(loginInfo),
				success: function(resp){
				}
			});
		});
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>