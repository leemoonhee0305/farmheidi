<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../header.jsp"%>
<%@ include file="mypageMenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 주문 배송 확인</title>
<style>
.myOrder-table { width: 100%;
	      text-align: center;
	      border-collapse: collapse;
	      border-top: 1px solid gray;
	      border-bottom: 1px solid gray;}
	      
 .myOrder-table:first-child {border-bottom: 1px solid #bababa;
		  background-color: #F0F8FF;} 

th, td {
	border: 0px solid #cdcdcd;
	border-collapse: collapse;
	text-align: center;
}
.odliTxt {font-weight: 600;}
.myO-th { font-family: 'SUITE-Regular'; background-color: lightgray; width: 200px; padding: 15px;}
.myO-td { font-weight: bold; padding: 15px 20px;}

.odliBody{ width: 80%; margin: 0 auto; margin-bottom: 100px; }

@media only screen and (max-width: 1000px) {
	.odliBody{ width: 75%; margin: 0 auto; margin-bottom: 100px; }
}
@media screen and (max-width : 968px){ .first-del{display : none;} }
@media only screen and (max-width: 600px) { .odliBody{width: 90%; margin: 0 auto; margin-bottom: 100px;} 
			.orderTable {width: 100%;} .myO-td {padding: 5px 0px;} .myO-th {padding: 5px 0px;} }
.hh3{ text-align: center; font-family: 'SBAggroB'; }
a.myOrderCan { color: #007bff; text-decoration: none; background-color: transparent;}
a.myOrderCan:hover { color: #0056b3; text-decoration: none; } 
a.myOrderDe { color: black; text-decoration: none; }
a.myOrderDe:hover { color: #26588d; text-decoration: none; }

</style>
<script>
	function deleteConf(oifId,oifShip ) {
	    if (confirm("상품 주문을 취소하시겠습니까?")) {
	        alert("취소되었습니다.");
	        console.log(oifId);
	        console.log(oifShip);
	        
	        
	        $.ajax({
	            type: "POST",
	            url: "myOrderCan.do", 
	            data: { oif_id : oifId , oif_shipstate : oifShip, oif_canstate : '주문취소' }, 
	            success: function (res) {
	            	console.log(res);
	                location.reload();
	            }
	        });
	    } 
	}
	
	$(function() { 
		$(".myO-td").each(function() {
		    var oif_canstate = $(this).text().trim();
		    if (oif_canstate === '취소완료') {
		      $(this).css({"color": "red"}); 
		    }
		  });
		});

</script>
</head>
<body>
<div class="odliBody">
	<h3 class="hh3">나의 주문 배송 조회</h3>
	<span class="odliTxt"><br>주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.<br>
			취소/교환/반품 신청은 배송완료일 기준 7일까지 가능합니다.<br></span>
	<br>
	<div class="orderTable">
		<table id="myOrder-table" class="myOrder-table">
			<tbody>
				<tr class="myO-tr">
					<th class="myO-th">주문번호</th>
					<th class="myO-th first-del">주문일자</th>
					<th class="myO-th">주문금액</th>
					<th class="myO-th">배송현황</th>
					<th class="myO-th">주문상태</th>
				</tr>
				<c:choose>
				<c:when test="${myOrderList ne null }">
				<c:forEach var="orderList" items="${myOrderList }">
				<tr class="myO-tr">
					<td class="myO-td"><a class="myOrderDe" href="orderInfoClear.do?oifID=${orderList.oif_id}">${orderList.oif_id}</a></td>
					<td class="myO-td first-del">${orderList.oif_date}</td>
					<td class="myO-td"><fmt:formatNumber
						value="${orderList.oif_total}" pattern="#,###" /> 원</td>
					<td class="myO-td">${orderList.oif_shipstate}</td>
					<td class="myO-td">
					<c:choose>
						<c:when test="${orderList.oif_canstate eq '정상주문'}">
						<a class="myOrderCan" onclick="deleteConf('${orderList.oif_id}', '${orderList.oif_shipstate}')">[주문취소]</a>
						</c:when>
						<c:otherwise>취소완료 </c:otherwise>
					</c:choose></td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">상품 주문 내역이 없습니다.</td>
					</tr>
				</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>