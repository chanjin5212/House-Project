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
	section {
		padding: 50px;
	}
	
	section > #title {
		font-size: var(--large-font);
	}
	
	section > .table {
		width: 700px;
	}
	section > .table tr:nth-child(1) {
		font-size: var(--large-font);
		text-align: center;
	}
	section > .table tr:nth-child(2) {
		height: 700px;
	}
	
	#submitBtn {
		width: 700px;
		display: flex;
		justify-content: right;
		padding-bottom: 100px;
	}
</style>
</head>
<body>	
	<main>
      <section>
      	<table class="table table-bordered">
      		<tr>
      			<td>거절 사유</td>
      		</tr>
      		<tr>
      			<td>${content}</td>
      		</tr>
      	</table>
      		<div id="submitBtn">
	      		<form method="post" action="/house/useralarm/refusal">
	      			<input type="submit" value="확인" class="button gray"/>
	      			<input type="hidden" value="${seq}" name="seq"/>
	      		</form>
      		</div>
      		
      </section>
    </main>
    <script>
    
    
    </script>
</body>
</html>