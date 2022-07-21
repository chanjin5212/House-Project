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


.button.blue.editbtn{
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
      		
      		<div class="editPw">
      		
      			<form method="POST" action="/house/domain/sign/editPwOk"
      			
      				onsubmit="return before_submit_check()">
      		
      				<p class="editPw-title">비밀번호 변경</p>
      				
      					<p style="text-align: center;">변경할 비밀번호를 입력해주세요!</p>	
      					
      					
      					
      					<div class="label-area">	
			      			
			      				<div class="box">
									<span class="label-text">회원님의 아이디</span>
										
										
										<div class="line id-line" style="margin-top: 20px;">
										<input type="text" name="id"  class="form-control id" value="${id}" readonly>
										
										</div>
										<p class="explanation"></p>
										
								</div>
						</div>
						
						
						
						<div class="label-area" id="pw_check">	
			      			
			      				<div class="box">
									<span class="label-text">비밀번호</span>
										
										
										<div class="line id-line" style="margin-top: 20px;">
										<input type="password" name="pw"  class="form-control id" placeholder="변경할 비밀번호 입력" >
										<font id="checkPw" size = "1"></font>
										</div>
										<p class="explanation">*8자 이상 15자 이하 영문,숫자를 입력해주세요</p>
										
								</div>
						</div>
						
						
						<div class="label-area" id="pwCheck_check">	
			      			
			      				<div class="box">
									<span class="label-text">비밀번호 확인</span>
										
										
										<div class="line id-line" style="margin-top: 20px;">
										<input type="password" name="pwCheck"  class="form-control id" placeholder="비밀번호 입력" >
										<font id="checkPwCheck" size = "1"></font>
										</div>
										<p class="explanation"></p>
										
								</div>
						</div>
      				
      				
      					<input type="submit" class="button blue editbtn" value="비밀번호 변경하기" > 
      			
      			</form>
      		
      		</div>
      		
      		
      		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
       
    const pw_input = $('#pw_check input[name=pw]');
	const pwCheck_input = $('#pwCheck_check input[name=pwCheck]');
    
	
    
    //비밀번호 유효성 검사
    function checkPassword() {
		
		let pwRegExp = /^[a-z0-9]{8,12}$/;
		let pw = pw_input.val();
		let pwCheck = pwCheck_input.val();
		
		//비밀번호 유효성 검사
		if(!pwRegExp.test(pw)){
			
			$("#checkPw").html('영어 및 숫자 8~12자리로 입력하세요.');
			$("#checkPw").attr('color', 'red');
			
			return false;
		}
		
	
		
		//비밀번호와 비밀번호 확인이 다르다면
		if(pw != pwCheck) {
			
			
			
			$("#checkPwCheck").html('비밀번호가 일치하지 않습니다. ');
			$("#checkPwCheck").attr('color', 'red');
		
			
			return false;
			
		}
		
		//아이디와 비밀번호가 같을 때 
		if(id == pw) {
			
			$("#checkPw").html('아이디와 비밀번호는 같을 수 없습니다.');
			$("#checkPw").attr('color', 'red');
			
			
			return false;
			
		}
		
		//모든 유효성 검사 확인 완료되었을 때 
		return true;
		
	}
    
    
    //submit 전 유효성 검사 체크하는 함수
    function before_submit_check() {

    	
		if(!checkPassword()){
			//유효성 검사 실패했을 때	
			return false;
		
		}else {

			return true;
		}
		
		
	}
    
    
    
    </script>
</body>
</html>