<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방 중개사</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<style>
#menu  a {
	text-decoration: none;
	font-size: var(--middle-font);
	/* color: var(--color-gray); */
	color : white;
}

#menu  a:hover {
	text-decoration: none;
	color: #68c1f8;
}

#menu ul {
	padding: 0;
	margin: 0;
	list-style: none;
}

section{
	/* border : 1px solid black; */
	width : 1200px;
	margin:0 auto;
	margin-bottom : 50px;
	/* height: 1000px; */
}

#title{
	/* border: 1px solid red; */
	padding: 30px;
	height: 70px;
	text-align : center;
	font-size: var(--large-font);
	color: #8fd0f8;
	display: table-cell; /* vertical-align:middle 적용되기 위한 조건 */
	vertical-align: middle;
	width: inherit;
	
	
}

#menu hr {
	margin: 0;
}

#main{
	display : flex;
	margin-top : 30px;

}

#menu{
	
	display: flex;
	/* margin-top: 30px; */
	
}

/* 메뉴 탭 디자인 */
#menu li > div{

	/* border : 1px solid var(--color-gray); */
	text-align: center;
	width: 150px;
	height: 50px;
	padding: 10px;
	background-color: #ccc;

}

#content {
	/* border: 1px solid black; */
	float: left;
	/* display: flex; */
	height: inherit;
	width: 1050px;
	padding-left: 300px;
	margin-bottom: 100px;
}

#content table{
	
	/* margin: 0  auto;
	margin-left: 300px; */
	/* width: 800px; */
	/* border: 1px solid black; */
	/* width: 800px; */
}

#content table th {

	padding : 25px;
	padding-right: 70px;
}

#content table td{
	/* border: 1px solid black;	 */
	font-size: var(--small-font);
	width: 500px;
	
}

#content table input[type=text]{
	color: var(--color-gray);
	padding : 5px;
	width: 250px;
	/* color : #ccc; */
}

#content table .button.blue{

	margin-left : 10px;
}

#content::after {

	content: '';
	display: block;
	clear: both;

}

#edit {
	
	/* border: 1px solid black; */
	margin: 30px 0 0 500px;
}

#searchAddr{
	
	margin-left: 0;

}

</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/brokerHeader.jsp" %>
      <section>
      		<!-- <p style="font-size: var(--large-font)">large입니다.</p>
      		<p style="font-size: var(--middle-font)">middle입니다.</p>
      		<p style="font-size: var(--small-font)">small입니다.</p>
      		<p style="font-size: var(--min-font)">min입니다.</p> -->
      		
      		<div id="title">개인정보</div>
      		<hr />
      		<div id="main">
	      		<div id="menu">
	      			<ul>
	      				<li><div style="background-color: var(--color-gray);"><a href="/house/web/brokermypage/brokerEditInfo">개인정보</a></div></li>
	      				<li><div><a href="/house/web/brokermypage/brokerSecurity">보안</a></div></li>
	      				<li><div><a href="/house/web/brokermypage/brokerDealListView">거래 목록</a></div></li>
	      				<li><div><a href="/house/web/brokermypage/brokerCounselList">상담 내역</a></div></li>
	      			</ul>
	      		</div>
	      		<div id="content">
	      			<!-- <form method="POST" action="/house/web/brokermypage/brokerEditInfoOk" id="editInfo"> -->
	      			<form id="editInfo">
	      			<table>
	      				<tr>
	      					<th>이름</th>
	      					<td>${name }</td>
	      				</tr>
	      				<tr>
	      					<th>아이디</th>
	      					<td>${auth }</td>
	      				</tr>
	      				<tr>
	      					<th>전화번호</th>
	      					<td><input type="text" value="${dto.tel }" class="form-control" name="tel" id="tel"/></td>
	      				</tr>
	      				<tr>
	      					<th>이메일</th>
	      					<td><input type="text" value="${dto.email }" class="form-control" name="email" id="email"/></td>
	      				</tr>
	      				<tr>
	      					<th>주소</th>
	      					<td style="display:flex; flex-wrap:wrap;">
	      					<input type="text" value="${dto.address }" style="width: 300px;" class="form-control" name="address" id="address"/>
	      					<input type="button" value="주소 찾기" class="button blue" id="searchAddr"/>
	      					<!-- <div style="clear:both;float:none;"></div> -->
	      					<input type="text" placeholder="상세주소" style="width: 300px;" class="form-control" name="addressDetail" id="addressDetail"/>
	      					
	      					
	      					
	      					</td>

	      				</tr>
	      				<!-- <tr>
	      					<th>중개사</th>
	      					<td><span>조은부동산</span><input type="button" value="중개사 찾기" class="button blue"/></td>
	      				</tr> -->
	      			</table>
	      			<div id="edit"><input type="button" value="수정" class="button blue" id="editbtn"/></div>
	      			</form>
	      		</div>
	      			
      		</div>
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    //주소찾기 api
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    
    	$('#searchAddr').click(function(){
    		
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	                // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	                
	                $('#address').val(data.address); //텍스트박스에 주소 넣기
	                
	                
	            }
	        }).open();
    		
    		
    	});
    	
    	
    //수정된 정보 ajax로 받아오기
	$('#editbtn').click(function(){
			
			$.ajax({
				type:'POST',
				url: '/house/web/brokermypage/brokerEditInfoOk',
				data: $('#editInfo').serialize(),
				dataType: 'json',
				success: function(result){
					
					//수정된 정보 출력
					alert('정보가 수정되었습니다.');
					
					//alert(result);
					//console.log(result.tel);
					
					$('#tel').val(result.tel);
					$('#email').val(result.email);
					$('#address').val(result.address);
					$('#addressDetail').val('');
					
					
				},
				error : function(a,b,c){
					console.log(a,b,c);
				}
			});
		});
    
    
    
    
    
  
    </script>
</body>
</html>