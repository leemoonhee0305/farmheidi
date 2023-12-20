<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="adminMenu.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminMain.css">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">

<body>
<div class="wrap">
<div class="container">
  <div class="box">
  <table class="adTit">
  	<th class="adMt">체험 예약 현황</th><th><a class="adMli" href="/adminResvList.do">더보기</a></th>
  </table>
	  	<c:choose>
			<c:when test="${not empty resvList }">
			  		<table class="resvTb">
			  			<tr><th class="resv">예약날짜</th><th class="resv">예약자명</th><th class="resv">인원</th></tr>
			  	<c:forEach var="resvList" items="${resvList }" end="4">
			  			<tr><td class="resv">${resvList.resv_date }</td><td class="resv">${resvList.resv_name }</td><td class="resv">${resvList.resv_headcount } / ${resvList.resv_youthheadcount }</td></tr>
			  	</c:forEach>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>예약 내역이 없습니다.</p>
	  		</c:otherwise>
		</c:choose>
  </div>
  <div class="box">
  <table class="adTit">
  	<th class="adMt">주문 배송 현황</th><th><a class="adMli" href="/getAllOrder.do">더보기</a></th>
  </table>
  	 <c:choose>
			<c:when test="${oifList ne null }">
			  		<table class="proTb">
			  			<tr><th class="resv">주문번호</th><th class="resv">상품상태</th><th class="resv">주문자</th></tr>
			  	<c:forEach var="oif" items="${oifList}" end="5" >
			  			<tr><td class="resv">${oif.oif_id}</td><td class="resv">${oif.oif_shipstate }</td><td class="resv">${oif.user_id }</td></tr>
			  	</c:forEach>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>예약 내역이 없습니다.</p>
	  		</c:otherwise>
		</c:choose>
  </div>
  <script>
  $(function() { 
		$(".qna").each(function(i,o) {
		    var qna_reply = $(this).children('.qchild').text();
		    if (qna_reply === '답변필요') {
		    	$(this).children('.qchild').css({"color": "#bd0909"}); 
		    }
		  });
		});
  </script>
  <div class="box">
    <table class="adTit">
  	<th class="adMt">Q&A 글 현황</th><th><a class="adMli" href="/adminQnaList.do">더보기</a></th>
  </table>
  	<c:choose>
			<c:when test="${not empty qnaList }">
			  		<table class="qnaTb">
			  			<tr><th class="qna">제목</th><th class="qna">작성자</th><th class="qna">답변여부</th></tr>
			  	<c:forEach items="${qnaList}" var="qna">
			  			<tr><td class="qna">${qna.qna_title }</td><td class="qna">${qna.qna_id }</td>
			  			<td class="qna"><c:choose><c:when test="${qna.qna_reply eq null}"><span class="qchild">답변필요</span></c:when>
			  			<c:otherwise>답변완료</c:otherwise></c:choose></td></tr>
			  	</c:forEach>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>Q&N내역이 없습니다</p>
	  		</c:otherwise>
		</c:choose>
  </div>
  <div class="box">
	<table class="adTit">
  	<th class="adMt">회원 가입 현황</th><th><a class="adMli" href="adminUserList.do">더보기</a></th>
  	</table>
  	<c:choose>
			<c:when test="${not empty userList }">
			  		<table class="userTb">
			  			<tr><th class="user">아이디</th><th class="user">이름</th><th class="user">가입날짜</th></tr>
			  	<c:forEach items="${userList}" var="user">
			  			<tr><td class="user">${fn:substring(user.user_id, 0, 5)}${fn:substring('...', 0, fn:length(user.user_id) - 5)}
			  			</td><td class="user">${user.user_name }</td><td class="user">${user.join_date }</td></tr>
			  	</c:forEach>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>회원이 존재하지 않습니다.</p>
	  		</c:otherwise>
		</c:choose>
  
  </div>
</div>
</div>

</body>
</html>