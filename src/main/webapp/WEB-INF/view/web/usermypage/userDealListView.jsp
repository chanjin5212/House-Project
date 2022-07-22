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

ul {
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
	padding: 10px;
	height: 50px;
	text-align : center;
	font-size: var(--large-font);
	color: #8fd0f8;
	display: table-cell; /* vertical-align:middle 적용되기 위한 조건 */
	vertical-align: middle;
	width: inherit;
	
	
}

hr {
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
	padding : 25px;
	margin-bottom: 100px;
	/* padding-left: 300px; */
}

#content h1{
	/* border: 1px solid black; */
	font-size: var(--large-font); 
	
}
div#content{
padding-top: 0px;


}


#submitpw{
	text-align: center;
	width: 400px;
	height: 56px;
	margin-top: 30px;
	border-radius: 0.25rem;
	
}

#pw input {
	width: 400px;
	height: 56px;
	margin-top: 30px;
	border-radius: 0.25rem;
}

#dealList th{
	
	text-align: center;

}

#dealList td{
	
	text-align: center;

}

#searchDiv{
	/* margin-top : 100px; */
	margin-left: 570px;
	margin-top: 50px;
}

#search td{

}
.explain {
	
	font-size: var(--small-font);
	text-align: center;
	/*margin-top: 100px;*/
    padding: 30px;
	height: 40px;
	

}


</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
   <section>
      		<!-- <p style="font-size: var(--large-font)">large입니다.</p>
      		<p style="font-size: var(--middle-font)">middle입니다.</p>
      		<p style="font-size: var(--small-font)">small입니다.</p>
      		<p style="font-size: var(--min-font)">min입니다.</p> -->
      		
      		<div id="title">거래 목록</div>
      		
      		<p class="explain">회원님께서 거래한 매물 목록입니다.</p>
      		
      		<div id="main">
	      		<div id="menu">
	      			<ul>
	      				<li><div><a href="/house/web/usermypage/userEditInfo">내 정보</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userSecurity">보안</a></div></li>
	      				<li><div style="background-color: var(--color-gray);"><a href="/house/web/usermypage/userDealListView">거래 목록</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userContractView">요청한 계약</a></div></li>
	      			    <li><div><a href="/house/web/usermypage/userCounsel">상담 목록</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userMyReview">나의 후기</a></div></li>
	      			</ul>
	      		</div>

	      		
	      		<div id="content">
	      			<table class="table">
  <thead>
    <tr>
      <th scope="col">번호</th>
      <th scope="col">제목</th>
      <th scope="col">주소</th>
      <th scope="col">계약날짜</th>
    </tr>
  </thead>
  <tbody>
  
 <c:forEach items="${list}" var="dto">
    <tr>

      <td>${dto.contractSeq }</td>
	      					<td>${dto.contractCategory}  
	      						<c:if test="${not empty dto.deposit }">
	      						${dto.deposit } /
	      						</c:if>
	      						${dto.price}
	      					</td>
	      					<td>${dto.contractCategory }</td>
	      					<td>${dto.realestateAddr }</td>
	      					<td>${dto.contractDate }</td>
      <td><input type="submit" value="계약서 보기" class="button blue loginbtn"></td>
     

    </tr>
      </c:forEach>
      
      <c:if test="${dto.id==auth}">
       <td><input type="button" value="후기 작성" class="button blue loginbtn" onclick="location.href='/house/reviewboard/userAdd'"></td>
      </c:if>
  </tbody>
</table>
                     
	      	
	      		</div>
	      			
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