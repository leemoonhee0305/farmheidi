<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<%@ include file="menu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 농장에 어서오세요!</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
@font-face {
    font-family: 'HakgyoansimGaeulsopungB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimGaeulsopungB.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

	/* 제일 위의 이미지 */
	div.img-box{
		width : 100%;
		height : 350px
	}
	img.intro-img{
		width : 100%;	
		height : 100%;
		z-index : -100;
	}

	.letter-box{
		padding : 40px;
	}
	
	.letter-page{
		padding : 20px;
	}
	.top-text{
		text-align : center;
		font-weight : bold;
	}
	div.row{
		width : 100%;
	}
	
	div.letter > p{
		text-align: left;
		font-family : 'HakgyoansimGaeulsopungB';
		font-weight : bolder;
		font-size : 1.5rem;
	}
	h4{
		font-family : SBAggroB;
	}
	
	.text-right{
		text-align : right;
	}
	.content-box{
		padding : 100px 0;
	}
	
	.content-box.container{
		padding : 100px 0;
		padding-bottom : 50px;
	}
	
	.head-box{
		padding-bottom : 0;
	}
	.col-6 a{
		color : gray;
	}
	.fontB{
		color : #3f4575;
	}
	.font-center{
		text-align : center;
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
	div.row.col-lg-6{
		padding : 0;
	}
	
	div.row.col-lg-6 div.col{
		padding : 50px;
	}
	.top-box{
		text-align : center;
	}
	
	.back-white{
		background-color : white;
	}
	
	.trd-title{
		font-size : 1.15rem
	}
	.trd-box{
		padding : 25px;
	}
	.inner-box{
		border : 1px solid lightgray;
		padding : 50px;
		height : 100%;
	}

	
	@media screen and (max-width :968px){
		div.letter > p{
			font-size : 1rem;
		}
		div.row.col-lg-6 div.col{
			padding : 20px;
			padding-top : 0;
		}
		h3.top-box{
			margin-bottom : 50px;
		}
		.content-box.container{
			padding-top : 50px;
		}
		.content-box.container > h3.top-box{
			margin-bottom : 25px;
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
<div class="container">
	
	<!-- mini-menu -->
	
</div>
<div class="background-box">
	<div class="container">
	
		<h3 class="top-text">하이디의 마음</h3>
		<div class="letter-box row">
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 letter-page">
				<div class="letter">
					<p>안녕하세요. 하이디 목장입니다.</p>
					<br>
					<p>저희 나라의 많은 현대인들이 서울 지역을 비롯해 여러 도시에서 바쁜 일상을 보내고 있습니다.
					그런 와중 바쁜 일상에 지쳐 휴식을 가지고 싶어 유명 관광로 여행을 다니며 재충전하여 다시 일상을 돌아갑니다.
					그만큼 저도 항상 힐링이 필요했었고 여행을 다녔습니다.
					그러던 와중 항상 똑같이 다니던 여행에 저는 무료함을 느꼈습니다.</p>
					<br>
					<p>여행마저 일하는 것처럼 일정을 맞춰 다니고, 똑같은 구경을 하며, 힐링이라고 하기 어려운 여행. 
					<!-- 여긴 수정 -->
					편안함을 가지고 싶어하던 와중에 시골의 조용한 풍경이 너무 좋게 보였고, 그런 조용한 곳에서 동물들과 함께 하는 시간이 너무나 즐거웠습니다.</p>
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 letter-page">
				<div class="letter">
					<p>1년, 365일</p>
					<p>항상 똑같은 삶에 저희 하이디 목장은 새로운 휴식을 제공하고 싶었습니다.</p>
					<p>물론 떠나는 여행도 좋은 여행입니다. 하지만 새로운 것을 원하신다면
					생각나실때 한번 들려 편안한 시간을 가져보셨으면 좋겠습니다.
					여러분에게  최대한의 경험, 휴식, 행복을 제공하기 위해
					저희 하이디 농장은 노력하겠습니다.</p>
					<p>이상 하이디의 마음이였습니다. 감사합니다.</p>
					<br><br>
					<p class="text-right">현대인들의 방전을 다시 충전시켜주고 싶은<br>하이디 목장에서 드림.</p>
				</div>
			</div>
		</div>
		<div class="content-box sub-box head-box">
		<h3 class="top-box"><b class="fontB">컨텐츠 바로가기</b></h3>
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
	<div class="container content-box">
		<h3 class="top-box"><b class="fontB">하이디의 선물</b></h3>
		<div class="row">
				<div class="trd-box col-lg-4 col-md-12 col-sm-12 col-xs-12">
					<div class="inner-box">
						<h4><b>특별한 경험</b></h4>
						<p class="trd-title"><b>목장을 둘러보며 소들과 함께하는 특별한 경험을 해보세요.</b></p>
						<p>저희 목장의 체험은 하나의 패키지로 묶여있습니다. 해당 패키지의 체험은 소들과 함께하는 여러가지 체험과 소들이 우리에게 준 선물로 여러가지 요리를 해보는 등, 평소에 해보기 힘든 특별한 경험을 할 수 있습니다.</p>
					</div>
				</div>
				<div class="trd-box col-lg-4 col-md-12 col-sm-12 col-xs-12">
					<div class="inner-box">
						<h4><b>편안한 휴식</b></h4>
						<p class="trd-title"><b>조용하고 평화로운 넓은 초원에서 편안한 휴식을 가져보세요.</b></p>
						<p>저희 목장에는 소들이 살고 있는 넓은 초원이 있습니다. 그 넓은 초원에서 어느 때보다 안정과 평화를 느끼며 편안한 휴식을 가질 수 있습니다.</p>
					</div>
				</div>
				<div class="trd-box col-lg-4 col-md-12 col-sm-12 col-xs-12">
					<div class="inner-box">
						<h4><b>새로운 행복</b></h4>
						<p class="trd-title"><b>하이디 목장에서 소들과 확실하게 행복해져보세요!</b></p>
						<p>소들과 확실하게 행복해지는 농장이 모토를 가진 하이디 목장에서 소들과 함께 즐겁게 놀고 먹으며 여러분들이 확실히 행복해질 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
		<div class="bottom-box" id="intropic">
			<img class="intro-img" src="${pageContext.request.contextPath }/resources/img/introback.jpg">
		</div>
</div>
<div class="goTop">
	<a href="#"><img src="/resources/img/gotop_icon3.png" class="mapicon" id="topicon" alt="gotop"></a>
	<a href="./main.jsp"><img src="/resources/img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
	<a href="#intropic"><img src="/resources/img/godown_icon3.png" class="mapicon" id="downicon" alt="godown"></a>
	</div>

	<%@ include file="/footer.jsp"%>
</body>
</html>