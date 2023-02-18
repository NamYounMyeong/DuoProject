<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<style>
 	.verification {
 		display: none;
 	}
 	
 	.hide {
 		display: none;
 	}
 	
 	.place-bar {
    /* border: 1px solid #e6e6e6; */
    width: 100%;
    height: 8px;
    overflow: hidden;
    margin-top: 5px;
    display: flex;
    background-color: white;
	}
	
 	.place-bar > .inner {
 	 	height: 100%;
 	 	flex-direction: row;
 	 	flex-grow: 1;
 	 	border-radius: 10px;
 	 	border: 1px solid #e6e6e6;
 	}
 	 
 	.place-bar > .inner:nth-child(1) {
		background-color: skyblue;
	}
	
	.confirm-text {
		color: red;
	}
	
	
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
				<span>01</span>
				<span>아이디</span>
				<span>소유하신 이메일 정보를 입력해주세요</span>
			</div>
			<div>
				<input type="text" name="memberId" placeholder="이메일">
				<button class="request-btn" type="button">인증번호 요청</button>
				<div>
					<span class="confirm-text"></span>
				</div>
			</div>
			<div class="verification">
				<input id="verificationInput" type="text" placeholder="인증번호 입력">
				<button class="verification-btn" type="button">확인</button>
				<span></span>
			</div>
			
		</div>
		
		<!-- 비밀번호 입력 -->
		<div class="input-pw-area hide">
			<div>
				<span>02</span>
				<span>비밀번호</span>
				<span>영문 소문자/숫자/특수문자를 조합하여 8~20자로 입력해주세요</span>
			</div>
			<div>
				<input name="memberPw" type="password" placeholder="비밀번호">
			</div>
			<div>
				<input type="password" id="memberPwConfirm" placeholder="비밀번호 확인">
			</div>
		</div>
		
		<!-- 닉네임 입력 -->
		<div class="input-nick-area hide">
			<div>
				<span>03</span>
				<span>닉네임</span>
				<span>한글/영문 소문자/숫자를 사용하여 2~10자로 입력해주세요</span>
			</div>
			<div>
				<input type="text" name="memberNick" placeholder="닉네임">
			</div>
		</div>
		
		<!-- 전화번호 입력 -->
		<div class="input-phone-area hide">
			<div>
				<label>휴대폰 번호</label>
				<input type="tel" name="memberPhone">
			</div>
		</div>
		
		<!-- 생년월일 입력 -->
		<div class="input-birth-area hide">
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
		</div>
		
		<!-- 결혼예정일 입력 -->
		<div class="input-third-area hide">
			<div>
				<label>결혼예정일</label>
				<input type="date" name="memberDueDate">
			</div>
		</div>
		
		<!-- 성별 입력 -->
		<div class="input-gender-area hide">
			<div>
				<label for="memberGenderM">남자</label>
				<input id="memberGenderM" type="radio" name="memberGender" value="M">
				<label for="memberGenderF">여자</label>
				<input id="memberGenderF" type="radio" name="memberGender" value="F">
			</div>
			
			<div>
				<button type="submit">회원가입</button>
			</div>
		</div>
	</form>
	<div>
		<button type="button" class="prev-btn hide">이전</button>
		<button type="button" disabled="disabled" class="next-btn">다음</button>
	</div>
	<div>
		<a href="login">로그인 하기</a>
	</div>
</div>


<script type="text/javascript">
	$(function(){
		
		var area = $(".join-form").children();
// 		console.log(area[0]);
// 		console.log(area[1]);
// 		console.log(area[2]);
// 		console.log($(".input-id-area"));
// 		console.log($(area[1]).hasClass("hide"));
// 		console.log($(area[0]));
		//확인 완료
		
		
		
		/* 다음 버튼 */
		$(".next-btn").click(function(){
			for(var i = 0; i < area.length; i++) {			
				var nowArea = $(area[i]).hasClass("hide");
				if(nowArea == false) {
					break
					return i;
				}
			}
			//console.log(i); //확인완료
			
			if(!$(area[i]).hasClass("hide")) {				
				$(area[i]).addClass("hide");
				$(area[i+1]).removeClass("hide");
				$(".prev-btn").removeClass("hide");
				$(".place-bar > .inner:nth-child("+(i+1)+")").css("background-color","white");
				$(".place-bar > .inner:nth-child("+(i+2)+")").css("background-color","skyblue");
			}
			
			if(!$(area).last().hasClass("hide")) {
				$(this).addClass("hide");
			}
			$(this).attr("disabled",true);
		});
		
		/* 이전 버튼 */
		$(".prev-btn").click(function(){
			for(var i = 0; i < area.length; i++) {			
				var nowArea = $(area[i]).hasClass("hide");
				if(nowArea == false) {
					break
					return i;
				}
			}
			
			if(!$(area[i]).hasClass("hide")) {				
				$(area[i]).addClass("hide");
				$(area[i-1]).removeClass("hide");
				$(".place-bar > .inner:nth-child("+(i+1)+")").css("background-color","white");
				$(".place-bar > .inner:nth-child("+(i)+")").css("background-color","skyblue");
			}
			
			if(!$(area).first().hasClass("hide")) {
				$(this).addClass("hide");
			}
			$(".next-btn").attr("disabled",false);
		});
		
// 		/* 다음 버튼 */
// 		$(".next-btn").click(function(){
// 			if(!$(".input-first-area").hasClass("hide")) {				
// 				$(".input-first-area").addClass("hide");
// 				$(".input-second-area").removeClass("hide");
// 				$(".prev-btn").removeClass("hide");
// 				$(".place-bar > .inner:nth-child(1)").css("background-color","white");
// 				$(".place-bar > .inner:nth-child(2)").css("background-color","skyblue");
// 			}
// 			else if(!$(".input-second-area").hasClass("hide")) {				
// 				$(".input-second-area").addClass("hide");
// 				$(".input-third-area").removeClass("hide");
// 				$(".place-bar > .inner:nth-child(2)").css("background-color","white");
// 				$(".place-bar > .inner:nth-child(3)").css("background-color","skyblue");
// 			}
			
// 			if(!$(".input-third-area").hasClass("hide")) {
// 				$(this).addClass("hide");
// 			}
// 		});
		
// 		/* 이전 버튼 */
// 		$(".prev-btn").click(function(){
// 			if(!$(".input-second-area").hasClass("hide")) {				
// 				$(".input-second-area").addClass("hide");
// 				$(".input-first-area").removeClass("hide");
// 				$(".place-bar > .inner:nth-child(2)").css("background-color","white");
// 				$(".place-bar > .inner:nth-child(1)").css("background-color","skyblue");
// 			}
// 			else if(!$(".input-third-area").hasClass("hide")) {				
// 				$(".input-third-area").addClass("hide");
// 				$(".input-second-area").removeClass("hide");
// 				$(".next-btn").removeClass("hide");
// 				$(".place-bar > .inner:nth-child(3)").css("background-color","white");
// 				$(".place-bar > .inner:nth-child(2)").css("background-color","skyblue");
// 			}
			
// 			if(!$(".input-first-area").hasClass("hide")) {
// 				$(this).addClass("hide");
// 			}
// 		});
		
		
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
									$(".next-btn").attr("disabled",false);
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
		
		
		// 폼 전송
		var validChecking = {
				memberIdValid: false,
				verificationInputValid: false,
				memberPwValid: false,
				memberPwConfirmValid: false,
				memberNickValid: false,
				memberPhoneValid: false,
				memberBirthValid: false,
				memberDuedateValid: false,
				memberGenderValid: false,
				
				isAllValid: function () {
					return this.memberIdValid && this.verificationInputValid && this.memberPwConfirm && this.memberPwConfirmValid && this.memberNickValid
							&& this.memberPhoneValid && this.memberBirthValid && this.memberDuedateValid && this.memberGenderValid;
				}
				
		};
		
		$("[name=memberId]").on("input", function(e){
			e.preventDefault();
			var memberId = $(this).val();
				$.ajax({
					url: "${pageContext.request.contextPath}/rest/check-id",
					method: "POST",
					data: {memberId:memberId},
					success: function(resp) {
						//console.log("결과: "+resp); //확인 완료
						if(resp == "Y") {
							$("[name=memberId]").siblings("div").find(".confirm-text").text("이미 존재하는 아이디입니다.");
						}
						
					}
				});//ajax end
			//console.log(memberId); //확인 완료
			
			
			
			
		}); //아이디 검사 end
		
		
		
	});
</script>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>