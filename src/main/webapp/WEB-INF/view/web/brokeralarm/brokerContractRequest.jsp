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
	section{
		padding-bottom: 100px;
	}
	
	a {
	text-decoration: none;
	font-size: var(--large-font);
	color: var(--color-gray);
	}

	a:hover {
		text-decoration: none;
		color: #68c1f8;
	}
	
	hr {
		margin: 0;
	}
	
	#main{
	
		/* border: 1px solid black; */
		width: 800px;
		margin: 0 auto;
		margin-top : 30px;
	}
	
	#menu {
	
	}
	
	#menu div {
		/* border: 1px solid black; */
		display: inline-block;
		margin: 10px;
		font-size: var(--large-font); 
	}
</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/brokerHeader.jsp" %>
      <section>
      		
      		<div id="main">
      		
	      		<div id="menu">
	      			<div>
	      				<a href="/house/web/brokeralarm/brokerContractRequest">계약 요청</a>
	      			</div>
	      			<div>
	      				<a href="/house/web/brokeralarm/brokerConselRequest">상담 요청</a>
	      			</div>
	      		</div>
	      		
	      		<hr />
	      		
	      		
      			<div id="content">
	      			<%-- ${list } --%>
	      			<div id="count">총 <span style="color:#8fd0f8;">${list.size() }</span>개의 요청이 존재합니다.</div>
	      			<table class="table table" id="dealList">
	      				<thead>
		      				<tr>
			      				<th>번호</th>
			      				<th>제목</th>
			      				<th>종류</th>
			      				<th>매물 주소</th>
			      				
			      				<th></th>
			      				<th></th>
		      				</tr>
	      				</thead>
	      				<c:forEach var="list" items ="${list }">
	      				<tr>
	      					<td>${list.contractSeq }</td>
	      					<td>${list.contractCategory}  
	      						<c:if test="${not empty list.deposit }">
	      						${list.deposit } /
	      						</c:if>
	      						${list.price }
	      					</td>
	      					<td>${list.contractCategory }</td>
	      					<td>${list.realestateAddr }</td>
	      					
	      					<c:if test="${list.brokerCheck == '대기중' }">
	      					<td>
	      					
				      			<!-- 계약서 창 띄울때 보낼 데이터 -->
				      			<form name="popForm" method ="POST" action="/house/web/brokeralarm/brokerWriteContractDoc" target="popwin" id="popForm">
								    <input type="hidden" name="contractseq" id="contractseq" />
								    <input type="hidden" name="category" id="category" />
	      							<input type="button" class="button blue" value="승인" id="showContractBtn" onclick="writeContract('${list.contractSeq}','${list.contractCategory }');"/>
	      							
								</form>
								
	      					</td>
	      					<td>
	      						<input type="button" value="거절" class="button blue" />
	      					</td>
	      					</c:if>
	      					
	      					<c:if test="${list.brokerCheck == '승인완료' }">
	      					
		      					<c:if test="${list.state == '대기중' }">
		      						<td>
		      							대기중
		      						</td>
		      					</c:if>
		      					<c:if test="${list.state == '완료' }">
		      						<td>
		      							계약 완료
		      						</td>
		      						<td>
		      							<form name="popForm" method ="POST" action="/house/web/brokermypage/showContractDoc" target="popwin" id="popForm">
									    <input type="hidden" name="contractseq" id="contractseq" />
									    <input type="hidden" name="category" id="category" />
		      							<input type="button" value="계약서보기" class="button blue" onclick="showContract('${list.contractSeq}','${list.contractCategory }');" />
		      							</form>
		      						</td>
		      					</c:if>
	      					
	      					</c:if>
	      				</tr>
	      				</c:forEach>
	      			</table>
	      			

      		
      		
      			</div>
      		</div>
      		
      </section>
      <footer>
      	
      </footer>
    </main>
    <script>
    
	    function writeContract(contractseq, category){
		  	
	 	   //alert();
	 		    window.open('/house/web/brokeralarm/brokerWriteContractDoc','popwin','width=950,height=900');
	 		   $('#contractseq').val(contractseq);
	 		   $('#category').val(category);
	 		   /* $('#category').val('매매');  */
	 		   $('#popForm').submit();
	  
	    }
	    
	    function showContract(contractseq, category){
		  	
	 	   //alert();
	 		    window.open('/house/web/brokermypage/showContractDoc','popwin','width=950,height=900');
	 		   $('#contractseq').val(contractseq); 
	 		   $('#category').val(category);
	 		   /* $('#category').val('매매');  */
	 		   $('#popForm').submit();
	  
	    }
    
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