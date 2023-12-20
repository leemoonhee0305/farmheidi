<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 - 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/adminProduct.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminOrderDetail.css">
<script>
//핸드폰 유효성검사 체크 	
$(function(){
	/*전화번호 수동 입력시 자동완성 기능  .telFormat클래스는 모두 적용됨.*/
	$(document).on("keyup", ".telFormat", function(idx,data) {
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") ); 
		//휴대폰 유효성 검사
		if($(this).attr("id") == "user_phone"){
			var reg_mobile = /^01([0|1|6|7|8|9]?)-?([0-9]{4})-?([0-9]{4})$/;
			var userMobil = $('#user_phone').val().trim();
			if(!reg_mobile.test(user_phone)){
	    		$('#user_phone').show();
	    		mobileChk = 'N';
			}else{
	    		$('#user_phone').hide();
	    		mobileChk = 'Y';
			}
		}
	});
});

$(document).ready(function(){
	let shipFee = document.getElementById('shipFee').innerText.replace(',', '');
	let orderPrice = document.getElementById('orderPrice').innerText.replace(',', '');
	let onlyProductTotalPrice =  Number(orderPrice)-Number(shipFee);
	document.getElementById('onlyProductTotalPrice').innerText = onlyProductTotalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");	
});

</script>
</head>
<body>
	<%@ include file="./adminMenu.jsp" %>
	<div id="entireBox">
	<c:choose>
	<c:when test="${!empty orderAboutInfo}">
	
	<div class="eachBox">
	<h3>주문상품 목록</h3>
		<p>
			<span>주문번호 <strong><span id="oifID">${orderAboutInfo.oif_id}</span></strong></span>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<span>주문일시 ${orderAboutInfo.oif_date}<span id="hms">-${fn:substring(orderAboutInfo.oif_id,6,8)}:${fn:substring(orderAboutInfo.oif_id,8,10)}</span></span>
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<span>주문총액 <fmt:formatNumber value="${orderAboutInfo.oif_total}" pattern="###,###,###" />원</span>
		</p>
	
		<table class="productInfoTable">
			<tr>
				<th>상품번호</th>
				<th colspan="2">상품정보</th>
				<th>수량</th>
				<th>총금액</th>
			</tr>
			<c:choose>
			<c:when test="${!empty orderProductInfo}">
				<c:forEach items="${orderProductInfo}" var="productInfo">
					<tr>
						<td class="textCenter">${productInfo.pro_num}</td>
						<td><img src="/resources/img/productPicture/${productInfo.pro_file}"></td>
						<td>${productInfo.pro_name}</td>
						<td class="textCenter">${productInfo.cart_amount}</td>
						<td class="textCenter"><fmt:formatNumber value="${productInfo.cart_totalp}" pattern="###,###,###" /></td>
					</tr>
				</c:forEach>
			</c:when>
			</c:choose>
		</table>
	</div>
	
	
	<div class="eachBox">
		<h3>결제상세정보 확인</h3>
		<table class="payInfoTable">
		<colgroup>
			<col width="30%" />
			<col width="70%" />
		</colgroup>
			<tr>
				<th>총 상품금액</th>
				<td><span id="onlyProductTotalPrice"></span></td>
			</tr>
			<tr>
				<th>배송비</th>
				<td id="shipFee"><fmt:formatNumber value="${orderAboutInfo.oif_shipfee}" pattern="###,###,###" /></td>
			</tr>
			<tr>
				<th>결제금액</th>
				<td id="orderPrice"><fmt:formatNumber value="${orderAboutInfo.oif_total}" pattern="###,###,###" /></td>
			</tr>
			<tr>
				<th>결제방법</th>
				<td>${orderAboutInfo.oif_ordtype}</td>
			</tr>
		</table>
	</div>
	
	
	<div class="eachBox">	
		<h3>주문자/수령자 정보</h3>
		<div class="infoDiv">
		<form>
		<div class="infoTableDiv">
		<h4>주문자 정보</h4>
		<table class="infoTable">
			<tr class="infoTableFirstTR">
				<th>이름</th>
				<td><input name="user_name" id="user_name" value="${orderAboutInfo.user_name}"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input name="oif_ordtel" id="oif_ordtel" class="telFormat" value="${orderAboutInfo.oif_ordtel}"></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input name="user_phone" id="user_phone" class="telFormat" value="${orderAboutInfo.user_phone}"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
				   	<input type="text" class="postcode" name="oif_ordaddr1" id="oif_ordaddr1" value="${orderAboutInfo.oif_ordaddr1}">
	               	<input type="button" class="postBtn" onclick="execDaumPostcode(0)" value="우편번호 찾기"><br>
	               	<input type="text" class="address" name="oif_ordaddr2" id="oif_ordaddr2" value="${orderAboutInfo.oif_ordaddr2}"><br>
	               	<input type="text" class="detailAddress" name="oif_ordaddr3" id="oif_ordaddr3" value="${orderAboutInfo.oif_ordaddr3}">
	               	<input type="hidden" class="extraAddress" placeholder="참고항목">
					
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="user_mail" id="user_mail" value="${orderAboutInfo.user_mail}"></td>
			</tr>
		</table>
		</div>
		
		<div class="infoTableDiv">
		<h4>수령자 정보</h4>
		<table class="infoTable">
			<tr class="infoTableFirstTR">
				<th>이름</th>
				<td><input name="oif_shipname" id="oif_shipname" value="${orderAboutInfo.oif_shipname}"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input name="oif_shiptel" id="oif_shiptel" class="telFormat" value="${orderAboutInfo.oif_shiptel}"></td>
			</tr>
			<tr>
				<th>핸드폰</th>
				<td><input name="oif_shipphone" id="oif_shipphone" class="telFormat" value="${orderAboutInfo.oif_shipphone}"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
				  	<input type="text" class="postcode" name="oif_shipaddr1" id="oif_shipaddr1" value="${orderAboutInfo.oif_shipaddr1}">
		            <input type="button" class="postBtn" onclick="execDaumPostcode(1)" value="우편번호 찾기"><br>
		            <input type="text" class="address" name="oif_shipaddr2" id="oif_shipaddr2" value="${orderAboutInfo.oif_shipaddr2}"><br>
		            <input type="text" class="detailAddress" name="oif_shipaddr3" id="oif_shipaddr3" value="${orderAboutInfo.oif_shipaddr3}">
		            <input type="hidden" class="extraAddress" placeholder="참고항목">
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input name="oif_shipmail" id="oif_shipmail" value="${orderAboutInfo.oif_shipmail}"></td>
			</tr>
			<tr>
				<th>배송메모</th>
				<td>${orderAboutInfo.oif_shipmemo}</td>
			</tr>
		</table>
		</div>
		
		<input type="hidden" name="oif_id" id="oif_id" value="${orderAboutInfo.oif_id}">
		</form>
		</div>
		<div id="btn">
			<button type="button" onclick="infoUpdate()">수정</button>
			<button type="button" onclick="location.href='/getAllOrder.do'">뒤로</button>
		</div>
	</div>
	
		</c:when>
	</c:choose>
	</div>
</body>
</html>