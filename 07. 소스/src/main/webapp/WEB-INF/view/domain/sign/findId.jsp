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

	height: 800px;

}


.findid{
	width: 500px;
	height: 600px;
	margin: 200px auto;
	border: 1px solid rgb(245, 245, 245);
	
}

form {
	
	width: 400px;
	margin: 0 auto;
	
	
}

.findid-title {
	
	font-size: var(--large-font);
	text-align: center;
	margin-top: 100px;
	font-weight: bold;
	
	

}

.label-area {
	text-align: left;
}

.label-text {
	font-size: var(--middle-font);
	margin-top: 20px;

}
.findid .form-control {
	width: 400px;
	height: 44px;

}



.button.blue.find-idbtn{
	text-align: center;
	width: 150px;
	height: 38px;
	margin-top: 30px;
	margin-left: 38px;
	border-radius: 0.25rem;
	background-color: var(--color-blue);
	color: white;
	
}

.undo {
	width: 150px;
	margin-bottom: 5px;
	margin-left: 15px;
	height: 38px;
	background-color: var(--color-gray);
	color: white;
	
	
	

}






</style>


</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      		
      		<div class="findid">
      		
      			
      			
					<form method="POST" action="/house/domain/sign/findIdResult">
		      			<p class="findid-title">아이디 찾기</p>
		      			
		      				<p style="text-align: center;">가입 시 입력하신 이메일을 통해 찾을 수 있습니다.</p>
							<div class="label-area">	
			      				<label class="input-with-label">
			      		
									<p class="label-text">이름</p>
										
										<input type="text" name="name" class="form-control" placeholder="이름 입력" required>
								</label>
									
							</div>
							
							
							<div class="label-area">
								<label class="input-with-label">
								
										
										
									<p class="label-text">이메일</p>
										<input type="text" name="email" class="form-control" placeholder="이메일 입력" required>
										
								</label>
							</div>
							
						
							<input type="submit" value="아이디 찾기" class="button blue find-idbtn">
							
							<button class="btn btn-outline-secondary undo" onclick="history.back();">취소</button> 
								
							
						
						
				</form>
      		
      		</div>
      		
      		
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
	  
    
    
    
    
    
    
    
        
    </script>
</body>
</html>