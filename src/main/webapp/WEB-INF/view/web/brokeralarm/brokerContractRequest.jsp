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

	header > div > nav#user > ul > li:nth-child(5) > a,
	header > div > nav#broker > ul > li:nth-child(3) > a  {
		color: var(--color-blue);
	}

	section{
		padding-bottom: 100px;
	}
	
	#menu > div > a {
	text-decoration: none;
	font-size: var(--large-font);
	color: var(--color-gray);
	}

	#menu > div > a:hover {
		text-decoration: none;
		color: #68c1f8;
	}
	
	hr {
		margin: 0;
	}
	
	#main{
	
		/* border: 1px solid black; */
		width: 1000px;
		margin: 0 auto;
		/* margin-right : 30px; */
	}
	
	#menu {
	
	}
	
	#menu div {
		/* border: 1px solid black; */
		display: inline-block;
		margin-right: 60px;
		margin-top:30px;
		margin-bottom: 30px;
		font-size: var(--large-font); 
	}
	
	#content{
		
		padding-top: 50px;
		
	}
	
	#pageContainer{
		/* border: 1px solid black; */
		margin-left: 450px;
		margin-top : 100px;
	}
	
</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/brokerHeader.jsp" %>
      <section>
      		
      		<div id="main">
      		
	      		<div id="menu">
	      			<div >
	      				<a href="/house/web/brokeralarm/brokerContractRequest" style="color:#68c1f8">
	      					계약 요청
	      					<c:if test="${countNew != '0' }">
	      					<span class="badge badge-pill badge-danger"  style="font-size: 12px; vertical-align: top;">
	      						${countNew }
	      					</span>
	      					</c:if>
	      				</a>
	      			</div>
	      			<div>
	      				<a href="/house/web/brokermypage/brokerCounselList">
	      				상담 요청
	      				<c:if test="${couselCount != '0' }">
	      				<span class="badge badge-pill badge-danger"  style="font-size: 12px; vertical-align: top;">
	      					${couselCount }
	      				</span>
	      				</c:if>
	      				</a>
	      			</div>
	      		</div>
	      		
	      		<hr />
	      		
	      		
      			<div id="content">
	      			<%-- ${list } --%>
	      			<h1 style="font-size: 20px;">계약 요청 목록</h1>
	      			<div id="count" style="margin-left: 100px; text-align:center;"><span style="color:#8fd0f8;">${countNew }</span>개의 새로운 요청이 있습니다.</div>
	      			<table class="table table" id="dealList">
	      				<thead>
		      				<tr>
			      				<th>번호</th>
			      				<th>제목</th>
			      				<th>종류</th>
			      				<th>매물 주소</th>
			      				<th>요청자</th>
			      				
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
	      					<td>${list.userId }</td>
	      					
	      					<c:if test="${list.brokerCheck == '대기중' }">
	      					<td>
	      					
				      			<!-- 계약서 작성 창 띄울때 보낼 데이터 -->
				      			<form name="popForm" method ="POST" action="/house/web/brokeralarm/brokerWriteContractDoc" target="popwin" id="popForm">
								    <input type="hidden" name="contractseq" id="contractseq" />
								    <input type="hidden" name="category" id="category" />
								    <input type="hidden" name="realestateSeq" id="realestateSeq" />
	      							<input type="button" class="button blue" value="승인" id="showContractBtn" onclick="writeContract('${list.contractSeq }','${list.contractCategory }','${list. realEstateSeq }');"/>
	      							
								</form>
								
	      					</td>
	      					<td>
	      						<!-- 거절버튼 -->
	      						<form name="popForm2" action="/house/web/brokeralarm/brokerRefuseContract" method="POST" target="popwin2" id="popForm2">
	      							<input type="hidden" name="contractSeq" id="contractSeq"/>
	      							<input type="button" value="거절" class="button blue" id="refuse" onclick="showRefuse('${list.contractSeq }');"/>
	      						</form>
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
									    <input type="hidden" name="contractDocSeq" id="contractDocSeq" />
									    <input type="hidden" name="category" id="category" />
		      							<input type="button" value="계약서보기" class="button blue" onclick="showContract('${list.contractDocSeq}','${list.contractCategory }');" />
		      							</form>
		      						</td>
		      					</c:if>
		      					
	      					
	      					</c:if>
		      					
	      					<c:if test="${list.brokerCheck == '거절' }">
	      						<td>
	      							취소됨
	      						</td>
	      					</c:if>
	      					<c:if test="${list.state == '거절' }">
	      						<td>
	      							취소됨
	      						</td>
	      					</c:if>
	      				</tr>
	      				</c:forEach>
	      			</table>
	      			
	      			<div id="pageContainer">
	      				${pagebar }
	      			</div>
	      			
					
      		
      		
      			</div>
      		</div>
      		
      </section>
     <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
    $("#pagebar").change(function() {
		
		
		
		location.href = '/house/web/brokeralarm/brokerContractRequest?page=' + $(this).val();
		
	});
    
    
    function showRefuse(contractSeq){
	  	
	 	   //alert(realestateSeq);
	 		    window.open('/house/web/brokeralarm/brokerRefuseContract','popwin2','width=500,height=500');
	 		   $('#contractSeq').val(contractSeq);
	 		   /* $('#category').val('매매');  */
	 		   $('#popForm2').submit();
	  
	    }
    	
    
	    function writeContract(contractseq, category, realestateSeq){
		  	
	 	   //alert(realestateSeq);
	 		    window.open('/house/web/brokeralarm/brokerWriteContractDoc','popwin','width=950,height=900');
	 		   $('#contractseq').val(contractseq);
	 		   $('#category').val(category);
	 		   $('#realestateSeq').val(realestateSeq);
	 		   /* $('#category').val('매매');  */
	 		   $('#popForm').submit();
	  
	    }
	    
	    function showContract(contractDocSeq, category){
		  	
	 	   //alert();
	 		    window.open('/house/web/brokermypage/showContractDoc','popwin','width=950,height=900');
	 		   $('#contractDocSeq').val(contractDocSeq); 
	 		   $('#category').val(category);
	 		   /* $('#category').val('매매');  */
	 		   $('#popForm').submit();
	  
	    }
    
	   
    </script>
</body>
</html>