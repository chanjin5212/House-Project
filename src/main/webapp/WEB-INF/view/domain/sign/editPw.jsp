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


.editPw{
	width: 500px;
	height: 600px;
	margin: 200px auto;
	border: 1px solid rgb(245, 245, 245);
	
}

form {
	
	width: 400px;
	margin: 0 auto;
	
	
}

.editPw-title {
	
	font-size: var(--large-font);
	text-align: center;
	margin-top: 100px;
	font-weight: bold;
	
	

}

.label-text {
	
	text-align: left;
	font-size: var(--middle-font);
	margin-top: 20px;

}


.explanation{

	font-size: var(--min-font);

}






</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      		
      		<div class="editPw">
      		
      			<form method="POST" action="/house/domain/sign/editPwOk">
      		
      				<p class="editPw-title">비밀번호 변경</p>
      				
      					<p style="text-align: center;">변경할 비밀번호를 입력해주세요!</p>	
      					
      					
      					
      					<div class="label-area">	
			      			
			      				<div class="box">
									<span class="label-text">아이디</span>
										
										
										<div class="line id-line" style="margin-top: 20px;">
										<input type="text" name="id"  class="form-control id" value="${id}" readonly>
										
										</div>
										<p class="explanation"></p>
										
								</div>
						</div>
						
						
						<div class="label-area">	
			      			
			      				<div class="box">
									<span class="label-text">이메일</span>
										
										
										<div class="line id-line" style="margin-top: 20px;">
										<input type="email" name="email"  class="form-control id" value="${email}" readonly>
										
										</div>
										<p class="explanation"></p>
										
								</div>
						</div>
						
						
						
						<div class="label-area">	
			      			
			      				<div class="box">
									<span class="label-text">비밀번호</span>
										
										
										<div class="line id-line" style="margin-top: 20px;">
										<input type="password" name="pw"  class="form-control id" placeholder="변경할 비밀번호 입력" >
										
										</div>
										<p class="explanation">*8자 이상 15자 이하 영문,숫자를 입력해주세요</p>
										
								</div>
						</div>
						
						
						<div class="label-area">	
			      			
			      				<div class="box">
									<span class="label-text">비밀번호 확인</span>
										
										
										<div class="line id-line" style="margin-top: 20px;">
										<input type="password" name="pwCheck"  class="form-control id" placeholder="비밀번호 입력" >
										
										</div>
										<p class="explanation"></p>
										
								</div>
						</div>
      			
      			
      			</form>
      		
      		</div>
      		
      		
      		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
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