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


.findPw{
	width: 500px;
	height: 600px;
	margin: 200px auto;
	border: 1px solid rgb(245, 245, 245);
	
}

form {
	
	width: 400px;
	margin: 0 auto;
	
	
}

.findPw-title {
	
	font-size: var(--large-font);
	text-align: center;
	margin-top: 100px;
	font-weight: bold;
	
	

}

.email {

	width: 230px;
	heigth: 44px;
	margin-right: 20px;
	
	
}

.label-text {
	font-size: var(--middle-font);
	margin-top: 20px;

}

.line{

	display: flex;

}

.id-line{
	
	width: 800px;

}

.idcheck:hover {
   transform: none;
}

.form-control.email_confirm{
	
	width: 200px;

}

#email_check_tr .auth{
		
	margin-left : 2px;
	width: 130px;

}



.button.blue.findPw{
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
      	
      	<div class="findPw">
	      	<form method="POST" action="/house/domain/sign/editPw">
	      
		      	<p class="findPw-title">비밀번호 찾기</p>
		      		
		      		<p style="text-align: center;">가입한 아이디, 이메일을 통해 찾을 수 있습니다.</p>
      	
      				
      				<div class="label-area" id="id_check">	
			      				<label class="input-with-label">
			      		
									<p class="label-text">아이디</p>
										
										<input type="text" name="id" class="form-control email" style="margin-bottom: 20px;" placeholder="아이디 입력" required>
								</label>
									
					</div>
					
					
					<div class="label-area">	
			      			
			      				<div id="email_check_tr">
									<span class="label-text" >이메일</span>
										
										
										<div class="line id-line" style="margin-top: 20px;">
										<input type="email" name="email"  class="form-control email"  placeholder="이메일 입력" required>
										<input 
										type="button" id="send_key_btn" class="fill-button gray idcheck" value="인증 메일 보내기"
										onclick="email_authentication();" /> <span id="email_auth_msg"></span>
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
    
    	const id_input = $('#id_check input[name=id]');	
    
	    const email_input = $('#email_check_tr input[name=email]');
		const email_auth_msg = $('#email_auth_msg');
		const email_flag = $('#email_auth_pass');
    
    	
		//인증메일 보내기
		function email_authentication() {
			
			if (!email_val_check()) {
				return false;
			}

			$.ajax({
				type: 'POST',
				url: '/house/domain/user/userEmailCheck',
				data: 'id=' + id_input.val() + '&email=' + email_input.val(),
				dataType: 'json',
				success: function(confirm) {
					//-1 DB오류발생 0 입력한 아이디와 이메일 정보가 존재하는 회원 , 1 존재하지 않는 이메일 혹은 이름은 존재하나 이메일이 존재X 혹은 이메일은 존재하나 이름이 존재X
					let result = confirm.result;
					
					if (result == 1) {
						$(email_input).focus();
						email_auth_msg.css('color', 'tomato').text('등록되지 않은 정보입니다.');
					} else if (result == 0) {
						request_auth_email();
						append_auth_form();
						$('#email_auth_check_msg').css('color', 'green').text('인증 코드를 발송했습니다.');
						$('#email_check').focus();
					} else {
						console.log('DB오류');
					}
					
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}
		
		//유효성검사
		function email_val_check() {
			let email_pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			let email = email_input.val();

			if (email_pattern.test(email)) {
				return true;
			} else {
				email_input.focus();
				
				if (email_input.val() == '') {
					email_auth_msg.css('color', 'tomato').text('이메일을 입력해주세요.');
				} else {
					email_auth_msg.css('color', 'tomato').text('정확한 이메일 형식을 입력해주세요.');
					return false;	
				}
				
			}
		}

		//이메일 인증번호 전송
		let key = null;

		function request_auth_email() {
			$.ajax({
				type: 'POST',
				url: '/house/domain/emailauth/sendEmailAuth',
				data: 'email=' + email_input.val(),
				dataType: 'json',
				success: function(auth) {
					key = auth.key;
				},
				error: function(a, b, c) {
					console.log(a, b, c);
				}
			});
		}

		//이메일 인증 체크 폼 추가
		function append_auth_form() {
			let html = `<div class="label-area plusform">	
				
				<div id="email_check_tr">
				
					
					
					<div class="line id-line">
					<input type="text" id="email_check" name="email_confirm"  class="form-control email"  placeholder="인증번호 입력" required>
					<input 
					type="button" class="fill-button gray idcheck auth" value="인증"
					onclick="auth_code_check()" /><span id="email_auth_check_msg"></span>
					
					<p class="explanation"></p>
					
					</div>
				</div>`;

			$('#email_check_tr').after(html);
			toogle_email_auth_form();
		}
		
		

		//이메일 인증 체크
		function auth_code_check() {
			console.log(key);
			console.log(key == $('#email_check').val());
			if (key == $('#email_check').val()) {
				$('#email_auth_check_msg').css('color', 'green').text('이메일 인증에 성공했습니다.');
				email_auth_msg.text('');
				email_flag.val('true');
				
				append_pw_find_btn();
				
			} else {
				$('#email_auth_check_msg').css('color', 'tomato').text('이메일 인증에 실패했습니다.');
				email_flag.val('false');
			}
		}

		//인증메일 활성화 토글
		function toogle_email_auth_form() {
			let email_check_tr = $('#email_check_tr');
			let email_auth_btn = $('#send_key_btn');
			
			if (email_input.attr("disabled") == 'disabled') {
				key = null;
				$('#email_auth_msg').text('');
				//email_check_tr.next().remove();
				//email_input.css('cursor', 'auto').attr('disabled', false);
				//email_auth_btn.css('cursor', 'auto').attr('disabled', false);
				email_flag.val('false');
			} else {
				email_input.css('cursor', 'not-allowed').attr('disabled', true);
				email_auth_btn.css('cursor', 'not-allowed').attr('disabled', true);
			}
		}
		
		
		//비밀번호 찾기 버튼 추가
		function append_pw_find_btn() {
			
			
			let html = `<input 
						type="submit" 
						class="button blue findPw" 
						value="비밀번호 찾기" 
						>`;
						
						$('.plusform').after(html);
						toogle_email_auth_form();
			
			
		}
    
    
    
    
        
    </script>
</body>
</html>