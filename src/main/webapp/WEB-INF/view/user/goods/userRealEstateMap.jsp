<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<%@include file="/WEB-INF/inc/asset.jsp"%>
<link rel="stylesheet" href="/house/asset/css/user/realEstateMap/frame.css" />
<link rel="stylesheet" href="/house/asset/css/user/realEstateMap/overlay.css" />
<style>
	.info {
		display: block;
	    background: #50627F;
	    color: #fff;
	    text-align: center;
	    border-radius:4px;
	    padding:0px 10px;
	}
</style>
</head>
<body>
	<main>
		<%@include file="/WEB-INF/inc/header.jsp"%>
		<section id="goods_section">
			<!-- 맵 -->
			<div id="map_area">
				<div id="map"></div>	
				<!-- 검색창 -->
				<form onsubmit="return false;" id="search_form">
					<div class="map_search_input">
						<div>
							<input type="text" autocomplete="off" size="30" placeholder="지역, 지하철, 학교 검색"/>
							<i class="fa-solid fa-x"></i>
						</div>
						<span>
							<button type="submit" id="goods_search_btn"><i class="fa-solid fa-magnifying-glass"></i></button>
						</span>
					</div>
					<div class="result_wrap">
						<div class="wrap_items hidden">
							<div class="hidden area">
								<h1>지역, 지하철, 대학교</h1>
								<ul id="keyword"></ul>			
							</div>
							<div class="hidden office">
								<h1>오피스텔</h1>
								<ul id="officetel"></ul>			
							</div>
							<div class="hidden apart">
								<h1>아파트</h1>
								<ul id="apart"></ul>			
							</div>
						</div>
					</div>
				</form>
			</div>
		</section>
	</main>
	<!-- 페이지기능 js -->
	<!-- 
	단일값 가져오기
	json.key = value 
	
	대상이 배열인경우
	json.배열[0] = value
	
	대상이 json인경우
	json.json.key = value
	-->
	<script src="${pageContext.request.contextPath}/asset/js/util/stringparser.js"></script>
	<!-- 카카오 지도 API -->
	<!-- 카카오지도 javascript api key 1fa556584214d59e3cc2cb84e32bb504-->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1fa556584214d59e3cc2cb84e32bb504&libraries=services,clusterer"></script>
	<!-- 검색조작 script -->
	<script>
		/* ---------------- 카카오맵 기능 --------------------- */
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		
		var startX = 37.56683321263384;
		var startY = 126.97865225625175;
		var startLv = 8;
		
		<c:if test="${coordinateX ne null}">
			startX = getParam('coordinateX');
		</c:if>
		<c:if test="${coordinateY ne null}">
			startY = getParam('coordinateY');
		</c:if>
		
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(startX, startY), //지도의 중심좌표.
			level : 8
		//지도의 레벨(확대, 축소 정도)
		};
		
		//지도 생성 및 객체 리턴
		var map = new kakao.maps.Map(container, options);
		
	    //마커클러스터러 생성
	    var clusterer = new kakao.maps.MarkerClusterer({
	        map: map,
	        averageCenter: true,
	        minLevel: 5
	    });
	    
	    //마커들 담을 배열
	    var markers = [];
	    //오버레이 담을 배열
	    var overlays = [];
	    //인포윈도우 담을 배열
	    var infowindows = [];
	    //선택된 마커 있는지 확인
	    let clickedOverlay = null;
		
	    //마커 지우기
	    function removeMarker() {
	    	markers.forEach(function(marker) {
	    		marker.setMap(null);
	    	});
	    	markers.length = 0;
	    }
	    //오버레이 지우기
	    function removeOverlay() {
	    	overlays.forEach(function(overlay) {
	    		overlay.setMap(null);
	    	});
	    	overlays.length = 0;
	    }
	    //인포윈도우 지우기
	    function removeInfowindow() {
	    	infowindows.forEach(function(infowindow) {
	    		infowindow.setMap(null);
	    	});
	    	infowindows.length = 0;
	    }
	    
	    
	    /* --------------------------------- 오버레이 생성 부분입니다 --------------------------- */
	    function info_header(goodsList, content, overlay) {
	    	//헤더부분
		    var content_header = document.createElement('div');
		    content_header.classList.add('overlay_header');
		    content.appendChild(content_header);
		    
		    //헤더 내용
		    var header_temp = '';
		    header_temp += goodsList.category+ ' ';
            if(goodsList.deposit != 0) header_temp += goodsList.deposit+'/';
            header_temp += goodsList.price+'만원';
		    
		    var header_content = document.createElement('div');
		    header_content.innerText = header_temp;
		    
		    var closeBtn = document.createElement('button');
		    closeBtn.innerHTML = '<i class="fa-solid fa-x"></i>';

		    closeBtn.onclick = function () {
		        overlay.setMap(null);
		    };
		    
		    content_header.appendChild(header_content);
		    content_header.appendChild(closeBtn);
	    }
	    
	    function info_body(goodsList, content, img) {
	    	//바디부분
		    var content_body = document.createElement('div');
		    content_body.classList.add('overlay_body');
		    
		    var body_frame = document.createElement('div');
		    body_frame.classList.add('body_frame');
		    
		    //이미지 삽입
		    body_frame.innerHTML = '<img src="/house/files/'+ img +'"/>';
		    content.appendChild(content_body);	
		    
		  	//건물 카테고리
		    var body_category = document.createElement('div');
		    body_category.classList.add('category');
		    body_category.innerHTML = goodsList.type;
		    body_frame.appendChild(body_category);
		    
		    content_body.appendChild(body_frame);
	    }
	    
	    function info_footer(goodsList, content, img) {
	    	//푸터부분
		    var content_footer = document.createElement('div');
		    content_footer.classList.add('overlay_footer');
		    
		    //상세보기 보튼
		    var details_btn = document.createElement('button');
		    details_btn.classList.add('fill-button', 'blue');
		    details_btn.innerText = '상세보기';
		    details_btn.onclick = function () {
		    	location.href='/house/web/userRealEstateView?seq='+goodsList.seq+'&coordinateX='+goodsList.coordinateX+'&coordinateY='+goodsList.coordinateY;
		    };
		    content_footer.appendChild(details_btn);
		    
		    //상담버튼
		    var counsel_btn = document.createElement('button');
		    counsel_btn.classList.add('fill-button', 'green');
		    counsel_btn.innerText = '상담하기';
		    counsel_btn.onclick = function () {
		        location.href='/house/web/userCounsel?seq='+goodsList.seq+'&image='+img+'&coordinateX='+goodsList.coordinateX+'&coordinateY='+goodsList.coordinateY+'&status=map';
		    };
		    content_footer.appendChild(counsel_btn);
		    
		    content.appendChild(content_footer);
	    }
	    
	    
	    function makeInfo(goodsList, overlay) {		   
            
            //오버레이 골격생성
			var content = document.createElement('div');
			content.classList.add('overlay');
		    
		    //헤더부분
		    info_header(goodsList, content, overlay);
		    
		    $.ajax({
		    	type : 'POST',
				url : '/house/web/getGoodsImg',
				data: "seq="+goodsList.seq,
				dataType : 'json',
				astnc: false,
				success : function(result) {
					if(result.img != '') {
						//바디부분
						info_body(goodsList, content, result.img);		    
					    //푸터부분
					    info_footer(goodsList, content, result.img);
					} else {					
						//바디부분
						info_body(goodsList, content, nosearchimg);		    
					    //푸터부분
					    info_footer(goodsList, content, nosearchimg);
					}
				},
				error: function(a,b,c) {
					alert('이미지를 불러오는데 실패했습니다.');
				}
		    });
		    
            //오버레이 추가
            overlay.setContent(content);    
            overlays.push(overlay);
	    }
		//유효성검사시 두개가 다르면 안넘어가게
	    
	    //마커 만들기
		function viewMarker() {
	    	//보여지는 위치의 데이터만 가져오기
			var bounds = map.getBounds();
			//남서
			var sw = bounds.getSouthWest();
			//북동
			var ne = bounds.getNorthEast();
			
			var lat1 = sw.La;
			var lng1 = sw.Ma;
			var lat2 = ne.La;
			var lng2 = ne.Ma;
			//level별로 데이터 수 제한걸기는 나중에 추가할 예정 -> 기능적인 면보다는 성능적인 면
			var level = map.getLevel();
	    	
			$.ajax({
				type : 'POST',
				url : '/house/web/getGoodsList',
				data: "lat1="+lat1+"&lng1="+lng1+"&lat2="+lat2+"&lng2="+lng2,
				dataType : 'json',
				success : function(goodsList) {	

					//마커 추가
					$(goodsList).map(function(i, goodsList) {
			            var marker = new kakao.maps.Marker({
			                position : new kakao.maps.LatLng(goodsList.coordinateX, goodsList.coordinateY)
			            });			            
			            //마커 추가
			            markers.push(marker);
			            
			          	//마커 클릭 이벤트 추가
			            kakao.maps.event.addListener(marker, 'click', function(mouseEvent) {
			            	map.panTo(marker.getPosition());			            	
			            	makeInfo(goodsList, overlay);
			            });
			          	
			          	//오버레이 생성
			            var overlay = new kakao.maps.CustomOverlay({
			                position: marker.getPosition(),
			                xAnchor: 0.5,
			                yAnchor: 1.15
			            });
			          	
			          	//오버레이 클릭 이벤트 추가
			            kakao.maps.event.addListener(marker, 'click', function() {
			            	if(clickedOverlay != null) {
			            		clickedOverlay.setMap(null);
			            	}
				            overlay.setMap(map);
				            clickedOverlay = overlay;
			            });
			            
			            //인포윈도우용 오버레이생성    
			            var info = '<div class="info">';
			            info += goodsList.category+ '<br>';
			            if(goodsList.deposit != 0) info += goodsList.deposit+'/';
			            info += goodsList.price+'만원';
			            info += "</div>";
			            console.log(goodsList.deposit);
			            console.log(goodsList.price);
			            
			            var infowindow = new kakao.maps.CustomOverlay({
			                position: marker.getPosition(),
			                xAnchor: 0.5,
			                yAnchor: -0.3,
			                content: info
			            });
			            infowindows.push(infowindow);
			            infowindow.setMap(map);		            
			        });					
					//클러스터러 추가
					clusterer.addMarkers(markers);	
				},
				error : function(a, b, c) {
					console.log(a, b, c);
				},
				beforeSend: function() {	
					//비동기 실행전 초기화작업
					removeMarker();
					removeInfowindow();
					removeOverlay();
					clusterer.clear();
				}
			});						
		}
	    
		//시작시 마커표시
		$(document).ready(function() {
			viewMarker();
		});
		
		//화면변경시 보이는 영역만 마크 새로그리기
		kakao.maps.event.addListener(map, 'zoom_changed', function() {
			checkArea();
		});
		kakao.maps.event.addListener(map, 'dragend', function() {
			checkArea();
		});
		
		function checkArea() {
			viewMarker();	
		}
		
		
		/* --------------------------------- 검색기능 ------------------------------------------- */
		//키워드 장소 검색 객체를 생성합니다
		var places = new kakao.maps.services.Places();
		
		//키워드 장소 검색 결과를 받은 콜백함수
		var geyKeywordData = function(result, status) {
		    if (status === kakao.maps.services.Status.OK && result.length > 0) {
		    	for(let i=0; i<result.length; i++) {
			        data_list.push(result[i]);
		    	}
		    }
		};
		//데이터 입력
		const search = $('.map_search_input > div > input');
		let data_list = [];
		
		
		//한글 입력기(IME) 조합기로인해 문제발생중
		//키워드 입력시
		search.on('input', select_move);
		
		function select_move() {

			let value = search.val();
			
			//검색어가 있다면
			if(value != 0 ) {
				show_list();
			} else {
				hide_list();
			}
			
			//ul 밑 li가 있다면 초기화
			reset_list();
			
			//데이터 있으면 x표 표시 및 리스트 출력
			//리스트 초기화 후 값을 얻어온 뒤 출력
			if(value.length > 0) {
				$('.map_search_input > div > i').css("display", "block");
				getAreaData(value);
				places.keywordSearch(value, geyKeywordData, { category_group_code : 'SW8' });
				places.keywordSearch(value, geyKeywordData, { category_group_code : 'SC4' });
				result();
			} else {
				$('.map_search_input > div > i').css("display", "none");
			}		
		}
		
		function show_list() {
			$('.wrap_items').removeClass('hidden');
			$('.area').removeClass('hidden');
		}
		
		function hide_list() {
			$('.wrap_items').addClass('hidden');
			$('.area').addClass('hidden');
		}
		
		function reset_list() {
			if($('#keyword').length>0) {
				$('#keyword').empty();
			}
		}
		
		//x 아이콘클릭시 동작
		$('.map_search_input > div > i').click(function() {
			$('.map_search_input > div > input').val("");
			$('.map_search_input > div > i').css("display", "none");
			search.focus();
			hide_list();
			reset_list();
		});
		
		//지역명 데이터 가져오기
		function getAreaData (value) {
			//공백문자 포함검색
			value += ' ';
			//비동기 통신시 한글 완성문제 아직 해결하지 못했음
			$.ajax({			
				url: 'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent(value),
				type: 'GET',
				headers: {'Authorization' : 'KakaoAK 61d5f0b4fa7b9fbffc15115b839cc2b2'},
				success: function(data) {			
					//가져온 데이터가 있다면 리스트 초기화 후 실행
					data_list = [];
					if(data.meta.pageable_count > 0) {
						for(let i=0; i<data.meta.pageable_count; i++) {	
							data_list.push(data.documents[i]);
						}
					}
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
		}
		
		
		function result() {
			if(data_list.length > 0) {	

				for(let i=0; i<data_list.length; i++) {
					let temp = data_list[i];
					let name = null;
					let x = null;
					let y = null;
					
					if(temp.category_group_code == 'SC4' || temp.category_group_code == 'SW8') {
						name = temp.place_name;
					} else {
						name = temp.address_name;
					}
					x = data_list[i].x;
					y = data_list[i].y;
					
					if(name != null && x != null && y != null) {
						$('#keyword').append(
								  '<li class="wrap_item">'
									+ name
									+ '<input type="hidden" id="x" value="'+x+'" />'
									+ '<input type="hidden" id="y" value="'+y+'" />'
								+ '</li>'
								);
					}
				}
				$('.wrap_item').click(clickList);
			} else {
				$('#keyword').append('<div class="no_result">검색 결과가 없습니다.</div>');
			}		
		}	
		
		let temp = null;
		let x = null;
		let y = null;
		
		//리스트클릭시 해당 항목으로 이동
		function clickList(event) {
			temp = $(event.target).text();
			x = Number($(event.target).children('#x').val());
			y = Number($(event.target).children('#y').val());
			
			gomove();
		}	
		
		//submit시 최상단 항목으로 이동
		$('#search_form').submit(function(event) {
			let items = $('.wrap_item');
			
			if(items.length > 0) {
				temp = $(items[0]).text();
				x = Number($(items[0]).children('#x').val());
				y = Number($(items[0]).children('#y').val());		
			}
			
			gomove();
		});
		
		
		function gomove() {
			//이동한 위치 검색창에 표시
			search.val(temp);
			
			/*리스트 클리어*/
			/*
			$('.wrap_items').addClass('hidden');
			reset_list();
			*/
			
			if(x!=null && y!=null && temp != null) {
				//원그리고
				fnCircle(y, x);
				//이동
				var moveLatLng = new kakao.maps.LatLng(y, x);
				map.panTo(moveLatLng);
			} else {
				//만약 찾을 수 없다면?
				alert('좌표를 찾을 수 없습니다.');
			}
		}
		
		//지도상 원그리기
		var circle;
		
		function fnCircle(Lat, Lng) {
			if(circle) {	
				//최초 실행시 circle이 없으니 예처리
				circle.setMap(null);
			}
			
			circle = new kakao.maps.Circle({
	        center : new kakao.maps.LatLng(y, x),  // 원의 중심좌표 입니다 
	        radius: 500, // 미터 단위의 원의 반지름입니다 
	        strokeWeight: 3, // 선의 두께입니다 
	        strokeColor: '#75B8FA', // 선의 색깔입니다
	        strokeOpacity: 0.8, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	        strokeStyle: 'solid', // 선의 스타일 입니다
	        fillColor: '#CFE7FF', // 채우기 색깔입니다
	        fillOpacity: 0.4  // 채우기 불투명도 입니다   
		    }); 
			
			// 지도에 원을 표시합니다 
		    circle.setMap(map); 
		}  	
	</script>

</body>
</html>






























