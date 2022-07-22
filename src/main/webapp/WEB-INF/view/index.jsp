<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방</title>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0202686bf75bcc93c7133b1e58c7ac49&libraries=services"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<!-- slick 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick-theme.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.css">
<style>
	section > div#search {
		display: flex;
		justify-content: center;
		margin-bottom: 20px;
	}
	
	section > div#search {
		display: flex;
		align-items: center;
	}
	
	section > div#search > button {
		height: 40px;
		width: 100px;
	}
	
	section > div#search > input {
		width: 1100px;
		height: 60px;
		margin-right: 20px;
	}
	
	section > div#reco {
		font-size: var(--large-font);
		width: 1200px;
		margin: 50px auto;
		padding-top: 30px;
		
	}
	

	
	section > div#recoList {
		width: 1200px;
		display: flex;
		margin: 50px auto;
		border-bottom: 1px solid #CCC;
		padding-bottom: 40px;
	}
	
	section > div#recoList > div {
		margin-right: 50px;
	}
	
	section > div#content {
		width: 1220px;
		margin: 0 auto;
		font-size: var(--large-font);
		padding-top: 100px;
		padding-bottom: 20px;
		
	}
	
	#recoList > div > a > img:hover {
		transform: scale(1.1);
		transition: transform 1s;
		filter: brightness(70%);
	}
	
	
	/* banner */
	.banner {position: relative; width: 1200px; height: 210px; top: 50px;  margin:0 auto; padding:0; overflow: hidden;}
	.banner ul {position: absolute; margin: 0px; padding:0; list-style: none; }
	.banner ul li {float: left; width: 1200px; height: 210px; margin:0; padding:0;}

	
</style>
<script>
$(document).ready(function() {
	//사용할 배너
	var $banner = $(".banner").find("ul");

	var $bannerWidth = $banner.children().outerWidth();//배너 이미지의 폭
	var $bannerHeight = $banner.children().outerHeight(); // 높이
	var $bannerLength = $banner.children().length;//배너 이미지의 갯수
	var rollingId;

	//정해진 초마다 함수 실행
	rollingId = setInterval(function() { rollingStart(); }, 5000);//다음 이미지로 롤링 애니메이션 할 시간차

	//마우스 오버시 롤링을 멈춘다.
	banner.mouseover(function(){
		//중지
		clearInterval(rollingId);
		$(this).css("cursor", "pointer");
	});
	//마우스 아웃되면 다시 시작
	banner.mouseout(function(){
		rollingId = setInterval(function() { rollingStart(); }, 3000);
		$(this).css("cursor", "default");
	});
	
	function rollingStart() {
		$banner.css("width", $bannerWidth * $bannerLength + "px");
		$banner.css("height", $bannerHeight + "px");
		//alert(bannerHeight);
		//배너의 좌측 위치를 옮겨 준다.
		$banner.animate({left: - $bannerWidth + "px"}, 1500, function() { //숫자는 롤링 진행되는 시간이다.
			//첫번째 이미지를 마지막 끝에 복사(이동이 아니라 복사)해서 추가한다.
			$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
			//뒤로 복사된 첫번재 이미지는 필요 없으니 삭제한다.
			$(this).find("li:first").remove();
			//다음 움직임을 위해서 배너 좌측의 위치값을 초기화 한다.
			$(this).css("left", 0);
			//이 과정을 반복하면서 계속 롤링하는 배너를 만들 수 있다.
		});
	}
}); 
</script>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/header.jsp" %>
      <section>
      		<div id="content">찾으시는 지역을 검색해보세요!</div>
      		<div id="search">
      			<input type="text" class="form-control" id="addr" placeholder="주소를 입력하세요." required="required"/><button onclick="address(addr.value);" class="button blue">검색하기</button>	      			
      		</div>
			    <div class="contents">
					<div class="banner">
						<ul>
							<li><img src="/house/asset/images/banner1.png" style="width: 1200px;"></li>
							<li><img src="/house/asset/images/banner2.png" style="width: 1200px;"></li>
							<li><img src="/house/asset/images/banner3.png" style="width: 1200px;"></li>
						</ul>
					</div>
				</div>

				
      		<div id="reco"><span style="font-family: var(--title-font);">${address}</span> 추천 매물 <span style="font-size: var(--small-font);">회원가입한 주소 기준입니다.</span></div>
      		<div id="recoList">
      			<c:forEach items="${list}" var="dto" begin="0" end="3">
      				<div>
      				<c:if test="${dto.filename == null}">
      					<a href="/house/web/userRealEstateView?seq=${dto.seq}&coordinateX=${dto.coordinateX}&coordinateY=${dto.coordinateY}"><img src="/house/asset/images/basic.jpeg" style="width: 264px; height: 200px;"/></a>
      				</c:if>
      				
      				<c:if test="${dto.filename != null}">
      					<a href="/house/web/userRealEstateView?seq=${dto.seq}&coordinateX=${dto.coordinateX}&coordinateY=${dto.coordinateY}"><img src="/house/files/${dto.filename}" style="width: 264px; height: 200px;"/></a>
      				</c:if>
      				<div style="font-size: var(--small-font);">${dto.bname}</div>
      				<c:if test="${dto.deposit == null}">
      					<div style="font-size: var(--middle-font);">${dto.name} ${dto.price}</div>
      				</c:if>
      				<c:if test="${dto.deposit != null}">
      					<div style="font-size: var(--middle-font);">${dto.name} ${dto.deposit}/${dto.price}</div>
      				</c:if>

      				<div style="font-size: var(--small-font);">${dto.realEstateAddr}</div>
      			</div>
      			</c:forEach>
      		</div>
      		<div style="width: 1000px; height: 500px; margin: 0 auto;">
				<!--차트가 그려질 부분-->
				<canvas id="myChart"></canvas>
			</div>
      </section>
      <%@include file="/WEB-INF/inc/footer.jsp" %>
    </main>
    <script>

    	
		    var context = document
		    .getElementById('myChart')
		    .getContext('2d');
			var myChart = new Chart(context, {
		    type: 'bar', // 차트의 형태
		    data: { // 차트에 들어갈 데이터
		        labels: [
		            //x 축
		            '매매','전세','월세'
		        ],
		        datasets: [
		            { //데이터
		                label: '${month}월 거래량', //차트 제목
		                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
		                data: [ 
		                	102, 150, 170,  50 //x축 label에 대응되는 데이터 값
		                ],
		                backgroundColor: [
		                    //색상
		                    'rgba(255, 99, 132, 0.2)',
		                    'rgba(54, 162, 235, 0.2)',
		                    'rgba(255, 206, 86, 0.2)',
		                    'rgba(75, 192, 192, 0.2)',
		                    'rgba(153, 102, 255, 0.2)',
		                    'rgba(255, 159, 64, 0.2)'
		                ],
		                borderColor: [
		                    //경계선 색상
		                    'rgba(255, 99, 132, 1)',
		                    'rgba(54, 162, 235, 1)',
		                    'rgba(255, 206, 86, 1)',
		                    'rgba(75, 192, 192, 1)',
		                    'rgba(153, 102, 255, 1)',
		                    'rgba(255, 159, 64, 1)'
		                ],
		                borderWidth: 1 //경계선 굵기
		            }/* ,
		            {
		                label: 'test2',
		                fill: false,
		                data: [
		                    8, 34, 12, 24
		                ],
		                backgroundColor: 'rgb(157, 109, 12)',
		                borderColor: 'rgb(157, 109, 12)'
		            } */
		        ]
		    },
		    options: {
		        scales: {
		            yAxes: [
		                {
		                    ticks: {
		                        beginAtZero: true
		                    }
		                }
		            ]
		        }
		    }
		});
    
    
    	function address(val) {

    		// 주소-좌표 변환 객체를 생성합니다
    	    var geocoder = new kakao.maps.services.Geocoder();
    	
    	    // 주소로 좌표를 검색합니다
    	    geocoder.addressSearch(val, function(result, status) {
    	
    	        // 정상적으로 검색이 완료됐으면 
    	         if (status === kakao.maps.services.Status.OK) {
    	
    	            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    	            location.href='/house/web/userRealEstateMap?coordinateX=' + result[0].y + '&coordinateY=' + result[0].x;
    	
    	        } 
    	    });    
    	}
 		
    
    
    </script>
</body>
</html>