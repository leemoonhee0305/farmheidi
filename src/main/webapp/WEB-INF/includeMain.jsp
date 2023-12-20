<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 농장</title>
<style>
	body{
		font-family : SUITE-Regular;
	}

 	.container{ 
	} 

	.top-box{
		text-align : center;
		margin-bottom : 50px;
	}
	
	.content-box{
		padding : 100px 0;
	}
	
	
/* 	.content-box.half{ */
/* 		margin-bottom : 100px; */
/* 	} */
	
/* 	.content-box.thalf{ */
/* 		margin-bottom : 70px; */
/* 	} */
	
	.img-product{
		width : 100%;
		height : 215px;
	}
	
	.container .row{
		width : 100%;
	}
	
	.product-box{
		width : 100%;
		height :215px;	
		margin-bottom : 15px;
	}
	
	.news-box{
		height : 250px;
	}
	
	.product-box .img-product{
		border-radius : 8px;
	}
	
	.even-box{
		background-color : #F0F7F7;
		padding : 100px 0;
	}
	
	div.row{
/* 		margin-bottom : 70px; */
		width : 100%;
	}
	
	.col-2{
		width :100%;
		height : 175px;
		margin : 0 auto;
	}
	
	.col-4{
		margin : 0 auto;
	}
	
	.col-6 a{
		color : gray;
		
	}
	
	.product-info{
		display : block;
		white-space : nowrap;
		overflow : hidden;
		text-overflow : ellipsis;
	}
	
	.fontB{
		color : #3f4575;
	}
	
	.fontR{
		color : red;
	}
	
	.font-center{
		text-align : center;
	}
	
	a:hover{
		text-decoration :none;
	}
	
	img.img-product:hover{
		border : 3px solid #3f4575;
	}
	
	p.fontB{
		margin-bottom : 5px;
	}
	
	.hover-clicker{
		width : 100%;
	}
	
	.hov-clicker:hover{
		cursor : pointer;
	
	}
	
	.img-item{
		width: 90%;
		height : 90%;
   		display: flex;
    	margin: auto auto;
    	border-radius : 8px;
	}
	
	img.border-img{
		border-radius: 30%;
	}
	
	
	.item-box{
		width: 100%;
	    height: 70%;
	    border-radius: 100%;
	    border: 3px solid #3f4575;
	    padding: 10%;
	    margin-bottom: 15px;
	}
	
	.item-box:hover{
		background-color : #3f4575;;
	}
	
	.item-content{
		height : 180px;
	}
	
	.full-w{
		width : 100%;
	}
	
	.content-box.sub-box{
		padding-top : 0;
	}
	
	ul.notice-box{
		margin-left : 60px;
		white-space : nowrap;
		overflow : hidden;
		text-overflow : ellipsis;
	}
	
	li.notice-info{
		padding : 20px;
		border-radius : 5px;
	}
	
	li.notice-info:hover{
		background-color : white;
	}
	
	.img-intro{
		display : block;
		width : 80%;
		margin :0 auto;
		border-radius : 8px;
	}
	
	.img-intro:hover{
		border : 1px solid lightgray;
	}
	
	.intro-box{
		width : 100%;
		margin-bottom : 15px;
		padding : 1%;
	}
	
	div.row.col-lg-6{
		padding : 0;
	}
	
	div.row.col-lg-6 div.col{
		padding : 50px;
	}
	
	@media screen and (max-width : 576px){
		.img-product{
			height : 150px;
		}
		.product-box{
			height : 150px;
		}
		
		.dis-none{
			display : none;
		}
		
		ul.notice-box{
		    list-style: none;
		    padding-left: 0;
		    margin-left : 0;
		}
		
		div.content-box.even-box{
			height: 1000px;
			padding : 50px 0;
		}
		
		div.first-box{
			margin-bottom : 110px;
		}
		
		li.notice-info{
			display: block;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    list-style: none;
		}
		div.row.col-lg-6 div.col{
			padding : 20px;
			padding-top : 0;
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
	function goProductPage(){
		location.href = "/productList.do";
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
<!-- 헤더 -->
<div class="container">
	
	<!-- mini-menu -->
	<div class="content-box sub-box">
		<h3 class="top-box"><b class="fontB">하이디 컨텐츠</b></h3>
		<div class="row">
			<div class="row col-lg-6 col-md-12 col-sm-12">
			<div class="col">
				<a href="/introduce.jsp">
					<div class="item-box">
						<img class="img-item border-img" src="${pageContext.request.contextPath }/resources/img/introduce.svg" alt="introduce" title="introduce">
					</div>
					<p class="font-center"><b class="fontB">소개</b></p>
				</a>
			</div>
			<div class="col">
				<a href="/playMain.do">
					<div class="item-box">
						<img class="img-item border-img" src="${pageContext.request.contextPath }/resources/img/experience.svg" alt="experience" title="experience">
					</div>
					<p class="font-center"><b class="fontB">체험</b></p>
				</a>
			</div>
			</div>
			<div class="row col-lg-6 col-md-12 col-sm-12">
			<div class="col">
				<a href="/productList.do">
					<div class="item-box">
						<img class="img-item border-img" src="${pageContext.request.contextPath }/resources/img/product.svg" alt="product" title="product">
					</div>
					<p class="font-center"><b class="fontB">상품</b></p>
				</a>
			</div>
			<div class="col">
				<a href="/getNoticeList.do">
					<div class="item-box">
						<img class="img-item border-img" src="${pageContext.request.contextPath }/resources/img/conversation.svg" alt="conversation" title="conversation">
					</div>
					<p class="font-center"><b class="fontB">커뮤니티</b></p>
				</a>
			</div>
			</div>
		</div>
	</div>
</div>
	<!-- 농장 NEWS -->
	<div class="content-box even-box">
		<div class="container">
			<div class="row">
				<div class="first-box col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<h3 class="top-box"><b class="fontB">농장 NEWS</b></h3>
					<div class="intro-box">
						<img class="img-intro" src="${pageContext.request.contextPath }/resources/img/babycow.jpg" alt="송아지가 태어났어요!" title="송아지가 태어났어요!">
					</div>
					<p class="font-center"><b class="fontB">송아지가 태어났어요!</b></p>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
					<h3 class="top-box"><b class="fontB">농장 게시판</b></h3>
					<div class="product-box">
						<ul class="notice-box">
							<c:forEach var="notice" items="${notice }" end="5">
								<a href="/getNotice.do?notice_num=${notice.notice_num }"><li class="notice-info"><b class="fontB">${notice.notice_title }</b></li></a>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 상품단 -->
<div class="container">
	<div class="content-box">
		<h3 class="top-box"><b class="fontB">하이디 신상</b></h3>
		<div class="row">
			<c:forEach var="product" items="${product }" begin="0" end="3">
				<div class="col-6 col-sm-6 col-lg-3">
					<a href="/productDetail.do?pro_num=${product.pro_num }">
						<div class="product-box"><img class="img-product" src="${pageContext.request.contextPath }/resources/img/productPicture/${product.pro_file}" alt="${product.pro_name }" title="${product.pro_name }"/></div>
						<p class="fontB product-info"><b>${product.pro_name }</b></p>
						<small class="product-info">${product.pro_desc }</small>
						<small><b class="fontB"><fmt:formatNumber value="${product.pro_price }" pattern="##,###"/></b>원</small>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="content-box sub-box" id="maindown">
		<h3 class="top-box"><b class="fontB">하이디 </b><b class="fontR">HOT</b></h3>
		<div class="row">
			<c:forEach var="product" items="${product }">
				<c:if test="${product.pro_num eq 1011 || product.pro_num eq 2031 ||product.pro_num eq 3021 ||product.pro_num eq 3131 }">
					<div class="col-6 col-sm-6 col-lg-3">
						<a href="/productDetail.do?pro_num=${product.pro_num }">
							<div class="product-box"><img class="img-product" src="${pageContext.request.contextPath }/resources/img/productPicture/${product.pro_file}" alt="${product.pro_name }" title="${product.pro_name }"/></div>
							<p class="fontB product-info"><b>${product.pro_name }</b></p>
							<small class="product-info">${product.pro_desc }</small>
							<small><b class="fontB"><fmt:formatNumber value="${product.pro_price }" pattern="##,###"/></b>원</small>
						</a>
					</div>
				</c:if>
			</c:forEach>
		</div> <!-- content-box1 -->
	</div>
	<div class="hov-clicker" onclick="goProductPage()"><img class="full-w" src="${pageContext.request.contextPath }/resources/img/label1.jpg"></div>
<div class="goTop">
	<a href="#"><img src="/resources/img/gotop_icon3.png" class="mapicon" id="topicon" alt="gotop"></a>
	<a href="./main.jsp"><img src="/resources/img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
	<a href="#maindown"><img src="/resources/img/godown_icon3.png" class="mapicon" id="downicon" alt="godown"></a>
	</div>

</div>
<div style="margin-bottom : 200px;"></div>
</body>
</html>