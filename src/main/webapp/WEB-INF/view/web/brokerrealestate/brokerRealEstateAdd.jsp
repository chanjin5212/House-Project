<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0202686bf75bcc93c7133b1e58c7ac49&libraries=services"></script>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<style>

section > form {
	margin-top: 30px;
}

section > form > div {

	width: 500px;
	margin: 10px auto;
}
section > form > div > #sample5_address {
	width: 300px;
}

#att_zone {
  width: 660px;
  min-height: 150px;
  padding: 10px;
  border: 1px dotted #00f;
}

#att_zone:empty:before {
  content: attr(data-placeholder);
  color: #999;
  font-size: .9em;
}
section > form > div#optionCheck > input,
section > form > div#feeCheck > input {
	margin-right: 10px;
}

section > form > div > div#structure > input {
	width: 50px;
}

section > form > div > input {
	margin: 2px 2px 2px 2px;
}

</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/brokerHeader.jsp" %>
      <section>
      	<form id="formData" method="POST" action="/house/brokerrealestate/brokerRealEstateAdd" enctype="multipart/form-data">
      		<div>
      			계약 종류
      			<select name="selectContract" id="selectContract">
      				<c:forEach items="${cList}" var="cdto">
      					<option value="${cdto.seq}">${cdto.contractName}</option>
      				</c:forEach>
      			</select>
      			건물 종류
      			<select name="selectBuilding">
      				<c:forEach items="${bList}" var="bdto">
      					<option value="${bdto.seq}">${bdto.buildingTypeName}</option>
      				</c:forEach>
      			</select>
      		</div>
      		<div id="deposit">
      			보증금 : <input type="text" name="deposit" required="required" />
      		</div>
      		<div>
      			가격 : <input type="text" name="price" required="required" />
      		</div>
      		<div>
      			중개보수 : <input type="text" name="brokerReward" required="required" />
      		</div>
      		<div>
      			입주가능일: <input type="date" name="moveInDate" required="required">
      		</div>
      		<hr>
      		<div style="font-size: var(--middle-font);">관리비</div>
      		<div>
      			총액 : <input type="text" name="amount" required="required" />
      		</div>
      		<div id="feeCheck">
      			전기세 포함 <input type="checkbox" name="electricityBill" value="y">
      			가스비 포함 <input type="checkbox" name="gasBill" value="y">
      			수도세 포함 <input type="checkbox" name="waterBill" value="y">
      			TV요금 포함 <input type="checkbox" name="televisionBill" value="y"><br>
      			인터넷 요금 포함 <input type="checkbox" name="internetBill" value="y">
      			주차비 포함 <input type="checkbox" name="parkingBill" value="y">
      		</div>
      		<hr>
      		
      		<div style="font-size: var(--middle-font);">옵션 정보</div>
      		<div id="optionCheck">
      			애완동물 가능 <input type="checkbox" name="petOk" value="y">
      			대출 가능 <input type="checkbox" name="loanOk" value="y">
      			TV <input type="checkbox" name="television" value="y">
      			에어컨 <input type="checkbox" name="airConditioner" value="y">
      			냉장고 <input type="checkbox" name="refrigerator" value="y"><br>
      			세탁기 <input type="checkbox" name="washingMachine" value="y">
      			건조기 <input type="checkbox" name="dryer" value="y">
      			인덕션 <input type="checkbox" name="induction" value="y">
      			가스레인지 <input type="checkbox" name="gasRange" value="y">
      			책상 <input type="checkbox" name="desk" value="y">
      			책장 <input type="checkbox" name="bookshelf" value="y"><br>
      			침대 <input type="checkbox" name="bed" value="y">
      			옷장 <input type="checkbox" name="closet" value="y">
      			식기세척기 <input type="checkbox" name="dishWasher" value="y">
      			신발장 <input type="checkbox" name="shoeCloset" value="y"><br>
      			주차여부 <input type="checkbox" id="parking" onclick="showHideBox();" name="parkingStatus" value="y" checked="checked">
      			<div id="pargkinNumber">주차 가능수 <input type="number" name="numParkSpace" style="width:50px;" required="required"/></div>
      		</div>
      		<hr>
      		<div>
      			<div style="font-size: var(--middle-font);">구조 정보</div><br>
      			<div id="structure">
      				주용도 
	      			<select name="selectMainUse">
	      				<c:forEach items="${mList}" var="mdto">
	      					<option value="${mdto.seq}">${mdto.mainUseName}</option>
	      				</c:forEach>
	      			</select>
	      			방종류
	      			<select name="selectRoomType">
	      				<c:forEach items="${rList}" var="rdto">
	      					<option value="${rdto.seq}">${rdto.roomTypeName}</option>
	      				</c:forEach>
	      			</select>
	      			<br>
	      			난방 종류
	      			<select name="selectHeatingType">
	      				<option value="개별">개별</option>
	      				<option value="지역">지역</option>
	      				<option value="중앙">중앙</option>
	      			</select>
	      			방향
	      			<select name="selectDirection">
	      				<option value="남향">남향</option>
	      				<option value="동향">동향</option>
	      				<option value="서향">서향</option>
	      				<option value="북향">북향</option>
	      			</select>
	      			<br>
	      			방 개수 <input type="number" name="numRoom" required="required" />
	      			화장실 개수 <input type="number" name="numToilets" required="required" />
	      			베란다/발코니 개수 <input type="number" name="numBalcony" required="required" /><br>
	      			건물층 <input type="number" name="buildingFloor" required="required" />
	      			해당층 <input type="number" name="theFloor" required="required" />
	      			전용면적 <input type="number" name="dedicatedArea" required="required" />
	      			공급면적 <input type="number" name="supplyArea" required="required" /><br>
	      			엘리베이터 <input type="checkbox" name="elevatorStatus" value="y">
	      			빌트인 <select name="built">
	      				<option value="아님">아님</option>
	      				<option value="있음">있음</option>
	      			</select>
      			</div>
      		</div>
      		<hr>
      		<div>
      			<div style="font-size: var(--middle-font);">집주인 정보</div><br>
      			이름 <input type="text" name="ownerName" style="width: 100px;" required="required" /> 주민번호 <input type="text" name="ownerSsn" required="required" /><br>
      			주소 <input type="text" name="ownerAddress" required="required" />
      			휴대전화 <input name="ownerTel1" style="width: 40px;" type="text" value="010" readonly />- <input name="ownerTel2" style="width: 60px;" type="text" required="required" />-<input name="ownerTel3" style="width: 60px;" type="text" required="required" />
      		</div>
      		<hr>
      		<div>
      			<div style="font-size: var(--middle-font);">집주인 대리인</div><br>
      			이름 <input name="deputyName" type="text" style="width: 100px;" required="required" /> 주민번호 <input name="deputySsn" type="text" required="required" /><br>
      			주소 <input name="deputyAddress" type="text" required="required" />
      		</div>
      		<hr>
      		<div>
      			<div style="font-size: var(--middle-font);">상세 내용</div><br>
   				<textarea name="introduce" cols="70" rows="10" style="resize: none;" required="required"></textarea>
      		</div>
      		<hr>
      		<div>
	      		<input type="text" name="address" id="sample5_address" placeholder="주소" readonly required="required">
				<input type="button" onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
				<input type="text" name="addressPlus" placeholder="상세주소를 입력하세요." required="required" />
				<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
			</div>
			<hr>
			<div>
				<div><input type="file" name="attach1"></div>
				<div id="filelist"></div>
				<hr>
				<input type="button" value="이미지 추가하기" class="btn btn-secondary" id="btnfile">
			</div>
			<hr>
			<div>
				<button class="btn btn-outline-secondary" onclick="location.href='/house/brokermain/brokerMain'">돌아가기</button>
				<button id="target-btn" class="button blue" disabled="disabled">등록하기</button>
			</div>
			
		</form>
      </section>
      <footer>
      	
      </footer>
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
    
	    let no = 2;
		
		$('#btnfile').click(function() {
			
			let temp = String.format('<div><input type="file" name="attach{0}"><span onclick="del();">&times;</span></div>', no);
			
			$('#filelist').append(temp);
			
			no++;
			
		});
		
		function del() {
			//alert(this);
			//alert(event.target);
			
			$(event.target).parent().remove();
		}
	    
	    $(document).ready(function() {
	    	  $('#selectContract').change(function() {
	    	    var result = $('#selectContract option:selected').val();
	    	    if (result == '1') {
	    	      $('#deposit').show();
	    	      $('input[name=deposit]').attr("required", true);
	    	    } else {
	    	      $('#deposit').hide();
	    	      $('input[name=deposit]').attr("required", false);
	    	    }
	    	  }); 
	    	}); 
	
	    function showHideBox() {
	    	if($('input:checkbox[id="parking"]').is(':checked')==true){
	    		$('#pargkinNumber').show();
	    		$('input[name=numParkSpace]').attr("required", true);
	    	}else{
	    		$('#pargkinNumber').hide();
	    		$('input[name=numParkSpace]').attr("required", false);
	    	}
	    }
	    

		    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
		    mapOption = {
		        center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		        level: 5 // 지도의 확대 레벨
		    };
		
		//지도를 미리 생성
		var map = new daum.maps.Map(mapContainer, mapOption);
		//주소-좌표 변환 객체를 생성
		var geocoder = new daum.maps.services.Geocoder();
		//마커를 미리 생성
		var marker = new daum.maps.Marker({
		    position: new daum.maps.LatLng(37.537187, 127.005476),
		    map: map
		});
		
		
		function sample5_execDaumPostcode() {
			const target = document.getElementById('target-btn');
			target.disabled = false;
		    new daum.Postcode({
		        oncomplete: function(data) {
		            var addr = data.address; // 최종 주소 변수
		
		            // 주소 정보를 해당 필드에 넣는다.
		            document.getElementById("sample5_address").value = addr;
		            // 주소로 상세 정보를 검색
		            geocoder.addressSearch(data.address, function(results, status) {
		                // 정상적으로 검색이 완료됐으면
		                if (status === daum.maps.services.Status.OK) {
		
		                    var result = results[0]; //첫번째 결과의 값을 활용
		
		                    // 해당 주소에 대한 좌표를 받아서
		                    var coords = new daum.maps.LatLng(result.y, result.x);
		                    const coordinateX = `<input type="hidden" value="\${result.y}" name="coordinateX">`;
		                    const coordinateY = `<input type="hidden" value="\${result.x}" name="coordinateY">`;
		                    $('#formData').append(coordinateX);
		                    $('#formData').append(coordinateY);
		                    
		                    // 지도를 보여준다.
		                    mapContainer.style.display = "block";
		                    map.relayout();
		                    // 지도 중심을 변경한다.
		                    map.setCenter(coords);
		                    // 마커를 결과값으로 받은 위치로 옮긴다.
		                    marker.setPosition(coords)
		                    map.setZoomable(false);
		                    map.setDraggable(false);
		                }
		            });
		        }
		    }).open();
		}
	        
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
