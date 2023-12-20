<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../header.jsp" %>
    
<%@ include file="reviewMenu.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<head>
<meta charset="UTF-8">
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
h3{color: #26588d; font-weight:bold;}
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
#searchNav,#searchNav2{-webkit-justify-content: flex-end; justify-content: flex-end;     margin-right: 7px;
    flex-flow: row;}
/* #searchNav{margin-right: 25px;} */
/* #searchNav2{margin-right:2%} */
input{width: 400px; height: 250px}
button{
 text-decoration : none; background-color: #26588d;
    color: #e0ffff;
    border: 1px solid #26588d;
   padding : 5px 13px; float: right; 
   margin-left:3.5px;}

.qBtn:hover { background: #00a9ff; color: white; border: none; box-shadow: none; text-decoration : none; }

.qBtn:active{ color: white; background: lightgray; border: none;
}
 fieldset{width:700px; display: inline-block; float: left; margin-bottom: 20px; margin-left:10px; margin-right:10px;}
  [type=image]{width: 220px; height: 220px; margin-left: 24.5%; padding-left:0px;}
  .div1{ display: flex;    width: 100%;    text-align: left;    margin: 0 auto;    flex-wrap: wrap;    justify-content: space-between; }
 
  table,td,tr{justify-content:center;  width:350px;}
  
  #content3{	
	background-color : white;	
	color : gray;
}
.tdtest{
display:  -webkit-box;
-webkit-line-clamp: 7;
-webkit-box-orient: vertical;
text-align:center;
 width:350px;
 height:168px;
 resize: none; 
 overflow: hidden;
 border: none;
 white-sapce:nowrap;
text-overflow: ellipsis;
margin: 0 auto;

}
textarea:hover { cursor: pointer;}
textarea:focus {outline: none;}
.divbox{display: inline-block; width: 45%;  border:1px solid #dfd3c3; margin: 20px; border-radius: 5px;}
@media(max-width:1457.5px){
/* #searchNav{-webkit-justify-content: flex-end; justify-content: flex-end; width:720px;  text-align: right;} */
/* #searchNav2{-webkit-justify-content: flex-end; justify-content: flex-end; width:95%;  margin-left:3%; text-align:right;} */
#Reviewinsert{float: left; }
#fieldsettest{margin-left: auto; margin-right: auto;}
#divtest{margin-left: auto; margin-right: auto;}
}
@media (max-width:1457px){
/* 	#searchNav{float: right;} */
/* 	#searchNav2{margin-right: 0px;} */
	.imgtest{margin-left: 24%;}

}
@media(max-width:1199px){
/* 	#searchNav{margin-left : 21.3%; margin-right: 1.2%} */
/* 	#searchNav2{margin-left: 4%;} */
	.imgtest{margin-left: 22%;}
	.div1{padding-left:1%;}

}
@media(max-width: 991px){
/* 	#searchNav {padding-right:23%;} */
	.div1 {padding-left: 25%;}
	.divbox {width: 60%;} 
	.container     {padding-left: 0; text-align: center; padding-right:0;}
/* 	#searchNav2  {margin-left:-20%;} */
	.imgtest {margin-left:0%;}
	.tdtest{width:320px; margin: 0;}

}
@media(max-width:978px){
/* 	#searchNav{padding-right: 0%;} */
/* 	#searchNav2{margin-left: 20%;} */
}
@media(max-width:767px){ 
/* 	#searchNav {margin-right: -90px;} */
	.div1  {padding-left: 1%; margin-left:4%; text-align: center;}
/* 	#searchNav2 {margin-left: 26%;} */
	.imgtest{margin-right: 3%;}
	h3{margin-right:8%; color: #26588d;}
	h6{margin-right:22%;}
	.tdtest{width:300px; margin: 0;}

}
@media(max-width:575px){
	
/* 	#searchNav2{padding-right: 1.5%;} */

}
/* 547에서 텍스트 깨짐. skip */

@media(max-width:450px){
.divbox{width: 85%;}
.tdtest{width: 300px; margin-left:2%;}
}
@media(max-width:400px){
.divbox{width: 99%;}
.div1{padding-right:10%; margin-left:2%;}
h3{margin-right:5%; color: #26588d;}
h6{margin-right: 14%;}
.tdtest{width:340px; margin-left:0%;}
.imgtest{margin-left:4%;}
/* #searchNav{padding-left:38%;} */
/* #searchNav2{padding-right: 3.5%;} */

}

.revwTit {text-align : center; font-weight: bold;}
.container{ margin-bottom:50px;}
</style>
</head>
<body>
<div class="title">
<h2 class="revwTit">Review</h2>
</div>
<div class="container" style="border:none; padding : 0 auto; margin:0 auto;">

<nav id="searchNav2" class="navbar navbar-expand-sm navbar-dark">
  <button id="Reviewinsert" type="button" >글쓰기</button>
  </nav>

<br>
<div class="div1">
<c:forEach items="${reviewList}" var="review">
<div class="divbox"  type="button" onclick="location.href='getReview.do?review_num=${review.review_num}'">
<div class="container">
<input class="imgtest"  type="image" src="${pageContext.request.contextPath}/resources/img/${review.review_filename }" 
onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/img/mainlogo2.png';">
 </div>
 <div style="text-align: center;"> 
  	<table style="margin: 0 auto;">
  <tr ><td colspan="2" style="text-align:center; width:500px;"><h3>${review.review_title}</h3></td></tr>
  <tr><td style="width:250px;"><h6>${review.review_id}</h6></td><td style="width:250px;" readonly><h6>${review.review_date}</h6></td></tr>
<%--   <tr><td colspan="2" rowspan="6" style="text-align:center; width:500px; height: 200px;"><h5 class="content_td">${review.review_content}</h5></td></tr> --%>
  <td colspan="2"><textarea class="tdtest" readonly>${review.review_content}</textarea></td>
</table>

  </div>
</div>


</c:forEach>
</div>


<script>
	//페이징 처리 함수
	function resvPageList(page, keyword) {
		//alert("keyword :: "+keyword);
		if( (keyword != null) && (keyword != "null") ) {
			document.location.href="/getReviewList.do?page="+page+"&searchKeyword="+keyword;
		} else {
			document.location.href="/getReviewList.do?page="+page;
		}
		return;
	}
	</script>
<section id="ResvPage" class="ResvPage" style="display: flex; justify-content: center;">
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
<%@ include file="/footer.jsp"%>
</body>
</html>
