<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
h2{
font-size: var(--large-font);
text-align: center;

}
h3{
font-size: var(--small-font);

}
#content{
text-align: center;
}

</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      <div id="content">
        <h2>매물</h2>
        <c:if test="${dto.deposit == null}">
      	<h3>${dto.contractname}/${dto.price}/${dto.realestateaddr}</h3>  
      </c:if>
      <c:if test="${dto.deposit != null}">
      	<h3>${dto.contractname}/${dto.deposit}/${dto.price}/${dto.realestateaddr}</h3>
      </c:if>	
      	<h2>상담상세내용</h2>	
      	        <h3>${dto.content}</h3>
      		<h2>회원</h2>
      		        <h3>${dto.name}</h3>
      		<h2>전화번호</h2>
      		        <h3>${dto.tel}</h3>
      		      
           
      		        <input type="button" value="돌아 가기" class="button blue loginbtn" onclick="location.href='/house/web/usermypage/userCounsel'">
      		        <input type="button" value="별점 등록" class="button blue loginbtn" onclick="location.href='/house/web/usermypage/userStarScope?seq=${seq}&brokername=${dto.brokername}'">
     </div>
      </section>
 <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>

    </script>
</body>
</html>