<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방 중개사</title>
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
	margin-bottom: 100px;
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
	      				<li><div><a href="/house/web/brokermypage/brokerEditInfo">개인정보</a></div></li>
	      				<li><div style="background-color: var(--color-gray);"><a href="/house/web/brokermypage/brokerSecurity">보안</a></div></li>
	      				<li><div><a href="/house/web/brokermypage/brokerDealListView">거래 목록</a></div></li>
	      				<li><div><a href="/house/web/brokermypage/brokerCounselList">상담 내역</a></div></li>
	      			</ul>
	      		</div>
	      		
	      		<div id="content">
		      			<div id="editpw">
			      			<form method="POST" action="/house/web/brokermypage/brokerSecurityEditOk">
				      				<div><h1>비밀번호 변경</h1></div>
				      				<hr />
					      			<table>
					      				<tr>
					      					<th>새 비밀번호</th>
					      					<td><div id="pw"><input type="password" class="form-control" name="newpw" id="newpw" placeholder="비밀번호를 입력하세요."/></div></td>
					      				</tr>
					      				<tr>
					      					<th>새 비밀번호 확인</th>
					      					<td><div id="pw"><input type="password" class="form-control" name="checkpw" id="checkpw" placeholder="비밀번호를 입력하세요."/></div></td>
					      				</tr>
					      			</table>
				      			
				      				<div ><input type="submit" value="완료" class="button blue" id="editpwbtn" /></div>
			      			</form>
		      			</div>
	      			
	      			<div id="deactive">
		      			<div><h1>회원 탈퇴</h1></div>
		      			<hr />
		      			<!-- 버튼 클릭하면 회원탈퇴 확인 창 띄우기 -->
		      			<div id="deactive"><input type="button" value="탈퇴" class="btn btn-outline-danger" id="deactivebtn" /></div>
	      			</div>
	      			
	      			
	      		</div>
	      			
      		</div>
      		<div id="dialog">
			    <span style="font-weight: bold; color:#8fd0f8;">정말 탈퇴하시겠습니까?</span><br><br />
			    <span style="font-size: var(--small-font);">회원 탈퇴시 회원님의 모든 정보는 삭제됩니다.</span><br>
			    <span style="font-size: var(--small-font);">또한 회원님 ID로 이용하셨던 서비스의 이용이 모두 불가능하게 됩니다.</span><br>
			</div>
      		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
    $('#dialog').hide(); //팝업창으로 띄울 내용은 숨겨놓기
    /* 다이알로그 창 타이틀 없애기 */
   /* $("#dialog").dialog().parents(".ui-dialog").find(".ui-dialog-titlebar").remove(); */
    
   $('#deactivebtn').click(function(){
	   
	   //alert();
	   $('#dialog').dialog({
		   width: 550,
		  /*  height: 270, */
           draggable: false, //이동방지
           resizable: false, //상자 크기 변경 방지
           buttons: {
               '탈퇴': function(){  //버튼을 클릭하면 발생할 이벤트
            	    //alert();
					location.href='/house/web/brokermypage/brokerDeactive';
               },

               '취소': function() {
                   $('#dialog').dialog('close'); //알림창 닫기
               }
           }, //버튼 객체
           modal: true
	   }).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();
   });
    
    
    
    </script>
</body>
</html>