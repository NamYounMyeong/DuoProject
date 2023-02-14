<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
 	.verification {
 		display: none;
 	}
</style>

<div>
	<div>
		<span>회원가입</span>
	</div>
	<form method="post" action="join" autocomplete="off" class="join-form">
		<div>
			<span>01</span>
			<span>아이디</span>
			<span>소유하신 이메일 정보를 입력해주세요</span>
		</div>
		<div>
			<input type="text" name="memberId" placeholder="이메일">
			<button class="request-btn" type="button">인증번호 요청</button>
		</div>
		<div class="verification">
			<input type="text" placeholder="인증번호 입력">
			<button class="verification-btn" type="button">확인</button>
			<span></span>
		</div>
		
		<div>
			<span>02</span>
			<span>비밀번호</span>
			<span>영문 소문자/숫자/특수문자를 조합하여 8~20자로 입력해주세요</span>
		</div>
		<div>
			<input name="memberPw" type="password" placeholder="비밀번호">
		</div>
		<div>
			<input type="password" placeholder="비밀번호 확인">
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
			<label>휴대폰 번호</label>
			<input type="tel" name="memberPhone">
		</div>
		<div>
			<label>결혼예정일</label>
			<input type="date" name="memberDueDate">
		</div>

		<div>
			<span>04</span>
			<span>생년월일</span>
		</div>
		<div>
			<input type="date" name="memberBirth">
<!-- 			<input type="text" class="member-birth-y" placeholder="YYYY">년  -->
<!-- 			<input type="text" class="member-birth-m" placeholder="MM">월  -->
<!-- 			<input type="text" class="member-birth-d" placeholder="DD">일 -->
		</div>
		<div>
			<label for="memberGenderM">남자</label>
			<input id="memberGenderM" type="radio" name="memberGender" value="M">
			<label for="memberGenderF">여자</label>
			<input id="memberGenderF" type="radio" name="memberGender" value="F">
		</div>
		
		<div>
			<button type="submit">회원가입</button>
		</div>
	</form>
	<div>
		<a href="login">로그인 하기</a>
	</div>
</div>


<script type="text/javascript">
	$(function(){
		
		// 이메일 전송, 인증번호 확인
		$(".request-btn").click(function(){
			
			var inputId = $("[name=memberId]").val();
			
			if(inputId.length == 0) return;
			
			$.ajax({
				url: "${pageContext.request.contextPath}/rest/send-email",
				method: "POST",
				data: {memberId:inputId},
				success: function() {
					console.log("메일 전송 완료");
					$(".verification").css("display","block");
					
					$(".verification-btn").click(function(){
						var code = $(".verification").find("input").val();
						//console.log(code); 확인 완료
						
						$.ajax({
							url: "${pageContext.request.contextPath}/rest/check-verification",
							method: "POST",
							data: {certId:inputId,certSerial:code},
							success: function(resp) {
								if(code.length < 6){
									//console.log("인증번호를 제대로 입력하세요"); 확인 완료
									$(".verification").find("span").text("인증번호를 제대로 입력하세요.").css("color","red");
								}//if end
								else if(resp == 'Y'){
									//console.log("인증번호 일치"); 확인 완료
									$(".verification").find("span").text("인증번호 확인 완료").css("color","black");
									$(".verification").find("input").attr("readonly","true").css("background-color","gray").css("color","white");
									$(".verification-btn").css("display","none");
								}//else if end
								else {
									//console.log("인증번호가 일치하지 않습니다"); 확인 완료
									$(".verification").find("span").text("인증번호가 일치하지 않습니다.").css("color","red");
								}//else end
							}
						});//ajax end
						
					}); //verification-btn click end
					
					
				}
			});//ajax end
		});//.request-btn click end
		
		
		
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>