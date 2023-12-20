	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.spring.farm.util.PagingVO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	PagingVO pageInfo = (PagingVO)request.getAttribute("paging");
	int listCount=pageInfo.getTotal();
	int nowPage=pageInfo.getNowPage();
	int maxPage=pageInfo.getLastPage(); //최대 페이지 개수
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage(); //endPage는 보여지는 것 중 마지막 페이지 - LastPage는 찐 마지막 페이지
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 농장</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/product.js"></script> 
<style>
body {
   margin: 0px;
   padding: 0px;
   font-family: 'HakgyoansimWoojuR';
}
   .container{max-width: 1390px!important;}
      .sBox{float:right; padding: 0 40px;}
         .sForm{float:right; margin-bottom: 10px;}
            .searchIn {
               background-color: #26588d; color: #e0ffff; border: 1px solid #26588d;
               border-radius:3px;
            }
            .searchIn:hover{
            	background-color: #00a9ff;
            	border: 1px solid #00a9ff;
				color: white;
            }
         .order{float:right;}
            .order > a{color: black;}
            .order > a:hover{text-decoration: none;}

      ul{padding:0;}
         #liTag{
            margin: 10px 0;
            max-width: 330px;
            display:inline-block;
         }
            .click_box{width:300px; height: 350px;}
               .productInList {
                  color: black;
                  text-decoration:none!important;
               }
               .productInList:hover{
                  cursor: pointer;
               }
                  div.inDiv {
                     width:300px;
                     height: 300px;
                     max-width: 100%;
                  }
                     div.inDiv > img {
                        width:100%;
                        height: 100%;
                        border: 1px solid lightgray;
                     }
                  .proName{
                     display: block;
                     text-overflow: ellipsis;
                     overflow: hidden;
                     margin: 10px 0;
                     height: 48px;
                     font-size:20px;
                     line-height:23px;
                  }
            a.aBtn{
               float: right;
               margin: 13px 0;
            }

      .pagDiv{
         text-align:center;
         margin-bottom: 40px;
      }
         section > a.btn{
            border: none;
            background:#26588d;
            color: #e0ffff;
         }
         section > a.btn:hover{
            border: none;
            background-color: #00a9ff;
			color: white;
         }
         .btn-number{margin:0 5px;}

/* 모달창 */
#madalBack{
   display: none;
   position : absolute;
   z-index:995;
   top: 0px;
   left:0px;
   background:rgba(0,0,0, 0.5);
}
   #modalCont {
      display: none; 
      position : absolute;
      z-index: 999;
      width: 400px;
      height: 250px;
      background-color: #fff;
      border-radius: 8px;
      border: 1px solid #000;
      padding: 40px 10px 10px 10px;
      background:#fff;
   }
      #modalClose {
         position: absolute;
         top : 0px;
         right:0px;
         padding: 5px 10px;
         border-radius: 8px;
         text-align: right;
      }
      #modalClose:hover{cursor:pointer;}
      #cartbtn{
         margin-top: 20px;
         text-align: center;
      }
      #cartbtn button{margin:20px 5px;}
         .shopping{
            color: #e0ffff ;
            padding: 10px 15px;
            background: #26588d;
            border:none;
            border-radius: 3px;
         }
         .carting{
            color: white;
            padding: 10px 15px;
            background: black;
            border:none;
            border-radius: 3px;
         }
		h2.productTitle{
			width: 40%;
			margin: 0 auto;
			text-align: center;
			font-weight: bold;
		}

@media screen and (max-width: 412px) {
	ul{
		text-align: center;
	}
	.sBox{padding: 10px 40px;}
	#topicon { right: 10px; bottom: 98px;}
   #homeicon { right: 10px; bottom: 59px; }
   #downicon { right: 10px; bottom: 20px;}
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

</style>
<%@ include file="../../header.jsp" %>
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
	<%@ include file="../../menu.jsp" %>
	<div class="container">
	<h2 class="productTitle">상품목록</h2>
		<div class="sBox">
			<form action="/productList.do" method="get" class="sForm">
				<input type="search" name="searchKeyword">
				<input type="submit" value="검색" class="searchIn">
			</form>
			<br>
			<div class="order">
				<a href="/productList.do?search=DATE">최신등록순</a>
				<span> | </span>
				<a href="/productList.do?search=LOWPRICE">낮은가격순</a>
				<span> | </span>
				<a href="/productList.do?search=HIGHPRICE">높은가격순</a>
				<span> | </span>
				<a href="/productList.do?search=NAME">이름순</a>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<div id="productListBy" class="container_box">
			<ul>
				<c:forEach items="${productList}" var="product">
					<li id="liTag" class="col-xs-12 col-md-6 col-xl-3">
						<div class="click_box">
							<a href="/productDetail.do?pro_num=${product.pro_num}" class="productInList">
								<div class="inDiv">
									<img class="product" src="/resources/img/productPicture/${product.pro_file}" title="${product.pro_name} 상품 사진" alt="${product.pro_name}" id="propic">
								</div>
								<strong class="proName">${product.pro_name}</strong>
								<strong><fmt:formatNumber value="${product.pro_price}" pattern="###,###,###" /> 원</strong>
							</a>
						</div>
						<a onclick="listCart('${product.pro_num}','${product.pro_price}', this)" class="aBtn productInList">
							<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
							  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
							</svg>
						</a>
					</li>
				</c:forEach>
			</ul>
		</div>
		<br><br>
		
	<div class="pagDiv">
		<section id="pageList" class="btn section">
			<% if(nowPage<=1){ %> 
				이전&nbsp;&nbsp;
			<%}else{ %>
				<a onclick="pageList('<%=nowPage-1 %>')" class="btn prev">이전</a>&nbsp;
				
			<%} %>
	
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
						<%=a %>&nbsp;
					<%}else{ %>
						<a onclick="pageList('<%=a %>')" class="btn-number"><%=a %></a>&nbsp;
						
					<%} %>
			<%} %>
	
			<%if(nowPage>=maxPage){ %>
				&nbsp;다음
			<%}else{ %>
				<a onclick="pageList('<%=nowPage+1 %>')" class="btn next">다음</a>
			<%} %>
		</section>
	</div>
		
	</div>
	
	<div id="madalBack">
		<div id="modalCont">
			<div id="modalClose">X</div>
			<div id="cartbtn">
				<span>선택하신 상품이<br>장바구니에 추가 되었습니다</span><br>
				<button type="button" id ="modalClose2" class="shopping">쇼핑 계속하기</button>
				<button type="button" onclick="location.href='/inMyCart.do'" class="carting">장바구니로 이동</button>
				<form name="cfrm"><input type="hidden" name="cart_ckid" ></form>
			</div>
		</div>
	</div>
	<div class="goTop">
	<a href="#"><img src="/resources/img/gotop_icon3.png" class="mapicon" id="topicon" alt="gotop"></a>
	<a href="./main.jsp"><img src="/resources/img/home_icon.png" class="mapicon" id="homeicon" alt="gohome"></a> 
	<a href="#propic"><img src="/resources/img/godown_icon3.png" class="mapicon" id="downicon" alt="godown"></a>
	</div>	
	
	<%@ include file="/footer.jsp"%>
</body>
</html>