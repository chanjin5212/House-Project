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
      		<p style="font-size: var(--large-font)">large입니다.</p>
      		<p style="font-size: var(--middle-font)">middle입니다.</p>
      		<p style="font-size: var(--small-font)">small입니다.</p>
      		<p style="font-size: var(--min-font)">min입니다.</p>
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
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