<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	/* min-height: 100vh; */
}

#admin-box-wrapper {
	display: flex;
}

.admin-box {
	text-align: center;
	width: 240px;
	height: 200px;
	background-color: #e2e2e2;
	border: 1px solid #e2e2e2;
	margin: 70px;
}

#info {
	text-decoration: underline;
	text-decoration-color: #e2e2e2;
}

div.tn {
	text-decoration: none;
	color: black;
}

div.top {
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

div.gen {
	text-align: center;
	width: 150px;
	border: 1px solid black;
	border-radius: 8px;
	color: white;
	background-color: black;
}

div.ngen {
	text-align: center;
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
	top: 220px;
	left: 210px;
}

.input-wrapper {
	display: flex;
	margin-top: 3px;
}

#s-wrapper {
	display: grid;
	place-items: center;
}

#s {
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

#btn-wrapper {
	float: right;
}
</style>
</head>
<body
	style="padding-left: 50px; padding-right: 50px; margin-left: 50px; margin-right: 50px;">
	<img src="/house/asset/images/adminlogo.png" class="logo"
		onclick="location.href='../adminmain/adminMain';">
	</a>
	</div>
	<div class="top">회원관리</div>
	<div class="g-wrapper">
		<div class="gen">일반회원</div>
		<a href="manageBroker" style="text-decoration: none; color: black">
			<div class="ngen">중개사</div>
		</a>
	</div>
	<div class="input-wrapper">
		<form>
			<select name="language"
				style="width: 100px; border: 1px solid #e2e2e2; height: 30px; border-radius: 3px;">
				<option value="none">전체</option>
				<option value="a">활동중</option>
				<option value="b">활동중지</option>
			</select>
		</form>
		<svg class="glass-svg" style="width: 20px; height: 20px;"
			xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
            <path
				d="M500.3 443.7l-119.7-119.7c27.22-40.41 40.65-90.9 33.46-144.7C401.8 87.79 326.8 13.32 235.2 1.723C99.01-15.51-15.51 99.01 1.724 235.2c11.6 91.64 86.08 166.7 177.6 178.9c53.8 7.189 104.3-6.236 144.7-33.46l119.7 119.7c15.62 15.62 40.95 15.62 56.57 0C515.9 484.7 515.9 459.3 500.3 443.7zM79.1 208c0-70.58 57.42-128 128-128s128 57.42 128 128c0 70.58-57.42 128-128 128S79.1 278.6 79.1 208z" />
        </svg>
		<div
			style="background-color: #e2e2e2; width: 40px; height: 33px; border: 1px solid #e2e2e2; border-radius: 7px;">
		</div>
		<input
			style="border: 1px solid #e2e2e2; height: 30px; border-radius: 3px;"
			type="text">
	</div>
	<table class="table">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">이름</th>
			<th scope="col">아이디</th>
			<th scope="col">생년월일</th>
			<th scope="col">주소</th>
			<th scope="col">이메일</th>
			<th scope="col">전화번호</th>
			<th scope="col">활동상태</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>${dto.name}</td>
				<td>${dto.id}</td>
				<td>${dto.ssn}</td>
				<td>${dto.email}</td>
				<td>${dto.address}</td>
				<td>${dto.tel}</td>
				<td>${dto.active} /
					<button type="button" class="btn btn-primary">정지</button>
				</td>
			</tr>
		</c:forEach>
	</table>

	<div id="btn-wrapper">
		<button type="button" class="button blue"
			onclick="location.href='../adminmain/adminMain">돌아가기</button>
	</div>

	
	<div
		style="display: flex; justify-content: center; align-items: center;">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
				</a></li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item active"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item"><a class="page-link" href="#"
					aria-label="Next"> <span aria-hidden="true">&raquo;</span>
				</a></li>
			</ul>
		</nav>
	</div>
	
	



</body>

</html>