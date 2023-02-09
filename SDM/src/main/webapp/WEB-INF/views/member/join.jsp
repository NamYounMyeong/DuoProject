<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<div>
	<div>
		<span>회원가입</span>
	</div>
	<form method="post" action="member/join" autocomplete="off" class="join-form">
		<div>
			<span>01</span>
			<span>아이디</span>
			<span>소유하신 이메일 정보를 입력해주세요</span>
		</div>
		<div>
			<input type="text" name="memberId" placeholder="이메일">
			<button class="request-btn" type="button">인증번호 요청</button>
		</div>
		<div>
			<input type="text" placeholder="인증번호">
		</div>
		<div>
			<button type="button">입력</button>
		</div>
		
		<div>
			<span>02</span>
			<span>비밀번호</span>
			<span>영문 소문자/숫자/특수문자를 조합하여 8~20자로 입력해주세요</span>
		</div>
		<div>
			<input type="text" placeholder="비밀번호">
		</div>
		<div>
			<input type="text" placeholder="비밀번호 확인">
		</div>
		
		<div>
			<span>03</span>
			<span>닉네임</span>
			<span>한글/영문 소문자/숫자를 사용하여 2~10자로 입력해주세요</span>
		</div>
		<div>
			<input type="text" name="memberNick" placeholder="닉네임">
		</div>

		<div>
			<span>04</span>
			<span>생년월일</span>
		</div>
		<div>
			<input type="text" class="member-birth-y" placeholder="YYYY">년 
			<input type="text" class="member-birth-m" placeholder="MM">월 
			<input type="text" class="member-birth-d" placeholder="DD">일
		</div>
		
		<div>
			<button type="button">회원가입</button>
		</div>
	</form>
	<div>
		<a href="login">로그인 하기</a>
	</div>
</div>


<script type="text/javascript">
	$(function(){
		$(".request-btn").click(function(){
			
			var inputId = $("[name=memberId]").val();
			
			if(inputId.length == 0) return;
			
			$.ajax({
				url: "${pageContext.request.contextPath}/rest/member/send-email",
				method: "post",
				data: {memberId:inputId},
				success: function(){
					console.log("메일 전송 완료");
				}
			});//ajax end
		});//.request-btn click end
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>