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
	margin-left: 700px;
	margin-top: 50px;
	padding-left: 100px;
}

#search td{

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
      		
      		<div id="title">상담 내역</div>
      		<hr />
      		<div id="main">
	      		<div id="menu">
	      			<ul>
	      				<li><div><a href="/house/web/brokermypage/brokerEditInfo">개인정보</a></div></li>
	      				<li><div><a href="/house/web/brokermypage/brokerSecurity">보안</a></div></li>
	      				<li><div><a href="/house/web/brokermypage/brokerDealListView">거래 목록</a></div></li>
	      				<li><div style="background-color: var(--color-gray);"><a href="#">상담 내역</a></div></li>
	      			</ul>
	      		</div>
	      		
	      		<%-- ${avg } --%>
	      		<div id="content">
	      			<%-- ${list } --%>
	      			<c:if test="${not empty list and avg != 'NaN'}">
	      			<div style="margin-left: 350px; font-size: 20px;">회원님의 상담 후기 평점  <span style="color: var(--color-green);">★ ${avg }</span></div>
	      			</c:if>
	      			<div id="count">총 <span style="color:#8fd0f8;">${list.size() }</span>개의 상담내역이 존재합니다.</div>
	      			<table class="table table" id="dealList">
	      				<thead>
		      				<tr>
			      				<th>번호</th>
			      				<th>아이디</th>
			      				<th>등록일</th>
			      				<th>처리상태</th>
			      				<th>처리일</th>
			      				<th></th>
			      				<th></th>
		      				</tr>
	      				</thead>
	      				<c:if test="${empty list }">
	      					<tr>
	      						<td colspan="5" style="text-align:center;">
	      							존재하는 내역이 없습니다.
	      						</td>
	      					</tr>
	      				</c:if>
	      				
	      				
	      				
		      				<c:forEach var="list" items ="${list }">
		      				<tr>
		      					<td>${list.seq }</td>
		      					<td>${list.memberId}
		      					</td>
		      					<td>${list.writeDate }</td>
		      					<c:if test="${list.state == '처리중' }">
		      					<td style="color:var(--color-green)">처리전</td>
		      					</c:if>
		      					<c:if test="${list.state == '처리완료' }">
		      					<td>${list.state }</td>
		      					</c:if>
		      					<td>${list.completedate }</td>
		      					<td>
		      					
					      			<!-- 상담 상세페이지 띄울때 보낼 데이터 -->
					      			<form name="popForm" method ="POST" action="/house/web/brokermypage/showCounsel" target="popwin" id="popForm">
									    <input type="hidden" name="seq" id="seq" />
										<c:if test="${list.state == '처리중' }">
		      							<input type="button" class="button blue" value="처리하기" id="counselseq" onclick="showCounsel('${list.seq}');"/>
										</c:if>
										<c:if test="${list.state == '처리완료' }">
		      							<input type="button" class="button blue" value="상세보기" id="counselseq" onclick="showCounsel('${list.seq}');"/>
										</c:if>
									</form>
		      					</td>
		      					<c:if test = "${not empty list.reviewSeq }">
		      					<td>
		      						${list.star }
		      					</td>
		      					</c:if>
		      				</tr>
		      				</c:forEach>
	      				
	      			</table>
	      			<div style="margin-left:450px; margin-top: 60px; ">${pagebar }</div>


	      			
	      			 <form id="searchForm">
		      			 <div id="searchDiv">
		      			 	<table id="search">
		      			 		<tr>
		      			 			<td>
		      			 				<select name="date" id="" class="form-control">
					      			 		<option value="default">날짜</option>
					      			 		<option value="desc">최신순</option>
					      			 		<option value="asc">등록순</option>
					      			 	</select>	    
		      			 			</td>
		      			 			<td>
		      			 				<!-- type="button"을 안 주면 새로고침됨 -->
		      			 				<button type="button" id="searchBtn" class="button blue">정렬</button>
		      			 			</td>
		      			 		</tr>
		      			 		
		      			 	</table>
		      			 </div>
	      			 </form>
	      			
	      			
	      		</div>
	      			
      		</div>
      </section>
     <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
   

    
   function showCounsel(seq){
	  	
	   //alert();
		    window.open('/house/web/brokermypage/showConusel','popwin','width=600,height=550');
		   $('#seq').val(seq); 
		   /* $('#category').val(category); */ 
		  
		   $('#popForm').submit();
 
   }
    
    
    $('#searchBtn').click(function(){
    	
    	//alert();
    	$.ajax({
			type:'GET',
			url: '/house/web/brokermypage/brokerCouselSearch',
			data: $('#searchForm').serialize(),
			dataType: 'json',
			success: function(result){
				
				//검색 결과 출력
				
				//기존 테이블 내용 없애기
				$('#dealList tbody').html('');
				
				$('#count').html('총 <span style="color:#8fd0f8;">' + result.length + '</span>개의 결과가 검색되었습니다.');
					
				 if (result.length > 0) {
					
						$(result).each(function(index, item) {
		
						     
						     let temp = '';
						     
						     temp += `<tr>
			      					<td>\${list.seq }</td>
			      					<td>\${list.memberId}
			      					</td>
			      					<td>\${list.writeDate }</td>
			      					<td>\${list.state }</td>
			      					<td>\${list.completedate }</td>
			      					<td>
			      					
						      			<!-- 상담 상세페이지 띄울때 보낼 데이터 -->
						      			<form name="popForm" method ="POST" action="/house/web/brokermypage/showCounsel" target="popwin" id="popForm">
										    <input type="hidden" name="seq" id="seq" />
								
			      							<input type="button" class="button blue" value="상세보기" id="showContractBtn" onclick="showCounsel('\${item.seq}');"/>
										</form>
			      					</td>`;
									
						     if(item.reviewSeq != "null"){
									temp += `<td><input type="button" class="button blue" value="후기" onclick="location.href='/house/reviewboard/userReviewBoardDetail?seq=\${item.reviewSeq}';" /></td>`;
									
								}
						     temp += '</tr>';
					
						     
						     
							$('#dealList tbody').append(temp);
							
						});
					} else {
						$('#dealList tbody').append('<tr><td colspan="6">일치하는 결과가 없습니다.</td></tr>');
					}  
				
			},
			error : function(a,b,c){
				console.log(a,b,c);
			}
		});
    	
    });
    
    
    /* 
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
    });  */
    </script>
</body>
</html>