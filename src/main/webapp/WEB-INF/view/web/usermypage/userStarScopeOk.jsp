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
</style>
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
	
	<c:if test="${result == 1}">
	<!--location.href = '';-->
	alert('성공');
	location.href = '/house/web/usermypage/userCounsel';
	</c:if>
	
	<c:if test="${result == 0}">
	alert('failed');
	history.back();
	</c:if>
   
    </script>
</body>
</html>