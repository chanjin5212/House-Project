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
	
	/*별점 css*/
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
      	<div style="font-size: var(--large-font)">후기 게시판 글쓰기</div>
      	<form method="post" action="/house/reviewboard/userAdd" enctype="multipart/form-data">
	      	<div style="margin-bottom: 20px;">
				<div id="image_container"></div>
				<div><input type="file" name="attach1" onchange="setThumbnail(event, 1);"></div>
				<div id="filelist"></div>
				<input type="button" value="이미지 추가하기" class="button gray" id="btnfile">
			</div>
			<div id="tableSize">
				<table class="table table-bordered">
					<tr>
						<td>매물 선택하기</td>
						<td>
							<select name="choice" class="form-control" style="width: 400px;">
								<c:forEach items="${addressList}" var="addr">
									<option value="${addr.seq}">${addr.address}</option>	
								</c:forEach>
							</select>
						</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input name="title" type="text" class="form-control" required="required"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea name="content" style="resize: none; height:500px;" class="form-control" required="required"></textarea></td>
					</tr>
					<tr>
						<td>청결</td>
						<td>
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
						</td>
					</tr>
					<tr>
						<td>가격</td>
						<td>
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
						</td>
					</tr>
					<tr>
						<td>위치</td>
						<td>
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
						</td>
					</tr>
					<tr>
						<td>옵션</td>
						<td>
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
						</td>
					</tr>
				</table>
				
			</div>

			<div id="btns">
				<input type="button" class="button gray" value="돌아가기" onclick="location.href='/house/reviewboard/userReviewBoardView'" />
				<button class="button blue">등록하기</button>
			</div>
		</form>
		
		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
	   
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
		
		function del() {
			//alert(this);
			//alert(event.target);
			
			$(event.target).parent().remove();
			$('#img'+num).remove();
		}
    
    	
     	
    </script>
</body>
</html>