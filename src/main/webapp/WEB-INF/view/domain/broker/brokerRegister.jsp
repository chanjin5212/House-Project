<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<%@include file="/WEB-INF/inc/asset.jsp"%>
</head>
<style>
section {
	height: 3000px;
}

section>h1 {
	text-align: center;
	font-weight: bold;
	margin-top: 100px;
	color: var(--color-blue);
}

.register-container {
	width: 900px;
	height: 2000px;
	margin: 50px auto;
	border: 1px solid rgb(245, 245, 245);
	text-align: center;
}

.icon_box {
	display: flex;
	margin-top: 50px;
	margin-left: 100px;
	margin-bottom: 50px;
}

.icon {
	width: 150px;
}

.icon-info {
	margin-top: 20px;
}

.icon .fa-clipboard-check {
	color: var(--color-gray);
}

.icon .fa-arrow-right {
	margin-top: 45px;
}


#sign_up_form {
	
	width: 400px;
	margin: 0 auto;
	
	
}


.register-title {
	
	font-size: var(--large-font);
	text-align: center;
	margin-top: 50px;
	font-weight: bold;
	
	

}


.label-area {
	text-align: left;

}

.label-text {
	
	text-align: left;
	font-size: var(--middle-font);
	margin-top: 20px;

}

.register-container .form-control {

	width: 400px;
	heigth: 44px;
	
}

.id {

	margin-right: 20px;

}

.idcheck:hover {
   transform: none;
}


.register-container .email {

	width: 400px;
	heigth: 44px;
	margin-right: 20px;
	
	
}

.explanation{

	font-size: var(--min-font);

}

.line{

	display: flex;

}

.id-line{
	
	width: 800px;

}


.button.blue.registerbtn{
	text-align: center;
	width: 400px;
	height: 56px;
	margin-top: 30px;
	border-radius: 0.25rem;
	
}


.form-control.email_confirm{
	
	width: 200px;

}

#email_check_tr .auth{
		
	margin-left : 15px;
	margin-right : 15px;
}

#image_container > img {
	width: 100px;
	height: 100px;
}
</style>



<body>
	<main>
		<%@include file="/WEB-INF/inc/header.jsp"%>
		<section>

			<h1>중개사 회원가입</h1>

			<div class="register-container">

				<div class="icon_box">

					<div class="icon">
						<i class="fa-solid fa-magnifying-glass fa-6x"></i>
						<p class="icon-info">중개사무소 조회</p>

					</div>


					<div class="icon">
						<i class="fa-solid fa-arrow-right fa-3x"></i>
					</div>

					<div class="icon">
						<i class="fa-solid fa-clipboard-user fa-6x"></i>
						<p class="icon-info">회원 정보 등록</p>

					</div>

					<div class="icon">
						<i class="fa-solid fa-arrow-right fa-3x"></i>
					</div>

					<div class="icon">
						<i class="fa-solid fa-clipboard-check fa-6x"></i>
						<p class="icon-info">가입 완료</p>

					</div>


				</div>
				<form name="form" action="/house/domain/broker/brokerRegisterOk"
					method="POST" id="sign_up_form"
					onsubmit="return before_submit_check()" enctype="multipart/form-data">
					<!-- form안의 모든 hidden타입의 input value가 true가 되어야 brokerRegisterOk로 넘어감. -->
					<input type="hidden" id="email_auth_pass" value="false" /> <input
						type="hidden" id="id_auth_pass" value="false" />
					
					<p class="register-title">중개사무소 정보 입력</p>
					<div>국가공간정보포털의 부동산중개업 정보에 등록된 대표 공인중개사만 회원가입이 가능합니다.</div>
					
					<div class="label-area">


						<span class="label-text">중개업소명</span>

						<div class="line id-line">
							<input type="text" name="firmName" id="firmName" class="form-control id"
								placeholder="중개업소명 입력" value="${dto.firmName}" required> <input type="button"
								id="brokerbtn" value="중개업소명 조회" class="fill-button gray idcheck">
							

						</div>
						<p class="explanation"></p>
						
						
						<p id="result"></p>

					</div>
					
				
					<div class="label-area">


						<span class="label-text">중개등록번호</span>

						<div class="line id-line">
							<input type="text" name="firmNum" id="firmNum" class="form-control id"
								placeholder="중개등록번호 입력" value="${dto.firmNum}" required> 
							
						</div>
						<p class="explanation"></p>


					</div>
					
					<div class="label-area">


						<span class="label-text">중개업소 주소</span>

						<div class="line id-line">
							<input type="text" name="firmAddress" id="firmAddress" class="form-control id"
								placeholder="중개업소주소 입력" value="${dto.firmAddress}" required> 
							
						</div>
						<p class="explanation"></p>


					</div>
					
					<div class="label-area">


						<span class="label-text">사업자 대표명</span>

						<div class="line id-line">
							<input type="text" name="representName" id="representName" class="form-control id"
								placeholder="사업자 대표명 입력" value="${dto.representName}" required> 
							
						</div>
						<p class="explanation"></p>


					</div>
					
					<div class="label-area">


						<span class="label-text">유선전화번호</span>

						<div class="line id-line">
							<input type="text" name="firmTel" id="firmTel" class="form-control id"
								pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
								maxlength="12"
								placeholder="유선전화번호 입력" required> 
							
						</div>
						<p class="explanation"></p>


					</div>
					
					<div class="label-area">


						<span class="label-text">사업자등록번호</span>

						<div class="line id-line">
							<input type="text" name="corporateNum1" style="width: 110px; "class="form-control" required> 
							<input type="text" name="corporateNum2" style="width: 110px; margin-left: 35px;"class="form-control" required> 
							<input type="text" name="corporateNum3" style="width: 110px; margin-left: 35px;"class="form-control" required> 
							
							
							
						</div>
						<p class="explanation"></p>


					</div>
					
					
					<hr>
					<p class="register-title">회원정보 입력</p>
					<div class="label-area" id="id_check">


						<span class="label-text">아이디</span>

						<div class="line id-line">
							<input type="text" name="id" id="id" class="form-control id"
								placeholder="아이디 입력" required> <input type="button"
								id="idbtn" value="중복 검사" class="fill-button gray idcheck">
							<font id="checkId" size="1"></font>

						</div>
						<p class="explanation">*5자 이상 10자 이하 영문,숫자를 입력해주세요</p>


					</div>


					<div class="label-area" id="pw_check">


						<span class="label-text">비밀번호</span>

						<div class="line id-line">
							<input type="password" name="pw" class="form-control"
								placeholder="비밀번호 입력" required> <font id="checkPw"
								size="1"></font>
						</div>

						<p class="explanation">*8자 이상 15자 이하 영문,숫자를 입력해주세요</p>

					</div>




					<div class="label-area" id="pwCheck_check">


						<span class="label-text">비밀번호 확인</span>
						<div class="line id-line">
							<input type="password" name="pwCheck" class="form-control"
								placeholder="비밀번호 확인 입력" required> <font
								id="checkPwCheck" size="1"></font>
						</div>

						<p class="explanation"></p>

					</div>

					<div class="label-area" id="name_check">


						<span class="label-text">이름</span>
						<div class="line id-line">
							<input type="text" name="name" class="form-control"
								placeholder="이름 입력" required> <font id="checkName"
								size="1"></font>
						</div>

						<p class="explanation"></p>

					</div>

					<div class="label-area">

						<div id="email_check_tr">
							<span class="label-text">이메일</span>


							<div class="line id-line">
								<input type="email" name="email" class="form-control email"
									placeholder="이메일 입력" required> <input type="button"
									id="send_key_btn" class="fill-button gray idcheck"
									value="인증 메일 보내기" onclick="email_authentication();" /> <span
									id="email_auth_msg"></span>
							</div>
							<p class="explanation"></p>

						</div>
					</div>

					<div class="label-area" id="ssn_check">

						<span class="label-text">주민번호</span>

						<div class="line id-line">
							<input type="text" id="ssnInput" name="ssn" class="form-control"
								placeholder="주민번호 입력" maxlength="14" required> <font
								id="checkSsn" size="1"></font>
						</div>
						<p class="explanation">*숫자만 입력하세요.</p>
					</div>


					<div class="label-area" id="address_check">

						<span class="label-text">주소</span>

						<div class="line id-line">
							<input type="text" id="address" name="address"
								class="form-control email" placeholder="주소 입력" required>
							<input type="button" onclick="daumPostcode()"
								class="fill-button gray idcheck" value="주소 검색"><br>
						</div>
						<p class="explanation"></p>
						<input type="text" id="addressPlus" name="addressPlus"
							class="form-control" placeholder="상세 주소 입력" required>
						<p class="explanation">*주소 검색 후 상세 주소를 입력하세요.</p>


						<div id="map"
							style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
						<p class="explanation"></p>
					</div>


					<div class="label-area" id="tel_check">

						<span class="label-text">전화번호</span>

						<div class="line id-line">
							<input type="text" name="tel" id="telInput" class="form-control"
								pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" placeholder="전화번호 입력"
								maxlength="13" required> <font id="checkTel" size="1"></font>
						</div>
						<p class="explanation">*숫자만 입력하세요.</p>
					</div>
					
					
					
					
					<div class="label-area" style="margin-bottom: 20px;">
						<span class="label-text">중개사 프로필 이미지</span>
		               <div id="image_container"></div>
		               <div><input type="file" name="profileImg" class="form-control" onchange="setThumbnail(event, 1);"></div>
		               <div id="filelist"></div>
		               
		            </div>

					<div class="btns">
						<input type="submit" class="button blue registerbtn" value="회원가입">

					</div>
				</form>

			</div>
		</section>
		<%@include file="/WEB-INF/inc/footer.jsp"%>
	</main>
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4ca8da1af1b5a90ad610b927d18ab748&libraries=services"></script>
	<script>
	
		const id_input = $('#id_check input[name=id]');
		const pw_input = $('#pw_check input[name=pw]');
		const pwCheck_input = $('#pwCheck_check input[name=pwCheck]');
		const name_input = $('#name_check input[name=name]');
		const ssn_input = $('#ssn_check input[name=ssn]');
		
		
		const email_input = $('#email_check_tr input[name=email]');
		const email_auth_msg = $('#email_auth_msg');
		const email_flag = $('#email_auth_pass');
		
		const id_flag = $('#id_auth_pass');

		//input태그에서 엔터칠시 submit 막기
		email_input.keydown(function(event) {
			if(event.keyCode === 13) {
				event.preventDefault();
			}
		});
		
		
		//ID 중복검사 + 유효성 검사
		$('#idbtn').click(function(){
		
			
			$.ajax({
			
				type: 'POST',
				url: '/house/domain/user/idDuplicateCheck',
				data: 'id=' +  $('#id').val(),
				dataType: 'json',
				success: function(confirm){
					
					let result = confirm.result;
					
					
						//아이디 유효성 검사
						let idRegExp = /^[a-z0-9]{5,10}$/;  
						let id = id_input.val();
					
					if((result == 0) || (!idRegExp.test(id))) {
						$("#checkId").html('사용할 수 없는 아이디입니다.');
						$("#checkId").attr('color', 'red');
						
						
						form.id.value="";
						form.id.focus();
						id_flag.val('false');
						
					}else if((result == 1) && (idRegExp.test(id))) {
						$("#checkId").html('사용할 수 있는 아이디입니다.');
						$("#checkId").attr('color', 'green');
						
						$("#idbtn").attr('disabled', true);
						$("#idbtn").css('background-color', 'var(--color-lightgray)');
						$("#id").attr('readonly', true);
						id_flag.val('true');
					}
					
				},
				
				error: function() {
					alert("서버요청 실패");
					
				}
				
			});
			
			
		});
		
		

		//인증메일 보내기
		function email_authentication() {
			
			if (!email_val_check()) {
				return false;
			}

			$.ajax({
				type: 'POST',
				url: '/house/domain/user/userEmailDuplicateCheck',
				data: 'email=' + email_input.val(),
				dataType: 'json',
				success: function(confirm) {
					//-1 DB오류발생 0 사용가능, 1 중복 사용불가능
					let result = confirm.result;
					
					if (result == 1) {
						$(email_input).focus();
						email_auth_msg.css('color', 'tomato').text('이미 사용중인 이메일입니다.');
					} else if (result == 0) {
						request_auth_email();
						append_auth_form();
						email_auth_msg.text('');
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
			let html = `<div class="label-area">	
				
				<div id="email_check_tr">
				
					
					
					<div class="line id-line">
					<input type="text" id="email_check" name="email_confirm"  class="form-control email_confirm"  placeholder="인증번호 입력" required>
					<input 
					type="button" class="fill-button gray idcheck auth" value="인증"
					onclick="auth_code_check()" />
					<input 
					type="button" class="fill-button gray idcheck" value="초기화"
					onclick="toogle_email_auth_form()" /><span id="email_auth_check_msg"></span>
					</div>
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
				email_check_tr.next().remove();
				email_input.css('cursor', 'auto').attr('disabled', false);
				email_auth_btn.css('cursor', 'auto').attr('disabled', false);
				email_flag.val('false');
			} else {
				email_input.css('cursor', 'not-allowed').attr('disabled', true);
				email_auth_btn.css('cursor', 'not-allowed').attr('disabled', true);
			}
		}
		
		//모든 인증 요소
		function before_submit_check() {
			
			
			
			
			//전송시 로그인 폼 flag true시 submit됨
			
			if(id_flag.val()!='true'){
				$("#checkId").html('아이디 중복확인을 완료해주세요.');
				$("#checkId").attr('color', 'red');
				return false;
			}
			
			if(!checkPassword()){
				return false;
			}else if(!checkName()){
				return false;
			}else if(!checkSsn()){
				return false;
			}
			
			//이메일 확인
			let check_flag = false;
		
			//이메일 인증이 완료되지 않았을경우
			if (email_flag.val() != 'true') {
				email_auth_msg.css('color', 'tomato').text('이메일 인증을 완료해주세요.');
				return false;
				//check_flag가 true라면 이전 인증 및 입력은 완료된 상태므로 해당 태그에 focus
				if (check_flag == true) {
					if($('#email_check').length == 0) {
						email_input.focus();
					} else if ($('#email_check').length > 0) {
						$('#email_check').focus();
					}
				} 
			//이메일 인증이 완료됐을 경우
			} else {
				check_flag = true;
			}
			
			
			check_flag = true;
			
			
			
	
			//disabled된 input value는 form으로 넘어가지 않는다.
			if(check_flag == true) {
				email_input.attr('disabled', false);	
				return check_flag;
			}
			
			//모든 인증이 끝나지 않았을 경우 submit 막기
			return false;
		}
		
		
		
		//비밀번호 유효성 검사
		function checkPassword() {
			
			let pwRegExp = /^[a-z0-9]{8,12}$/;
			let pw = pw_input.val();
			let pwCheck = pwCheck_input.val();
			let id = id_input.val();
			
			
			//비밀번호 유효성 검사
			if(!pwRegExp.test(pw)){
				
				$("#checkPw").html('숫자 8~12자리로 입력하세요.');
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
			
			
			$("#checkPw").html('');
			$("#checkPwCheck").html('');
			return true;
			
		}
		
		
		//이름 유효성 검사
		function checkName() {
			
			let nameRegExp = /^[가-힣]{2,4}$/; 
			let name = name_input.val();
			
			if(!nameRegExp.test(name)) {
				$("#checkName").html('이름이 올바르지 않습니다.');
				$("#checkName").attr('color', 'red');
				
				return false;
			}
			
			
			
			$("#checkName").html('');
			return true;
			
		}
		
		
		//주민번호 유효성 검사
		function checkSsn() {
			
			let ssn = ssn_input.val();
			
		 	if(ssn.length!=14) {
				
				$("#checkSsn").html("잘못된 주민번호입니다.");
				$("#checkSsn").attr('color', 'red');
				
				
				
				let indexOf = ssn.indexOf('-');
				if((indexOf == -1) || (indexOf != 7)){
					
					$("#checkSsn").html("-(하이픈) 를 올바른 위치에 포함하여 작성하여야 합니다.");
					$("#checkSsn").attr('color', 'red');
					
					return false;
					
				}
				
			}
		 	
		 	$("#checkSsn").html("");
		 	return true;
			
			
		}
		
		//주민번호 '-' 자동입력
		function autoHypenSsn(str) {
		  str = str.replace(/[^0-9]/g, '');
		  var tmp = '';
	
		  
		  if(str.length < 6){
		  
			  return str;
		  }
		  else {
		  tmp += str.substr(0,6);
		  tmp += '-';
		  tmp += str.substr(6);
		  return tmp;
		  }
		
		  return str;
		  
		}
		
			//전화번호 '-' 자동입력
			function autoHypenTel(str) {
			  str = str.replace(/[^0-9]/g, '');
			  var tmp = '';

			  if (str.substring(0, 2) == 02) {
			    // 서울 전화번호일 경우 10자리까지만 나타나고 그 이상의 자리수는 자동삭제
			    if (str.length < 3) {
			      return str;
			    } else if (str.length < 6) {
			      tmp += str.substr(0, 2);
			      tmp += '-';
			      tmp += str.substr(2);
			      return tmp;
			    } else if (str.length < 10) {
			      tmp += str.substr(0, 2);
			      tmp += '-';
			      tmp += str.substr(2, 3);
			      tmp += '-';
			      tmp += str.substr(5);
			      return tmp;
			    } else {
			      tmp += str.substr(0, 2);
			      tmp += '-';
			      tmp += str.substr(2, 4);
			      tmp += '-';
			      tmp += str.substr(6, 4);
			      return tmp;
			    }
			  } else {
			    // 핸드폰 및 다른 지역 전화번호 일 경우
			    if (str.length < 4) {
			      return str;
			    } else if (str.length < 7) {
			      tmp += str.substr(0, 3);
			      tmp += '-';
			      tmp += str.substr(3);
			      return tmp;
			    } else if (str.length < 11) {
			      tmp += str.substr(0, 3);
			      tmp += '-';
			      tmp += str.substr(3, 3);
			      tmp += '-';
			      tmp += str.substr(6);
			      return tmp;
			    } else {
			      tmp += str.substr(0, 3);
			      tmp += '-';
			      tmp += str.substr(3, 4);
			      tmp += '-';
			      tmp += str.substr(7);
			      return tmp;
			    }
			  }

			  return str;
			}
		
			
			
		
		
		
		//주민번호 입력될 때마다 호출됨.
		$('#ssnInput').keyup(function (event) {
			  event = event || window.event;
			  var _val = this.value.trim();
			  this.value = autoHypenSsn(_val);
		});
		
		//전화번호 입력될 때마다 호출됨.
		$('#telInput').keyup(function (event) {
			  event = event || window.event;
			  var _val = this.value.trim();
			  this.value = autoHypenTel(_val);
		});
		
		//전화번호 입력될 때마다 호출됨.
		$('#firmTel').keyup(function (event) {
			  event = event || window.event;
			  var _val = this.value.trim();
			  this.value = autoHypenTel(_val);
		});
		
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

	    //지도를 미리 생성
	    var map = new daum.maps.Map(mapContainer, mapOption);
	    //주소-좌표 변환 객체를 생성
	    var geocoder = new daum.maps.services.Geocoder();
	    //마커를 미리 생성
	    var marker = new daum.maps.Marker({
	        position: new daum.maps.LatLng(37.537187, 127.005476),
	        map: map
	    });
		
		//주소 api 사용
	    function daumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                var addr = data.address; // 최종 주소 변수

	                // 주소 정보를 해당 필드에 넣는다.
	                document.getElementById("address").value = addr;
	                // 주소로 상세 정보를 검색
	                geocoder.addressSearch(data.address, function(results, status) {
	                    // 정상적으로 검색이 완료됐으면
	          	           if (status === daum.maps.services.Status.OK) {

	                        var result = results[0]; //첫번째 결과의 값을 활용

	                        // 해당 주소에 대한 좌표를 받아서
	                        var coords = new daum.maps.LatLng(result.y, result.x);
	                        
	                        console.log(result.y);
	                        console.log(result.x);
	                        
	                        
	                        const x = `<input type="hidden" value="\${result.y}" name="x">`;
                            const y = `<input type="hidden" value="\${result.x}" name="y">`;
                            $('#sign_up_form').append(x);
                            $('#sign_up_form').append(y);

	                        
	                        
	                        
	                        // 지도를 보여준다.
	                        mapContainer.style.display = "block";
	                        map.relayout();
	                        // 지도 중심을 변경한다.
	                        map.setCenter(coords);
	                        // 마커를 결과값으로 받은 위치로 옮긴다.
	                        marker.setPosition(coords)
	                    } 
	                });
	            }
	        }).open();
	        
	        
	    }
		
		
	   
	       function setThumbnail(event, num) {
	           var reader = new FileReader();
	         if (document.getElementById("img"+num)){
	            document.getElementById("img"+num).remove();
	         }
	           reader.onload = function(event) {
	             var img = document.createElement("img");
	             img.setAttribute("src", event.target.result);
	             img.setAttribute("id", "img" + num);
	             document.querySelector("div#image_container").appendChild(img);
	           };
	   
	           reader.readAsDataURL(event.target.files[0]);
	         }

	    
	       String.format = function() {
	           var theString = arguments[0];
	           for (var i = 1; i < arguments.length; i++) {
	               var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
	               theString = theString.replace(regEx, arguments[i]);
	           }
	           
	           return theString;
	       }
	    
	       let no = 2;
	       
	       
	       $(document).ready(function() {
	    	   
	    	   
	    	   $("#brokerbtn").click(function(){
	    		   
			    	  window.open("/house/domain/broker/brokerSearch", "중개사무소 조회",  "location=no, scrollbars=yes, top=400px, left=100px, width= 500px, height= 600px");
			    	   
			    	   
			       })
	    	   })
	    	   
	    	   
	    	   
	      
	       
	       
	       

	</script>

</body>
</html>