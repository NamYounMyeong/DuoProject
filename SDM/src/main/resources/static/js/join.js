$(function(){
		
	var validChecking = {
			memberIdValid: false,
			verificationInputValid: false,
			memberPwValid: false,
			memberPwConfirmValid: false,
			memberNickValid: false,
			memberPhoneValid: false,
			memberBirthValid: false,
			memberDueDateValid: false,
			memberGenderValid: false,
			memberPwRegex: /^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$])[a-zA-Z0-9!@#$]{8,20}$/,
            memberNickRegex: /^[a-zA-Z0-9가-힣]{2,10}$/,
            memberPhoneRegex: /^010\d{8}$/,
			
			isAllValid: function () {
				return this.memberIdValid && this.verificationInputValid && this.memberPwValid && this.memberPwConfirmValid && this.memberNickValid
						&& this.memberPhoneValid && this.memberBirthValid && this.memberDueDateValid && this.memberGenderValid;
			}
			
	};
	
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
			$(".place-bar > .inner:nth-child("+(i+2)+")").css("background-color","#81D4FA");
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
			$(".place-bar > .inner:nth-child("+(i)+")").css("background-color","#81D4FA");
		}
		
		if(!$(area).first().hasClass("hide")) {
			$(this).addClass("hide");
		}
		$(".next-btn").removeClass("hide");
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


	$("[name=memberId]").on("blur", function(){
		var memberId = $(this).val();
			$.ajax({
				url: root+"/rest/member/check-id",
				method: "POST",
				data: {memberId:memberId},
				success: function(resp) {
					//console.log("결과: "+resp); //확인 완료
					if(resp == "Y") {
						$("[name=memberId]").siblings("div").find(".confirm-text").text("이미 존재하는 아이디입니다.");
						validChecking.memberIdValid = false;
					}
					else {
						$("[name=memberId]").siblings("div").find(".confirm-text").text("");
						validChecking.memberIdValid = true;
					}
					
				}
			});//ajax end
		//console.log(memberId); //확인 완료
		
	}); //아이디 검사 end
	
	
	// 이메일 전송, 인증번호 확인
	$(".request-btn").click(function(){
		
		var inputId = $("[name=memberId]").val();
		
		if(inputId.length == 0) return;
		
		$.ajax({
			url: root+"/rest/member/send-email",
			method: "POST",
			data: {memberId:inputId},
			success: function() {
				//console.log("메일 전송 완료");
				$(".verification").css("display","block");
				
				$(".verification-btn").click(function(){
					var code = $(".verification").find("input").val();
					//console.log(code); 확인 완료
					
					$.ajax({
						url: root+"/rest/member/check-verification",
						method: "POST",
						data: {certId:inputId,certSerial:code},
						success: function(resp) {
							if(code.length != 6){
								//console.log("인증번호를 제대로 입력하세요"); 확인 완료
								$(".verification").find("span").text("인증번호를 제대로 입력하세요.").css("color","red");
								validChecking.verificationInputValid = false;
							}//if end
							else if(resp == 'Y'){
								//console.log("인증번호 일치"); 확인 완료
								$(".verification").find("span").text("인증번호 확인 완료").css("color","black");
								$(".verification").find("input").attr("readonly","true").css("background-color","gray").css("color","white");
								$("[name=memberId]").attr("readonly","true").css("background-color","gray").css("color","white");
								$(".verification-btn").css("display","none");
								$(".request-btn").css("display","none");
								$(".next-btn").attr("disabled",false);
								validChecking.verificationInputValid = true;
							}//else if end
							else {
								//console.log("인증번호가 일치하지 않습니다"); 확인 완료
								$(".verification").find("span").text("인증번호가 일치하지 않습니다.").css("color","red");
								validChecking.verificationInputValid = false;
							}//else end
						}
					});//ajax end
					
				}); //verification-btn click end
				
				
			}
		});//ajax end
	});//.request-btn click end
	
	
	$("[name=memberPw]").on("blur", function(){
		var memberPw = $(this).val();
		var regex = validChecking.memberPwRegex;
		
		if(regex.test(memberPw)) {
			$(this).siblings("div").find(".confirm-text").text("사용 가능한 비밀번호입니다.").css("color","green");
			validChecking.memberPwValid = true;
		}
		else {
			$(this).siblings("div").find(".confirm-text").text("형식에 맞지 않는 비밀번호입니다.").css("color","red");
			validChecking.memberPwValid = false;
		}
		
		if(validChecking.memberPwValid && validChecking.memberPwConfirmValid) {
			$(".next-btn").attr("disabled",false);
		}
		else {
			$(".next-btn").attr("disabled",true);
		}
		//비밀번호 일치 확인 후 비밀번호 변경을 하고 다음 단계로 넘어가지 못 하도록 함.
		
	});//비밀번호 검사 end
	
	$("#memberPwConfirm").on("input", function(){
		var memberPw = $("[name=memberPw]").val();
		var memberPwConfirm = $(this).val();
		
		if(memberPw == memberPwConfirm) {
			$(this).siblings("div").find(".confirm-text").text("비밀번호가 일치합니다.").css("color","green");
			validChecking.memberPwConfirmValid = true;
			if(validChecking.memberPwValid && validChecking.memberPwConfirmValid) {
				$(".next-btn").attr("disabled",false);
			}
		}
		else {
			$(this).siblings("div").find(".confirm-text").text("비밀번호가 일치하지 않습니다.").css("color","red");
			validChecking.memberPwConfirmValid = false;
			$(".next-btn").attr("disabled",true);
		}
	});//비밀번호 확인 end
	
	$("[name=memberNick]").on("input",function(){
		var memberNick = $("[name=memberNick]").val();
		var regex = validChecking.memberNickRegex;
		
		$.ajax({
			url: root+"/rest/member/check-nick",
			method: "POST",
			data: {memberNick:memberNick},
			success: function(resp){
				if(resp == "Y") {
					$("[name=memberNick]").siblings("div").find(".confirm-text").text("이미 존재하는 닉네임입니다.").css("color","red");
					validChecking.memberNickValid = false;
					$(".next-btn").attr("disabled",true);
				}
				else {
					if(regex.test(memberNick)) {
						$("[name=memberNick]").siblings("div").find(".confirm-text").text("사용 가능한 닉네임입니다.").css("color","green");
						validChecking.memberNickValid = true;
						$(".next-btn").attr("disabled",false);
					}
					else {
						$("[name=memberNick]").siblings("div").find(".confirm-text").text("형식에 맞지 않는 닉네임입니다.").css("color","red");
						validChecking.memberNickValid = false;
						$(".next-btn").attr("disabled",true);
					}
				}
			}
		}); //ajax end
		
	});//닉네임 확인 end
	
	//휴대폰번호 확인 memberDueDate
	$("[name=memberPhone]").on("input", function() {
		var memberPhone = $(this).val();
		var regex = validChecking.memberPhoneRegex;
		
		if(memberPhone.length == 11 && regex.test(memberPhone)) {
			$.ajax({
				url: root+"/rest/member/check-phone",
				method: "POST",
				data: {memberPhone:memberPhone},
				success: function(resp) {
					if(resp == "Y") {
						$("[name=memberPhone]").siblings("div").find(".confirm-text").text("이미 존재하는 휴대폰번호입니다.").css("color","red");
						$(".next-btn").attr("disabled",true);
						validChecking.memberPhoneValid = false;
					}
					else {
						$("[name=memberPhone]").siblings("div").find(".confirm-text").text("사용 가능한 휴대폰번호입니다.").css("color","green");
						$(".next-btn").attr("disabled",false);
						validChecking.memberPhoneValid = true;
					}
				}
			});//ajax end
		}
		else {
			$("[name=memberPhone]").siblings("div").find(".confirm-text").text("휴대폰번호 11자리를 입력해 주세요.").css("color","red");
			$(".next-btn").attr("disabled",true);
			validChecking.memberPhoneValid = false;
		}
		
	}); //휴대폰번호 확인 end
	
	//생년월일 입력
	$("[name=memberBirth]").on("input", function() {
		if($(this).val().length > 0) {
			validChecking.memberBirthValid = true;
			$(".next-btn").attr("disabled",false);
		}
		else {
			validChecking.memberBirthValid = false;
			$(".next-btn").attr("disabled",true);
		}
	}); //생년월일 입력 end
	
	//결혼예정일 입력
	$("[name=memberDueDate]").on("input", function() {
		if($(this).val().length > 0) {
			validChecking.memberDueDateValid = true;
			$(".next-btn").attr("disabled",false);
		}
		else {
			validChecking.memberDueDateValid = false;
			$(".next-btn").attr("disabled",true);
		}
	}); //결혼예정일 확인 end
	
	//성별 입력
	$("[name=memberGender]").on("input", function() {
		if($(this).attr("checked","checked").length == 1) {
			validChecking.memberGenderValid = true;
			$(".send-form-btn").attr("disabled", false);
		}
		else {
			validChecking.memberGendreValid = false;
			$(".send-form-btn").attr("disabled", true);
		}
	}); //성별 확인 end
	
	$(".join-form").submit(function(e) {
		e.preventDefault();
		
		if(validChecking.isAllValid()) {
			this.submit();
		}
		
	})//join-form submit end
	
	
	
});