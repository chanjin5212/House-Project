<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방 중개사</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<style>

section > div#roomList {
	margin-top: 50px;
}

section > div#roomList > span {
	font-size: var(--large-font);
}

section > div {
	margin: 0 auto;
	width: 1000px;
	
}

section > div#title {
	border-bottom: 1px solid var(--color-lightgray);
	display: flex;
	justify-content: right;
}

section > div#title > span {
	font-size: var(--small-font);
}

section > div.list {
	display: flex;
	padding: 30px;
}

section > div.list > div {
	border: 1px solid var(--color-lightgray);
	display: flex;
}

</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/brokerHeader.jsp" %>
      <section>
      		<div id="roomList">
				<span>방목록</span>
      		</div>
      		<div id="title">
      			<span>등록한 방:${count}개</span>
      		</div>
      		<c:forEach items="${list}" var="dto">
      			<c:if test="${dto.contractCheck == '계약중'}">
      				<div class="list">
		      			<div>
		      				<c:if test="${not empty dto.filename}">
			      				<div style="background-image:url(/house/files/${dto.filename}); background-size: cover; width:200px; height: 200px;"><span class="badge badge-success">계약중</span></div>
		      				</c:if>
		      				<c:if test="${empty dto.filename}">
			      				<div style="background-image:url(/house/asset/images/basic.jpeg); background-size: cover; width:200px; height: 200px;"><span class="badge badge-success">계약중</span></div>		      				
		      				</c:if>
			      			<div style="padding: 40px; width:550px; border-right: 1px solid var(--color-lightgray);">
			      				<c:if test="${not empty dto.deposit}">
					      			<span style="font-size: var(--large-font)">${dto.name} ${dto.deposit}/${dto.price}</span>		      				
			      				</c:if>
			      				<c:if test="${empty dto.deposit}">
			      					<span style="font-size: var(--large-font)">${dto.name} ${dto.price}</span>
			      				</c:if>
				      			<div style="font-size: var(--middle-font)"><span>${dto.realEstateAddr}</span></div>
				      			<div style="font-size: var(--small-font)"><span>관심등록:${dto.wish}</span></div>
			      			</div>
			      			<div style="display: flex; justify-content: center; width: 200px;">
			      				<div style="margin: auto;"><button class="btn btn-outline-secondary" onclick="cancel(${dto.seq});">계약 취소하기</button></div>
			      			</div>
		      			</div>
		      		</div>
      			</c:if>
      			<c:if test="${dto.contractCheck == '판매중'}">
      				<div class="list">
		      			<div>
		      				<c:if test="${not empty dto.filename}">
			      				<div style="background-image:url(/house/files/${dto.filename}); background-size: cover; width:200px; height: 200px;"><span class="badge badge-danger">판매중</span></div>
		      				</c:if>
		      				<c:if test="${empty dto.filename}">
			      				<div style="background-image:url(/house/asset/images/basic.jpeg); background-size: cover; width:200px; height: 200px;"><span class="badge badge-danger">판매중</span></div>		      				
		      				</c:if>
			      			<div style="padding: 40px; width:550px; border-right: 1px solid var(--color-lightgray);">
				      			<c:if test="${not empty dto.deposit}">
					      			<span style="font-size: var(--large-font)">${dto.name} ${dto.deposit}/${dto.price}</span>		      				
			      				</c:if>
			      				<c:if test="${empty dto.deposit}">
			      					<span style="font-size: var(--large-font)">${dto.name} ${dto.price}</span>
			      				</c:if>
				      			<div style="font-size: var(--middle-font)"><span>${dto.realEstateAddr}</span></div>
				      			<div style="font-size: var(--small-font)"><span>관심등록:${dto.wish}</span></div>
			      			</div>
			      			<div class="btns" style="display: flex; justify-content: center; width: 200px;">
			      				<div style="margin: auto;">
				      				<div style="margin-bottom: 10px;"><button type="button" class="btn btn-outline-secondary" onclick="delRe(${dto.seq});">삭제하기</button></div>
			      				</div>
			      			</div>
		      			</div>
		      		</div>
      			</c:if>
      		</c:forEach>
      		
      		
      		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
    	function delRe(seq) {
    		if (confirm('삭제하시겠습니까?')) {
    			location.href = "/house/brokerrealestate/brokerRealEstateDel?seq=" + seq;
    		}
    	}
    
    	function cancel(seq) {
    		if (confirm('취소하시겠습니까?')) {
    			location.href = "/house/brokerrealestate/brokerRealEstateCancel?seq=" + seq;
    		}
    	}
       


    </script>
</body>
</html>