<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      		<input type="text" />
      </section>
    </main>
    <footer></footer>
	<script>
		<c:if test="${result eq 1}">
			alert('신고가 접수됐습니다.');
			location.href = '/house/web/userRealEstateView?seq='+${seq}+'&coordinateX='+${coordinateX}+'&coordinateY='+${coordinateY};
		</c:if>
		<c:if test="${result eq 0}">
			alert('전송에 실패했습니다. 잠시후 다시 시도해주세요.');
			histroy.back();
		</c:if>
	</script>
</body>
</html>