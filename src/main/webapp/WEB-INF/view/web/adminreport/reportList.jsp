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

#content {
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

.tn {
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

.g-wrapper {
	position: absolute;
	right: 50px;
	top: 150px;
	display: flex;
}

.gen {
	text-align: center;
	width: 150px;
	border: 1px solid black;
	border-radius: 8px;
	color: white;
	background-color: black;
}

.ngen {
	text-align: center;
	width: 150px;
}

.gen2 {
	text-align: center;
	width: 150px;
}

.ngen2 {
	text-align: center;
	width: 150px;
	border: 1px solid black;
	border-radius: 8px;
	color: white;
	background-color: black;
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

#section1 {
	margin: 20px;
	background-color: white;
}

#section2 {
	margin: 20px;
	background-color: white;
}

#btn-wrapper {
	margin: 10px;
	display: flex;
	place-items: center;
}

#btn-wrapper {
	float: right;
}

div.table {
	width: 100%;
	margin-bottom: 1rem;
	color: #212529;
	margin-left: 50px;
}
</style>
</head>
<body
	style="padding-left: 50px; padding-right: 50px; margin-left: 50px; margin-right: 50px;">
	<img src="/house/asset/images/adminlogo.png" class="logo"
		onclick="location.href='../adminmain/adminMain';">
	</a>
	</div>
	<div class="top">허위 매물 관리</div>
	<div class="g-wrapper">
		<a href="reportListNew" style="text-decoration: none; color: black">
			<div class="ngen">신규</div>
		</a>
		<div class="gen">전체 신고내역</div>

	</div>

	<table class="table">
		<tr>
			<th scope="col">번호</th>
			<th scope="col">카테고리</th>
			<th scope="col">신고매물</th>
			<th scope="col">신고자</th>
			<th scope="col">상태</th>
		</tr>
		<c:forEach items="${list}" var="dto">
			<tr>
				<td>${dto.seq}</td>
				<td>${dto.buildingtype}</td>
				<td><a href="allowReport?seq=${dto.getSeq}">${dto.addr}</a>></td>
				<td>${dto.id}</td>
				<td>${dto.state}</td>

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