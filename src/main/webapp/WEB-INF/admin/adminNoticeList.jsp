<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="adminMenu.jsp" %>
<%@ page import="com.spring.farm.util.PagingVO" %>
<%
	PagingVO pageInfo = (PagingVO)request.getAttribute("paging");
	int totalCount=pageInfo.getTotal(); //전체(검색) 목록 수
	int nowPage=pageInfo.getNowPage(); //현재페이지 수
	int maxPage=pageInfo.getLastPage(); //최대 페이지 수
	int startPage=pageInfo.getStartPage(); //시작페이지 수
	int endPage=pageInfo.getEndPage(); //마지막페이지 수
%>

<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminNoticeList.css">
<title>관리자 공지사항</title>
<style>
/*   th.noticenum{ */
/*   width: 10%; */
/*   } */
/*   th.notice{ */
/*   width: 45%; */
/*   } */

/* 페이지 버튼 스타일 start */
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
.adnoticeTit {text-decoration: none; color:black;}
</style>
</head>
<body>
	<div class="boxx">
  	<h3 class="noticeh">공지사항</h3>
	  	<c:choose>
			<c:when test="${not empty noticeList }">
			  		<table class="tbl">
			  			<tr style="background-color: #F0F8FF;"><th class="notice num">번호</th><th class="notice">제목</th><th class="notice">등록일</th>
<!-- 			  			<th class="notice">상세보기</th> -->
<!-- 			  			<th class="notice">삭제</th> -->
			  			</tr>
			  	<c:forEach var="noticeList" items="${noticeList }" end="4">
			  			<tr><td class="notice num">${noticeList.notice_num }</td>
			  			<td class="notice"><a class="adnoticeTit" href="adminNoticeInfo.do?notice_num=${noticeList.notice_num}">${noticeList.notice_title }</a></td><td class="notice">${noticeList.notice_date }</td>
<%-- 			  			<td class="notice"><button type="button" class="selbtn" onclick="location.href='adminNoticeInfo.do?notice_num=${noticeList.notice_num}'">상세</button></td> --%>
<%-- 			  			<td class="notice"><button type="button" class="delbtn" onclick="location.href='adminDeleteNotice.do?notice_num=${noticeList.notice_num}'">삭제</button></td> --%>
			  			</tr>
			  	</c:forEach>
			  		</table>
			</c:when>
		  	<c:otherwise>
	  			<p>공지사항이 없습니다</p>
	  			<table>
			  		<tr><th class="notice">제목</th><th class="notice">작성자</th></tr>
			  	</table>
	  		</c:otherwise>
		</c:choose>
		<button type="button" class="admina" onclick="location.href='/adminInsertInfo.do'">글등록</button>
		
		<script>
	//페이징 처리 함수
	function resvPageList(page, keyword) {
		//alert("keyword :: "+keyword);
		if( (keyword != null) && (keyword != "null") ) {
			document.location.href="/adminNoticeList.do?page="+page+"&searchKeyword="+keyword;
		} else {
			document.location.href="/adminNoticeList.do?page="+page;
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