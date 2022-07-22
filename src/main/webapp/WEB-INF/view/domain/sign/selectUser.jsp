<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ca8da1af1b5a90ad610b927d18ab748"></script>
<style>


section {

	height: 800px;

}


section > h1 {

	text-align: center;
	margin-top: 50px;
	margin-bottom: 20px;
	font-weight: bold;
	color: var(--color-blue);

}

.login-info{

	text-align: center;
	

}


.select-box{

	
	height: 600px;
	
}


.user-loginbox {


	float: left;
	width: 400px;
	height: 400px;
	margin-top: 100px;
	
	

}

.broker{
	
	
	margin-left: 300px;

}

.user-box,
.broker-box{
	
	border-radius: 0.25rem;
	text-align: center;
	background-color: var(--color-lightgray);
	height: 50px;
	font-size: var(--large-font);
}

.loginbtn-box{
	
	border-radius: 0.25rem;
	margin-top: 30px;
	background-color: var(--color-lightgray);
	text-align: center;
	height: 280px;
}



.loginbtn-box > i{
	margin-top: 30px;
	
}

.button.blue.loginbtn{
	text-align: center;
	width: 400px;
	height: 56px;
	margin-top: 30px;
	border-radius: 0.25rem;
	background-color: var(--color-blue);
	color: white;
	
}




</style>



</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      
      	
      		<h1>로그인</h1>
      		<p class="login-info">일반 회원, 중개사 중 선택하세요.</p>
      		
      		<hr>
      		<div class="select-box">
      		
      			<div class="container">
	      		<div class="user-loginbox">
	      		
	      			<div class="user-box">
	      			
	      				일반회원
	      			
	      			</div>
	      			
	      			<div class="loginbtn-box">
	      			
	      			<i class="fa-solid fa-user fa-6x"></i>
	      			
	      			<form method="POST" action="/house/domain/sign/login">
	      			
	      			<button class="button blue loginbtn" onclick="location.href='/house/domain/sign/login'">일반 회원 로그인</button>
	      			
	      			<input type="hidden" name="check" value="user">
	      			
	      			
	      			</form>
	      			</div>
	      			
	      			
	      			
	      			
	      			
	      		
	      		
	      		</div>
	      		
	      		<div class="user-loginbox broker">
	      		
	      			<div class="broker-box">
	      			
	      				중개사회원
	      			
	      			</div>
	      			
	      			<div class="loginbtn-box">
	      			
	      			<i class="fa-solid fa-building fa-6x"></i>
	      			
	      			<form method="POST" action="/house/domain/sign/login">
	      			
	      			<button class="button blue loginbtn" onclick="location.href='/house/domain/sign/login'">중개사 회원 로그인</button>
	      			
	      			<input type="hidden" name="check" value="broker">
	      			
	      			</form>
	      			</div>
	      			
	      		
	      		</div>
      		
      			</div>
      		</div>
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
       
    </script>
</body>
</html>