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
		alert('failed');
		history.back();
		</c:if>
	    
    
    
    
    
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