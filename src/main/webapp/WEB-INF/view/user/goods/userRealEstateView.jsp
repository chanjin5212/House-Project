<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="/WEB-INF/inc/asset.jsp"%>
<link rel="stylesheet" href="/house/asset/css/user/realEstateView/realestateview.css" />
<link rel="stylesheet" href="/house/asset/css/user/realEstateView/realestateviewmap.css" />
<style>
	.modal-footer > button {
		width: 150px;
		height: 40px;
	}
	.form-group > .form-control {
		margin-bottom: 5px;
	}
</style>
</head>
<body>
	
	<main>
		<%@include file="/WEB-INF/inc/header.jsp"%>
		<section class="goods_view_section">
			<div id="slideShow">
				<ul class="slides">
					<c:forEach items="${realEstateImgList}" var="img">
						<li><div><img src="/house/files/${img}"></div></li>				
					</c:forEach>
				</ul>
				<p class="controller">
					<span class="prev">&lang;</span>
					<span class="next">&rang;</span>
				</p>
			</div>
			<div id="sildeCount">
				<div id="nowsild">1</div>
				<span id="sild_num_cut">/</span>
				<div id="maxslid">${fn:length(realEstateImgList)}</div>
			</div>
			<div class="real_estate_view">
				<div>
					<div class="real_estate_article">
						<div class="real_estate_content">
							<div class="price rs">
								<div class="price_info">
									<h4 class="price intro">가격정보</h4>
									<div class="price_bill_list">
										<li>
											<div class="list_title">${realEstateInfo.contract}</div>
											<div>
												<p>
												<c:if test="${realEstateInfo.deposit ne null}">${realEstateInfo.deposit} /</c:if>
												<fmt:formatNumber value="${realEstateInfo.price}" type="number"/>
												만원
												</p>
											</div>
										</li>
										<!-- realEstateInfo realEstateImgList -->
										<li>
											<div class="list_title">관리비</div>
											<div>
												<p>매월 <fmt:formatNumber value="${realEstateInfo.amountmanagementfee}" type="number"/>만원</p>
												<p class="point_content" id="bill"></p>
												<div class="etc_add">
													<p>별도 금액으로 부과되는 항목</p>
													<p class="point_content" id="etc_bill"></p>
												</div>
											</div>
										</li>
										<li>
											<div class="list_title">주차</div>
											<div id="parking_status"></div>
										</li>
									</div>
								</div>
							</div>
							<div class="infos rs">
								<div class="infos_view">
									<div>
										<h4 class="intro">상세정보</h4>
										<div class="infos_option_list">
											<li>
												<div class="list_title">건물주소</div>
												<div>${realEstateInfo.buildingaddress}</div>
											</li>
											<li>
												<div class="list_title">방종류</div>
												<div>${realEstateInfo.roomtype}</div>
											</li>
											<li>
												<div class="list_title">해당층/건물층</div>
												<div>${realEstateInfo.thefloor}/${realEstateInfo.buildingfloor}</div>
											</li>
											<li>
												<div class="list_title">전용/계약면적</div>
												<div class="area">
													<p>${realEstateInfo.dedicatedarea} / ${realEstateInfo.supplyarea}</p>
												</div>
											</li>
											<li>
												<div class="list_title">방 수/욕실 수</div>
												<div>${realEstateInfo.numroom}개/ ${realEstateInfo.numtoilets}개</div>
											</li>
											<li>
												<div class="list_title">방향</div>
												<div>${realEstateInfo.direction}<p class="point_content">주실 방향 기준</p></div>
											</li>
											<li>
												<div class="list_title">난방종류</div>
												<div>${realEstateInfo.heatingtype}난방</div>
											</li>
											<li>
												<div class="list_title">빌트인</div>
												<div>${realEstateInfo.built}</div>
											</li>
											<li>
												<div class="list_title">건물 주차</div>
												<div>총 ${realEstateInfo.numparkspace}대</div>
											</li>
											<li>
												<div class="list_title">베란다/발코니</div>
												<c:if test="${realEstateInfo.numbalcony ne 0}">
													<div>${realEstateInfo.numbalcony}개</div>
												</c:if>
												<c:if test="${realEstateInfo.numbalcony eq 0}">
													<div>없음</div>
												</c:if>
											</li>
											<li>
												<div class="list_title">입주가능일</div>
												<div>${realEstateInfo.moveindate}이후</div>
											</li>
											<li>
												<div class="list_title">주용도</div>
												<div>${realEstateInfo.mainuse}</div>
											</li>
											<li>
												<div class="list_title">사용승인일</div>
												<div>${realEstateInfo.updatedate}</div>
											</li>
											<li>
												<div class="list_title">최초등록일</div>
												<div>${realEstateInfo.createdate}</div>
											</li>
										</div>
									</div>
								</div>
							</div>
							<div class="option rs">
								<div class="option_list">
									<h4 class="intro">옵션</h4>
									<div class="option_views"></div>
								</div>
							</div>
							<!--  나중에 보안 안전시설 추가
							<div class="safety rs">
								<div class="safety_list">
									<h4 class="intro">보안/안전시설</h4>
									<div class="safety_views">
										<div class="safety_item">
											<div>
												<div style="background: url(/house/asset/images/중개사로고.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>
											</div>
											<p>CCTV</p>
										</div>
									</div>
								</div>
							</div>
							-->
							<div class="location rs">
								<div class="location_map">
									<h4 class="intro">위치 및 주변시설</h4>
									<div class="location_address">
										<p>${realEstateInfo.buildingaddress}</p>
									</div>
									<div class="map_wrap">
										<div id="map"></div>
										<ul id="category">
									        <li id="BK9" data-order="0"> 
									            <span class="category_bg bank"></span>
									            은행
									        </li>       
									        <li id="MT1" data-order="1"> 
									            <span class="category_bg mart"></span>
									            마트
									        </li>  
									        <li id="PM9" data-order="2"> 
									            <span class="category_bg pharmacy"></span>
									            약국
									        </li>  
									        <li id="OL7" data-order="3"> 
									            <span class="category_bg oil"></span>
									            주유소
									        </li>  
									        <li id="CE7" data-order="4"> 
									            <span class="category_bg cafe"></span>
									            카페
									        </li>  
									        <li id="CS2" data-order="5"> 
									            <span class="category_bg store"></span>
									            편의점
									        </li>      
									    </ul>
									</div>
								</div>
							</div>
							<div class="memo">
								<div class="memo_box">
									<h4 class="intro">상세설명</h4>
									<div class="memo_content">${realEstateInfo.introduce}</div>
								</div>
							</div>
							<!-- <div class="other-room"></div> -->
							<div class="report">
								<button class="fill-button green" onclick="location.href='/house/web/userReport?seq=${seq}&coordinateX=${coordinateX}&coordinateY=${coordinateY}';">허위매물 신고하기</button>
							</div>
						</div>
						<div class="real_estate_broker">
							<div class="broker_status">
								<!-- 브로커 상태 동적추가하기 -->
								<div class="broker_profile">
									<img src="/house/files/${realEstateInfo.brokerprofileimg}"/>
									<div class="broker_name">
										<div>공인중개사 ${realEstateInfo.brokername}님</div>	
										<c:if test="${not empty realEstateInfo.brokerscore}">
											<div>평점 : <span id="star">★</span><span id="rating">${realEstateInfo.brokerscore}</span>/5</div>
										</c:if>											
										<c:if test="${empty realEstateInfo.brokerscore}">
											<div style="color:gray;">아직 평가되지 않았습니다.</div>
										</c:if>
									</div>
								</div>
								<ul class="broker_info">
									<li class="broker_info_list">
										<div class="re_main_title">${realEstateInfo.firmname}</div>
										<div class="re_address">
											<p class="re_title">주소</p>
											<p class="re_content">${realEstateInfo.firmaddress}</p>
										</div>
										<div class="re_code">
											<p class="re_title">중개등록번호</p>
											<p class="re_content">${realEstateInfo.corporatenum}</p>
										</div>
									</li>
								</ul>
								<div class="re_btn_list">
									<button class="fill-button blue" onclick="location.href='/house/web/userCounsel?seq=${seq}&coordinateX=${coordinateX}&coordinateY=${coordinateY}&status=view';">문의하기</button>
									<button class="fill-button green" type="button" data-toggle="modal" data-target="#move_in_modal">입주신청하기</button>
									<div class="modal fade" id="move_in_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog modal-dialog-centered">
									    <div class="modal-content">
									      <div class="modal-header">
									        <h5 class="modal-title" id="exampleModalLabel">입주신청</h5>
									        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									          <span aria-hidden="true">&times;</span>
									        </button>
									      </div>
									      <div class="modal-body">
									        <form>
									          <div class="form-group">
									          	<div class="col-form-label">입주가능일자:</div>
									            <div class="form-control">${realEstateInfo.moveindate}일 이후</div>
									          </div>
									          <div class="form-group">
									            <label for="movein_date" class="col-form-label">날짜 선택하기</label>
									            <input type="date" class="form-control" id="movein_date" onchange="selectedMoveInDate(event);"/>
									          </div>
									          <div class="form-group">
									            <div class="col-form-label">선택날짜:</div>
									            <div class="form-control" id="user_selected_date"></div>
									            <div id="check_date"></div>
									          </div>
									        </form>
									      </div>
									      <div class="modal-footer">
									        <button type="button" id="submit_move_in_data" class="fill-button blue" disabled style="cursor: not-allowed;" onclick="submitSelectedDate(event);">전송하기</button>
									        <button type="button" class="fill-button red" data-dismiss="modal">닫기</button>
									      </div>
									    </div>
									  </div>
									</div>
								</div>
							</div>
							<div class="like_btn">
								<button type="button">
									<span>찜하기</span>
									<span id="like_icon">
										<i class="fa-regular fa-heart"></i>
									</span>
								</button>
								<input type="hidden" id="like_status" value="0"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<%@include file="/WEB-INF/inc/footer.jsp" %>
</body>
<script src="${pageContext.request.contextPath}/asset/js/user/viewslider.js"></script>
<script src="${pageContext.request.contextPath}/asset/js/util/stringparser.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fa556584214d59e3cc2cb84e32bb504&libraries=services,clusterer"></script>
<script>

	//jstl이용하면 해당 페이지에서만 이용이되는듯 이거도 이제알아서 나중에 대폭수정해야될꺼같음
	$(document).ready(function() {
		likeStatus();
		getBill();
		etcBill();
		parkStatus();
		option();
	});
	
	
	//일 0 -> 토 6
	const dayToString = ['일', '월', '화', '수' ,'목', '금', '토'];
	let strDate;
	
	//이거도 따로 변수 만들어서 토글로만들기
	function selectedMoveInDate(e) {	
		
		strDate = $(e.target).val();
		
		const date = new Date(strDate);
		let selectedDateToString = date.getFullYear()+'년 '+(date.getMonth()+1)+'월 '+date.getDate()+'일 '+dayToString[date.getDay()]+'요일';
		$('#user_selected_date').text(selectedDateToString);
		
		if(checkMoveInDate(strDate)) {
			//선택가능일자
			$('#check_date').css('color', 'green').text('선택가능한 일자입니다.');
			$('#submit_move_in_data').attr('disabled', false);
			$('#submit_move_in_data').css('cursor', 'pointer');
		} else {
			//선택불가일자
			$('#check_date').css('color', 'tomato').text('입주가 불가능한 일자입니다.');
			$('#submit_move_in_data').attr('disabled', true);
			$('#submit_move_in_data').css('cursor', 'not-allowed');
		}
	}
	
	//이미 한번 신청했거나, 거래가 완료된 매물에 대해 검증하는 로직추가 필요
	function submitSelectedDate(e) {
		if(checkMoveInDate(strDate)) {
			$.ajax({
				type: 'GET',
				url: '/house/web/userMoveIn',
				data: 'date='+strDate+'&seq=${seq}&id=${auth}',
				dataType: 'json',
				success: function(result) {		
					if(result.result = 1) {
						alert('신청이 완료되었습니다.');
						$('#move_in_modal').modal('hide');
					} else {
						alert('신청에 실패했습니다. 잠시후 다시 시도해주세요.');
						$('#move_in_modal').modal('hide');
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});		
		} else {
			alert('입주일자를 확인해주세요.');
		}
	}
	
	function checkMoveInDate(date) {
		if('${realEstateInfo.moveindate}' < date) {
			return true;
		}
		return false;
	}
	
	
	//찜하기 기능
	$('.like_btn > button').click(function (){
		var like_status = $('#like_status');
		
		$.ajax({
			type: 'GET',
			url: '/house/web/changeLikeStatus',
			data: 'like='+like_status.val()+'&seq=${seq}&id=${auth}',
			dataType: 'json',
			success: function(like) {			
				if(like.result == 1) {
					if(like_status.val() == '0') {
						$('#like_icon').children().remove();
						$('#like_icon').append('<i class="fa-solid fa-heart"></i>');
						like_status.val('1');
					} else {
						$('#like_icon').children().remove();
						$('#like_icon').append('<i class="fa-regular fa-heart"></i>');
						like_status.val('0');
					}
				} else {
					alert('잠시 후 다시시도해주세요.');
				}
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
	});

	function likeStatus () {
		//로그인 상태일때만 조회
		var id = '${auth}';
		if(id.length>0) {
			$.ajax({
				type: 'GET',
				url: '/house/web/getLikeStatus',
				data: 'seq='+${seq}+'&id='+ id,
				dataType: 'json',
				success: function(like) {
					//검색결과가 있는 경우에만 초기시작 하트변경
					if(like.result == 1) {
						$('#like_icon').children().remove();
						$('#like_icon').append('<i class="fa-solid fa-heart"></i>');
						$('#like_status').val('1');
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		}
	}

	
	function option() {

		//이제 알게된건데 옵션같은 경우는 db에서 따로 조회해서 리스트로 받아오는게 나은듯 -> 일단은 대충 처리해두고 나중에 list로 조회해서 처리하기
		let temp = '';
		let option_list = $('.option_views');

		if ('${realEstateInfo.aircon}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/aircon.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>에어컨</p>'
				+ '</div>';
		}
		if ('${realEstateInfo.refrigerator}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/refrigerator.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>냉장고</p>'
				+ '</div>';
		}
		if ('${realEstateInfo.dryer}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/dryer.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>건조기</p>'
				+ '</div>';
		}
		if ('${realEstateInfo.induction}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/induction.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>인덕션</p>'
				+ '</div>';
		}
		if ('${realEstateInfo.gasrange}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/gasrange.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>가스레인지</p>'
				+ '</div>';
		}
		if ('${realEstateInfo.desk}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/desk.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>책상</p>'
				+ '</div>';
		}
		if ('${realEstateInfo.bed}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/bed.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>침대</p>'
				+ '</div>';
		}
		if ('${realEstateInfo.closet}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/closet.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>옷장</p>'
				+ '</div>';
		}
		if ('${realEstateInfo.dishwasher}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/dishwasher.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>식기세척기</p>'
				+ '</div>';
		}
		if ('${realEstateInfo.shoecloset}'.toUpperCase() == 'Y') {
			temp += '<div class="option_item">'
				+ '<div>'
				+ '<div style="background: url(/house/files/option/shoeCloset.png); background-repeat:no-repeat; background-position:center; background-size:cover;"></div>'
				+ '</div>'
				+ '<p>신발장</p>'
				+ '</div>';
		}

		if (temp.length == 0) {
			temp += '없음';
		}

		option_list.append(temp);
	}

	function getBill() {
		let temp = '';

		if ('${realEstateInfo.electricitybill}'.toUpperCase() == 'Y') {
			if (temp.length > 0) temp += ', ';
			temp += '전기세'
		}
		if ('${realEstateInfo.gasbill}'.toUpperCase() == 'Y') {
			if (temp.length > 0) temp += ', ';
			temp += '가스비'
		}
		if ('${realEstateInfo.internetbill}'.toUpperCase() == 'Y') {
			if (temp.length > 0) temp += ', ';
			temp += '인터넷 이용료'
		}
		if ('${realEstateInfo.televisionbill}'.toUpperCase() == 'Y') {
			if (temp.length > 0) temp += ', ';
			temp += '텔레비전 이용료'
		}
		if ('${realEstateInfo.waterbill}'.toUpperCase() == 'Y') {
			if (temp.length > 0) temp += ', ';
			temp += '수도세'
		}
		if ('${realEstateInfo.parkingbill}'.toUpperCase() == 'Y') {
			if (temp.length > 0) temp += ', ';
			temp += '주차비'
		}

		if (temp.length == 0) {
			temp += '-';
		}

		$('#bill').text(temp);
	}

	function etcBill() {
		let temp = '';

		if (temp.length == 0) {
			temp += '-';
		}

		$('#etc_bill').text(temp);
	}

	function parkStatus() {
		let temp = '';

		if ('${realEstateInfo.parkingbill}'.toUpperCase() == 'Y') {
			if (temp.length > 0) temp += ', ';
			temp += '가능';
			temp += '(${realEstateInfo.numparkspace}대)';
		}

		if (temp.length == 0) {
			temp += '-';
		}

		$('#parking_status').text(temp);
	}

	// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
	    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
	    markers = [], // 마커를 담을 배열입니다
	    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
	 
    var startX = 37.56683321263384;
	var startY = 126.97865225625175;
	var startLv = 8;
	
	<c:if test="${coordinateX ne null}">
		startX = getParam('coordinateX');
	</c:if>
	<c:if test="${coordinateY ne null}">
		startY = getParam('coordinateY');
	</c:if>       
	    
	    
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(${coordinateX}, ${coordinateY}), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
		}; 
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	
	// 지도에 표시할 원을 생성합니다
	var circle = new kakao.maps.Circle({
	    center : new kakao.maps.LatLng(${coordinateX}, ${coordinateY}),  // 원의 중심좌표 입니다 
	    radius: 50, // 미터 단위의 원의 반지름입니다 
	    strokeWeight: 3, // 선의 두께입니다 
	    strokeColor: '#75B8FA', // 선의 색깔입니다
	    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	    strokeStyle: 'solid', // 선의 스타일 입니다
	    fillColor: '#CFE7FF', // 채우기 색깔입니다
	    fillOpacity: 0.7  // 채우기 불투명도 입니다   
	});
	
	// 지도에 원을 표시합니다 
	circle.setMap(map); 
	

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places(map); 

	// 지도에 idle 이벤트를 등록합니다
	kakao.maps.event.addListener(map, 'idle', searchPlaces);

	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
	contentNode.className = 'placeinfo_wrap';

	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

	// 커스텀 오버레이 컨텐츠를 설정합니다
	placeOverlay.setContent(contentNode);  

	// 각 카테고리에 클릭 이벤트를 등록합니다
	addCategoryClickEvent();

	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
	function addEventHandle(target, type, callback) {
	    if (target.addEventListener) {
	        target.addEventListener(type, callback);
	    } else {
	        target.attachEvent('on' + type, callback);
	    }
	}

	// 카테고리 검색을 요청하는 함수입니다
	function searchPlaces() {
	    if (!currCategory) {
	        return;
	    }
	    
	    // 커스텀 오버레이를 숨깁니다 
	    placeOverlay.setMap(null);

	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
	        displayPlaces(data);
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

	    } else if (status === kakao.maps.services.Status.ERROR) {
	        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
	        
	    }
	}

	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {

	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	    var order = document.getElementById(currCategory).getAttribute('data-order');

	    

	    for ( var i=0; i<places.length; i++ ) {

	            // 마커를 생성하고 지도에 표시합니다
	            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker, place) {
	                kakao.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place);
	                });
	            })(marker, places[i]);
	    }
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });

	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

	    return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}

	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';

	    contentNode.innerHTML = content;
	    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);  
	}


	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;

	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}

	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
	    var id = this.id,
	        className = this.className;

	    placeOverlay.setMap(null);

	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}

	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;

	    for ( i=0; i<children.length; i++ ) {
	        children[i].className = '';
	    }

	    if (el) {
	        el.className = 'on';
	    } 
	} 
	
</script>
</html>