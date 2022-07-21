<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방 중개사</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<%-- <%@ include file="/example/inc/asset.jsp" %> --%>
<style>

	@font-face {
	  font-family: "S-CoreDream-5Medium";
	  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff")
	    format("woff");
	  font-weight: normal;
	  font-style: normal;
	}

	body{
		font-family: "S-CoreDream-5Medium";
	}
	
	#container{
		width: 700px;
	}
	
	#view {
		/* border : 1px solid black; */
		width: 700px;
		maring: 0 auto;
	}
</style>
</head>
<body>
	
	
	
		<%-- ${dto } --%>
		<div id="container">
		<h1>거절 사유 작성</h1>
		<form id="submitForm">
			<table class="table table" id="view">
				<tr>
					<td>
						<textarea style="width:300px; height: 300px;" name="refuseContent" id="refuseContent" required></textarea>
					</td>
				</tr>
				<tr>
					<td colspan = "2" style="padding-left:300px;">
					<input type="button" value="제출"  class="button blue" onclick="closeBtn();"/>
					<input type="hidden"  name="contractSeq" value="${contractSeq }"/>
					</td>
				</tr>
			</table>
		</form>
		</div>
	
	
	<script>
		
		function closeBtn(){
			
			alert($('#submitForm').serialize());
			
			
			if($('#refuseContent').val() == null || $('#refuseContent').val() == ""){
				alert('내용을 입력해주세요.');
				return;
				
			}

			$.ajax({
				type:'POST',
				url: '/house/web/brokeralarm/brokerRefuseOk',
				data: $('#submitForm').serialize(),
				dataType: 'json',
				success: function(result){
						
					
					if(result.result2){
						
						alert('작성 완료되었습니다.');
						opener.location.reload(); //부모창 새로고침
						window.close();
						
					}else {
						alert('작성 실패');
					}
					
		
						
				},
				error : function(a,b,c){
					console.log(a,b,c);
					alert('작성 실패');
				}
			});
			
			
			
			//alert();
			//opener.location.reload(); //부모창 새로고침
			//window.close();
			
		}
	
	
	
		function complete(seq){
			
			//alert();
			$.ajax({
				type:'POST',
				url: '/house/web/brokermypage/completeCounsel',
				data: 'seq=' + seq,
				dataType: 'json',
				success: function(result){
						
					alert('처리완료 되었습니다.');
					$('#state').html('처리완료');
					
					$('#comBtn').remove();
						
				},
				error : function(a,b,c){
					console.log(a,b,c);
					alert('처리 실패하였습니다.');
				}
			});
			
		}
		
	
	</script>
</body>
</html>