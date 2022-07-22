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

div#content {
	display: grid;
	place-items: center;
	/* min-height: 100vh; */
}

div#admin-box-wrapper {
	display: flex;
}

div.admin-box {
	border-radius: 8px;
	text-align: center;
	width: 240px;
	height: 200px;
	background-color: rgb(131, 205, 250);
	margin: 70px;
}

div#info {
	text-decoration: underline;
	text-decoration-color: #e2e2e2;
}


</style>
</head>
<body
	style="padding-left: 20px; padding-right: 20px; margin-left: 20px; margin-right: 20px;">
	<img src="/house/asset/images/adminlogo.png"
		style="width: 190px; height: 90px; margin: 14px; padding: 10px;"
		onclick="location.href='/house/adminmain/adminMain';" />
		<button class="button blue" style="float: right; margin-top: 20px;" onclick="location.href='/house/domain/admin/adminLogout'">로그아웃</button>
	<div id="content">
		<div id="admin-box-wrapper">
			<div class="admin-box">
				<br> <a style="color: black;"  href="../adminreport/reportList"><svg
						style="width: 20px; height: 20px;"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
                        <path
							d="M575.8 255.5C575.8 273.5 560.8 287.6 543.8 287.6H511.8L512.5 447.7C512.5 450.5 512.3 453.1 512 455.8V472C512 494.1 494.1 512 472 512H456C454.9 512 453.8 511.1 452.7 511.9C451.3 511.1 449.9 512 448.5 512H392C369.9 512 352 494.1 352 472V384C352 366.3 337.7 352 320 352H256C238.3 352 224 366.3 224 384V472C224 494.1 206.1 512 184 512H128.1C126.6 512 125.1 511.9 123.6 511.8C122.4 511.9 121.2 512 120 512H104C81.91 512 64 494.1 64 472V360C64 359.1 64.03 358.1 64.09 357.2V287.6H32.05C14.02 287.6 0 273.5 0 255.5C0 246.5 3.004 238.5 10.01 231.5L266.4 8.016C273.4 1.002 281.4 0 288.4 0C295.4 0 303.4 2.004 309.5 7.014L564.8 231.5C572.8 238.5 576.9 246.5 575.8 255.5L575.8 255.5z" />
                    </svg>허위 매물 관리 </a> <br> <br>
				<div
					style="text-decoration: underline; text-decoration-color: gray;">신고
					: ${count}건</div>
			</div>
			<div class="admin-box">
				<br> <a style="color: black;"> <svg
						style="width: 20px; height: 20px;"
						xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                        <path
							d="M336 0h-288c-26.51 0-48 21.49-48 48v416C0 490.5 21.49 512 48 512h288c26.51 0 48-21.49 48-48v-416C384 21.49 362.5 0 336 0zM192 128c35.35 0 64 28.65 64 64s-28.65 64-64 64S128 227.3 128 192S156.7 128 192 128zM288 384H96c-8.836 0-16-7.164-16-16C80 323.8 115.8 288 160 288h64c44.18 0 80 35.82 80 80C304 376.8 296.8 384 288 384z" />
                    </svg>회원 관리
				</a> <br> <br>
				<div>
					<a class="tn" style = "color:black;" href="../adminmanage/manage">일반회원&nbsp;&nbsp;<svg
							style="width: 20px; height: 20px;"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                            <path
								d="M256 0C114.6 0 0 114.6 0 256c0 141.4 114.6 256 256 256s256-114.6 256-256C512 114.6 397.4 0 256 0zM406.6 278.6l-103.1 103.1c-12.5 12.5-32.75 12.5-45.25 0s-12.5-32.75 0-45.25L306.8 288H128C110.3 288 96 273.7 96 256s14.31-32 32-32h178.8l-49.38-49.38c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l103.1 103.1C414.6 241.3 416 251.1 416 256C416 260.9 414.6 270.7 406.6 278.6z" />
                        </svg></a>
				</div>
				<br>
				<div>
					<a class="tn" style = "color:black;" href="../adminmanage/manageBroker">중개사&nbsp;&nbsp;<svg
							style="width: 20px; height: 20px;"
							xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                            <path
								d="M256 0C114.6 0 0 114.6 0 256c0 141.4 114.6 256 256 256s256-114.6 256-256C512 114.6 397.4 0 256 0zM406.6 278.6l-103.1 103.1c-12.5 12.5-32.75 12.5-45.25 0s-12.5-32.75 0-45.25L306.8 288H128C110.3 288 96 273.7 96 256s14.31-32 32-32h178.8l-49.38-49.38c-12.5-12.5-12.5-32.75 0-45.25s32.75-12.5 45.25 0l103.1 103.1C414.6 241.3 416 251.1 416 256C416 260.9 414.6 270.7 406.6 278.6z" />
                        </svg>
					</a>
				</div>
			</div>
		</div>
		<div id="info">오늘 방문자 : &nbsp;&nbsp;5명
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;오늘
			가입자:
			&nbsp;&nbsp;1명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			총 회원수 :&nbsp;&nbsp; ${cnt} 명</div>
	</div>

</body>

</html>