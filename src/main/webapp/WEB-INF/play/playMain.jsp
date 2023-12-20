<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험설명 및 메인</title>
<%@ include file="/header.jsp" %>

<style>
body{
	font-family :'kotragodic';
	font-size : 1.0rem;
}


#content1{
	background-color : white;
	color : gray;
}


.tag-text{
	list-style : none;
	color : #8a8a8a;
}


h4.top{
	width : 38%; 
	text-align : center;
	border-bottom : 1px solid lightgray;
	margin : 0 auto;
	padding : 15px;
}

div.div-top{
	margin-bottom : 50px;
}

h4.mini-category{
	padding-bottom : 30px;
	margin-bottom : 0;
	font-size : 1.3rem;
	color : #001087
}

.category-bottom{
	border-bottom : 1px dotted lightgray;
}

table{
	width : 90%;
	margin : 0 auto;
}


thead{
	border-bottom : 1px solid black;
}

th, td{
	padding : 8px;
	border : 1px solid black; 
}

p.tag-text{
	text-align : right;
	width : 90%;
	margin : 0 auto;
}

div.content{
	margin-bottom : 80px;
}
div.content-block{
	padding : 40px 30px;
	height : 230px;
	border-bottom : 1px dotted lightgray;
}

div.content-img{
	padding-right : 3rem;
}

.inner_img{
	width : 90%;
	height : 150px;
}

svg.bi{
	vertical-align : text-top!important;
}

hr.cutline{
	margin-bottom : 80px;
	color : gray;
}

.content-bottom{
	margin-bottom : 50px;
}

.resv-button{
	display: block;
    width: 30%;
    height: 60px;
    margin: 0 auto;
    margin-bottom: 100px;
    background-color: #26588d;
    color: #e0ffff;
    border: 1px solid #26588d;
    border-radius: 8px;
}

p.content-title{
	font-size : 1.3rem;
}

@media screen and (min-width : 968px){
	div.content-img{
		float : left;
		width : 30%;
		text-align: right;
	}
	
	div.content-text{
		float : right;
		width : 68%;
	}
	
}

@media screen and (max-width : 968px){
	div.content-img{
		margin-bottom : 25px;
		padding : 0;
	}
	div.content-block{
		height : 500px;
	}
	img.inner_img{
	width : 100%;
	height : 250px;
	}
	.caption{
		display : none;
	}
	table{
		text-align : center;
	}
}
/* 홈,위아래로가기 버튼 */
   .mapicon { position:fixed; padding: 5px; z-index:9999; }
   .mapicon:hover { border-color: #00a9ff;}
   #topicon { width: 40px; height: 40px; border-radius: 5px 5px 0 0; right: 25px; bottom: 98px;}
   #homeicon { width: 40px; height: 40px; border-radius: 0 0 0 0; right: 25px; bottom: 59px; }
   #downicon { width: 40px; height: 40px; border-radius: 0 0 5px 5px; right: 25px; bottom: 20px;}
   html { scroll-behavior: smooth; }

@media screen and (max-width: 1450px) {
	#topicon { right: 5px; bottom: 98px;}
   #homeicon { right: 5px; bottom: 59px; }
   #downicon { right: 5px; bottom: 20px;}
}

@media screen and (max-width: 412px) {
	ul{ text-align: center;	}
	#topicon { right: 10px; bottom: 98px;}
   #homeicon { right: 10px; bottom: 59px; }
   #downicon { right: 10px; bottom: 20px;}
}
</style>
<script>
	function goResvMain(){
		location.href="resvMain.do";
	}
	
	$(document).ready(function(){ 
		$('.goTop').hide();   
	    	console.log('top값 ',$(this).scrollTop());
	    $(window).scroll(function(){
	        if ($(this).scrollTop() > 100) {
	        	
	            $('.goTop').fadeIn();
	        } else {
	            $('.goTop').fadeOut();
	        }
	    });   
	});
</script>
</head>
<body>
<%@ include file="playMenu.jsp" %>
<div class="container">
	<!-- 체험 소개 내부 제일 위 -->
	<div class="div-top category-name">
			<h4 class="top">체험 소개</h4>
	</div>
	<!-- 체험 내용 소개부분 -->
	<div class="content">
		<h4 class="mini-category category-bottom"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-filter-square" viewBox="0 0 16 16">
  <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
  <path d="M6 11.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-2-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
</svg>&nbsp;&nbsp;체험 내용</h4>
	<c:choose>
		<c:when test="${playList ne null }" >
		<c:forEach var="playList" items="${playList }" >
			<div class="content-block">
				<div class="content-img">
					<img class="inner_img" src="${playList.pla_img }"/>
				</div>
				<div class="content-text">
					<p class="content-title">0${playList.pla_num } ${playList.pla_name }</p>
					<span>${playList.pla_content }</span>
				</div>
			</div>
		</c:forEach>
		</c:when>
		</c:choose>
	</div>
	

<div class="content">
	<h4 class="mini-category">
	<svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-calendar2-check" viewBox="0 0 16 16"><path d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0z"/><path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM2 2a1 1 0 0 0-1 1v11a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V3a1 1 0 0 0-1-1H2z"/><path d="M2.5 4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H3a.5.5 0 0 1-.5-.5V4z"/>
</svg>&nbsp;&nbsp;체험 시간표</h4>
	<table>
		<thead>
			<th>am/pm</th><th>시간</th><th>일정</th><th class="caption">비고</th>
		</thead>
		<tbody>
			<tr><td rowspan="4">am</td><td>10:00~10:30</td><td>건초주기</td><td class="caption"></td></tr>
			<tr><td>10:40~11:10</td><td>우유주기</td><td class="caption"></td></tr>
			<tr><td>11:20~12:10</td><td>우유짜기</td><td class="caption"></td></tr>
			<tr><td>12:10~12:30</td><td>자유시간</td><td class="caption">소들과 자유롭게 함께할 수 있는 시간입니다.</td><tr>
			<tr><td>Lunch</td><td>12:30~14:00</td><td>점심시간</td><td class="caption">점심 제공</td></tr>
			<tr><td rowspan="2">pm</td><td>14:00~15:20</td><td>치즈만들기</td><td class="caption"></td></tr>
			<tr><td>15:30~16:30</td><td>쿠킹 클래스</td><td class="caption"></td></tr>
		</tbody>
	</table>
	<br>
	<p class="tag-text">※ 당일 기상상황이나 소들의 상태에 따라 일정이 변경될 수 있습니다. </p>
</div>

<hr class="cutline">

<div class="content content-bottom" id="playdown">
<h4 class="mini-category"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
</svg>&nbsp;&nbsp;안내사항</h4>
	<ul class="resv-text">
		<li class="tag-text">-&nbsp; 하이디농장의 농장체험은 <b>사전 예약하셔야 체험에 참여 하실 수 있으며</b> 체험 사전 예약을 하지 않은 경우 준비가 불가능하여 이용하실 수 없습니다.</li>
		<li class="tag-text">-&nbsp; 단체 체험예약은 <b>하이디목장(02-3456-7890)</b>으로 연락 부탁드립니다.</li>
		<li class="tag-text">-&nbsp; 하이디농장의 농장체험은 <b>1일 1회 체험으로 언제나 정시 (오전 10:00)에 시작</b>됩니다.(월요일, 화요일은 정기 휴무)<br>
		&nbsp;&nbsp; 단, <b>단체체험</b>의 경우에는 협의 후 체험시작 시간을 조정하실 수 있습니다.</li>
	</ul>
	</div>
	<button class="resv-button" onclick="goResvMain()">예약하기 &gt;</button>
</div>
<div class="goTop">
	<a href="#"><img src="/resources/img/gotop_icon3.png" class="mapicon" id="topicon" alt="gotop"></a>
	<a href="./main.jsp"><img src="/resources/img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
	<a href="#playdown"><img src="/resources/img/godown_icon3.png" class="mapicon" id="downicon" alt="godown"></a>
	</div>

<%@ include file="/footer.jsp" %>
</body>
</html>