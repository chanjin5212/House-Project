
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<style>

</style>
</head>
<body>

	<main>
	  <%@include file="/WEB-INF/inc/header.jsp" %>
		<section>
			
			<h2>삭제</h2>
					
			<form method="POST" action="/house/web/usermypage/userDelOk">
			
			<div style="margin-bottom:15px;">삭제하겠습니까?</div>
			
			<div class="btns">
				<input type="button" value="돌아가기" class="btn btn-secondary"
					onclick="location.href='/house/web/usermypage/userMyReview'">
				
						<button class="btn btn-primary">
			<i class="fas fa-pen" ></i>
			삭제하기
			</button>
			</div>
			
			<input type="hidden" name="seq" value="${seq}">
			
			</form>
		
			
		</section>
	</main>
	
	<script>
		
	</script>

</body>
</html>




















