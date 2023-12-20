<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="adminMenu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 - 관리자</title>
<style>
.reportcont {
	width:55%;
    margin: auto;
    text-align: center;
}
.report-list-table{
	margin: auto;
	border-collapse: collapse;
	width:100%;
	padding: 10px;
}
.th1{
	border-bottom: 2px solid #ccc;
	padding: 10px;
}
.td1{
	border-bottom: 1px solid #ccc;
	padding: 10px;
}
input.shear{
    border: 1px solid #ccc;
    padding: 1px 4px;
    height: 24px;
    margin: 0;
}
/* #shrbtn{ */
/* 	border: 1px solid #ccc; */
/* 	height: 27.34px; */
/* 	padding: 1px 4px; */
/* } */
select#sel1.form-control {
    height: 27.33px;
    border: 1px solid #ccc;
}
.aul-search{
	margin-bottom: 20px;
}
.report-title-section{
	margin-bottom:
}
button.userDetailbtn {
    background-color: #7695B7;
    border: 1px solid #ccc;
    color: white;
    padding: 5px;
}
@media screen and (max-width: 415px) {
	body{
		width: 415px;
	}
	.reportcont {
	width:90%;
	}
	.pag{
	margin-bottom: 30px;
}
	.th1 {padding: 5px; font-size:14px;	}

}
</style>
</head>
<body>
<div class="container reportcont">
	<div class="report-title-section"><h2>신고 게시판 목록</h2>
	</div>
	<div id="userListTb" class="aul-list">
		<table class="report-list-table">
				<tr><th class="th1">게시판</th>
					<th class="th1">제목</th>
					<th class="th1">아이디</th>
					<th class="th1">날짜</th>
					<th class="th1">상세보기</th>
					
				</tr>
				<c:choose><c:when test="${adminReportList ne null }">
				<c:forEach var="report" items="${adminReportList}">
				<tr><c:if test="${report.review_num != 0}"><td class="td1">이용후기</td></c:if>
					<c:if test="${report.qna_num != 0}"><td class="td1">질의응답</td></c:if>
					<td class="td1">${report.report_title}</td>
					<td class="td1">${report.report_id}</td>
					<td class="td1">${report.report_date}</td>
					<td class="td1"><button class="userDetailbtn" type="button"
						onclick="location.href='getReport.do?report_num=${report.report_num}'">상세</button>
						
				</tr>
				</c:forEach>
				</c:when><c:otherwise><tr><td colspan="4">신고 목록이 없습니다.</td></tr></c:otherwise>
				</c:choose>
		</table>
	</div><br><br>
	<div id="pageList" class="aul-paging">
			<div style="display: block; text-align: center;" class="pag">		
		<c:if test="${paging.startPage >  1 }">
			<a href="/adminReportList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/adminReportList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage }">
			<a href="/adminUserList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
		</div>

</div>
</body>
</html>