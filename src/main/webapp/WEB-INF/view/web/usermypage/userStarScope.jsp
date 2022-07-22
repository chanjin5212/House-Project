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
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
     <div class="wrap">
    <h1>${brokername} 중개사님에 몇점을 주시겠습니까?</h1>
    <!--  -->
    <form name="reviewform" class="reviewform" method="post" action="/house/web/usermypage/userStarScopeOk">
        <input type="hidden" name="rate" id="rate" value="0"/>
        <input type="hidden" name="seq" value="${seq}"/>
   
 
    <div class="myform">
   <input type="radio" name="star" value="5" id="cleanRate1"><label
   for="cleanRate1">★</label>
   <input type="radio" name="star" value="4" id="cleanRate2"><label
   for="cleanRate2">★</label>
   <input type="radio" name="star" value="3" id="cleanRate3"><label
   for="cleanRate3">★</label>
   <input type="radio" name="star" value="2" id="cleanRate4"><label
   for="cleanRate4">★</label>
   <input type="radio" name="star" value="1" id="cleanRate5"><label
   for="cleanRate5">★</label>
</div>
  
        <div class="cmd">
            <!--  <input type="button" name="save" id="save" value="등록">-->
                 <input type="button" value="돌아 가기" class="button blue loginbtn" onclick="location.href='/house/web/usermypage/userCounsel'">
             <input type="submit" value="별점 등록" class="button blue loginbtn">
             	      
             	         
        </div>
    </form>
</div>
      		
      </section>
<%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>

    function Rating(){};
    Rating.prototype.rate = 0;
    Rating.prototype.setRate = function(newrate){
 
        this.rate = newrate;
        let items = document.querySelectorAll('.rate_radio');
        items.forEach(function(item, idx){
            if(idx < newrate){
                item.checked = true;
            }else{
                item.checked = false;
            }
        });
    }
    let rating = new Rating();
    </script>
</body>
</html>