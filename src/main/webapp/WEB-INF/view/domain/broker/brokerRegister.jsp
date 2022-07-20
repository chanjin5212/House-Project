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
<style>

section{

	height: 2000px;

}

section > h1{

	text-align: center;
	font-weight: bold;
	margin-top: 100px;

}


.register-container {

	width: 900px;
	height: 1200px;
	margin: 50px auto;
	border: 1px solid rgb(245, 245, 245);
	text-align: center;
	
}
	

</style>



<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      	
      	<h1>중개사 회원가입</h1>
      	
      	<div class="register-container">
      	
      		<div class="icon_box">
      	
      		<div class="icon">
      		<i class="fa-solid fa-magnifying-glass fa-6x"></i>
      		<p class="icon-info" >회원 정보 등록</p>
      	
      	
      		</div>
      		
      		</div>	
      	
      	
 	<div class="agent-search-layer" id="agent-search-layer">
    	<div class="box">
        <div class="i-title">
            중개사무소 찾기
            <button type="button" onClick="$('#agent-search-layer').hide();"><span class="zbIcon icon-close2"></span></button> 
        </div>

        <div class="i-cont">
            <input type="text" typeahead-select-on-blur="true"  placeholder="예)종로 베스트공인 김직방" id="agent-search-input" /> 
			<div class="i-ex">
				중개사무소 이름, 대표자명, 주소를 조합하여 <strong>국가공간정보포털의 부동산중개업 정보에 등록된 정보를</strong> 검색할 수 있습니다. <br />
				중개사무소가 검색되지 않을 경우1661-8734로 문의주세요.
			</div>
			<div class="i-result">
				<strong>주소</strong> <span class="i-addr"></span>
				<strong>대표번호 </strong>  <span class="i-tel"></span>
				<button onclick="onClickSetAgent()">확인</button>

			</div>
        </div>  
    </div> 
</div>	
      	</div>
      	
      	
      	
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    
    
    	function agentLayerShow() {
        var input = $("#agent-search-input");
        input.val("")
        $("#agent-search-layer").show();
        $("#agent-search-layer .i-ex").show();
        $("#agent-search-layer .i-result").hide();
        var agentAddr = new Bloodhound({
	        datumTokenizer: function(d) {
		        return Bloodhound.tokenizers.whitespace(d.val);
	        },
	        limit: 200,
	        queryTokenizer: Bloodhound.tokenizers.whitespace,
	        remote: {
		        url: apis_host + "/search?q=%QUERY&searchType[0]=realtyagency",
		        filter: function(data) {
			        return data.items;
		        }
	        }
        }); 
        
        agentAddr.initialize(); 
        input.typeahead({ highlight: true },{
	        name: 'agent',
	        displayKey: 'agent',
	        source: agentAddr.ttAdapter(),
	        templates: {
		        empty: ['<div class="empty" style="background:white">검색되는 정보가 없습니다.</div>'].join('\n'),
		        suggestion: function(data) {
			        if (data.name) { 
				        return "<p>" + data.name + " (" + data._source.ceo_name + ") <span>" + data._source.nsdi_address + "</span></p>";
			        }
		        }
	        }
        });
        
        
        function onClickSetAgent() {
			$(".item-search-box div").show()
			$("#agent-search-layer").hide();
			$("#agent_name").text(setAgent.name)
			$("#req_user").text(setAgent.ceoName)
			$("#address1").text(setAgent.address)
			$("#agent-tel").text(setAgent.tel)  
		}
    
    
    </script>
</body>
</html>