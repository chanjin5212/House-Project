<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방 중개사</title>
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
	margin: 2px;
	width: 50px;
}

section > form > div > div#structure > select {
	margin: 2px;
}

section > form > div > input {
	margin: 2px 2px 2px 2px;
}

section > form > div.tableSize > div > div#image_container {
	display: flex;
    overflow-x: auto;
    width: 700px;
    height: 205px;
}

section > form > div.tableSize > div > div#image_container > img {
	width: 200px;
	height: 200px;
    margin: 0 15px;
}

section > form > div.tableSize > table tr > td:nth-child(1) {
	width: 150px;
	text-align: center;
}

section > form > div.tableSize > table {
	margin: 0 auto;
	width: 700px;
}

</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/brokerHeader.jsp" %>
      <section>
      <div style="font-size: var(--large-font); width: 600px; margin:0 auto; margin-top: 30px;">매물 등록하기</div>
      <form id="formData" method="POST" action="/house/brokerrealestate/brokerRealEstateAdd" enctype="multipart/form-data">
      		<div class="tableSize">
      			<span style="font-size: var(--middle-font);">매물 주소</span>
	      		<table class="table table-bordered" style="margin-bottom: 20px;">
	      			<tr>
	      				<td>주소</td>
	      				<td>
	      					<div style="display: flex;">
					      		<input class="form-control" style="width: 300px;" type="text" name="address" id="sample5_address" placeholder="주소" readonly required="required">
								<input class="button green" type="button" onclick="sample5_execDaumPostcode()" value="주소 검색">
							</div>
							<input class="form-control" style="width: 200px;" type="text" name="addressPlus" placeholder="상세주소를 입력하세요." required="required" />
							<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
	      				</td>
	      			</tr>
      			</table>

				<span style="font-size: var(--middle-font)">매물 사진</span>
				<div style="margin-bottom: 20px;">
					<div id="image_container"></div>
					<div><input type="file" name="attach1" onchange="setThumbnail(event, 1);"></div>
					<div id="filelist"></div>
					<input type="button" value="이미지 추가하기" class="button gray" id="btnfile">
				</div>
				
				
      			<span style="font-size: var(--middle-font)">기본 정보</span>
	      		<table class="table table-bordered">
	      			<tr>
	      				<td>계약종류</td>
	      				<td>
		      				<select style="width:100px;" class="form-control" name="selectContract" id="selectContract">
		      					<c:forEach items="${cList}" var="cdto">
		      					<option value="${cdto.seq}">${cdto.contractName}</option>
		      					</c:forEach>
	      					</select>
      					</td>
	      			</tr>
	      			<tr>
	      				<td>건물종류</td>
	      				<td>
	      					<select style="width:100px;" name="selectBuilding" class="form-control">
			      				<c:forEach items="${bList}" var="bdto">
			      					<option value="${bdto.seq}">${bdto.buildingTypeName}</option>
			      				</c:forEach>
			      			</select>
	      				</td>
	      			</tr>
	      			<tr id="deposit">
	      				<td>보증금</td>
	      				<td><div style="display:flex; align-items: center;"><input style="width:200px; margin-right:5px;" class="form-control" type="text" name="deposit" required="required" />만원</div></td>
	      			</tr>
	      			<tr>
	      				<td>가격</td>
	      				<td><div style="display:flex; align-items: center;"><input style="width:200px; margin-right:5px;" class="form-control" type="text" name="price" required="required" />만원</div></td>
	      			</tr>
	      			<tr>
	      				<td>중개보수</td>
	      				<td><div style="display:flex; align-items: center;"><input style="width:200px; margin-right:5px;" class="form-control" type="text" name="brokerReward" required="required" />만원</div></td>
	      			</tr>
	      			<tr>
	      				<td>입주가능일</td>
	      				<td><input style="width:200px;" class="form-control" type="date" name="moveInDate" required="required"></td>
	      			</tr>
	      			<tr>
	      				<td>관리비</td>
	      				<td>
	      					<div style="display:flex; align-items: center;"><input style="width:200px; margin-right:5px;" class="form-control" type="text" name="amount" required="required" />만원</div>
	      					<div>전기세 포함 <input type="checkbox" name="electricityBill" value="y">
				      			가스비 포함 <input type="checkbox" name="gasBill" value="y">
				      			수도세 포함 <input type="checkbox" name="waterBill" value="y">
				      			TV요금 포함 <input type="checkbox" name="televisionBill" value="y"><br>
				      			인터넷 요금 포함 <input type="checkbox" name="internetBill" value="y">
				      			주차비 포함 <input type="checkbox" name="parkingBill" value="y"></div>
	      				</td>
	      			</tr>
	      			<tr>
	      				<td>옵션 정보</td>
	      				<td>
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
	      				</td>
	      			</tr>
	      			<tr>
	      				<td>주차 여부</td>
	      				<td>
	      					<select id="parkingStatus" style="width:100px;" class="form-control" name="parkingStatus">
	      						<option value="y">가능</option>
	      						<option value="n">불가능</option>
	      					</select>
	      				</td>
	      			</tr>
	      			<tr id="pargkinNumber">
	      				<td>주차 가능수</td>
	      				<td><input style="width:100px; margin-right:5px;" class="form-control" type="number" name="numParkSpace" style="width:50px;" required="required"/></td>
	      			</tr>
	      		</table>
      		</div>
      		
      		<div class="tableSize">
      			<span style="font-size: var(--middle-font)">구조 정보</span>
      			<table class="table table-bordered">
      				<tr>
      					<td>주용도</td>
      					<td>
      						<select style="width:200px;" class="form-control" name="selectMainUse">
			      				<c:forEach items="${mList}" var="mdto">
			      					<option value="${mdto.seq}">${mdto.mainUseName}</option>
			      				</c:forEach>
			      			</select>
      					</td>
      				</tr>
      				<tr>
      					<td>방종류</td>
      					<td>
      						<select style="width:100px;" class="form-control" name="selectRoomType">
			      				<c:forEach items="${rList}" var="rdto">
			      					<option value="${rdto.seq}">${rdto.roomTypeName}</option>
			      				</c:forEach>
			      			</select>
      					</td>
      				</tr>
      				<tr>
      					<td>난방 종류</td>
      					<td>
      						<select style="width:100px;" class="form-control" name="selectHeatingType">
			      				<option value="개별">개별</option>
			      				<option value="지역">지역</option>
			      				<option value="중앙">중앙</option>
			      			</select>
      					</td>
      				</tr>
      				<tr>
      					<td>방향</td>
      					<td>
      						<select style="width:100px;" class="form-control" name="selectDirection">
			      				<option value="남향">남향</option>
			      				<option value="동향">동향</option>
			      				<option value="서향">서향</option>
			      				<option value="북향">북향</option>
			      			</select>
      					</td>
      				</tr>
      				<tr>
      					<td>방 개수</td>
      					<td><div style="display: flex; align-items: center;"><input style="width:100px; margin-right:5px;" class="form-control" type="number" name="numRoom" required="required" />개</div></td>
      				</tr>
      				<tr>
      					<td>화장실 개수</td>
      					<td><div style="display: flex; align-items: center;"><input style="width:100px; margin-right:5px;" class="form-control" type="number" name="numToilets" required="required" />개</div></td>
      				</tr>
      				<tr>
      					<td>베란다/발코니<br> 개수</td>
      					<td><div style="display: flex; align-items: center;"><input style="width:100px; margin-right:5px;" class="form-control" type="number" name="numBalcony" required="required" />개</div></td>
      				</tr>
      				<tr>
      					<td>층수</td>
      					<td>
      						<div style="display: flex; align-items: center;">
      							건물층 <input style="width:100px; margin-left:5px; margin-right:5px;" class="form-control" type="number" name="buildingFloor" required="required" /><span style="margin-right: 20px;">층</span>
      							해당층 <input style="width:100px; margin-left:5px; margin-right:5px;" class="form-control" type="number" name="theFloor" required="required" />층
      						</div>
      					</td>
      				</tr>
      				<tr>
      					<td>크기</td>
      					<td>
      						<div style="display: flex; align-items: center;">
      							전용면적 <input style="width:100px; margin-left:5px; margin-right:5px;" class="form-control" type="number" name="dedicatedArea" required="required" /><span style="margin-right: 20px;">㎡</span>
	      						공급면적 <input style="width:100px; margin-left:5px; margin-right:5px;" class="form-control" type="number" name="supplyArea" required="required" />㎡
      						</div>
      					</td>
      				</tr>
      				<tr>
      					<td>엘리베이터</td>
      					<td>
      						<select style="width:100px;" class="form-control" name="elevatorStatus">
      							<option value="y">있음</option>
      							<option value="n">없음</option>
      						</select>
      					</td>
      				</tr>
      				<tr>
      					<td>빌트인</td>
      					<td>
      						<select style="width:100px;" class="form-control" name="built">
			      				<option value="아님">없음</option>
			      				<option value="있음">있음</option>
			      			</select>
      					</td>
      				</tr>
      			</table>
      		</div>
      		
			<div class="tableSize">
				<span style="font-size: var(--middle-font)">집주인 정보</span>
				<table class="table table-bordered">
					<tr>
						<td>이름</td>
						<td><input style="width:100px;" class="form-control" type="text" name="ownerName" required="required" /></td>
					</tr>
					<tr>
						<td>주민번호</td>
						<td><input style="width:200px;" class="form-control" type="text" name="ownerSsn" required="required" /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input style="width:200px;" class="form-control" type="text" name="ownerAddress" required="required" /></td>
					</tr>
					<tr>
						<td>휴대전화</td>
						<td>
							<div style="display: flex;">
								<input name="ownerTel1" class="form-control" style="width: 60px;" type="text" value="010" readonly />- <input name="ownerTel2" class="form-control" style="width: 80px;" type="text" required="required" />-<input name="ownerTel3" class="form-control" style="width: 80px;" type="text" required="required" />
							</div>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="tableSize">
				<span style="font-size: var(--middle-font)">집주인 대리인</span>
				<table class="table table-bordered">
					<tr>
						<td>이름</td>
						<td><input style="width:100px;" class="form-control" type="text" name="deputyName" required="required" /></td>
					</tr>
					<tr>
						<td>주민번호</td>
						<td><input style="width:200px;" class="form-control" type="text" name="deputySsn" required="required" /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input style="width:200px;" class="form-control" type="text" name="deputyAddress" required="required" /></td>
					</tr>
				</table>
			</div>

      		<div>
      			<div style="font-size: var(--middle-font);">상세 내용</div><br>
   				<textarea style="width:700px; height:300px; resize: none;" class="form-control" name="introduce" required="required"></textarea>
      		</div>
      		
			<div>
				<button class="button gray" onclick="location.href='/house/brokermain/brokerMain'">돌아가기</button>
				<button id="target-btn" class="button blue" disabled="disabled">등록하기</button>
			</div>
			
		</form>
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>
    	//이미지 미리보기, 파일 업로드 삭제하면 사진 미리보기도 같이 삭제시키기
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

    
	    String.format = function() {
	        var theString = arguments[0];
	        for (var i = 1; i < arguments.length; i++) {
	            var regEx = new RegExp("\\{" + (i - 1) + "\\}", "gm");
	            theString = theString.replace(regEx, arguments[i]);
	        }
	        
	        return theString;
	    }
    
	    let no = 2;
		
	    //버튼 추가
		$('#btnfile').click(function() {
			
			let temp = String.format('<div><input type="file" name="attach{0}" onchange="setThumbnail(event, {0});"><span onclick="del({0});">&times;</span></div>', no, no, no);
			
			$('#filelist').append(temp);
			
			no++;
			
		});
		
		function del() {
			//alert(this);
			//alert(event.target);
			
			$('#img'+num).remove();
			$(event.target).parent().remove();
		}
	    
		//보증금 보이기 숨기기
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
		
		//주차 보이기 숨기기
	    $(document).ready(function() {
	    	  $('#parkingStatus').change(function() {
	    	    var result = $('#parkingStatus option:selected').val();
	    	    if (result == 'y') {
	    	      $('#pargkinNumber').show();
	    	      $('input[name=numParkSpace]').attr("required", true);
	    	    } else {
	    	      $('#pargkinNumber').hide();
	    	      $('input[name=numParkSpace]').attr("required", false);
	    	    }
	    	  }); 
	    	}); 
	    

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
	        

    </script>
</body>
</html>
