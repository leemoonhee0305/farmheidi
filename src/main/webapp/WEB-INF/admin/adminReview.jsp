<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/admin/adminMenu.jsp" %>
<%@ page import="com.spring.farm.util.PagingVO" %>
<%
	PagingVO pageInfo = (PagingVO)request.getAttribute("paging");
	int totalCount=pageInfo.getTotal(); //전체(검색) 목록 수
	int nowPage=pageInfo.getNowPage(); //현재페이지 수
	int maxPage=pageInfo.getLastPage(); //최대 페이지 수
	int startPage=pageInfo.getStartPage(); //시작페이지 수
	int endPage=pageInfo.getEndPage(); //마지막페이지 수
%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminReview.css">
<meta charset="UTF-8">
<title>리뷰목록</title>
<style>

		section#ResvPage {
			margin-top: 20px;
			text-align: center;
		}
		section.ResvPage>button {
			margin:0 0 5px 5px;
			background-color: #54aadfd1;
			color: #e0ffff;
			border: 1px solid #54aadfd1;
			cursor: pointer;
		}
		section.ResvPage>button:hover {
			background: #54aadfd1;
			color: white;
			border: none;
		}
		section.ResvPage>button:active {
			background: lightgray;
			color: white;
			border: none;
		}
		section#ResvPage>button.prevbtn {
   width:2rem; height:2rem;
   /*border:1px solid #888;
   border-radius:0.2rem;*/
   border: none;
   background: none;
   color: black;
}
		section#ResvPage>button.listbtn {
			width:2rem; height:2rem;
			border:1px solid #54aadfd1;
			border-radius:1rem;
		}
		section#ResvPage>button.viewbtn {
			background-color: white; /*#00a9ff*/
			color: #54aadfd1;
			border: 1px solid #54aadfd1;
			font-weight: bold;
		}
		section#ResvPage>button.nextbtn {
   width:2rem; height:2rem;
   /*border:1px solid #888;
   border-radius:0.2rem;*/
   border: none;
   background: none;
   color: black;
}
		section#ResvPage>button.notlinkbtn {
			cursor: default;
		}
		section.ResvPage>button.notlinkbtn:active {
			background: #00a9ff;
			color: white;
			border: none;
			
		}

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
margin-top: 50px;
}
</style>
</head>
<body>
<div class="boxx">
  	<h3 class="reviewh">리뷰</h3>
	  	<c:choose>
			<c:when test="${not empty reviewList }">
			  		<table class="tbl">
			  			<tr style="background-color: #F0F8FF;"><th class="review num">제목</th><th class="review">작성자</th><th class="review">상세보기</th></tr>
			  	<c:forEach var="reviewList" items="${reviewList }" end="10">
			  			<tr><td class="review num">${fn:substring(reviewList.review_title, 0, 5)}</td><td class="review">${reviewList.review_id }</td>
			  			<td class="review"><button type="button" class="selbtn" onclick="location.href='/adminReviewList.do?review_num=${reviewList.review_num}'">상세</button></td>
			  	</c:forEach>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>공지사항이 없습니다</p>
	  			<table>
			  		<tr><th class="review">제목</th><th class="review">작성자</th></tr>
			  	</table>
	  		</c:otherwise>
		</c:choose>
<!-- 		<button type="button" class="admina" onclick="location.href=''">글등록</button> -->
<!-- 		<span class="adiv"><a class="admina" href="/adminInsertInfo.do">글등록</a></span> -->

		<script>
	//페이징 처리 함수
	function resvPageList(page, keyword) {
		//alert("keyword :: "+keyword);
		if( (keyword != null) && (keyword != "null") ) {
			document.location.href="/adminReview.do?page="+page+"&searchKeyword="+keyword;
		} else {
			document.location.href="/adminReview.do?page="+page;
		}
		return;
	}
	</script>
  <section id="ResvPage" class="ResvPage" style="display: flex; justify-content: center; ">
			<% if(nowPage<=1){ %>
				<button type="button" class="prevbtn notlinkbtn">&lt;</button>
			<%}else{ %>
				<button type="button" class="prevbtn" onclick="resvPageList('<%=nowPage-1 %>','${searchKeyword}')">&lt;</button>
			<%} %>
			
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
						<button type="button" class="listbtn viewbtn notlinkbtn"><%=a%></button>
					<%}else{ %>
						<button type="button" class="listbtn" onclick="resvPageList('<%=a %>','${searchKeyword}')"><%=a%></button>
					<%} %>
			<%} %>
				
			<%if(nowPage>=maxPage){ %>
				<button type="button" class="nextbtn notlinkbtn">&gt;</button>
			<%}else{ %>
				<button type="button" class="nextbtn" onclick="resvPageList('<%=nowPage+1 %>','${searchKeyword}')">&gt;</button>
			<%} %>
		</section>
  </div>
</body>
</html>