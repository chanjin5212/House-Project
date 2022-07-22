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
	
	section > form > div#tableSize > table {
		margin: auto;
		width: 900px;
	}	
	section > form > div#tableSize > table tr > td:nth-child(1) {
	width: 150px;
	text-align: center;
	}
	
	form > div {
		width: 900px;
		margin: 50px auto;
	}
	
	#image_container {
		display: flex;
		margin: 0 auto;
	    overflow-x: auto;
	    width: 900px;
	    height: 420px;
	}
	
	section > div {
		width: 900px;
		margin: 50px auto;
	}
	
	#addImage {
		width: 900px;
		margin: 0 auto;
	}
	
	#image_container > img {
		width: 400px;
		height: 400px;
	    margin: 0 15px;
	}
	
	#btns {
		display: flex;
		justify-content: right;
		width: 900px;
		margin: 50px auto;
	}
	
	.myform {
    display: inline-block;
    direction: rtl;
    border:0;
	}
	.myform legend{
	    text-align: right;
	}
	.myform input[type=radio]{
	    display: none;
	}
	.myform label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	.myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	.myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	.myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
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
      	<div style="font-size: var(--large-font)">후기 게시판 글수정</div>
      	<form method="post" action="/house/reviewboard/userEdit" enctype="multipart/form-data">
      		<input type="hidden" name="seq" value="${seq}" />
      		<div style="margin-bottom: 20px;">
				<div id="image_container">
					<c:forEach items="${list}" var="dto">
	      				<img src="/house/files/${dto.jpg}" id="img${dto.seq}"/>
	      				<div><input onclick="imgDel(${dto.seq});" type="button" class="button gray" value="X" id="btn${dto.seq}"/></div>
	      			</c:forEach>
				</div>
				<div><input type="file" name="attach1" onchange="setThumbnail(event, 1);"></div>
				<div id="filelist"></div>
				<input type="button" value="이미지 추가하기" class="button gray" id="btnfile">
			</div>
			<div id="tableSize">
				<table class="table table-bordered">
					<tr>
						<td>제목</td>
						<td><input name="title" type="text" class="form-control" value="${dto.title}" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" style="resize: none; height:500px;" class="form-control">${dto.content}</textarea></td>
					</tr>
					<tr>
						<td>청결</td>
						<td>
							<c:if test="${dto.cleanStar == 5}">
								<div class="myform">
									<input type="radio" name="cleanStar" value="5" id="cleanRate1" checked="checked"><label
										for="cleanRate1">★</label>
									<input type="radio" name="cleanStar" value="4" id="cleanRate2"><label
										for="cleanRate2">★</label>
									<input type="radio" name="cleanStar" value="3" id="cleanRate3"><label
										for="cleanRate3">★</label>
									<input type="radio" name="cleanStar" value="2" id="cleanRate4"><label
										for="cleanRate4">★</label>
									<input type="radio" name="cleanStar" value="1" id="cleanRate5"><label
										for="cleanRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.cleanStar == 4}">
								<div class="myform">
									<input type="radio" name="cleanStar" value="5" id="cleanRate1"><label
										for="cleanRate1">★</label>
									<input type="radio" name="cleanStar" value="4" id="cleanRate2" checked="checked"><label
										for="cleanRate2">★</label>
									<input type="radio" name="cleanStar" value="3" id="cleanRate3"><label
										for="cleanRate3">★</label>
									<input type="radio" name="cleanStar" value="2" id="cleanRate4"><label
										for="cleanRate4">★</label>
									<input type="radio" name="cleanStar" value="1" id="cleanRate5"><label
										for="cleanRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.cleanStar == 3}">
								<div class="myform">
									<input type="radio" name="cleanStar" value="5" id="cleanRate1"><label
										for="cleanRate1">★</label>
									<input type="radio" name="cleanStar" value="4" id="cleanRate2"><label
										for="cleanRate2">★</label>
									<input type="radio" name="cleanStar" value="3" id="cleanRate3" checked="checked"><label
										for="cleanRate3">★</label>
									<input type="radio" name="cleanStar" value="2" id="cleanRate4"><label
										for="cleanRate4">★</label>
									<input type="radio" name="cleanStar" value="1" id="cleanRate5"><label
										for="cleanRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.cleanStar == 2}">
								<div class="myform">
									<input type="radio" name="cleanStar" value="5" id="cleanRate1"><label
										for="cleanRate1">★</label>
									<input type="radio" name="cleanStar" value="4" id="cleanRate2"><label
										for="cleanRate2">★</label>
									<input type="radio" name="cleanStar" value="3" id="cleanRate3"><label
										for="cleanRate3">★</label>
									<input type="radio" name="cleanStar" value="2" id="cleanRate4" checked="checked"><label
										for="cleanRate4">★</label>
									<input type="radio" name="cleanStar" value="1" id="cleanRate5"><label
										for="cleanRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.cleanStar == 1}">
								<div class="myform">
									<input type="radio" name="cleanStar" value="5" id="cleanRate1"><label
										for="cleanRate1">★</label>
									<input type="radio" name="cleanStar" value="4" id="cleanRate2"><label
										for="cleanRate2">★</label>
									<input type="radio" name="cleanStar" value="3" id="cleanRate3"><label
										for="cleanRate3">★</label>
									<input type="radio" name="cleanStar" value="2" id="cleanRate4"><label
										for="cleanRate4">★</label>
									<input type="radio" name="cleanStar" value="1" id="cleanRate5" checked="checked"><label
										for="cleanRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.cleanStar == 0}">
								<div class="myform">
									<input type="radio" name="cleanStar" value="5" id="cleanRate1"><label
										for="cleanRate1">★</label>
									<input type="radio" name="cleanStar" value="4" id="cleanRate2"><label
										for="cleanRate2">★</label>
									<input type="radio" name="cleanStar" value="3" id="cleanRate3"><label
										for="cleanRate3">★</label>
									<input type="radio" name="cleanStar" value="2" id="cleanRate4"><label
										for="cleanRate4">★</label>
									<input type="radio" name="cleanStar" value="1" id="cleanRate5"><label
										for="cleanRate5">★</label>
								</div>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>
							<c:if test="${dto.priceStar == 5}">
								<div class="myform">
									<input type="radio" name="priceStar" value="5" id="priceRate1" checked="checked"><label
										for="priceRate1">★</label>
									<input type="radio" name="priceStar" value="4" id="priceRate2"><label
										for="priceRate2">★</label>
									<input type="radio" name="priceStar" value="3" id="priceRate3"><label
										for="priceRate3">★</label>
									<input type="radio" name="priceStar" value="2" id="priceRate4"><label
										for="priceRate4">★</label>
									<input type="radio" name="priceStar" value="1" id="priceRate5"><label
										for="priceRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.priceStar == 4}">
								<div class="myform">
									<input type="radio" name="priceStar" value="5" id="priceRate1"><label
										for="priceRate1">★</label>
									<input type="radio" name="priceStar" value="4" id="priceRate2" checked="checked"><label
										for="priceRate2">★</label>
									<input type="radio" name="priceStar" value="3" id="priceRate3"><label
										for="priceRate3">★</label>
									<input type="radio" name="priceStar" value="2" id="priceRate4"><label
										for="priceRate4">★</label>
									<input type="radio" name="priceStar" value="1" id="priceRate5"><label
										for="priceRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.priceStar == 3}">
								<div class="myform">
									<input type="radio" name="priceStar" value="5" id="priceRate1"><label
										for="priceRate1">★</label>
									<input type="radio" name="priceStar" value="4" id="priceRate2"><label
										for="priceRate2">★</label>
									<input type="radio" name="priceStar" value="3" id="priceRate3" checked="checked"><label
										for="priceRate3">★</label>
									<input type="radio" name="priceStar" value="2" id="priceRate4"><label
										for="priceRate4">★</label>
									<input type="radio" name="priceStar" value="1" id="priceRate5"><label
										for="priceRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.priceStar == 2}">
								<div class="myform">
									<input type="radio" name="priceStar" value="5" id="priceRate1"><label
										for="priceRate1">★</label>
									<input type="radio" name="priceStar" value="4" id="priceRate2"><label
										for="priceRate2">★</label>
									<input type="radio" name="priceStar" value="3" id="priceRate3"><label
										for="priceRate3">★</label>
									<input type="radio" name="priceStar" value="2" id="priceRate4" checked="checked"><label
										for="priceRate4">★</label>
									<input type="radio" name="priceStar" value="1" id="priceRate5"><label
										for="priceRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.priceStar == 1}">
								<div class="myform">
									<input type="radio" name="priceStar" value="5" id="priceRate1"><label
										for="priceRate1">★</label>
									<input type="radio" name="priceStar" value="4" id="priceRate2"><label
										for="priceRate2">★</label>
									<input type="radio" name="priceStar" value="3" id="priceRate3"><label
										for="priceRate3">★</label>
									<input type="radio" name="priceStar" value="2" id="priceRate4"><label
										for="priceRate4">★</label>
									<input type="radio" name="priceStar" value="1" id="priceRate5" checked="checked"><label
										for="priceRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.priceStar == 0}">
								<div class="myform">
									<input type="radio" name="priceStar" value="5" id="priceRate1"><label
										for="priceRate1">★</label>
									<input type="radio" name="priceStar" value="4" id="priceRate2"><label
										for="priceRate2">★</label>
									<input type="radio" name="priceStar" value="3" id="priceRate3"><label
										for="priceRate3">★</label>
									<input type="radio" name="priceStar" value="2" id="priceRate4"><label
										for="priceRate4">★</label>
									<input type="radio" name="priceStar" value="1" id="priceRate5"><label
										for="priceRate5">★</label>
								</div>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>위치</td>
						<td>
							<c:if test="${dto.locationStar == 5}">
								<div class="myform">
									<input type="radio" name="locationStar" value="5" id="locationRate1" checked="checked"><label
										for="locationRate1">★</label>
									<input type="radio" name="locationStar" value="4" id="locationRate2"><label
										for="locationRate2">★</label>
									<input type="radio" name="locationStar" value="3" id="locationRate3"><label
										for="locationRate3">★</label>
									<input type="radio" name="locationStar" value="2" id="locationRate4"><label
										for="locationRate4">★</label>
									<input type="radio" name="locationStar" value="1" id="locationRate5"><label
										for="locationRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.locationStar == 4}">
								<div class="myform">
									<input type="radio" name="locationStar" value="5" id="locationRate1"><label
										for="locationRate1">★</label>
									<input type="radio" name="locationStar" value="4" id="locationRate2" checked="checked"><label
										for="locationRate2">★</label>
									<input type="radio" name="locationStar" value="3" id="locationRate3"><label
										for="locationRate3">★</label>
									<input type="radio" name="locationStar" value="2" id="locationRate4"><label
										for="locationRate4">★</label>
									<input type="radio" name="locationStar" value="1" id="locationRate5"><label
										for="locationRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.locationStar == 3}">
								<div class="myform">
									<input type="radio" name="locationStar" value="5" id="locationRate1"><label
										for="locationRate1">★</label>
									<input type="radio" name="locationStar" value="4" id="locationRate2"><label
										for="locationRate2">★</label>
									<input type="radio" name="locationStar" value="3" id="locationRate3" checked="checked"><label
										for="locationRate3">★</label>
									<input type="radio" name="locationStar" value="2" id="locationRate4"><label
										for="locationRate4">★</label>
									<input type="radio" name="locationStar" value="1" id="locationRate5"><label
										for="locationRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.locationStar == 2}">
								<div class="myform">
									<input type="radio" name="locationStar" value="5" id="locationRate1"><label
										for="locationRate1">★</label>
									<input type="radio" name="locationStar" value="4" id="locationRate2"><label
										for="locationRate2">★</label>
									<input type="radio" name="locationStar" value="3" id="locationRate3"><label
										for="locationRate3">★</label>
									<input type="radio" name="locationStar" value="2" id="locationRate4" checked="checked"><label
										for="locationRate4">★</label>
									<input type="radio" name="locationStar" value="1" id="locationRate5"><label
										for="locationRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.locationStar == 1}">
								<div class="myform">
									<input type="radio" name="locationStar" value="5" id="locationRate1"><label
										for="locationRate1">★</label>
									<input type="radio" name="locationStar" value="4" id="locationRate2"><label
										for="locationRate2">★</label>
									<input type="radio" name="locationStar" value="3" id="locationRate3"><label
										for="locationRate3">★</label>
									<input type="radio" name="locationStar" value="2" id="locationRate4"><label
										for="locationRate4">★</label>
									<input type="radio" name="locationStar" value="1" id="locationRate5" checked="checked"><label
										for="locationRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.locationStar == 0}">
								<div class="myform">
									<input type="radio" name="locationStar" value="5" id="locationRate1"><label
										for="locationRate1">★</label>
									<input type="radio" name="locationStar" value="4" id="locationRate2"><label
										for="locationRate2">★</label>
									<input type="radio" name="locationStar" value="3" id="locationRate3"><label
										for="locationRate3">★</label>
									<input type="radio" name="locationStar" value="2" id="locationRate4"><label
										for="locationRate4">★</label>
									<input type="radio" name="locationStar" value="1" id="locationRate5"><label
										for="locationRate5">★</label>
								</div>
							</c:if>
						</td>
					</tr>
					<tr>
						<td>옵션</td>
						<td>
							<c:if test="${dto.optionStar == 5}">
								<div class="myform">
									<input type="radio" name="optionStar" value="5" id="optionRate1" checked="checked"><label
										for="optionRate1">★</label>
									<input type="radio" name="optionStar" value="4" id="optionRate2"><label
										for="optionRate2">★</label>
									<input type="radio" name="optionStar" value="3" id="optionRate3"><label
										for="optionRate3">★</label>
									<input type="radio" name="optionStar" value="2" id="optionRate4"><label
										for="optionRate4">★</label>
									<input type="radio" name="optionStar" value="1" id="optionRate5"><label
										for="optionRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.optionStar == 4}">
								<div class="myform">
									<input type="radio" name="optionStar" value="5" id="optionRate1"><label
										for="optionRate1">★</label>
									<input type="radio" name="optionStar" value="4" id="optionRate2" checked="checked"><label
										for="optionRate2">★</label>
									<input type="radio" name="optionStar" value="3" id="optionRate3"><label
										for="optionRate3">★</label>
									<input type="radio" name="optionStar" value="2" id="optionRate4"><label
										for="optionRate4">★</label>
									<input type="radio" name="optionStar" value="1" id="optionRate5"><label
										for="optionRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.optionStar == 3}">
								<div class="myform">
									<input type="radio" name="optionStar" value="5" id="optionRate1"><label
										for="optionRate1">★</label>
									<input type="radio" name="optionStar" value="4" id="optionRate2"><label
										for="optionRate2">★</label>
									<input type="radio" name="optionStar" value="3" id="optionRate3" checked="checked"><label
										for="optionRate3">★</label>
									<input type="radio" name="optionStar" value="2" id="optionRate4"><label
										for="optionRate4">★</label>
									<input type="radio" name="optionStar" value="1" id="optionRate5"><label
										for="optionRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.optionStar == 2}">
								<div class="myform">
									<input type="radio" name="optionStar" value="5" id="optionRate1"><label
										for="optionRate1">★</label>
									<input type="radio" name="optionStar" value="4" id="optionRate2"><label
										for="optionRate2">★</label>
									<input type="radio" name="optionStar" value="3" id="optionRate3"><label
										for="optionRate3">★</label>
									<input type="radio" name="optionStar" value="2" id="optionRate4" checked="checked"><label
										for="optionRate4">★</label>
									<input type="radio" name="optionStar" value="1" id="optionRate5"><label
										for="optionRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.optionStar == 1}">
								<div class="myform">
									<input type="radio" name="optionStar" value="5" id="optionRate1"><label
										for="optionRate1">★</label>
									<input type="radio" name="optionStar" value="4" id="optionRate2"><label
										for="optionRate2">★</label>
									<input type="radio" name="optionStar" value="3" id="optionRate3"><label
										for="optionRate3">★</label>
									<input type="radio" name="optionStar" value="2" id="optionRate4"><label
										for="optionRate4">★</label>
									<input type="radio" name="optionStar" value="1" id="optionRate5" checked="checked"><label
										for="optionRate5">★</label>
								</div>
							</c:if>
							<c:if test="${dto.optionStar == 0}">
								<div class="myform">
									<input type="radio" name="optionStar" value="5" id="optionRate1"><label
										for="optionRate1">★</label>
									<input type="radio" name="optionStar" value="4" id="optionRate2"><label
										for="optionRate2">★</label>
									<input type="radio" name="optionStar" value="3" id="optionRate3"><label
										for="optionRate3">★</label>
									<input type="radio" name="optionStar" value="2" id="optionRate4"><label
										for="optionRate4">★</label>
									<input type="radio" name="optionStar" value="1" id="optionRate5"><label
										for="optionRate5">★</label>
								</div>
							</c:if>
						</td>
					</tr>
				</table>
				
			</div>
			<div id="btns">
				<input type="button" class="button gray" value="돌아가기" onclick="location.href='/house/reviewboard/userReviewBoardDetail?seq=${seq}'" />
				<button class="button blue">수정하기</button>
			</div>
		</form>
		
		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
	    function imgDel(num) {

	    	let rem = document.getElementById('img'+num);
	    	let brem = document.getElementById('btn'+num);
	
	        $.ajax({
	          type: 'POST',
	          url: '/house/reviewboard/imgDel',
	          data: 'seq=' + num,
	          dataType: 'json',
	          success: function(result) {
	
	            if (result.result == "1") {
	
	              rem.remove();
	              brem.remove();
	
	            } 
	
	          },
	          error: function (a,b,c) {
	            console.log(a,b,c);
	          }
	        });
	
	      }
    
	   
	    String.format = function() {
	        var theString = arguments[0];
	        for (var i = 1; i < arguments.length; i++) {
	            var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
	            theString = theString.replace(regEx, arguments[i]);
	        }
	        
	        return theString;
	    }
    
	    function setThumbnail(event, num) {
	        var reader = new FileReader();
			if (document.getElementById("img"+num)){
				document.getElementById("img"+num).remove();
			}
	        reader.onload = function(event) {
	          var img = document.createElement("img");
	          img.setAttribute("src", event.target.result);
	          img.setAttribute("id", "img" + num);
	          document.querySelector("div#image_container").appendChild(img);
	        };
	
	        reader.readAsDataURL(event.target.files[0]);
	      }
	    
		let no = 2;
		
		$('#btnfile').click(function() {
			
			let temp = String.format('<div><input type="file" name="attach{0}" onchange="setThumbnail(event, {0});"><span onclick="del({0});">&times;</span></div>', no, no, no);
			
			$('#filelist').append(temp);
			
			no++;
			
		});	
		
		function del(num) {
			//alert(this);
			//alert(event.target);
			
			$(event.target).parent().remove();
			$('#img'+num).remove();
		}
    

    </script>
</body>
</html>