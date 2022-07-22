<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<style>

section {

	height: 800px;

}

section > h1{

	text-align: center;
	font-weight: bold;
	margin-top: 100px;
	color: var(--color-blue);
}


.login{
	width: 500px;
	height: 600px;
	margin: 50px auto;
	border: 1px solid rgb(245, 245, 245);
	
}

form {
	
	width: 400px;
	margin: 0 auto;
	
	
}

.login-title {
	
	font-size: var(--large-font);
	text-align: center;
	margin-top: 100px;
	font-weight: bold;
	
	

}

.label-area {
	text-align: left;
}

.label-text {
	font-size: var(--middle-font);
	margin-top: 20px;

}
.login .form-control {
	width: 400px;
	height: 44px;

}


.findbox{

	display: flex;
	justify-content: space-between;

}


.form-check {
	margin-top: 15px;
	margin-bottom: 15px;
}

.form-check > span {
	
	font-size: var(--small-font);
}


.find-idpw{

	display: flex;
	
}

.find-idpw span {

	margin-left: 8px;
    margin-right: 8px;
    width: 1px;
    height: 18px;
    background-color: rgb(223, 223, 223);

}


.find-idpw p{

	cursor: pointer;

}


.find-idpw p,span{
	
	
	font-size: var(--min-font);
	margin-top: 17px;

}


.button.blue.loginbtn{
	text-align: center;
	width: 400px;
	height: 56px;
	margin-top: 30px;
	border-radius: 0.25rem;
	
}



</style>

</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      
      
			<c:if test="${lv=='1'}">
				<h1>일반 회원</h1>
			</c:if>
			
			<c:if test="${lv=='2'}">
				<h1>중개사 회원</h1>
				<p style="text-align: center; margin-top: 20px;">중개사 계정으로 로그인하시면, 빠방 중개사 페이지로 이동합니다!</p>
			</c:if>
			
      		<div class="login">
      			
		      		
      			<form method="POST" action="/house/domain/sign/loginOk">
	      			<p class="login-title">로그인</p>
	      			
						<div class="label-area">	
		      				<label class="input-with-label">
		      		
								<p class="label-text">아이디</p>
									
									<input type="text" name="id" class="form-control" value="${dto.id}"placeholder="아이디 입력" required>
							</label>
								
						</div>
						
						
						<div class="label-area">
							<label class="input-with-label">
							
									
									
								<p class="label-text">비밀번호</p>
									<input type="password" name="pw" class="form-control" placeholder="비밀번호 입력" required>
									
							</label>
						</div>
						
						<div class="findbox">
						
							<div class="form-check">
	 							<input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1" >
	 							<span>로그인 상태 유지</span>
							</div>
						
							<div class="find-idpw">
							
								<p onclick="location.href='/house/domain/sign/findId'">아이디찾기</p>
								<span></span>
								<p onclick="location.href='/house/domain/sign/findPw'">비밀번호찾기</p>
								
							</div>
						
						</div>
						
							
						<input type="submit" value="로그인" class="button blue loginbtn">
					
					
					
				</form>
				
			</div>
      		
      		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
       
    </script>
</body>
</html>