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
.label-area{

	height: 1200px;
	float: left;

}

.label-text{

	text-align: center;
	margin-top: 100px;
	font-size: var(--large-font);
}

.firmName{

	width: 400px;
	margin: 0 auto;
	margin-top: 50px;
}





.firmCheck{

	display: flex;

}




#result{

	width: 400px;
	margin: 0 auto;
}


#brokerbtn{

	margin: 0 auto;
	height: 38px;
	margin-top: 48px;
	margin-left: 10px;

}

.line{

	display: flex;
	width: 400px;
	margin: 0 auto;
}




</style>


</head>
<body>	
	<main>

      <section>
      		
      		
      		<div class="label-area">


						<div class="label-text">중개 사무소 조회</div>
						
						
						
						

						<div class="line id-line" id="line">
							<input type="text" name="firmName" id="firmName" class="form-control firmName"
								placeholder="중개업소명 입력" required> 							
								<input type="button"
								id="brokerbtn" value="검색" class="fill-button gray firmCheck" >
							

						</div>
						<p class="explanation"></p>
						
						
						<div id="result_box" style="flex-direction: column;">
						
							
							<p id="result"></p>
							
							
						</div>
						
						
							<form style="text-align: center;">
						
							
							<input type="button" class="fill-button blue" value="확인" onclick="broker_check()">
						
							<input type="hidden" id="firmName" name="firmName">
							<input type="hidden" id="firmNum" name="firmNum">
							<input type="hidden" id="firmAddress" name="firmAddress">
							<input type="hidden" id="representName" name="representName">
							
							</form>
						
						
					</div>
      		
      		
      		
      </section>
     
    </main>
    <script>
        
    	
    $(document).ready(function() {
 	   
 	   
 	   $("#brokerbtn").click(function(){
 		   			
 		   
 		   		   //한 번 조회 후 다시 조회하면 출력됐던 정보는 없애기
 		  		   $("span").remove();
 		   
		    	   $.ajax({
		   	    	
			    	   method: "GET",
			    	   url: "http://openapi.nsdi.go.kr/nsdi/EstateBrkpgService/attr/getEBOfficeInfo",
			    	   data: {bsnmCmpnm: $("#firmName").val() , authkey: "5082056b101c10f8a1839c", format: "json", numOfRows: "10"}
			    	  
			    		   
			       
			       })
			       
			       		.done(function(msg) {
			       		
			    	   		console.log(msg.EBOffices.field.length);
			    	   		
			    	   		for(var i = 0; i<msg.EBOffices.field.length; i++){
			    	   			
			    	   			$("#result").append("<span>"+ "<strong>"+"중개업소명: " + "</strong>"+ msg.EBOffices.field[i].bsnmCmpnm + "<br>" + "<strong>"+"사업자 대표명: "  + "</strong>" +msg.EBOffices.field[i].brkrNm + "<br>" + "<strong>"+ "중개업소 주소: "   + "</strong>" + msg.EBOffices.field[i].ldCodeNm  + "<br><br>"  +"</span>");
				    	   		
			    	   		}
		    	   			
		    	   
		    	   		//console.log($('#result span').text());
		    	   		
		    	   		$('#firmName').val(msg.EBOffices.field[0].bsnmCmpnm);
		    	   		$('#firmNum').val(msg.EBOffices.field[0].jurirno);
		    	   		$('#firmAddress').val(msg.EBOffices.field[0].ldCodeNm);
		    	   		$('#representName').val(msg.EBOffices.field[0].brkrNm);
		    	   		
		    	   		console.log($('#firmName').val());
			    	   		
			       		});
		    	   
		    	 
		    	   
                   
		    	   
                   
		    	   
		       })
 	   })
 	   

		    	   function broker_check(){
		    		   
		    		    
		    		   
		    		    $(opener.document).find("#firmName").val($("#firmName").val());
		    		    $(opener.document).find("#firmNum").val($("#firmNum").val());
		    		    $(opener.document).find("#firmAddress").val($("#firmAddress").val());
		    		    $(opener.document).find("#representName").val($("#representName").val());
		    	   		
		    		    
		    		    window.close();
		    		   
		    		   
		    	   }
    
    
    
    
    
    </script>
</body>
</html>