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
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
    	
	    <c:if test="${result == 1}">
	    alert('회원가입이 완료되었습니다.');
		location.href = '/house/main';
		</c:if>
		
		<c:if test="${result == 0}">
		alert('회원가입에 실패하였습니다. ');
		history.back();
		</c:if>
    
    
    
        
    </script>
</body>
</html>