<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${pageContext.request.contextPath}/image/diamond.png" rel="shortcut icon" type="image/x-icon">
<title>Mærry We</title>

<!-- 글꼴 Noto Sans Korean -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<!-- css 파일 -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/commons.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">

<!-- 폰트어썸 -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"/>

<!-- jQuery -->
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<!-- 배포 시 min 버전으로 -->
<!-- <script src="//code.jquery.com/jquery-3.6.1.min.js"></script> -->

<!-- 상대 경로 설정을 위한 변수 선언 -->
<script>
	var root = "${pageContext.request.contextPath}";
</script>

<style type="text/css">
	
</style>

</head>
<body>
	<div class="nav">
		<div class="logo-box">
			<img alt="로고 이미지" src="${pageContext.request.contextPath}/image/diamond.png">
			<img alt="로고 이미지" src="${pageContext.request.contextPath}/image/logo-text.png">
		</div>
		<div>
			<input type="text" placeholder="검색">
		</div>
		<div>
			<a href="${pageContext.request.contextPath}/member/login">로그인</a>
		</div>
	</div>


	<div class="container-1208">