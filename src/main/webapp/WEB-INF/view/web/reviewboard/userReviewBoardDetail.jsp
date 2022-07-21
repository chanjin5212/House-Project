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
	section > div {
		margin: auto;
		width: 900px;
	}
	
	#image_container {
		display: flex;
		margin: 0 auto;
	    overflow-x: auto;
	    width: 1200px;
	    height: 400px;
	    margin-top: 50px;
	}
	
	#image_container > img {
		width: 400px;
		hegiht: 398px;
		margin: 0 15px;
	}
	
	/* Style The Dropdown Button */
	.dropStar {
		background-color: transparent;
		padding: 16px;
		font-size: 16px;
		border: none;
		cursor: pointer;
	}
	
	/* The container <div> - needed to position the dropdown content */
	.dropdown {
		position: relative;
		display: inline-block;
	}
	
	/* Dropdown Content (Hidden by Default) */
	.dropStar-content {
		display: none;
		position: absolute;
		background-color: #f9f9f9;
		min-width: 160px;
		box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
		z-index: 1;
	}
	
	/* Links inside the dropdown */
	.dropStar span {
		font-size: var(--small-font);
	}
	
	.dropStar-content a {
		color: black;
		padding: 12px 16px;
		text-decoration: none;
		display: block;
		font-size: var(--small-font);
	}
	
	/* Change color of dropdown links on hover */
	.dropStar-content a:hover {
		background-color: #f1f1f1
	}
	
	#like > i {
		cursor: pointer;
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
      		<c:if test="${count < 3 && count > 0}">
      			<div id="image_container" style="justify-content: center;">
	      			<c:forEach items="${list}" var="filename">
	      				<img src="/house/files/${filename}" />
	      			</c:forEach>
	      		</div>
      		</c:if>
      		
      		<c:if test="${count >= 3}">
	      		<div id="image_container">
	      			<c:forEach items="${list}" var="filename">
	      				<img src="/house/files/${filename}" />
	      			</c:forEach>
	      		</div>
      		</c:if>
      		<div style="margin-top: 50px;">
      			<div><span style="font-size: var(--large-font);">${dto.title}</span></div>
      			<div>${dto.id}</div>
      			<div>${dto.regdate} 조회${dto.views}</div>
      			<div>매물:${address}</div>
      			<div class="dropdown">
	      			<button class="dropStar">
	      				<span>별점 평균:${avg}</span><i class="fa-solid fa-caret-down"></i>
	      			</button>
	      			<div class="dropStar-content">
						<div>청결 : 
							<c:forEach begin="1" end="${dto.cleanStar}">
								★
							</c:forEach>
						</div>
						<div>가격 : 
							<c:forEach begin="1" end="${dto.priceStar}">
								★
							</c:forEach>
						</div>
						<div>위치 : 
							<c:forEach begin="1" end="${dto.locationStar}">
								★
							</c:forEach>
						</div>
						<div>옵션 : 
							<c:forEach begin="1" end="${dto.optionStar}">
								★
							</c:forEach>
						</div>
					</div>
      			</div>
      			<hr>
      			<div style="margin-bottom: 50px;">
      				${dto.content}
      			</div>
      			<div style="display: flex; justify-content: center; align-items: center;">
      				
      				<div id="like" style="position: relative;">
      					<i onclick="goodchoice();" style="color: var(--color-blue);" class="fa-solid fa-thumbs-up fa-3x fa-inverse"></i>
      				<div style="position: absolute; left: 0; bottom: 0; left: 1.5em; top: 1em;"><span id="good">${good}</span></div>
      				</div>
      			</div>
      			<hr>
      			<c:if test="${dto.id == auth}">
	      			<div style="display: flex; justify-content: right;">
	      				<input onclick="delOk();" type="button" value="삭제하기" class="button green" />
	      				<input onclick="location.href='/house/reviewboard/userEdit?seq=${dto.seq}'" type="button" value="수정하기" class="button blue" />
	      			</div>
      			</c:if>
      			<div style="margin-bottom: 400px;">
      				<input type="button" value="목록으로" class="button gray" onclick="location.href='/house/reviewboard/userReviewBoardView'" />
      			</div>
      			
      		</div>
		
		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
    	function delOk() {
    		
    		if(confirm('삭제하시겠습니까?')) {
    			location.href="/house/reviewboard/userDel?seq=${dto.seq}";
    		}
    		
    	}
    
	    function goodchoice() {

	        $.ajax({
	          type: 'POST',
	          url: '/house/reviewboard/userGood',
	          data: 'seq=' + ${dto.seq},
	          dataType: 'json',
	          success: function(result) {
	
	            if (result.result == "1") {
	
	              $("#good").html(result.good);
	
	            } else if (result.result == "2") {
	            	alert('이미 추천하셨습니다.');
	            }
	
	          },
	          error: function (a,b,c) {
	            console.log(a,b,c);
	          }
	        });
	
	      }
    
	    $('.dropStar').click(function(e) {
	        if($('.dropStar-content').css('display') == 'block') {
	        	$('.dropStar > i').remove();
	        	$('.dropStar').append('<i class="fa-solid fa-caret-down"></i>');
	            $('.dropStar-content').css('display', 'none');
	        } else if($('.dropStar-content').css('display') == 'none') {
	            $('.dropStar-content').css('display', 'block');
	        	$('.dropStar > i').remove();
	        	$('.dropStar').append('<i class="fa-solid fa-caret-up"></i>');
	        }
	    });
    

    </script>
</body>
</html>