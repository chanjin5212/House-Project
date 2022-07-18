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
	section > div#board {
		width: 1000px;
		margin: 100px auto;
	}
	
	
	header > div > nav#user > ul > li:nth-child(4) > a,
	header > div > nav#broker > ul > li:nth-child(2) > a  {
		color: var(--color-blue);
	}
	
	section > div#search {
		width: 1000px;
		margin: 0 auto;
		display: flex;
		justify-content: center;
	}
	
	section > div#addBoard {
		width: 1000px;
		margin: 0 auto;
		display: flex;
		justify-content: right;
	}
	
	section > div#paging {
		width: 1000px;
		margin: 0 auto;
		display: flex;
		justify-content: center;
	}
	
	section > div#board > div#filter {
		width: 1000px;
		margin: 0 auto;
		display: flex;
		justify-content: right;
	}
	
	section > div#board > div#filter > a,
	section > div#board > div#filter > span {
		text-decoration: none;
		color: var(--color-gray);
	}
	
	section > div#board > nav#broker > ul {
		display: flex;
		
		list-style: none;
	}
	section > div#board > nav#broker > ul > li > a {
		margin-right: 40px;
		font-size: var(--large-font);
		font-family: var(--title-font);
		color: var(--color-gray);
		text-decoration: none;
	}
	
	section > div#board > nav#broker > ul > li > a:hover {
		color: var(--color-blue);
	}
	
	section > div#board > nav#broker > ul > li:nth-child(1) > a {
		color: var(--color-blue);
	}
	
	section > div#board > table th, table td {
		text-align: center;
	}
	
	section > div#board > table td:nth-child(2) {
		text-align: left;	
	}
	
	section > div#board > div#filter > a:nth-child(1) {
		color: var(--color-blue);
	}
	
	
	
	
</style>
</head>
<body>	
	<main>
		<c:if test="${check == 0}">
      		<%@include file="/WEB-INF/inc/header.jsp" %>
		</c:if>
		<c:if test="${check == 1}">
			<%@include file="/WEB-INF/inc/brokerHeader.jsp" %>
		</c:if>
      <section>
		<div id="board">
			<c:if test="${check == 1}">
			<div>중개사</div>
			<nav id="broker">
				<ul>
					<li><a href="/house/reviewboard/userReviewBoardView">후기 게시판</a></li>
					<li><a href="">내 매물 후기</a></li>
				</ul>
			</nav>
			</c:if>
	      	<div id="filter">
	      		<a href="">최신 순</a><span>&nbsp|&nbsp</span>
	      		<a href="">인기 순</a>
	      	</div>
      			<table class="table">
      				<tr>
      					<th style="width: 100px;">글번호</th>
      					<th style="width: 450px;">제목</th>
      					<th>작성자</th>
      					<th>날짜</th>
      					<th>조회수</th>
      				</tr>
      				
      				<c:forEach items="${list}" var="dto">
      				<tr>
      					<td>${dto.seq}</td>
      					<td>${dto.title}</td>
      					<td>${dto.id}</td>
      					<td>${dto.regdate}</td>
      					<td>${dto.views}</td>
      				</tr>      				
      				</c:forEach>
      				
      				
		
      			</table>
      		</div>
      		
      		<div id="addBoard">
      			<button class="button green">글쓰기</button>
      		</div>
      		
      		<div id="paging">
				
				<nav aria-label="Page navigation example">
				  <ul class="pagination">
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Previous">
				        <span style="color: var(--color-blue)" aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				    <li class="page-item"><a style="color: var(--color-blue)" class="page-link" href="#">1</a></li>
				    <li class="page-item"><a style="color: var(--color-blue)" class="page-link" href="#">2</a></li>
				    <li class="page-item"><a style="color: var(--color-blue)" class="page-link" href="#">3</a></li>
				    <li class="page-item">
				      <a class="page-link" href="#" aria-label="Next">
				        <span style="color: var(--color-blue)" aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
				  </ul>
				</nav>
				
				
			</div>
      		
      		<div id="search">
				<form method="GET" action="/house/reviewboard/userReviewBoardView">
				<table class="search">
					<tr>
						<td>
							<select name="column" class="form-control">
								<option value="region">지역</option>
								<option value="building">건물</option>
							</select>
						</td>
						<td>
							<input type="text" name="word" class="form-control" required>
						</td>
						<td>
							<button class="button blue">
								검색하기
							</button>
						</td>
					</tr>
				</table>
				</form>
			</div>
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