<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../../header.jsp" %>
<%@ include file="noticeMenu.jsp" %>  
<%@ page import="com.spring.farm.util.PagingVO" %>
<%
	PagingVO pageInfo = (PagingVO)request.getAttribute("paging");
	int totalCount=pageInfo.getTotal(); //전체(검색) 목록 수
	int nowPage=pageInfo.getNowPage(); //현재페이지 수
	int maxPage=pageInfo.getLastPage(); //최대 페이지 수
	int startPage=pageInfo.getStartPage(); //시작페이지 수
	int endPage=pageInfo.getEndPage(); //마지막페이지 수
%>


<!DOCTYPE html>
<html>
<head><meta charset="UTF-8">
 <style>
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
		/* 페이지 버튼 스타일 end. */		
		.viewbtn {padding : 0px; float: none; margin-left:0px;} 
 .table th, .table td {text-align:center;}
 #searchNav{-webkit-justify-content: flex-end; justify-content: flex-end; padding-right: 0px;}
.footertest{float: right;} 
 #content1{   
   background-color : white;   
   color : gray;}
button{
 text-decoration : none; background-color: #26588d;
    color: #e0ffff;
    border: 1px solid #26588d;
   /* padding : 5px 13px; float: right;  margin-left:3.5px; */
   }
 @media(min-width:770px){
#searchNav{-webkit-justify-content: flex-end; justify-content: flex-end; padding-right: 0px;}


table{margin-right: auto; margin-left: auto; width:1200px;}

}
.tdtest{
display:  -webkit-box;
-webkit-line-clamp: 3;
-webkit-box-orient: vertical;
white-sapce:nowrap;
text-overflow: ellipsis;
overflow:hidden;
text-overflow: clip
}
.notTit {text-align : center; font-weight: bold;}
@media(min-width:978px){
.container-fluid{width: 80vw; margin-bottom: 50px;}
}
@media(max-width:978px){
#searchNav{float: right;}
}
.container-fluid{
    margin-bottom: 50px;
}
@media(max-width:575px){
.form-control{width:40%;}
#sel1{width:22%;}
[name=searchKeyword]{width:58%;}
#searchNav{margin-right:-6px;}
}
@media(max-width: 500px){
.table.th, .table td { padding: 0.25rem;}
.table.th {text-align:center;}
.abc{display: none;}
th{width:12%;}
}
</style>

</head>
<body >
<div class="title">
<h2 class="notTit">공지사항</h2>
</div>
<div class="container-fluid">
 <nav id="searchNav" class="navbar navbar-expand-sm navbar-dark">
  <form class="form-inline" action="getNoticeList.do" method="post">
  	<select class="form-control" id="sel1" name="searchCondition" style="display:inline-block!important;margin-right:10px;">
		<option value="${conditionMap['제목']}">제목</option>
		<option value="${conditionMap['내용']}">내용</option>
    </select>
    <input class="form-control mr-sm-2" type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
    <button class="btn btn-success" style="background-color: #54aadfd1; border: none;" type="submit">검색</button>
  </form>
</nav>
  <table class="table table-hover">
    <thead class="btn-primary" style="background-color: #54aadfd1; border: none;">
      <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>등록일</th>
        <th class="abc">조회수</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items="${noticeList}" var="notice">
	<tr onclick="selTr(${notice.notice_num})" style="cursor:pointer;">
	  <td class="tdCenter" style="text-align:center;">${notice.notice_num}</td>
	  <td ><div class="tdtest worddot" data-val="${notice.notice_title}">${notice.notice_title}</div></td>	
	  <td class="tdCenter">${notice.notice_writer}</td>
	  <td class="tdCenter">${notice.notice_date}</td>
	  <td class="tdCenter abc">${notice.notice_cnt}</td>
	</tr>
</c:forEach>
    </tbody>
  </table>
  <div class="footertest">
  <c:if test="${user_id == 'farmadmin'}"> <!-- marine부분은 관리자 부분. farmadmin으로 수정해야함. -->
  	<button type="button" id="conWrite">글쓰기</button>
  	</c:if>
  </div>

<script>
	//페이징 처리 함수
	function resvPageList(page, keyword) {
		//alert("keyword :: "+keyword);
		if( (keyword != null) && (keyword != "null") ) {
			document.location.href="/getNoticeList.do?page="+page+"&searchKeyword="+keyword;
		} else {
			document.location.href="/getNoticeList.do?page="+page;
		}
		return;
	}
	</script>
	<br><br>
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
<script>
let $worddot = $(".worddot");
$(document).ready(function(){
	$(window).resize(function(){
		if( $(window).width() <= 500){
			$.each($worddot, function(){
				$(this).text($(this).attr("data-val").substring(0,6) + "...");
			});
			
			$(".worddot").css('padding', '0px');
		}else{
			$.each($worddot, function(){
				$(this).text($(this).attr("data-val"));
			});
			$(".worddot").css('padding', '0.75rem');
		}
	});
});
</script>
<br><br>
<%@ include file="/footer.jsp"%>
</body>
</html>