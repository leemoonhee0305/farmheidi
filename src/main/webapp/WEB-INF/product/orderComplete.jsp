<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 농장</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/orderComplete.css">
<script>
var chk = false;
$(document).ready(function(){
	totalCount();
	orderTime()
});


function totalCount(){
	var totalTD = document.getElementsByClassName('oneProductTotal');
	var allProductTotal = 0;
	
	for(var i=0; i<totalTD.length; i++){
		allProductTotal += Number(totalTD[i].innerText.replace(',', ''));
	}
	document.getElementById('productTotal').innerText = allProductTotal.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	var shipfee = Number(document.getElementById('shipfee').innerText.replace(',', ''));
	document.getElementById('totalPrice').innerText = (allProductTotal + shipfee).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
}

function orderTime(){
	let orderID = document.getElementById('orderID').innerText;
	let orderHour = orderID.substr(6, 2);
	let orderMinute = orderID.substr(8, 2);
	
	document.getElementById('orderTime').innerText = ' '+orderHour+":"+orderMinute;
}

</script>
<%@ include file="/header.jsp" %>
</head>
<body>
	<%@ include file="/menu.jsp" %>
	<div id="entireBox">
	<div id="clearCommentBox">
		<h3 id="clearTitle">주문완료</h3>
	</div>
	
	<h4 class="infoTitle">결제정보</h4>
	<table class="payInfo">
		<tr><th>주문번호</th><td><strong id="orderID">${orderCom.oif_id}</strong></td></tr>
		<tr><th>주문일자</th><td>${orderCom.oif_date}<span id="orderTime"></span></td></tr>
		<tr><th>결제금액</th><td><strong><fmt:formatNumber value="${orderCom.oif_total}" pattern="###,###,###" /></strong>원</td></tr>
		<tr><th>결제수단</th><td>${orderCom.oif_ordtype}</td></tr>
		
	</table>
	<br>
	<h4 class="infoTitle">주문 상품 정보</h4>
	<table class="productInfo">
		<tr>
			<th colspan="2" class="firstTH">상품정보</th>
			<th>판매가</th>
			<th>수량</th>
			<th>합계</th>
		</tr>
		
		<c:forEach items="${orderWhat}" var="orderWhat">
			<tr>
				<td><img src="/resources/img/productPicture/${orderWhat.pro_file}" title="${orderWhat.pro_name} 상품 사진"></td>
				<td class="proInfoName">${orderWhat.pro_name}</td>
				<td>
					<fmt:formatNumber value="${orderWhat.pro_price}" pattern="###,###,###" /> 원
				</td>
				<td>${orderWhat.cart_amount}개</td>
				<td>
					<span class="oneProductTotal">
					<fmt:formatNumber value="${orderWhat.cart_totalp}" pattern="###,###,###" />
					</span>원
				</td>
			</tr>
		</c:forEach>

		<tr>
			<td colspan="5" id="proInfoTotalPrice">
				<span>상품금액 <span id="productTotal"></span> 원</span> + 
				<span>배송비 
					<span id="shipfee">
					<fmt:formatNumber value="${orderCom.oif_shipfee}" pattern="###,###,###" />
					</span>원
				</span> = 
				<span><span class="webBtn">합계 </span><strong><span id="totalPrice"></span></strong> 원</span>
			</td>
		</tr>
	</table>
	
	
	<h4 class="infoTitle">배송지 정보</h4>
	<table class="shipInfo">
		<tr>
			<th>받는사람이름</th><td>${orderCom.oif_shipname}</td>
		</tr>
		<tr>
			<th>우편번호</th><td>${orderCom.oif_shipaddr1}</td>
		</tr>
		<tr>
			<th>주소</th><td>${orderCom.oif_shipaddr2} , ${orderCom.oif_shipaddr3}</td>
		</tr>
		<tr>
			<th>휴대전화</th><td>${orderCom.oif_shipphone}</td>
		</tr>
		<tr>
			<th>일반전화</th><td>${orderCom.oif_shiptel}</td>
		</tr>
		<tr>
			<th>배송메시지</th><td>${orderCom.oif_shipmemo}</td>
		</tr>
	</table>
	<div id="buttons">
		<button type="button" onclick="location.href='/productList.do'">
			<span class="webBtn">상품목록 보러가기</span>
			<span class="mobBtn">상품목록</span>
		</button>
		<button type="button" onclick="location.href='../../main.jsp'">
			<span class="webBtn">메인으로 돌아가기</span>
			<span class="mobBtn">메인으로</span>
		</button>
	</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>