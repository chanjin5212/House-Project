<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
</head>
<style>

section{

	height: 800px;

}


.result-container{

	width: 500px;
	height: 300px;
	margin: 200px auto;
	border: 1px solid rgb(245, 245, 245); 
	
}

.findid-title {
	
	font-size: var(--large-font);
	text-align: center;
	margin-top: 100px;
	font-weight: bold;
	
}	


.findid-content{

	margin-top: 40px;
	text-align: center;

} 


.findid-content span{

	font-weight: bold;

}

.button.blue.back-login,
.button.blue.back-find,
.button.blue.registerbtn{
	text-align: center;
	width: 200px;
	height: 38px;
	margin-top: 30px;
	margin-left: 38px;
	border-radius: 0.25rem;
	background-color: var(--color-blue);
	color: white;
	
}


.button.blue.back-login{
	
	width: 420px;

}




</style>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      	
      	<!-- 아이디 정보 찾았을 때 -->
      		
      	<c:if test="${not empty dto.id}">
		<form method="POST" action="/house/domain/sign/login">
      		
   		<div class="result-container">
   		
   		
   		<p class="findid-title">아이디 찾기</p>
   		
   		
   		
   		<p class="findid-content"> 회원님의 아이디는 [<span>${dto.id}</span>] 입니다. </p>
   		
   		
   		<button class="button blue back-login" onclick="location.href='/house/domain/sign/login'">로그인 화면으로 돌아가기</button> 
   		
   		
   		</div>
   			<input type="hidden" name="id" value="${dto.id}">
   			
   			<c:if test="${lv=='1'}">
   			<input type="hidden" name="check" value="user">
   			</c:if>
   			
   			<c:if test="${lv=='2'}">
   			<input type="hidden" name="check" value="broker">
   			</c:if>
   			
  		</form>
  		
   		</c:if>
  		
  		
  		
  		<!-- 등록된 정보가 없을 때 -->
  		<c:if test="${empty dto.id}">
  		
  		
  		
  		<div class="result-container">
   		
   		
   		<p class="findid-title">아이디 찾기</p>
   		
   		
   		
   		<p class="findid-content"> 등록된 정보가 없습니다. </p>
   		
   		
   		<button class="button blue back-find" onclick="location.href='/house/domain/sign/findId'">다시 찾기</button> 
   		
   		<button class="button blue registerbtn" onclick="location.href='/house/domain/user/userRegister'">회원 가입</button> 
   		
   		</div>
   		
   		
      		
      	</c:if>
      		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
       
    </script>
</body>
</html>