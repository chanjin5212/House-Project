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

section {

	height: 800px;

}


.login{
	width: 500px;
	height: 600px;
	margin: 200px auto;
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


.form-check {
	margin-top: 15px;
	margin-bottom: 15px;
}

.form-check > span {
	
	font-size: var(--small-font);
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
      		<div class="login">
      			
		      		
      			<form method="POST" action="/house/domain/sign/loginOk">
	      			<p class="login-title">로그인</p>
	      			
						<div class="label-area">	
		      				<label class="input-with-label">
		      		
								<p class="label-text">아이디</p>
									
									<input type="text" name="id" class="form-control" placeholder="아이디 입력" required>
							</label>
								
						</div>
						
						
						<div class="label-area">
							<label class="input-with-label">
							
									
									
								<p class="label-text">비밀번호</p>
									<input type="password" name="pw" class="form-control" placeholder="비밀번호 입력" required>
									
							</label>
						</div>
						
						<div class="form-check">
 							<input class="form-check-input position-static" type="checkbox" id="blankCheckbox" value="option1" >
 							<span>로그인 상태 유지</span>
						</div>
						
						
							
						<input type="submit" value="로그인" class="button blue loginbtn">
					
					
					
				</form>
				
			</div>
      		
      		
      </section>
      <footer>
      	
      </footer>
    </main>
    <script>
        $('.dropbtn').click(function(e) {
            if($('.dropdown-content').css('display') == 'block') {
            	$('.dropbtn > i').remove();
            	$('.dropbtn').append('<i class="fa-solid fa-caret-down"></i>');
                $('.dropdown-content').css('display', 'none');
            } else if($('.dropdown-content').css('display') == 'none') {
                $('.dropdown-content').css('display', 'block');
            	$('.dropbtn > i').remove();
            	$('.dropbtn').append('<i class="fa-solid fa-caret-up"></i>');
            }
        });
    </script>
</body>
</html>