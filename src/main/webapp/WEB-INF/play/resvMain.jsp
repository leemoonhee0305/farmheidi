<%@page import="org.springframework.format.annotation.NumberFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험 예약</title>
<%@ include file="/header.jsp" %>
<style>
/* 머리부분	 */	
p.mini-category{
	font-size : 1.4rem;
	vertical-align : middle;
	margin-bottom : 2rem;
	color : #001087;
}

li.mini-category{
	list-style : none;
	margin : 10px 0;
}

.box-info{
	margin-bottom : 80px;
}

.resv-info{
	color : gray;
}

li.resv-info{
	margin : 10px 0;
}

p.resv-info{
	font-size : 1.1rem;
	color : black;
}


/* 패키지 상품 컨테이너화 CSS */
div.content-box{
	width : 24.5%;
	display : inline-block;
}

div.noun-content{
	border : 1px dotted lightgray;
	border-radius : 10px;
	padding : 30px;
	margin-bottom : 60px;
}

div.after-content{
	border : 1px dotted lightgray;
	border-radius : 10px;
	padding : 30px;
	margin-bottom : 60px;
}

.content-img{
	width : 100%;
	height : 200px;
}

.content-info{
	margin-bottom : 60px;
}

.content-name{
	text-align : center;
}



.top-name{
	margin : 0 auto;
	margin-bottom : 60px;
	text-align : center; font-weight: bold;
	padding : 30px;
}

.reqResv{
	display : block;
	width : 30%;
	height : 60px;
	margin : 0 auto;
	margin-bottom : 100px;
	border-radius : 8px;
	border : none;
	background-color : #26588d;
	color : #e0ffff;
}

.reqResv : hover{
	cursor : pointer;
}

.cut-line{
	margin-bottom : 60px;
}

.fontR{
	color : red;
}

div#content1{
	background-color : white;
}

a#content1{
	color : gray;
}

svg{
	vertical-align : text-top;
}

@media screen and (max-width : 968px){
	div.noun-content, div.after-content{
		padding : 5px;
	}
	div.content-box{
		width : 49%;
		margin-bottom : 15px;
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
</head>
<script>
	function goreqResv(){
		location.href="resvReq.do";
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
<body>
<div>
<%@ include file="resvMenu.jsp" %>
</div>

<!-- 체험예약 메인 페이지 : resvMain.jsp -->


<div class="container">
	<h2 class="top-name">패키지 체험 상품</h2>
	
	<div class="box-info">
	<p class="mini-category"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-exclamation-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M7.002 11a1 1 0 1 1 2 0 1 1 0 0 1-2 0zM7.1 4.995a.905.905 0 1 1 1.8 0l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 4.995z"/>
</svg>&nbsp;&nbsp;예약 시 유의사항</p>
	<ul>
		<li class="resv-info">하이디 목장은 <b>완전 예약제</b>입니다. 예약을 하지 않으신 분은 이용이 어려우니 참고바랍니다.</li>
		<li class="resv-info">점심은 목장에서 제공되며, 음식물을 반입하시는 경우에는 하이디 목장의 청정 환경 보호를 위해 <b>모든 쓰레기와 음식물을 가져가셔야합니다.</b><br>(목장에는 환경 보호를 위해 쓰레기통이 없습니다. 또한 이를 어기다 적발되시는 경우 앞으로의 목장 이용이 제한될 수 있습니다.)</li>
		<li class="resv-info">예약을 하신 경우에도 <b>반려동물을 데려오시는 경우에는 입장이 제한</b>됩니다.</li>
		<li class="resv-info"><b>우천시</b>에는 안내드린 컨텐츠들의 변경사항이 있을 수 있습니다.</li>
	</ul>
	</div>
	
	<hr class="cut-line">
	
	<div class="content-info">
		<p class="mini-category"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-currency-dollar" viewBox="0 0 16 16">
  <path d="M4 10.781c.148 1.667 1.513 2.85 3.591 3.003V15h1.043v-1.216c2.27-.179 3.678-1.438 3.678-3.3 0-1.59-.947-2.51-2.956-3.028l-.722-.187V3.467c1.122.11 1.879.714 2.07 1.616h1.47c-.166-1.6-1.54-2.748-3.54-2.875V1H7.591v1.233c-1.939.23-3.27 1.472-3.27 3.156 0 1.454.966 2.483 2.661 2.917l.61.162v4.031c-1.149-.17-1.94-.8-2.131-1.718H4zm3.391-3.836c-1.043-.263-1.6-.825-1.6-1.616 0-.944.704-1.641 1.8-1.828v3.495l-.2-.05zm1.591 1.872c1.287.323 1.852.859 1.852 1.769 0 1.097-.826 1.828-2.2 1.939V8.73l.348.086z"/>
</svg>&nbsp;&nbsp;체험 요금</p>
	<ul>
		<li>가족예약</li>
		<li class="mini-category resv-info"><b class="fontR">[성인 가격]</b> : <fmt:formatNumber value="${personSumPrice }" pattern="#,###"/> 원 &nbsp;&nbsp;&nbsp; <b class="fontR">[청소년 가격]</b> : <fmt:formatNumber value="${youthSumPrice }" pattern="#,###"/> 원</li>
		<li class="mini-category resv-info">24개월 미만의 미취학아동은 <b class="fontR">무료</b></li>
		<br>
		<li>단체예약</li>
		<li class="mini-category resv-info">단체예약의 경우 하이디목장(02-3456-7890)으로 연락주세요.</li>
	</ul>
	</div>
	<hr class="cut-line">
	
	<div class="content-info">
		<p class="mini-category"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-bank" viewBox="0 0 16 16">
  <path d="m8 0 6.61 3h.89a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5H15v7a.5.5 0 0 1 .485.38l.5 2a.498.498 0 0 1-.485.62H.5a.498.498 0 0 1-.485-.62l.5-2A.501.501 0 0 1 1 13V6H.5a.5.5 0 0 1-.5-.5v-2A.5.5 0 0 1 .5 3h.89L8 0ZM3.777 3h8.447L8 1 3.777 3ZM2 6v7h1V6H2Zm2 0v7h2.5V6H4Zm3.5 0v7h1V6h-1Zm2 0v7H12V6H9.5ZM13 6v7h1V6h-1Zm2-1V4H1v1h14Zm-.39 9H1.39l-.25 1h13.72l-.25-1Z"/>
</svg>&nbsp;&nbsp;입금안내</p>
	<ul>
		<li class="resv-info"> 해당 페이지는 교육용 페이지로 계좌이체가 불가능합니다.</li>
	</ul>
	</div>
	<hr class="cut-line">
	<p class="mini-category">
	<svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-card-text" viewBox="0 0 16 16">
  <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
  <path d="M3 5.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5zM3 8a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9A.5.5 0 0 1 3 8zm0 2.5a.5.5 0 0 1 .5-.5h6a.5.5 0 0 1 0 1h-6a.5.5 0 0 1-.5-.5z"/>
</svg>&nbsp;&nbsp;패키지 내역 설명
	</p>
	<p class="resv-info"> [ 오전 : 건초 주기 + 우유 주기 + 우유 짜기 + 소들과 함께하는 시간 ] </p>
	<div class="noun-content">
	
		<c:forEach items="${playList}" var="playList" end="3">
			<div class="content-box">
				<p class="content-name">${playList.pla_name }</p>
				<div class="img-box">
				<img class="content-img" src="${playList.pla_img}" alt="${playList.pla_name}">
				</div>
			</div>
		</c:forEach>
		</div>		
		<p class="resv-info"> [ 오후 : 치즈만들기 + 쿠킹클래스 ]</p>
		<div class="after-content">
		<c:forEach items="${playList}" var="playList" begin="4">
			<div class="content-box">
				<p class="content-name">${playList.pla_name }</p>
				<div class="img-box">
				<img class="content-img" src="${playList.pla_img}" alt="${playList.pla_name}">
				</div>
			</div>
		</c:forEach>
		</div>
	
	<hr class="cut-line">
	
	<div class="box-info" id="refund">
	<p class="mini-category"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-coin" viewBox="0 0 16 16">
  <path d="M5.5 9.511c.076.954.83 1.697 2.182 1.785V12h.6v-.709c1.4-.098 2.218-.846 2.218-1.932 0-.987-.626-1.496-1.745-1.76l-.473-.112V5.57c.6.068.982.396 1.074.85h1.052c-.076-.919-.864-1.638-2.126-1.716V4h-.6v.719c-1.195.117-2.01.836-2.01 1.853 0 .9.606 1.472 1.613 1.707l.397.098v2.034c-.615-.093-1.022-.43-1.114-.9H5.5zm2.177-2.166c-.59-.137-.91-.416-.91-.836 0-.47.345-.822.915-.925v1.76h-.005zm.692 1.193c.717.166 1.048.435 1.048.91 0 .542-.412.914-1.135.982V8.518l.087.02z"/>
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
  <path d="M8 13.5a5.5 5.5 0 1 1 0-11 5.5 5.5 0 0 1 0 11zm0 .5A6 6 0 1 0 8 2a6 6 0 0 0 0 12z"/>
</svg>&nbsp;&nbsp;환불 규정</p>
	<ul>
		<li class="resv-info">체험 6일전까지는 전체 금액을 환불받으실 수 있습니다.</li>
		<li class="resv-info">체험 5일전 : <b>50%</b> 환불</li>
		<li class="resv-info">체험 3일전 : <b>30%</b> 환불</li>
		<li class="resv-info">체험 1일전 : <b>10%</b> 환불</li>
		<li class="resv-info">체험 전날과 당일에는 환불이 불가능합니다.</li>
		<li class="resv-info">환불과 관련된 자세한 정보는 <b>하이디목장(02-3456-7890)</b>으로 연락주세요</li>
	</ul>
	</div>

	<button class="reqResv" type="button" onclick="goreqResv()">예약신청 &gt;</button>
</div>

<div class="goTop">
	<a href="#"><img src="/resources/img/gotop_icon3.png" class="mapicon" id="topicon" alt="gotop"></a>
	<a href="./main.jsp"><img src="/resources/img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
	<a href="#refund"><img src="/resources/img/godown_icon3.png" class="mapicon" id="downicon" alt="godown"></a>
	</div>


<%@ include file="/footer.jsp" %>

</body>
</html>