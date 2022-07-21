<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<style>

	#user > ul > li:nth-child(3) > a {
		color: var(--color-blue);
	}
	
	#title > span:nth-child(1) {
		font-size: var(--large-font);
		font-family: var(--title-font);
	}
	
	#title {
		width:800px;
		margin: 50px auto;
		
	}
	
	#content {
		width:800px;
		margin: 0 auto;
	}
	
	#content > table th, table td {
		text-align: center;
	}
	
	#content {
		margin-bottom: 400px;
	}
	
</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
			<div id="title">
				<span>계약 요청</span><span class="badge badge-danger">${list.size()}</span>
			</div>
			<div id="content">
				<table class="table">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>주소</th>
						<th>상태</th>
						<th></th>
					</tr>
					<c:forEach items="${list}" var="dto">
		      				<tr>
		      					<td>${dto.seq}</td>
		      					<c:if test="${empty dto.deposit}">
		      						<td>${dto.name} ${dto.price}</td>		      					
		      					</c:if>
		      					<c:if test="${not empty dto.deposit}">
		      						<td>${dto.name} ${dto.deposit}/${dto.price}</td>		      					
		      					</c:if>
		      					<td>${dto.address}</td>
		      					<td>${dto.state}</td>
		      					<c:if test="${dto.state =='대기중'}">
		      						<td>
		      							<input onclick="writeContract(${dto.seq}, ${dto.reseq})" type="button" class="button blue" value="계약서 보기" />
		      						</td>
		      					</c:if>
		      					<c:if test="${dto.state =='거절'}">
		      						<td>
		      							<input onclick="showContract(${dto.seq})" type="button" class="button gray" value="거절사유" />
		      						</td>
		      					</c:if>
		      				</tr>
	      				</c:forEach>
				</table>
			</div>
      </section>
		<%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    	
	    String.format = function() {
	        var theString = arguments[0];
	        for (var i = 1; i < arguments.length; i++) {
	            var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
	            theString = theString.replace(regEx, arguments[i]);
	        }
	        
	        return theString;
	    }
	    
	    function writeContract(seq, reseq){
		  	
		 	   	const url = String.format('/house/useralarm/showContractDoc?seq={0}&reseq={0}', seq, reseq);
	 		    window.open(url,'popwin','width=950,height=900');
		  
		}

	    
	    function showContract(seq){
		  	
	 	   		const url = String.format('/house/useralarm/refusal?seq={0}', seq);
	 		    window.open(url,'popwin','width=900,height=900');

	  
	    }
    
    </script>
</body>
</html>