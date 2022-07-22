<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<link rel="stylesheet" href="/house/asset/css/user/submitform/frame.css" />
<style>

	#form {
		height: 100%;
		width: 100%;
	}	
	
	.counsle_table {
		padding: 50px;
	}
	.report_category {
		display: flex;
		margin-bottom: 5px;
	}
	.report_category > div {
		margin-right: 5px;
	}
	.file-list {
		height: 200px;
	    overflow: auto;
	    border: 2px solid rgba(30, 85, 250, 0.17);
	    padding: 10px;
	}
	.right > input {
		margin-bottom: 10px;
	}
	.insert .file-list .filebox p {
	    font-size: 14px;
	    margin-top: 10px;
	    display: inline-block;
	}
	.insert .file-list .filebox .delete i{
	    color: #ff5353;
	    margin-left: 5px;
	}
	
	.hidden {
		display: none;
	}
	
	.report.right {
		width: 100%;
		height: 100%;
	}
	
	.report.right > div {
		height: 100%;
		width: 350px;
		margin-left: 40px;
	}
	
	.report.right > div > label {
		position: relative;
		width: 150px;
		height: 150px;
		margin: 10px;
		border: 1px solid var(--color-lightgray);
		border-radius: 5px;
		cursor: pointer;
	}
	.report.right > div > label > div {
		width: 100%;
		height: 100%;
		background-repeat: no-repeat;
		background-size: contain;
		background-position: center;
	}
	
	.report.right > div > label:hover {
		box-shadow: 1px 1px 1px 1px rgba(0,0,0,0.25);
	}
	
	.report.right > div > label > div > .plus {
		position: absolute; 
		font-size: 130px;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		color: rgba(0,0,0,0.3);
	}
	.report.right > div > label > div > .x {
		position: absolute;
		vertical-align: middle;
		top: 0px;
		right: 5px;
		padding: 5px;
		font-size: 25px;
		line-height: 20px;
		color: tomato;
		border: none;
		background-color: transparent;
	}
	.report.right > div > label > div > img {
		position: absolute;
		width: 150px;
		height: 150px;
		bacgkround-color: red;
	}
	
	.report.right {
		padding: 0px;
	}
</style>
</head>
<body>	
	<main class="counsel_main">
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <form action="/house/web/userReportOk" enctype="multipart/form-data" method="POST" id="form">
	      <div class="content insert">
	      	<h1>허위매물 신고하기</h1>
	      	<div class="counsle_table">
	      		<div class="report left">
	      			<h2>신속히 처리하겠습니다.</h2>
	      			<!-- db접속해서 동적추가 -->
	      			<div class="report_category">
	      				<div>신고 카테고리 : </div>
		      			<select name="category" id="category"></select>
	      			</div>
	      			<div class="sub">신고사항 입력하기<span class="length">(0/1000)</span></div>
	      			<textarea name="text" class="filed area" placeholder="메시지를 입력해주세요."></textarea>
	      			<button class="btn" type="submit">보내기</button>
	      		</div>
	      		<!-- 공통 형식은 만들어뒀으니 나중에 동적추가로 변경하자! -->
	      		<div class="report right">
	      			<h2>이미지 첨부</h2>
	      			<div class="file_list">
	      				<label for="file1">
	      					<div>
			      				<input type="file" name="file1" id="file1" class="file hidden" onchange="addImg(event);"/>
			      				<input type="button" value="x" class="hidden x" onclick="removeImg(event)"/>
			      				<span class="plus">+</span>
	      					</div>
	      				</label>
	      			</div>
	      		</div>
	      		<!-- 글번호 -->
	      		<input type="hidden" name="seq" value="${seq}"/>
	      		<input type="hidden" name="coordinateX" value="${coordinateX}" />
	      		<input type="hidden" name="coordinateY" value="${coordinateY}"/>
	      	</div>
	      </div>
      </form>
    <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>

    <script> 
    
    	//입력수 체크
	    let nowLength = 0;
		const maxLength = 1000;
		
		let filed = $('.filed');
		let showLength = $('.length');
		
		filed.on('input', function(e) {
			nowLength = filed.val().length;
			
			if(nowLength > 1000) {
				$(filed).val($(filed).val().substring(0, maxLength));
				
				let temp = '(';
	    		temp += maxLength + '/';
	    		temp += maxLength + ')'; 
				alert('최대 '+maxLength+'자까지만 입력이 가능합니다.');
	    		showLength.text(temp);
			} else {
	    		let temp = '(';
	    		temp += nowLength + '/';
	    		temp += maxLength + ')';
	    		
	    		showLength.text(temp);	
			}
			
		});
		
		//전송시 글자수 체크
    	$('#form').submit(function() {
    		let val = filed.val();
       		
       		if(val.length < 5) {
       			alert('최소 5글자 이상을 입력해주세요.');
       			return false;
       		}
    	});
    
	    //신고 카테고리 가져오기
		$(document).ready(function (){      
			getCategory();
		}); 	
		
		let category_list = document.querySelector('#category');
		let option = null;
		
		function getCategory() {
	   		$.ajax({			
					type: 'GET',
					url: '/house/web/getReportCategory',
					datatype: 'json',
					success: function(category) {	 					
						if(category.length != 0) {
							//헤더부분
							for(let i=0; i<category.length; i++) {
						    option = document.createElement('option');
						    option.value = category[i].seq;
						    option.text = category[i].name;
						    category_list.appendChild(option);				
							}
						} else {
							alert('DB오류');
						}
					},
					error: function(a,b,c) {
						console.log(a,b,c);
					}
				});		
		}
    	
    	//아이디 넘버링값
    	var id_num = 2;
		//현재파일개수
    	var now_file = 0;
    	//최대 파일개수
    	var max_file = 4;
    	//현재 파일 수용 공간
    	let file_list = $('.file_list')
    	let file_list_length = $('.file_list').children().length;
    	//파일 업로드시 view 변경
    	function addImg(e) {

    		//파일이 있다면 이미지첨부
    		if(e.target.files.length > 0) {
    			var src = URL.createObjectURL(event.target.files[0]);
    			$(e.target).parent().css('background-image', 'url('+src+')');
    			$(event.target).siblings('.x').val('x');
    			$(event.target).siblings('.x').removeClass('hidden');
    	   		$(event.target).siblings('.plus').addClass('hidden');
    	   		now_file++;
    	   		getItemLength();
    	   		
    	   		//만약 최대 파일개수를 초과하지 않았다면 태그추가후 넘버링값 증가
    	   		if(file_list_length < max_file) {
    	   			createImgArea();
    	   		}
    	   		
    		}
    	}
    	
    	//x버튼 클릭시 이미지 삭제 > 만약 이미지 공간이 2개이상일경우 공간도 같이 삭제
    	function removeImg(e) {
    		if(file_list_length > 1) {
    			//삭제 시키고
	    		$(e.target).parent().parent().remove();	 
    			//현재 아이템 수용공간과
				getItemLength();
    			//현재 파일 개수가
	    		now_file--;  
    			
    			//동일하다면 영역 추가
	    		if(now_file == file_list_length) {
		    		createImgArea();    			
	    		}
			} else {
				$(event.target).val('');
				$(e.target).parent().css('background-image', 'none');
				$(event.target).siblings('.x').addClass('hidden');
    	   		$(event.target).siblings('.plus').removeClass('hidden');
			}
    	}
    	
    	function createImgArea() {
	   		var temp = '<label for="file'+id_num+'">'
			+				'<div>'
			+					'<input type="file" name="file'+id_num+'" id="file'+id_num+'" class="file hidden" onchange="addImg(event);"/>'
			+					'<input type="button" value="x" class="hidden x" onclick="removeImg(event)"/>'
			+					'<span class="plus">+</span>'
			+				'</div>'
			+ 			'</label>';
	   		file_list.append(temp);
	   		
	   		id_num++;
    	}


    	function getItemLength() {
    		file_list_length = $('.file_list').children().length;
    	}

    </script>
</body>
</html>



















