<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
	padding: 30px;
	height: 70px;
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
	padding-left: 300px;
}

#content h1{
	/* border: 1px solid black; */
	font-size: var(--large-font); 
	
}



#editpwbtn{
/* 	text-align: center;
	width: 400px;
	height: 56px;
	margin-top: 30px;
	border-radius: 0.25rem; */
	margin-left: 300px;
	margin-top: 10px;
	
}


#pw input {
	/* width: 400px;
	height: 56px;
	margin-top: 30px;
	border-radius: 0.25rem; */
}

#content > div{
	padding-bottom: 50px;

}

#content  hr {
	width: 400px;
	padding: 10px;

}

#content table th {

	padding : 25px;
	padding-left: 0px;
	/* padding-right: 70px; */
}

#content table td{
	font-size: var(--small-font);
	
}


@font-face {
  font-family: "S-CoreDream-5Medium";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-5Medium.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}

#dialog{
	text-align: center;
	font-family: "S-CoreDream-5Medium";
	padding: 20px;
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
      		
      		<div id="title">보안</div>
      		<hr />
      		<div id="main">
	      		<div id="menu">
	      			<ul>
	      					<li><div><a href="/house/web/usermypage/userEditInfo">내 정보</a></div></li>
	      			<li><div style="background-color: var(--color-gray);"><a href="/house/web/usermypage/userSecurity">보안</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userDealListView">거래 목록</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userContractView">요청한 계약</a></div></li>
	      			    <li><div><a href="/house/web/usermypage/userCounsel">상담 목록</a></div></li>
	      				<li><div><a href="/house/web/usermypage/userMyReview">나의 후기</a></div></li>
	      			</ul>
	      		</div>
	      		
	      		<div id="content">
		      			<div id="editpw">
			      			<form method="POST" action="/house/web/usermypage/userSecurityEditOk">
				      				<div><h1>비밀번호 변경</h1></div>
				      				<hr />
					      			<table>
					      				<tr>
					      					<th>새 비밀번호</th>
					      					<td><div id="pw"><input type="password" class="pw" name="newpw" id="password_1" placeholder=""/></div></td>
					      				</tr>
					      				<tr>
					      					<th>새 비밀번호 확인</th>
					      					<td><div id="pw"><input type="password" class="pw" name="checkpw" id="password_2" placeholder=""/></div></td>
					      				</tr>
					      			</table>
				      			
				      				<div ><input type="submit" value="수정" class="button blue" id="editpwbtn" /></div>
			      			</form>
		      			</div>
	      			
	      			<div id="deactive">
		      			<div><h1>회원 탈퇴</h1></div>
		      			<hr />
		      			<!-- 버튼 클릭하면 회원탈퇴 확인 창 띄우기 -->
		      			<div id="deactive"><input type="button" value="탈퇴하기" class="button blue" id="deactivebtn" /></div>
	      			</div>
	      			
	      			
	      		</div>
	      			
      		</div>
      	
      		
      </section>
      <footer>
      	
      </footer>
    </main>
    
   <script> 
   $('.pw').focusout(function () {
       var pwd1 = $("#password_1").val();
       var pwd2 = $("#password_2").val();
 
       if ( pwd1 != '' && pwd2 == '' ) {
           null;
       } else if (pwd1 != "" || pwd2 != "") {
           if (pwd1 == pwd2) {
               $("#alert-success").css('display', 'inline-block');
               $("#alert-danger").css('display', 'none');
           } else {
               alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
               $("#alert-success").css('display', 'none');
               $("#alert-danger").css('display', 'inline-block');
           }
       }
   });
</script>

    
   
</body>
</html>