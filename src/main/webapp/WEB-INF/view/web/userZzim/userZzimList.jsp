<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<style>

section > div#roomList {
	margin-top: 50px;
}

section > div#roomList > span {
	font-size: var(--large-font);
	font-family: var(--title-font);
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

header > div > nav#user > ul > li:nth-child(2) > a  {
	color: var(--color-blue);
}

#aTag > a {
	color: black;
	text-decoration: none;
}

#aTag > a:hover {
	color: var(--color-blue);
}


</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      		<div id="roomList">
				<span>찜목록</span>
      		</div>
      		<div id="title">
      			<span>찜한 방:${count}개</span>
      		</div>
      		<c:forEach items="${list}" var="dto">
      			
      			
     			<div class="list">
	      			<div>
	      				<c:if test="${not empty dto.filename}">
		      				<div style="background-image:url(/house/files/${dto.filename}); background-size: cover; width:200px; height: 200px;"><span class="badge badge-danger">♥</span></div>
	      				</c:if>
	      				<c:if test="${empty dto.filename}">
		      				<div style="background-image:url(/house/asset/images/basic.jpeg); background-size: cover; width:200px; height: 200px;"><span class="badge badge-danger">♥</span></div>		      				
	      				</c:if>
		      			<div id="aTag" style="padding: 40px; width:550px; border-right: 1px solid var(--color-lightgray);">
			      			<c:if test="${not empty dto.deposit}">
				      			<a href="/house/web/userRealEstateView?seq=${dto.reSeq}&coordinateX=${dto.coordinateX}&coordinateY=${dto.coordinateY}"><span style="font-size: var(--large-font)">${dto.name} ${dto.deposit}/${dto.price}</span></a>		      				
		      				</c:if>
		      				<c:if test="${empty dto.deposit}">
		      					<a href="/house/web/userRealEstateView?seq=${dto.reSeq}&coordinateX=${dto.coordinateX}&coordinateY=${dto.coordinateY}"><span style="font-size: var(--large-font)">${dto.name} ${dto.price}</span></a>
		      				</c:if>
			      			<div style="font-size: var(--middle-font)"><span>${dto.realEstateAddr}</span></div>
		      			</div>
		      			<div class="btns" style="display: flex; justify-content: center; width: 200px;">
		      				<div style="margin: auto;">
			      				<div style="margin-bottom: 10px;"><button type="button" class="btn btn-outline-secondary" onclick="delRe(${dto.seq});">삭제하기</button></div>
		      				</div>
		      			</div>
	      			</div>
	      		</div>
      		</c:forEach>
      		
      		
      		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
    	function delRe(seq) {
    		if (confirm('삭제하시겠습니까?')) {
    			location.href = "/house/userZzim/userZzimDel?seq=" + seq;
    		}
    	}
    
       
    </script>
</body>
</html>