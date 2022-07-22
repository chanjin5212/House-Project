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

	section{
		width: 800px;
	}

	main{
		
		font-family: sans-serif;
		/* width: 800px; */
	}
	
	h2{
		font-family: serif;
		font-weight: bold;
		text-align: center;
	}
	
	table{
		margin: 20px;
	}
	
	
	#contract {
		border: 1px solid black;
		width: 900px;
	}
	
	#contract td, #contract th{
		border: 1px solid black;
	
	}
	
	th {
		text-align: center;
		width: 100px;
		background-color: #ccc;
	}
	
	#contract td {
		font-size: var(--small-font);
		padding: 5px;
		
	}
	
	.bold{
		font-weight: bold;
	}
	
	.gray{
		background-color: #ccc;
	}
	
	
</style>
</head>
<body>	
	<main>
      <section>

      		<c:if test="${dto.contractName == '매매'}">
      		<h2>부동산 매매 계약서</h2>
      		<form method="post" action="/house/useralarm/showContractDoc">
      		<table id="contract">
      			<tr>
      				<td colspan="10" class="gray">
      				 임대인과 임차인 쌍방은 아래 표시 부동산에 관하여 다음 계약내용과 같이 임대차계약을 체결한다.<br>
 					<span style="font-weight: bold;">1.부동산의 표시</span>
      				</td>
      			</tr>
      			<tr>
      				<th>소재지</th>
      				<td colspan="10">${dto.realestateaddr}</td>
      			</tr>
      			<tr>
      				<th>토지</th>
      				<th>지목</th>
      				<td colspan="3">${dto.land}</td>
      				<th>면적</th>
      				<td colspan="3" style = "text-align:justify;">${dto.dedicatedArea}</td>
      			</tr>
      			<tr>
      				<th>건물</th>
      				<th>구조 용도</th>
      				<td colspan="3">${dto.structural}</td>
      				<th>면적</th>
      				<td colspan="3">${dto.supplyArea}</td>
      			</tr>
      			<tr>
      				<th>임대할부분</th>
      				<td colspan="4">내용</td>
      				<th>면적</th>
      				<td colspan="3"><span >㎡</span></td>
      			</tr>
      			<tr>
      				<td colspan="10" class="gray">
      					<span class="bold">2. 계약내용</span><br>
 제 1 조 (목적) 위 부동산의 임대차에 한하여 임대인과 임차인은 합의에 의하여 임차보증금 및 차임을 아래와 같이 지불하기로 한다.
      				</td>
      			</tr>
      			<tr>
      				<th>보증금</th>
      				<c:if test="${dto.deposit != null}">
      				<td colspan="10">${dto.deposit}만</td>
      				</c:if>
      				<c:if test="${dto.deposit == null}">
      				<td colspan="10"></td>
      				</c:if>
      			</tr>
      			<tr>
      				<th>계약금</th>
      				<td colspan="10">${dto.downPayment}</td>
      			</tr>
      			<tr>
      				<th>잔금</th>
      				<td colspan="10">100만</td>
      			</tr>
      			<tr>
      				<th>차임</th>
      				<td colspan="10">100만</td>
      			</tr>
      			<tr>
      				<td colspan="10" style="font-size:11px;">
      				제 2조 (<span class="bold">존속기간</span>) 임대인은 위 부동산을 임대차 목적대로 사용․수익할 수 있는 상태로         년       월       일까지 임차인
   에게 인도하며, 임대차 기간은 인도일로부터         년         월        일까지(       개월)로 한다.<br>
제 3조 (<span class="bold">용도변경 및 전대 등</span>) 임차인은 임대인의 동의없이 위 부동산의 용도나 구조를 변경하거나 전대․임차권 양도 또는 담보제공을
   하지 못하며 임대차 목적 이외의 용도로 사용할 수 없다.<br>
제 4조 (<span class="bold">계약의 해지</span>) 임차인의 차임연체액이 2기의 차임액에 달하거나 제3조를 위반하였을 때 임대인은 즉시 본 계약을 해지 할 수 있다.<br>
제 5조 (<span class="bold">계약의 종료</span>) 임대차계약이 종료된 경우에 임차인은 위 부동산을 원상으로 회복하여 임대인에게 반환한다. 이러한 경우 임대인
   은 보증금을 임차인에게 반환하고, 연체 임대료 또는 손해배상금이 있을 때는 이들을 제하고 그 잔액을 반환한다.<br>
제 6조 (<span class="bold">계약의 해제</span>) 임차인이 임대인에게 중도금(중도금이 없을때는 잔금)을 지불하기 전까지, 임대인은 계약금의 배액을 상환하고, 
   임차인은 계약금을 포기하고 본 계약을 해제할 수 있다.<br>
제 7조 (<span class="bold">채무불이행과 손해배상</span>) 임대인 또는 임차인이 본 계약상의 내용에 대하여 불이행이 있을 경우 그 상대방은 불이행한 자에 
   대하여 서면으로 최고하고 계약을 해제 할 수 있다. 그리고 계약 당사자는 계약해제에 따른 손해배상을 각각 상대방에 대하여 청구
   할 수 있다.<br>
제 8조 (<span class="bold">중개보수</span>) 개업공인중개사는 임대인과 임차인이 본 계약을 불이행 함으로 인한 책임을 지지 않는다. 또한, 중개보수는 본
   계약체결과 동시에 계약 당사자 쌍방이 각각 지불하며, 개업공인중개사의 고의나 과실없이 본 계약이 무효․취소 또는 해제되어도 중개수수
   료는 지급한다. 공동중개인 경우에 임대인과 임차인은 자신이 중개 의뢰한 개업공인중개사에게 각각 중개보수를 지급한다.(중개보수는 
   거래가액의    %  로 한다.)<br>
제 9 조 (<span class="bold">중개대상물확인․설명서 교부 등</span>)개업공인중개사는 중개대상물 확인․설명서를 작성하고 업무보증관계증서(공제증서 등) 사본을 첨부하여 계약체결과 동시에 거래당사자 쌍방에게 교부한다.<br>

      				</td>
      			</tr>
      			<tr>
      				<td colspan="10" style="font-size:11px;">
      				<span class="bold">특약사항 : </span><br>
      				 - 현 상태의 임대차 계약임.
      				</td>
      			</tr>
      			<tr>
      				<td colspan="10" style="font-size:11px;">
      					본 계약을 증명하기 위하여 계약 당사자가 이의 없음을 확인하고 각각 서명․날인 후 임대인, 임차인 및 개업공인중개사는 각각 1통씩 보관한다.<br>                                                                                                   <span style =" display : inline-block;text-align:right; width: 95%;">${dto.contractdate}</span> 
      				</td>
      			</tr>
      			<tr>
      				<th rowspan="4" class="width">임대인</th>
      			</tr>
      			<tr>
      				<th>주소</th>
      				<td colspan="6">${dto.ownerAddress}</td>
      				<td rowspan="4"></td>
      			</tr>
      			<tr>
      				<th>주민등록번호</th>
      				<td  colspan="2">${dto.ownerSsn}</td>
      				<th>전화</th>
      				<td>${dto.ownerTel}</td>
      				<th>성명</th>
      				<td>${dto.ownerName}</td>
      			</tr>
      			<tr>
      				<th>대리인</th>
      				<th style="width: 50px;">주소</th>
      				<td>${dto.deputyAddress}</td>
      				<th>주민등록번호</th>
      				<td>${dto.deputySsn}</td>
      				<th>성명</th>
      				<td>${dto.deputyName}</td>
      			</tr>
      			<tr>
      				<th rowspan="4" >임차인</th>
      			</tr>
      			<tr>
      				<th>주소</th>
      				<td colspan="6">${dto.memberAddress}</td>
      				<td rowspan="4"></td>
      			</tr>
      			<tr>
      				<th>주민등록번호</th>
      				<td  colspan="2">${dto.memberSsn}</td>
      				<th>전화</th>
      				<td>${dto.memberTel}</td>
      				<th>성명</th>
      				<td>${dto.memberName}</td>
      			</tr>
      			<tr>
      				<th>대리인</th>
      				<th style="width: 50px;">주소</th>
      				<td><input type="text" name="deputyAddress" required="required"/></td>
      				<th>주민등록번호</th>
      				<td><input type="text" name="deputySsn" required="required"/></td>
      				<th>성명</th>
      				<td><input type="text" name="deputyName" required="required"/></td>
      			</tr>
      			<tr>
      				<th rowspan="5" >개인공인중개사</th>
      			</tr>
      			<tr>
      				<th>사무소 소재지</th>
      				<td colspan="7">${dto.firmaddress}</td>
      			</tr>
      			<tr>
      				<th>사무소 명칭</th>
      				<td colspan="7">${dto.firmname}</td>
      				
      			</tr>
      			<tr>
      				<th>대표</th>
      				<td  colspan="3">${dto.representname}</td>
      				<th>서명및날인</th>
      				<td colspan="3">내용</td>
      			</tr>
      			<tr>
      				<th>등록번호</th>
      				<td colspan="3">${dto.firmnum}</td>
      				<th>전화</th>
      				<td colspan="3">${dto.firmtel}</td>
      			</tr>
      		
      		</table>
      		<input type="hidden" value="${seq}" name="seq" />
      		<button style="margin-left: 10px;" class="button blue">서명하기</button>
      		</form>
      		
      		
      		
      		</c:if> <!-- 매매계약서  -->
      		
      		
      		<c:if test="${dto.contractName == '전세' || dto.contractName == '월세'}">
      		<h2>부동산 임대차 계약서</h2>
      		
      		<!-- 전월세 체크 -->
      		<table>
      			<tr>
      				<c:if test="${category == '전세'}">
      				<td>
	      				<span><input type="checkbox" checked disabled/>전세</span>
      				</td>
      				<td>
	      				<span><input type="checkbox" disabled/>월세</span>
      				</td>
      				</c:if>
      				<c:if test="${category == '월세'}">
      				<td>
	      				<span><input type="checkbox" disabled/>전세</span>
      				</td>
      				<td>
	      				<span><input type="checkbox" checked  disabled/>월세</span>
      				</td>
      				</c:if>
      			</tr>
      		</table>
    		
    		<form method="post" action="/house/useralarm/showContractDoc">
      		<table id="contract">
      			<tr>
      				<td colspan="10" class="gray">
      				 임대인과 임차인 쌍방은 아래 표시 부동산에 관하여 다음 계약내용과 같이 임대차계약을 체결한다.<br>
 					<span style="font-weight: bold;">1.부동산의 표시</span>
      				</td>
      			</tr>
      			<tr>
      				<th>소재지</th>
      				<td colspan="10">${dto.realestateaddr}</td>
      			</tr>
      			<tr>
      				<th>토지</th>
      				<th>지목</th>
      				<td colspan="3">${dto.land}</td>
      				<th>면적</th>
      				<td colspan="3" style = "text-align:justify;">${dto.dedicatedArea}</td>
      			</tr>
      			<tr>
      				<th>건물</th>
      				<th>구조 용도</th>
      				<td colspan="3">${dto.structural}</td>
      				<th>면적</th>
      				<td colspan="3">${dto.supplyArea}</td>
      			</tr>
      			<tr>
      				<th>임대할부분</th>
      				<td colspan="4">202호</td>
      				<th>면적</th>
      				<td colspan="3">30<span >㎡</span></td>
      			</tr>
      			<tr>
      				<td colspan="10" class="gray">
      					<span class="bold">2. 계약내용</span><br>
 제 1 조 (목적) 위 부동산의 임대차에 한하여 임대인과 임차인은 합의에 의하여 임차보증금 및 차임을 아래와 같이 지불하기로 한다.
      				</td>
      			</tr>
      			<tr>
      				<th>보증금</th>
      				<c:if test="${dto.deposit != null}">
      				<td colspan="10">금 ${dto.deposit}만원</td>
      				</c:if>
      				<c:if test="${dto.deposit == null}">
      				<td colspan="10">금 만원</td>
      				</c:if>
      			</tr>
      			<tr>
      				<th>계약금</th>
      				<td colspan="10">금 ${dto.downPayment/10000}만원</td>
      			</tr>
      			<tr>
      				<th>잔금</th>
      				<td colspan="10">금 100만원</td>
      			</tr>
      			<tr>
      				<th>차임</th>
      				<td colspan="10">금 100만원</td>
      			</tr>
      			<tr>
      				<td colspan="10" style="font-size:11px;">
      				제 2조 (<span class="bold">존속기간</span>) 임대인은 위 부동산을 임대차 목적대로 사용․수익할 수 있는 상태로         년       월       일까지 임차인
   에게 인도하며, 임대차 기간은 인도일로부터         년         월        일까지(       개월)로 한다.<br>
제 3조 (<span class="bold">용도변경 및 전대 등</span>) 임차인은 임대인의 동의없이 위 부동산의 용도나 구조를 변경하거나 전대․임차권 양도 또는 담보제공을
   하지 못하며 임대차 목적 이외의 용도로 사용할 수 없다.<br>
제 4조 (<span class="bold">계약의 해지</span>) 임차인의 차임연체액이 2기의 차임액에 달하거나 제3조를 위반하였을 때 임대인은 즉시 본 계약을 해지 할 수 있다.<br>
제 5조 (<span class="bold">계약의 종료</span>) 임대차계약이 종료된 경우에 임차인은 위 부동산을 원상으로 회복하여 임대인에게 반환한다. 이러한 경우 임대인
   은 보증금을 임차인에게 반환하고, 연체 임대료 또는 손해배상금이 있을 때는 이들을 제하고 그 잔액을 반환한다.<br>
제 6조 (<span class="bold">계약의 해제</span>) 임차인이 임대인에게 중도금(중도금이 없을때는 잔금)을 지불하기 전까지, 임대인은 계약금의 배액을 상환하고, 
   임차인은 계약금을 포기하고 본 계약을 해제할 수 있다.<br>
제 7조 (<span class="bold">채무불이행과 손해배상</span>) 임대인 또는 임차인이 본 계약상의 내용에 대하여 불이행이 있을 경우 그 상대방은 불이행한 자에 
   대하여 서면으로 최고하고 계약을 해제 할 수 있다. 그리고 계약 당사자는 계약해제에 따른 손해배상을 각각 상대방에 대하여 청구
   할 수 있다.<br>
제 8조 (<span class="bold">중개보수</span>) 개업공인중개사는 임대인과 임차인이 본 계약을 불이행 함으로 인한 책임을 지지 않는다. 또한, 중개보수는 본
   계약체결과 동시에 계약 당사자 쌍방이 각각 지불하며, 개업공인중개사의 고의나 과실없이 본 계약이 무효․취소 또는 해제되어도 중개수수
   료는 지급한다. 공동중개인 경우에 임대인과 임차인은 자신이 중개 의뢰한 개업공인중개사에게 각각 중개보수를 지급한다.(중개보수는 
   거래가액의    %  로 한다.)<br>
제 9 조 (<span class="bold">중개대상물확인․설명서 교부 등</span>)개업공인중개사는 중개대상물 확인․설명서를 작성하고 업무보증관계증서(공제증서 등) 사본을 첨부하여 계약체결과 동시에 거래당사자 쌍방에게 교부한다.<br>

      				</td>
      			</tr>
      			<tr>
      				<td colspan="10" style="font-size:11px;">
      				<span class="bold">특약사항 : </span><br>
      				 - 현 상태의 임대차 계약임.
      				</td>
      			</tr>
      			<tr>
      				<td colspan="10" style="font-size:11px;">
      					본 계약을 증명하기 위하여 계약 당사자가 이의 없음을 확인하고 각각 서명․날인 후 임대인, 임차인 및 개업공인중개사는 각각 1통씩 보관한다.<br>                                                                                                   <span style =" display : inline-block;text-align:right; width: 95%;">${dto.contractdate}</span> 
      				</td>
      			</tr>
      			<tr>
      				<th rowspan="4" class="width">임대인</th>
      			</tr>
      			<tr>
      				<th>주소</th>
      				<td colspan="6">${dto.ownerAddress}</td>
      				<td rowspan="4"><span style="color: blue;">${dto.ownerName}</span></td>
      			</tr>
      			<tr>
      				<th>주민등록번호</th>
      				<td  colspan="2">${dto.ownerSsn}</td>
      				<th>전화</th>
      				<td>${dto.ownerTel}</td>
      				<th>성명</th>
      				<td>${dto.ownerName}</td>
      			</tr>
      			<tr>
      				<th>대리인</th>
      				<th style="width: 50px;">주소</th>
      				<td>${dto.deputyAddress}</td>
      				<th>주민등록번호</th>
      				<td>${dto.deputySsn}</td>
      				<th>성명</th>
      				<td>${dto.deputyName}</td>
      			</tr>
      			<tr>
      				<th rowspan="4" >임차인</th>
      			</tr>
      			<tr>
      				<th>주소</th>
      				<td colspan="6">${dto.memberAddress}</td>
      				<td rowspan="4"></td>
      			</tr>
      			<tr>
      				<th>주민등록번호</th>
      				<td  colspan="2">${dto.memberSsn}</td>
      				<th>전화</th>
      				<td>${dto.memberTel}</td>
      				<th>성명</th>
      				<td>${dto.memberName}</td>
      			</tr>
      			<tr>
      				<th>대리인</th>
      				<th style="width: 50px;">주소</th>
      				<td><input type="text" name="deputyAddress" required="required"/></td>
      				<th>주민등록번호</th>
      				<td><input type="text" name="deputySsn" required="required"/></td>
      				<th>성명</th>
      				<td><input type="text" name="deputyName" required="required"/></td>
      			</tr>
      			<tr>
      				<th rowspan="5" >개인공인중개사</th>
      			</tr>
      			<tr>
      				<th>사무소 소재지</th>
      				<td colspan="7">${dto.firmaddress}</td>
      			</tr>
      			<tr>
      				<th>사무소 명칭</th>
      				<td colspan="7">${dto.firmname}</td>
      				
      			</tr>
      			<tr>
      				<th>대표</th>
      				<td  colspan="3">${dto.representname}</td>
      				<th>서명및날인</th>
      				<td colspan="3">내용</td>
      			</tr>
      			<tr>
      				<th>등록번호</th>
      				<td colspan="3">${dto.firmnum}</td>
      				<th>전화</th>
      				<td colspan="3">${dto.firmtel}</td>
      			</tr>
      		
      		</table>
      		<input type="hidden" value="${seq}" name="seq" />
      		<button style="margin-left: 10px;" class="button blue">서명하기</button>
      		</form>
      		</c:if>
      		
      </section>
    
    </main>
    <script>
   
	  
    </script>
</body>
</html>