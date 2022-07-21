<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>빠방 계약서</title>
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
     <%--  <%@include file="/WEB-INF/inc/brokerHeader.jsp" %> --%>
      <section>
      		<h1 style="text-align:center;">계약서 작성</h1>
      		<hr />
      		
      		<!-- 월세, 전세일 경우 -->
      		<c:if test="${category == '매매' }">
      		<h2>부동산 매매 계약서</h2>
      		
      		<table id="contract">
      			<tr>
      				<td colspan="10" class="gray">
      				 매도인과 매수인 쌍방은 아래 표시 부동산에 관하여 다음 계약 내용과 같이 매매계약을 체결한다.<br>
 					<span style="font-weight: bold;">1.부동산의 표시</span>
      				</td>
      			</tr>
      			<tr>
      				<th>소재지</th>
      				<td colspan="10">
      					${dto.realestateAddr }
      				</td>
      			</tr>
      			<tr>
      				<th>토지</th>
      				<th>지목</th>
      				<td colspan="3">
      					<select name="" id="">
      						<option value="대">대</option>
      						<option value="전">전</option>
      						<option value="공장 용도">공장 용도</option>
      						<option value="기타">기타</option>
      					</select>
      				</td>
      				<th>면적</th>
      				<td colspan="3" style = "text-align:justify;">429.2<span >㎡</span></td>
      			</tr>
      			<tr>
      				<th>건물</th>
      				<th>구조 용도</th>
      				<td colspan="3">
      					${dto.mainUse }
      				</td>
      				<th>면적</th>
      				<td colspan="3">
      					${dto.gywidth }
      				 <span>㎡</span></td>
      			</tr>
      			<tr>
      				<td colspan="10" class="gray">
      					<span class="bold">2. 계약내용</span><br>
 제 1 조 (목적) 위 부동산의 매매에 대하여 매도인과 매수인은 합의에 의하여 매매대금을 아래와 같이 지불하기로 한다.
      				</td>
      			</tr>
      			<tr>
      				<th>매매대금</th>
      				<td colspan="10">
      					금 ${dto.price }	만원정
      				</td>
      			</tr>
      			<tr>
      				<th>계약금</th>
      				<td colspan="10">
      					금 <input type="text" /> 만원은 계약시 지불하고 영수함.
      				</td>
      			</tr>
      			<tr>
      				<th>융자금</th>
      				<td colspan="3">
      					금 <input type="text" />만원을 승계키로 한다.
      				</td>
      				<th>임대보증금</th>
      				<td colspan="4">
      					총 <input type="text" />만원을 승계키로 한다.
      				</td>
      				
      			</tr>
      			<tr>
      				<th>잔금</th>
      				<td colspan="10">
      				금 10000만원은 <input type="text" />에 지불한다.
      				</td>
      			</tr>
      			<tr>
      				<td colspan="10" style="font-size:11px;">
      					제 2 조 (<span class="bold">소유권 이전 등</span>) 매도인은 매매대금의 잔금 수령과 동시에 매수인에게 소유권이전등기에 필요한 모든 서류를 교부하고 등기
   절차에 협력하며, 위 부동산의 인도일은           년       월       일로 한다.<br>
제 3 조 (<span class="bold">제한물권 등의 소멸</span>) 매도인은 위의 부동산에 설정된 저당권, 지상권, 임차권 등 소유권의 행사를 제한하는 사유가 있거나,   
   제세공과 기타 부담금의 미납금 등이 있을 때에는 잔금 수수일까지 그 권리의 하자 및 부담 등을 제거하여 완전한 소유권을 매수인
   에게 이전한다. 다만, 승계하기로 합의하는 권리 및 금액은 그러하지 아니하다.<br>
제 4 조 (<span class="bold">지방세 등</span>) 위 부동산에 관하여 발생한 수익의 귀속과 제세공과금 등의 부담은 위 부동산의 인도일을 기준으로 하되, 지방세의 
   납부의무 및 납부책임은 지방세법의 규정에 의한다.<br>
제 5 조 (<span class="bold">계약의 해제</span>) 매수인이 매도인에게 중도금(중도금이 없을때에는 잔금)을 지불하기 전까지 매도인은 계약금의 배액을 상환하고, 
   매수인은 계약금을 포기하고 본 계약을 해제할 수 있다.<br>
제 6 조 (<span class="bold">채무불이행과 손해배상</span>) 매도인 또는 매수인이 본 계약상의 내용에 대하여 불이행이 있을 경우 그 상대방은 불이행한자에 대
   하여 서면으로 최고하고 계약을 해제할 수 있다. 그리고 계약당사자는 계약해제에 따른 손해배상을 각각 상대방에게 청구할 수          있으며, 손해배상에 대하여 별도의 약정이 없는 한 계약금을 손해배상의 기준으로 본다. <br>
제 7 조 (<span class="bold">중개수수료</span>) 중개업자는 매도인 또는 매수인의 본 계약 불이행에 대하여 책임을 지지 않는다. 또한, 중개수수료는 본 계
   약체결과 동시에 계약 당사자 쌍방이 각각 지불하며, 중개업자의 고의나 과실없이 본 계약이 무효․취소 또는 해제되어도 중개수수료
   는 지급한다. 공동 중개인 경우에 매도인과 매수인은 자신이 중개 의뢰한 중개업자에게 각각 중개수수료를 지급한다.(중개수수료는  
   거래가액의           %로 한다.)<br>
제 8 조 (<span class="bold">중개수수료 외</span>) 매도인 또는 매수인이 본 계약 이외의 업무를 의뢰한 경우 이에 관한 보수는 중개수수료와는 별도로 지급하며 그 금액은 합의에 의한다.<br>
제 9 조 (<span class="bold">중개대상물확인․설명서 교부 등</span>) 중개업자는 중개대상물 확인․설명서를 작성하고 업무보증관계증서(공제증서 등) 사본을 첨부하여 
   계약체결과 동시에 거래당사자 쌍방에게 교부한다.<br>
      				

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
      					본 계약을 증명하기 위하여 계약 당사자가 이의 없음을 확인하고 각각 서명․날인 후 임대인, 임차인 및 개업공인중개사는 각각 1통씩 보관한다.<br>                                                                                                   <span style =" display : inline-block;text-align:right; width: 95%;">2020년   05월  01일</span> 
      				</td>
      			</tr>
      			<tr>
      				<th rowspan="4" class="width">매도인</th>
      			</tr>
      			<tr>
      				<th>주소</th>
      				<td colspan="6"></td>
      				<td rowspan="4"></td>
      			</tr>
      			<tr>
      				<th>주민등록번호</th>
      				<td  colspan="2">내용</td>
      				<th>전화</th>
      				<td>내용</td>
      				<th>성명</th>
      				<td></td>
      			</tr>
      			<tr>
      				<th>대리인</th>
      				<th style="width: 50px;">주소</th>
      				<td>내용</td>
      				<th>주민등록번호</th>
      				<td>내용</td>
      				<th>성명</th>
      				<td>내용</td>
      			</tr>
      			<tr>
      				<th rowspan="4" >매수인</th>
      			</tr>
      			<tr>
      				<th>주소</th>
      				<td colspan="6"></td>
      				<td rowspan="4"></td>
      			</tr>
      			<tr>
      				<th>주민등록번호</th>
      				<td  colspan="2">내용</td>
      				<th>전화</th>
      				<td>내용</td>
      				<th>성명</th>
      				<td></td>
      			</tr>
      			<tr>
      				<th>대리인</th>
      				<th style="width: 50px;">주소</th>
      				<td>내용</td>
      				<th>주민등록번호</th>
      				<td>내용</td>
      				<th>성명</th>
      				<td>내용</td>
      			</tr>
      			<tr>
      				<th rowspan="5" >개인공인중개사</th>
      			</tr>
      			<tr>
      				<th>사무소 소재지</th>
      				<td colspan="7"></td>
      			</tr>
      			<tr>
      				<th>사무소 명칭</th>
      				<td colspan="7"></td>
      				
      			</tr>
      			<tr>
      				<th>대표</th>
      				<td  colspan="3">내용</td>
      				<th>서명및날인</th>
      				<td colspan="3">내용</td>
      			</tr>
      			<tr>
      				<th>등록번호</th>
      				<td colspan="3">내용</td>
      				<th>전화</th>
      				<td colspan="3">내용</td>
      			</tr>
      		
      		</table>
      		
      		
      		
      		</c:if> <!-- 매매계약서  -->
      		
      		
      		<c:if test="${category == '전세' || category == '월세'}">
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
    		
    		
      		<table id="contract">
      			<tr>
      				<td colspan="10" class="gray">
      				 임대인과 임차인 쌍방은 아래 표시 부동산에 관하여 다음 계약내용과 같이 임대차계약을 체결한다.<br>
 					<span style="font-weight: bold;">1.부동산의 표시</span>
      				</td>
      			</tr>
      		
      			<tr>
      				<th>소재지</th>
      				<td colspan="10">${dto.realestateAddr }</td>
      			</tr>
      			<tr>
      				<th>토지</th>
      				<th>지목</th>
      				<td colspan="3">
      					<select name="" id="">
      						<option value="대">대</option>
      						<option value="전">전</option>
      						<option value="공장 용도">공장 용도</option>
      						<option value="기타">기타</option>
      					</select>
      				</td>
      				<th>면적</th>
      				<td colspan="3" style = "text-align:justify;">429.2<span >㎡</span></td>
      			</tr>
      			<tr>
      				<th>건물</th>
      				<th>구조 용도</th>
      				<td colspan="3">
      					${dto.mainUse }
      				</td>
      				<th>면적</th>
      				<td colspan="3">
      					${dto.gywidth }
      				 <span>㎡</span></td>
      			</tr>
      			<tr>
      				<th>임대할부분</th>
      				<td colspan="4">202호 전 부분</td>
      				<th>면적</th>
      				<td colspan="3">${dto.gywidth }<span >㎡</span></td>
      			</tr>
      			<tr>
      				<td colspan="10" class="gray">
      					<span class="bold">2. 계약내용</span><br>
 제 1 조 (목적) 위 부동산의 임대차에 한하여 임대인과 임차인은 합의에 의하여 임차보증금 및 차임을 아래와 같이 지불하기로 한다.
      				</td>
      			</tr>
      			<tr>
      				<th>보증금</th>
      				<td colspan="10">
      					금 ${dto.deposit }만원
      				</td>
      			</tr>
      			<tr>
      				<th>계약금</th>
      				<td colspan="10">
      					금 <input type="text" /> 만원은 계약시 지불하고 영수함.
      				</td>
      			</tr>
      			<tr>
      				<th>잔금</th>
      				<td colspan="10">
      					금 100000만원은 <input type="text" />에 지불한다.
      				</td>
      			</tr>
      			<c:if test="${category == '월세'}">
      			<tr>
      				<th>차임</th>
      				<td colspan="10">
      					금 ${dto.price }만원 은 매월 <input type="text" />에 입금한다.
      				</td>
      			</tr>
      			</c:if>
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
      					본 계약을 증명하기 위하여 계약 당사자가 이의 없음을 확인하고 각각 서명․날인 후 임대인, 임차인 및 개업공인중개사는 각각 1통씩 보관한다.<br>                                                                                                   <span style =" display : inline-block;text-align:right; width: 95%;"><input type="text" /></span> 
      				</td>
      			</tr>
      			<tr>
      				<th rowspan="4" class="width">임대인</th>
      			</tr>
      			<tr>
      				<th>주소</th>
      				<td colspan="6"></td>
      				<td rowspan="4"></td>
      			</tr>
      			<tr>
      				<th>주민등록번호</th>
      				<td  colspan="2">내용</td>
      				<th>전화</th>
      				<td>내용</td>
      				<th>성명</th>
      				<td></td>
      			</tr>
      			<tr>
      				<th>대리인</th>
      				<th style="width: 50px;">주소</th>
      				<td>내용</td>
      				<th>주민등록번호</th>
      				<td>내용</td>
      				<th>성명</th>
      				<td>내용</td>
      			</tr>
      			<tr>
      				<th rowspan="4" >임차인</th>
      			</tr>
      			<tr>
      				<th>주소</th>
      				<td colspan="6"></td>
      				<td rowspan="4"></td>
      			</tr>
      			<tr>
      				<th>주민등록번호</th>
      				<td  colspan="2">내용</td>
      				<th>전화</th>
      				<td>내용</td>
      				<th>성명</th>
      				<td></td>
      			</tr>
      			<tr>
      				<th>대리인</th>
      				<th style="width: 50px;">주소</th>
      				<td>내용</td>
      				<th>주민등록번호</th>
      				<td>내용</td>
      				<th>성명</th>
      				<td>내용</td>
      			</tr>
      			<tr>
      				<th rowspan="5" >개인공인중개사</th>
      			</tr>
      			<tr>
      				<th>사무소 소재지</th>
      				<td colspan="7"></td>
      			</tr>
      			<tr>
      				<th>사무소 명칭</th>
      				<td colspan="7"></td>
      				
      			</tr>
      			<tr>
      				<th>대표</th>
      				<td  colspan="3">내용</td>
      				<th>서명및날인</th>
      				<td colspan="3">내용</td>
      			</tr>
      			<tr>
      				<th>등록번호</th>
      				<td colspan="3">내용</td>
      				<th>전화</th>
      				<td colspan="3">내용</td>
      			</tr>
      		
      		</table>
      		</c:if>
      		
      		<table>
      			<tr>
      				<td>
      					<input type="button" value="작성완료 및 서명" class="button blue" />
      				</td>
      			</tr>
      		</table>
      		
      </section>
    
    </main>
    <script>
   
	  
    </script>
</body>
</html>