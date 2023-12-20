<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, minimum-scale=1"> -->
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/inMyCart.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/inMyCart.css">
<%@ include file="/header.jsp" %>
</head>
<body>
	<%@ include file="/menu.jsp" %>
	<div id="entireForm">
	<h4 id="cartTitle">장바구니</h4>
	<form name="cartform">
		<%int i = 0; %>
		<c:choose>
			<c:when test="${!empty myCartList}">
			<div class="table-box">
			<table class="entTable">
			<tr>
				<th><input type="checkbox" id="checkAll" class="result" onclick="checkAllClick()"></th>
				<th>상품정보</th>
				<th>판매가</th>
				<th>수량</th>
				<th>가격</th>
				<th></th>
			</tr>
				<c:forEach items="${myCartList}" var="cartProduct">
					<tr>
						<td class="firstTD">
							<input type="checkbox" name="idList" onclick="checkBoxValueChanged()" class="result" value="${cartProduct.pro_num}">
						</td>
						<td class="proName">
							<a href="/productDetail.do?pro_num=${cartProduct.pro_num}" class="productLink">
							<img class="productIMG" src="/resources/img/productPicture/${cartProduct.pro_file}" title="${cartProduct.pro_name} 상품 사진" alt="${cartProduct.pro_name} 상품 사진">
							<span class="proNameSpan">${cartProduct.pro_name}</span>
							</a>
						</td>
						<td class="eachPrice">
							<fmt:formatNumber value="${cartProduct.pro_price}" pattern="###,###,###" />원
						</td>
						<td class="heightTD">
							<button type="button" onclick='count(1, <%= i %>, "${cartProduct.pro_num}")' class="result">
								<img class="upButton" onmouseover="mouseoverU(<%= i %>)" onmouseleave="mouseleaveU(<%= i %>)" src="/resources/img/productUse/caret-up.svg">
							</button>
							<div class="selectAmount">${cartProduct.cart_amount}</div>
							<button type="button" onclick='count(-1, <%= i %>, "${cartProduct.pro_num}")' class="result">
								<img class="downButton" onmouseover="mouseoverD(<%= i %>)" onmouseleave="mouseleaveD(<%= i %>)" src="/resources/img/productUse/caret-down.svg">
							</button>
						</td>
						<td class="heightTD resultPriceTD">
							<div class="rpwon">
								<span class="resultPrice">
									<fmt:formatNumber value="${cartProduct.cart_totalp}" pattern="###,###,###" />
								</span>원
							</div>
						</td>
						<td class="heightTD lastTD">
							<c:choose>
							<c:when test="${not empty cartProduct.user_id}">
								<a href="/delete.do?pro_num=${cartProduct.pro_num}&user_id=${user_id}">
									<img class="cartTrashButton" onmouseover="mouseoverT(<%= i %>)" onmouseleave="mouseleaveT(<%= i %>)" src="/resources/img/productUse/trash3.svg">
								</a>
							</c:when>
							<c:otherwise>
								<a href="/delete.do?pro_num=${cartProduct.pro_num}&cart_ckid=${cartProduct.cart_ckid}">삭제</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
					<% i++; %>
				</c:forEach>
				</table>
				</div>
				<div id="priceSection">
				상품금액 <span id="prosPrice" class="numberStrong"></span>원
				+ 배송비 <span id="shipPrice">5,000</span>원
				= <span class="notNeed">총가격 </span><span id="totalPrice" class="numberStrong"></span>원
				</div>	
				<div id="btns">
						<div>
						<span class="cartBtnComment">선택상품을</span>
						<button type="button" class="cartBtn" id='delBtn'><span class="btnText">삭제하기</span><span class="btnTextSel">선택삭제</span></button>
						<button type="button" class="cartBtn" id='selBtn'><span class="btnText">구매하기</span><span class="btnTextSel">선택구매</span></button>
						</div>
						<button type="button" class="cartBtn" onclick="delcart()">장바구니 비우기</button>
				</div>
				<table id="priceBoxTable">
					<tr><th class="priceBox">결제예정금액</th><td id="totalPrice2" class="priceBox"></td></tr>
				</table>
			</c:when>
			<c:otherwise>
				<p>장바구니가 비어있습니다</p>
			</c:otherwise>
		</c:choose>
		
	</form>
		<div id="btns2">
			<button type="button" class="cartBtn colorBtn" onclick="location.href='/productList.do'">상품목록 페이지로</button>
			<%if(i >= 1){ %>
			<button type="button" class="cartBtn colorBtn" id="allOrderBtn">전체상품 주문하기</button>
			<%} %>
		</div>
	</div>
	<%if(session.getAttribute("user_id") != null){ %>
	<input type="hidden" id="logined" value="${user_id }">
	<%} %>
	<%@ include file="/footer.jsp"%>
</body>
</html>