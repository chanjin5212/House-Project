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
		width: 600px;
	}
	
	#view {
		/* border : 1px solid black; */
		width: 600px;
		maring: 0 auto;
	}
</style>
</head>
<body>
	
	
	
		<%-- ${dto } --%>
		<div id="container">
		<table class="table table" id="view">
			<tr>
				<th>작성자</th>
				<td>
					${dto.name } (${dto.memberId})
				</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td>${dto.tel }</td>
			</tr>
			<tr>
				<th>매물정보</th>
				<td>${dto.realestateaddr }</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td>${dto.writeDate }</td>
			</tr>
			<tr>
				<th>처리 상태</th>
				<td id="state">${dto.state }</td>
			</tr>
			<tr>
				<td colspan="2" style="height: 200px;">
				${dto.content }
				</td>
			</tr>
			<tr>
				<td colspan = "2" style="padding-left:400px; text-align: center;">
				<c:if test ="${dto.state != '처리완료' }">
				<input type="button" value="처리완료"  class="button blue" onclick="complete(${dto.seq})" id="comBtn"/>
				</c:if>
				<input type="button" value="닫기"  class="button blue" onclick="closeBtn();"/>
				
				</td>
			</tr>
		</table>
		</div>
	
	
	<script>
		
		function closeBtn(){
			
			//alert();
			opener.location.reload(); //부모창 새로고침
			window.close();
			
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
					
					//$('#comBtn').remove();
					
					opener.location.reload(); //부모창 새로고침
					window.close();
						
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