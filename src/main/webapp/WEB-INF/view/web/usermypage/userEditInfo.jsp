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
	padding-left: 300px;
}

/* #content table{
	
	margin: 0  auto;
	margin-left: 300px;
	
} */

#content table th {

	padding : 25px;
	padding-right: 70px;
}

#content table td{
	font-size: var(--small-font);
	
}

#content table input[type=text]{
	color: var(--color-gray);
	padding : 5px;
	/* color : #ccc; */
}

#content table .button.blue{

	margin-left : 10px;
	text-align: center;
}

#content::after {

	content: '';
	display: block;
	clear: both;

}

#edit {
	
	/* border: 1px solid black; */
	margin: 10px 0 0 700px;
	
}

.explain {
	
	font-size: var(--small-font);
	text-align: center;
	/*margin-top: 100px;*/
    padding: 30px;
	height: 40px;
	

}
p.explain{



}
input.button.blue{
text-align: center;

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
      		
      
      			
		      		
      	
	      		
      		
      		<div id="title">내 정보</div>
      			
      		<p class="explain">
      		회원님께서 가입하신 정보입니다.
      		<br>
      		수정하시려면 수정 후 완료 버튼을 눌러주세요.
      		
      		
      		</p>
      		<hr />
      		<div id="main">
	      		<div id="menu">
	      			<ul>
	      				<li><div style="background-color: var(--color-gray);"><a href="/house/web/usermypage/userEditInfo">내 정보</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userSecurity">보안</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userDealListView">거래 목록</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userContractView">요청한 계약</a></div></li>
	      			    <li><div><a href="/house/web/usermypage/userCounsel">상담 목록</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userMyReview">나의 후기</a></div></li>
	      			</ul>
	      		</div>
	      		<div id="explain">
	      		
	      		</div>
	      		
	      		<div id="content">

	      				<form method="POST" action="/house/web/usermypage/userEditInfoOk">
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
	      					<td><input type="text" value="${dto.tel }" class="form-control" name="tel"/></td>
	      				</tr>
	      				<tr>
	      					<th>이메일</th>
	      					<td><input type="text" value="${dto.email }" class="form-control" name="email"/></td>
	      				</tr>
	      				<tr>
	      					<th>주소</th>
	      					<td><input type="text" value="${dto.address }" style="width: 300px;" class="form-control" name="address"/></td>
	      				</tr>
	      				
	      			</table>
	      			<div id="edit"><input type="submit" value="수정완료" class="button blue" /></div>
	      			</form>
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