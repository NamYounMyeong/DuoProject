<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div>
	<div>
		<span>비밀번호 찾기</span>
	</div>
	<div>
		<span>사용중인 이메일(아이디) 인증 후 비밀번호 변경 가능합니다.</span>
	</div>
	<div>
		<input type="text" placeholder="이메일" autocomplete="off">
		<button type="button" class="cert-send">인증</button>
	</div>
	<div>
		<input type="text" placeholder="인증번호" autocomplete="off">
	</div>
	<div>
		<button type="button" class="cert-insert">입력</button>
	</div>
	<div>
		<form method="post" action="pw-search" autocomplete="off" class="pw-change-form">
			<div>
				<input type="text" name="memberPw" placeholder="비밀번호">
			</div>
			<div>
				<input type="text" class="pw-check" placeholder="비밀번호 확인">
			</div>
			<div>
				<button type="button" class="pw-change-btn">변경</button>
			</div>
		</form>
	</div>
</div>

<script type="text/javascript">
	$(function(){
		$(".pw-change-form").submit(function(e){
			e.preventDefault();
		});
	});
</script>
<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>