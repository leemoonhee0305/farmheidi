<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.farm.util.PagingVO" %>
<%
	PagingVO pageInfo = (PagingVO)request.getAttribute("paging");
	int listCount=pageInfo.getTotal();
	int nowPage=pageInfo.getNowPage();
	int maxPage=pageInfo.getLastPage(); //최대 페이지 개수
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage(); //endPage는 보여지는 것 중 마지막 페이지 - LastPage는 찐 마지막 페이지
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 - 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminOrderList.css">
<script>
	function pageList(page){
		location.href="/getAllOrder.do?page="+page;
	}
</script>
</head>
<body>
	<%@ include file="./adminMenu.jsp" %>
	<div id="entireBox">
	<div class="eachTableBox">
	<h3>전체주문통계</h3>
	<table class="totalInfo">
		<tr>
			<th colspan="2">전체 주문현황</th>			
			<th colspan="5">주문상태 현황</th>			
		</tr>
		
		<tr>
			<th>총 주문건수</th>
			<th>총 주문액</th>
			<th>입금완료</th>
			<th>배송준비</th>
			<th>배송중</th>
			<th>배송완료</th>
			<th>취소</th>
		</tr>
		<tr>
			<td>${allOrderCount}</td>
			<td>
				<fmt:formatNumber value="${allOrderTotal}" pattern="###,###,###" />원
			</td>
			<td>${getOrderClearCount}</td>
			<td>${getShipPrepareCount}</td>
			<td>${getShipIngCount}</td>
			<td>${getShipClearCount}</td>
			<td>${getCancelCount}</td>
		</tr>
	</table>
	</div>
	
	<div class="eachTableBox">
	<h3>검색</h3>
	<form action="/getAllOrder.do">
	<table class="searchBox">
		<tr>
			<th>검색어</th>
			<td>
				<select name="searchCondition">
					<option value="orderID">주문번호</option>
					<option value="userID">회원아이디</option>
					<option value="userName">주문자명</option>
					<option value="shipName">수령자명</option>
					<option value="shipPhone">수령자 휴대전화</option>
				</select>
				<input name="searchKeyword" type="text">
			</td>
		</tr>
		<tr>
			<th>주문날짜</th>
			<td>
				<input type="date" name="searchDate1">~<input type="date" name="searchDate2">
			</td>
		</tr>
		<tr>
			<th>주문상태</th>
			<td>
				<label><input type="radio" name="searchOrderState" value="입금완료">입금완료</label>
				<label><input type="radio" name="searchOrderState" value="배송준비">배송준비</label>
				<label><input type="radio" name="searchOrderState" value="배송중">배송중</label>
				<label><input type="radio" name="searchOrderState" value="배송완료">배송완료</label>
				<label><input type="radio" name="searchOrderState" value="주문취소">주문취소</label>
			</td>
		</tr>
	</table>
		<div class="searchBtns">
			<input type="submit" class="inputBtn" value="검색하기">
			<input type="reset" class="inputBtn" value="다시쓰기">
		</div>
	</form>
	</div>
	
	
	<div class="eachTableBox">
	<h3>최근 주문내역</h3>
	<table class="recentOrderTable">
		<tr>
			<th>주문번호</th>
			<th>주문상태</th>
			<th>주문자명</th>
			<th>수령자명</th>
			<th>휴대전화</th>
			<th>총주문액</th>
			<th>주문일시</th>
			<th>취소날짜</th>
			<th>주문상태</th>
			<th></th>
		</tr>
		<c:choose>
			<c:when test="${!empty allOrderList}">
				<c:forEach items="${allOrderList}" var="eachOrder">
					<tr>
						<td><a href="/orderWhat.do?oif_id=${eachOrder.oif_id}">${eachOrder.oif_id}</a></td>
						<td class="seltd1">
							<span class="changeSpan1">${eachOrder.oif_shipstate}</span>
							<c:choose><c:when test="${eachOrder.oif_canstate =='정상주문'}">
							<select name="oif_shipstate" class="oif_shipstateSel">
								<c:forEach items="${shipStateMap}" var="option1">
									<option value="${option1.value}" ${option1.value == eachOrder.oif_shipstate ? 'selected' : ''}>${option1.key}</option>
								</c:forEach>
							</select>
							</c:when></c:choose>
						</td>
						<td>${eachOrder.user_name}</td>
						<td>${eachOrder.oif_shipname}</td>
						<td>${eachOrder.user_phone}</td>
						<td>
							<fmt:formatNumber value="${eachOrder.oif_total}" pattern="###,###,###" />
						</td>
						<td>${eachOrder.oif_date}</td>
						<td>${eachOrder.oif_candate}</td>
						<td class="seltd2">
							<span class="changeSpan2">${eachOrder.oif_canstate}</span>
							<c:choose><c:when test="${eachOrder.oif_shipstate =='입금완료' && eachOrder.oif_canstate =='정상주문'}">
							<select name="oif_canstate" class="oif_canstateSel">
								<c:forEach items="${canStateMap}" var="option2">
									<option value="${option2.value}" ${option2.value == eachOrder.oif_canstate ? 'selected' : ''}>${option2.key}</option>
								</c:forEach>
							</select>
							</c:when></c:choose>
						</td>
						<td>
							<button type="button" class="modifyBtn" onclick="stChange(${eachOrder.oif_id}, this)">수정</button>
						</td>
					</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr><td colspan="9">주문 내역이 없습니다.</td></tr>
			</c:otherwise>
		</c:choose>
	</table>
	</div>
	<script>
	
	function stChange(oif_id, this_var){
		let val1 = $(this_var).parent().prevAll(".seltd1").children("select").val();
		let val2 = $(this_var).parent().prevAll(".seltd2").children("select").val();
		let noval1 = $(this_var).parent().prevAll(".seltd1").children("span")[0].innerText;
		let noval2 = $(this_var).parent().prevAll(".seltd2").children("span")[0].innerText;
		if(val1 == undefined){val1=noval1;}
		if(val2 == undefined){val2=noval2;}
		$.ajax({
			url : "/upOrderState.do",
			type : "post",
			data : {"oif_id":oif_id, "oif_shipstate" :val1, "oif_canstate" :val2},
			cache : false,
			success: function(res){
				if(res > 0){
					document.location.reload();
					alert('변경되었습니다.');
				}else{
					alert("상태 변경 실패");
				}
			},
			error: function(){
				
			}
		});
		
	}
	
	</script>
	
	
	<section id="pageList" class="pageList">
	
<%-- 		<% if(nowPage<=1){ %>  --%>
<!-- 			[이전]&nbsp; -->
<%-- 		<%}else{ %> --%>
<%-- 			<a onclick="pageList('<%=nowPage-1 %>')">[이전]</a>&nbsp; --%>
			
<%-- 		<%} %> --%>

<%-- 		<%for(int a=startPage;a<=endPage;a++){ --%>
<%-- 				if(a==nowPage){%> --%>
<%-- 					<span id="nowPage">[<%=a %>]&nbsp;</span> --%>
<%-- 				<%}else{ %> --%>
<%-- 					<a onclick="pageList('<%=a %>')">[<%=a %>]</a>&nbsp; --%>
					
<%-- 				<%} %> --%>
<%-- 		<%} %> --%>

<%-- 		<%if(nowPage>=maxPage){ %> --%>
<!-- 			[다음] -->
<%-- 		<%}else{ %> --%>
<%-- 			<a onclick="pageList('<%=nowPage+1 %>')">[다음]</a> --%>
<%-- 		<%} %> --%>
			<% if(nowPage<=1){ %>
				<button type="button" class="prevbtn notlinkbtn">&lt;</button>
			<%}else{ %>
				<button type="button" class="prevbtn" onclick="pageList('<%=nowPage-1 %>')">&lt;</button>
			<%} %>
			
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
						<button type="button" class="listbtn viewbtn notlinkbtn"><%=a%></button>
					<%}else{ %>
						<button type="button" class="listbtn" onclick="pageList('<%=a %>')"><%=a%></button>
					<%} %>
			<%} %>
				
			<%if(nowPage>=maxPage){ %>
				<button type="button" class="nextbtn notlinkbtn">&gt;</button>
			<%}else{ %>
				<button type="button" class="nextbtn" onclick="pageList('<%=nowPage+1 %>')">&gt;</button>
			<%} %>
		
	</section>
	</div>
</body>
</html>