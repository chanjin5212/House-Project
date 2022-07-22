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
</head>
<body>	
	<main class="counsel_main">
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <div class="content">
      	<h1>상담 메시지 보내기</h1>
      	<div class="counsle_table">
      		<c:if test="${empty image}">
	      		<div class="left" style="background: url(/house/asset/images/logo.png); background-repeat:no-repeat; background-position:center; background-size:contain;"></div> 		
      		</c:if>
      		<c:if test="${not empty image}">
	      		<div class="left" style="background: url(/house/files/${image}); background-repeat:no-repeat; background-position:center; background-size:cover;"></div> 		
      		</c:if>
      		<div class="right">
      			<h2>확인 후 연락드리겠습니다.</h2>
      			<div class="sub">문의사항 입력하기<span class="length">(0/1000)</span></div>
      			<textarea class="filed area" placeholder="메시지를 입력해주세요."></textarea>
      			<button class="btn">보내기</button>
      		</div>
      	</div>
      </div>
    <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>

    <script> 
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
    	
    	$('.btn').click(function() {
    		let val = filed.val();
    		
    		if(val.length < 5) {
    			alert('최소 5글자 이상을 입력해주세요.');
    			return;
    		}
    		
    		$.ajax({			
				type: 'POST',
				url: '/house/web/userCounselOk',
				data: "seq="+${seq}+"&content="+filed.val(),
				datatype: 'json',
				success: function(data) {			
					if(data.result == 1 && '${status}' == 'map') {
						alert('정상적으로 등록됐습니다.');
						location.href='/house/web/userRealEstateMap?coordinateX='+${coordinateX}+'&coordinateY='+${coordinateY};
					} else if(data.result == 1 && '${status}' == 'view') {
						alert('정상적으로 등록됐습니다.');
						location.href='/house/web/userRealEstateView?seq='+ ${seq} +'&coordinateX='+${coordinateX}+'&coordinateY='+${coordinateY};
					} else {
						alert('전송에 실패했습니다. 다시 시도해주세요.');						
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
    	});
    </script>
</body>
</html>



















