<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/admin/adminMenu.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminQnaList.css">
<meta charset="UTF-8">
<title>Admin - QNA 목록</title>
<style>

a.atg {
	text-decoration: none;
	display: inline-block;
	width: 2rem;
	height: 2rem;
	border-radius: 0.2rem;
	margin: 0 0 5px 5px;
	color: #7695B7;
	cursor: pointer;
}

div.num {
	text-decoration: none;
	background-color: white;
	display: inline-block;
	color: #7695B7;
	font-weight: bold;
	width: 2rem;
	height: 2rem;
	border: 1px solid #7695B7;
	border-radius: 1rem;
}
div.num:hover{
	cursor: pointer;
	background-color: #7695B7;
}
a.num:hover{
	color: white;
}

a.num {
	text-decoration: none;
	display: inline-block;
	padding: 5px;
	color: #7695B7;
}
b.num{
	text-decoration: none;
	display: inline-block;
	padding: 5px;
	color: white;
}

b.num:hover{
	color: white;
}

div.bnum {
	text-decoration: none;
	background-color: #7695B7;
	display: inline-block;
	font-weight: bold;
	width: 2rem;
	height: 2rem;
	border: 1px solid #7695B7;
	border-radius: 1rem;
}
div.aul-paging{
margin-top: 25px;
margin-bottom: 80px;
}
</style>
</head>

<body>
<div class="boxx">
  	<h2 class="qnah">Q&A</h2>
	  	<c:choose>
			<c:when test="${not empty qnaList }">
			  		<table class="tbl">
			  		<tbody>
			  			<tr>
				  			<th class="qna">제목</th><th class="qna">작성자</th><th class="qna day">등록일</th><th class="qna">상세보기</th>
			  			</tr>
			  	<c:forEach var="qnaList" items="${qnaList }" end="10">
			  			<tr>
				  			<td class="qna">${fn:substring(qnaList.qna_title, 0, 5)}${fn:substring('...', 0, fn:length(qnaList.qna_title) - 5)} </td><td class="qna">${qnaList.qna_id }</td><td class="qna day">${qnaList.qna_date }</td>
				  			<td class="qna"><button type="button" class="selbtn" onclick="location.href='adminQnaListInfo.do?qna_num=${qnaList.qna_num}'">상세</button></td>
			  			</tr>
			  	</c:forEach>
			  		</tbody>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>Q&A가 없습니다</p>
	  			<table class="tbl">
	  			<tbody>
		  			<tr>
			  			<th class="qna">제목</th><th class="qna">작성자</th><th class="qna day">등록일</th><th class="qna">상세보기</th>
		  			</tr>
		  		</tbody>
			  	</table>
	  		</c:otherwise>
		</c:choose>

		<div id="pageList" class="aul-paging">
			<div style="display: block; text-align: center;" class="pag">
				<c:if test="${paging.startPage >  1 }">
					<a
						href="/adminQnaList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"
						class="atg">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="userp">
					<c:choose>
						<c:when test="${userp == paging.nowPage }">
							<div class="bnum"><b class="num">${userp }</b></div>
						</c:when>
						<c:when test="${userp != paging.nowPage }">
							<div class="num">
								<a href="/adminQnaList.do?nowPage=${userp }&cntPerPage=${paging.cntPerPage}" class="num">${userp }</a>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage }">
					<a href="/adminQnaList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" class="atg">&gt;</a>
				</c:if>
			</div>
		</div>
  </div>
</body>
</html>