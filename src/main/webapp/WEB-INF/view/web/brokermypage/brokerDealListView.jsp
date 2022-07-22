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
	margin-left: 570px;
	margin-top: 50px;
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
      		
      		<div id="title">거래 목록</div>
      		<hr />
      		<div id="main">
	      		<div id="menu">
	      			<ul>
	      				<li><div><a href="/house/web/brokermypage/brokerEditInfo">개인정보</a></div></li>
	      				<li><div><a href="/house/web/brokermypage/brokerSecurity">보안</a></div></li>
	      				<li><div style="background-color: var(--color-gray);"><a href="#">거래 목록</a></div></li>
	      				<li><div><a href="/house/web/brokermypage/brokerCounselList">상담 내역</a></div></li>
	      			</ul>
	      		</div>
	      		
	      		<div id="content">
	      			<%-- ${list } --%>
	      			<div id="count">총 <span style="color:#8fd0f8;">${list.size() }</span>개의 거래내역이 존재합니다.</div>
	      			<table class="table table" id="dealList">
	      				<thead>
		      				<tr>
			      				<th>번호</th>
			      				<th>제목</th>
			      				<th>종류</th>
			      				<th>매물 주소</th>
			      				<th>계약 날짜</th>
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
	      					<td>${list.contractDocSeq }</td>
	      					<td>${list.contractCategory}  
	      						<c:if test="${not empty list.deposit }">
	      						${list.deposit } /
	      						</c:if>
	      						${list.price }
	      					</td>
	      					<td>${list.contractCategory }</td>
	      					<td>${list.realestateAddr }</td>
	      					<td>${list.contractDate }</td>
	      					<td>
	      					
				      			<!-- 계약서 창 띄울때 보낼 데이터 -->
				      			<form name="popForm" method ="POST" action="/house/web/brokermypage/showContractDoc" target="popwin" id="popForm">
								    <input type="hidden" name="contractDocSeq" id="contractDocSeq" />
								    <input type="hidden" name="category" id="category" />
	      							<input type="button" class="button blue" value="계약서" id="showContractBtn" onclick="showContract('${list.contractDocSeq}','${list.contractCategory }');"/>
								</form>
	      					</td>
	      					<c:if test = "${not empty list.reviewSeq }">
	      					<td><input type="button" class="button blue" value="후기" onclick="location.href='/house/reviewboard/userReviewBoardDetail?seq=${list.reviewSeq}';" /></td>
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
		      			 				<select name="category" id="" class="form-control">
					      			 		<option value="default">종류</option>
					      			 		<option value="매매">매매</option>
					      			 		<option value="전세">전세</option>
					      			 		<option value="월세">월세</option>
					      			 	</select>	    
		      			 			</td>
		      			 			<td>
		      			 				<input type="text" name="word" class="form-control" placeholder="검색어를 입력하세요." />
		      			 			</td>
		      			 			<td>
		      			 				<!-- type="button"을 안 주면 새로고침됨 -->
		      			 				<button type="button" id="searchBtn" class="button blue"><i class="fa-solid fa-magnifying-glass"></i></button>
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
   

    
   function showContract(contractDocSeq, category){
	  	
	   //alert();
		    window.open('/house/web/brokermypage/showContractDoc','popwin','width=950,height=900');
		   $('#contractDocSeq').val(contractDocSeq); 
		   $('#category').val(category);
		   /* $('#category').val('매매');  */
		   $('#popForm').submit();
 
   }
    
    
    $('#searchBtn').click(function(){
    	
    	//alert();
    	$.ajax({
			type:'GET',
			url: '/house/web/brokermypage/brokerDealListViewSearch',
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
									<td>\${item.contractDocSeq}</td>
									<td>\${item.category}  `;
						     if(item.deposit != "null"){ /* null이 문자 그대로 null이기 때문에 "null"로 적어줘야함 */
									temp += `\${item.deposit } /`;
								}
						     temp += `\${item.price }
									</td>`;
						     temp += `<td>\${item.category }</td>
									<td>\${item.addr }</td>
									<td>\${item.date }</td>
									<td>
			      					
					      			<!-- 계약서 창 띄울때 보낼 데이터 -->
					      			<form name="popForm" method ="POST" action="/house/web/brokermypage/showContractDoc" target="popwin" id="popForm">
									    <input type="hidden" name="contractDocSeq" id="contractDocSeq" />
									    <input type="hidden" name="category" id="category" />
		      							<input type="button" class="button blue" value="계약서" id="showContractBtn" onclick="showContract('\${item.contractDocSeq}','\${item.category}');"/>
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
    
    
    
 
    </script>
</body>
</html>