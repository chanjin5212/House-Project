<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain</title>
<%@include file="/WEB-INF/inc/asset.jsp"%>
<style>
body {
	font-family: "S-CoreDream-5Medium";
	font-size: 18px;
}

.logo {
	width: 240px;
	height: 100px;
	padding: 20px;
	margin: 20px;
}

div#content {
	display: grid;
	place-items: center;
}

i {
	font-size: 3rem;
	color: #ff5544;
}

div#info {
	text-decoration: underline;
	text-decoration-color: #e2e2e2;
}

div.tn {
	text-decoration: none;
	color: black;
}

.top {
	background-color: #68c1f8;
	font-family: "S-CoreDream-6Bold";
	font-size: 28px;
	height: 70px;
	padding-bottom: 10px;
	border-radius: 8px;
}

div.g-wrapper {
	position: absolute;
	right: 50px;
	top: 150px;
	display: flex;
}

di.gen {
	text-align: center;
	width: 150px;
	border: 1px solid black;
	border-radius: 8px;
	color: white;
	background-color: black;
}

div.ngen {
	v text-align: center;
	width: 150px;
}

div.gen2 {
	text-align: center;
	width: 150px;
}

div.ngen2 {
	text-align: center;
	width: 150px;
	border: 1px solid black;
	border-radius: 8px;
	color: white;
	background-color: black;
}

div.glass-svg {
	position: absolute;
	top: 194px;
	left: 152px;
}

div.input-wrapper {
	display: flex;
	margin-top: 3px;
}

div#s-wrapper {
	display: grid;
	place-items: center;
}

div#s {
	margin-top: 10px;
	width: 50%;
	background-color: #e2e2e2;
	height: 73vh;
}

div#section1 {
	margin: 20px;
	background-color: white;
}

div#section2 {
	margin: 20px;
	background-color: white;
}

div#btn-wrapper {
	margin: 10px;
	display: flex;
	place-items: center;
}
</style>
<head>
<body
	style="padding-left: 20px; padding-right: 20px; margin-left: 20px; margin-right: 20px;">
	<a href="1.html"><img src="img/logo.png" class="logo"></a>
	</div>
	<div class="top">허위 매물 관리</div>
	<div class="g-wrapper">
		<div class="gen2">신규</div>
		<div class="ngen2">전체 신고내역</div>
	</div>
	<div id="s-wrapper">
		<div id="s">
			<div id="section1">
				번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				카테고리&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				신고매물&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				신고자<br>${dto.seq}
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				${dto.buildingtype}
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				${dto.addr}
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				${dto.id}
			</div>
			<div id="section2">
				상세내용<br> <br> <br> <br>${dto.content}<br> <br>
				<br> <br> <br>
			</div>
			<div style="text-align: center;">
				<img src="webapp/files/1.jpg">
			</div>
		</div>
		<div id="btn-wrapper">
			<button type="button" class="button blue" style="margin: 3px;">처리
				완료</button>
			<button type="button" class="button blue" style="margin: 3px;">허위
				신고</button>
			<button type="button" class="button" style="margin: 3px;">돌아가기</button>
		</div>
	</div>
</body>

</html>