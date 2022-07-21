<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      		
      		
      		
      </section>
      <footer>
      	
      </footer>
    </main>
    <script>
	    
	    <c:if test="${not empty auth && lv=='1'}">
		location.href = '/house/main';
		</c:if>
		
		<c:if test="${not empty auth && lv=='2'}">
		location.href = '/house/brokermain/brokerMain';
		</c:if>
		
		<c:if test="${empty auth}">
		alert('로그인 정보를 확인해주세요.');
		history.back();
		</c:if>
	    
    
    
    
    
        
    </script>
</body>
</html>