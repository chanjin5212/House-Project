<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방 중개사</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<%@include file="/WEB-INF/inc/asset.jsp" %>
<style>

section > div#addedit {
	width: 600px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

section > div#addedit > button:nth-child(1) {
	color: var(--color-blue);
}

section > div#addedit > button:nth-child(2) {
	color: var(--color-green);
}

section > div#addedit > button#fir {
	border-color: var(--color-blue);
}

section > div#addedit > button#fir:hover {
	color: var(--color-white);
	background-color: var(--color-blue);
}

section > div#addedit > button#sec:hover {
	color: var(--color-white);
	background-color: var(--color-green);
}

section > div#addedit > button#sec {
	border-color: var(--color-green);
}

section > div > button {
	background-color: transparent;
	margin-top: 150px;
	margin-bottom: 100px;
}

section > div#board {
	display: flex;
	width: 1000px;
	margin: 0 auto;
}

section > div#board > table tr:nth-child(2) {
	font-size: var(--small-font);
}

section > div#chart {
	display: flex;
	margin: 0 auto;
}

section > div {
	width: 1000px;
	margin: 0 auto;
	display: flex;
}

section > div#check > span > a {
	text-decoration: none;
	color: black;
}

section > div#check > span > a:hover {
	color: var(--color-blue);
}

section > div#board > table tr > td:nth-child(1) > a {
	text-decoration: none;
	color: black;
}

section > div#board > table tr > td:nth-child(1) > a:hover {
	color: var(--color-blue);
}

</style>
</head>
<body>	
	<main>
      <%@include file="/WEB-INF/inc/brokerHeader.jsp" %>
      <section>
      		<div id="addedit">
      			<button id="fir" onclick="location.href='/house/brokerrealestate/brokerRealEstateAdd'"><i class="fa-solid fa-house-circle-check fa-5x" style="font-size: 150px;"></i><br>매물등록</button>
      			<button id="sec" onclick="location.href='/house/brokerrealestate/brokerRealEstateManage'"><i class="fa-solid fa-house-circle-exclamation fa-5x" style="font-size: 150px;"></i><br>매물관리</button>
      		</div>
      		<div><span style="font-size: var(--large-font);">후기 게시판 인기글&nbsp&nbsp<span style="font-size: var(--min-font);">일주일 단위</span></span></div>
      		<div id="check" style="display: flex; justify-content: right;"><span><a href="/house/reviewboard/userReviewBoardView">더보기</a></span></div>
      		<div id="board">
      			<table class="table">
      				<tr>
      					<th>제목</th>
      					<th>작성자</th>
      					<th>날짜</th>
      				</tr>
      				<c:forEach items="${list}" var="ldto" begin="0" end="4">
      				<tr>
      					<td><a href="/house/reviewboard/userReviewBoardDetail?seq=${ldto.seq}">${ldto.title}</a></td>
      					<td>${ldto.id}</td>
      					<td>${ldto.regdate}</td>
      				</tr>
      				</c:forEach>
      			</table>
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
                label: '전체 거래량', //차트 제목
                fill: false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                data: [ 
                	102, 150, 170,50 //x축 label에 대응되는 데이터 값
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
   

    </script>
</body>
</html>