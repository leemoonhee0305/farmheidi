<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 농장</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<%-- <script src="${pageContext.request.contextPath}/resources/js/productDetail.js"></script>  --%>
<style>

body {
	margin: 0px;
	padding: 0px;
}

/* div{border: 1px solid black;} */

.container {
    display: flex;
    flex-direction: column;
}
	.content-top{
		flex-direction: column;
		border: 1px solid #ededed;
	}
		#pdform{
		    display: flex;
		    flex-wrap: wrap;
		}
			.ct-left{padding:20px;}
			.ct-left img{
				max-width:100%;
				width: 100%;
				height: auto; 
				border-radius:5px;
			}
			
			.ct-right{
				padding: 20px;
				border-left: 1px solid #ededed;
			}
				.price{text-align: right !important;}
					.proPrice{font-size: 2rem;}
				.proAmount{}
					div#selectAmount {
					    margin: 0 10px;
						display: inline;
						border: none;
					}
					.amoBtn{
						box-sizing: border-box;
					    width: 35px;
					    height: 35px;
					    display: inline-block;
					}
					span#selectAmount{
						width: 40px;
  						text-align: center;
						padding: 4.5px 10px;
					    border-top: 1px solid #615656;
					    border-bottom: 1px solid #615656;
					    margin: 0 -8px;
					}
				.proResultPrice{
					line-height:46px;
					margin: 1rem 0 2rem;
				}
					.resultPrice {
						float: right;
					    font-size: 2.25rem;
		    		}
				.proBtn{display: flex; justify-content: space-between;}
					.col-4{
						padding-right: 5px;
					    padding-left: 5px;
				    }
						.link{
							width:100%;
							height: 60px;
							padding: 10px 0;
							border-radius:8px; 
							border: 1px solid #26588d;
							background: white;
							color: black;
						}
						.buy{
							color: #e0ffff;
							background-color: #26588d;
						}
	 					.link:hover{
							background: #00a9ff; 
							color: white; 
							border: none;
						}
						.link:active{
							color: white; 
							background: lightgray; 
							border: none;
						}
	.proDesc{text-align: center;}

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
	}
	
	.carting{
		color: white;
	    padding: 10px 15px;
	    background: black;
	    border:none;
	}

</style>
<script>

function checkLogin(pronum){
	
	var price = document.getElementById('resultPrice').innerText;
	
	let str = price.replace(',', '').replace('원', '');
	
	if(!document.getElementById('logined')){
		var ok = confirm('로그인 하시겠습니까?');
		if(ok) {
			location.href="/login.do";
		} else {
			checkCart(pronum, str);
		}
		
	} else {
		checkCart(pronum, str);
	}
}

function countInDetail(type)  {
	  // 결과를 표시할 element
	  const resultAmount = document.getElementById('selectAmount');
	  const resultPrice = document.getElementById('resultPrice');
	  
	  // 현재 화면에 표시된 값
	  var number = resultAmount.innerText;
	  var price = resultPrice.innerText;
	  var proPrice = "<c:out value='${productDetail.pro_price}'/>";
	  
	  
	  // 더하기/빼기
	  if(type == 1) {
	    number = parseInt(number) + 1;
	    price = proPrice * number;
	  }else if(type == -1)  {
		  if(number > 1){
				number = parseInt(number) - 1;
				price =  proPrice * number;
			} else {
				alert('최소수량입니다.');
				return false;
			}
	  }
	  
	  // 결과 출력
	  var cPrice = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+" 원";
	  
	  resultAmount.innerText = number;
	  resultPrice.innerText = cPrice;
	  
	}
	
function inCartInDetail(thisObj){
	var pronum = "<c:out value='${productDetail.pro_num}'/>"
	var amount = document.getElementById('selectAmount').innerText;
	var price = document.getElementById('resultPrice').innerText;
	
	let str = price.replace(',', '').replace(' 원', '');
	console.log(str);
	
	inCartUpdateInDetail(pronum, amount, str);
	modalShow(thisObj);
}

function inCartUpdateInDetail(proNum, amount, totalP){
	$.ajax({
		url: "/cart/byDetail/",
		data : {'pro_num': proNum , 'cart_amount' : amount, 'cart_totalp' : totalP  },
		type:"POST",
		dataType : 'text',
		cache : false,
		success : function(data){
			console.log("성공");
		},
		error:function(request,status){
			alert("장바구니에 담을 수 없습니다.");
		}
	});
}

function goOrderInDetail(){
	var proNum = document.getElementById('proNum').value;
	var amount = document.getElementById('selectAmount').innerText;
	var price = document.getElementById('resultPrice').innerText;
	let str = price.replace(',', '').replace(' 원', '');
	document.pdform.action = "/orderProduct.do?pro_num="+proNum+"&price="+str+"&amount="+amount;
	document.pdform.method= "post";
	document.pdform.submit();
}

function checkCart(pronum, str){
	console.log(1+str);
	$.ajax({
		url: "/countCart",
		type:"POST",
		data : {'pro_num' :pronum, 'cart_totalp' : str}, //{파라미터명 : 값} , data속성 : 파라미터를 지정하는 속성
		cache : false,
		success : function(res){ //res : 컨트롤러에서 처리하고 돌려주는 값을 받는 변수
			if(res == 0){
				goOrderInDetail();
			} else {
				var ok = confirm('장바구니에 동일상품이 있습니다. 같이 구매하시겠습니까?');
				if(ok){
					location.href='/inMyCart.do';
				}
				else{
					goOrderInDetail();
				}
			}
		},
		error:function(request,status){
			alert("장바구니에 담을 수 없습니다.");
		}
	});
}

function listBtn(){
	document.location.href="/productList.do";
}
</script>

</head>
<body>
	<%@ include file="/menu.jsp"%>
	<div class="container">
		<div class="content-top">
			<form name="pdform" id="pdform">
				<div class="ct-left col-xs-12 col-md-6">
					<img src="/resources/img/productPicture/${productDetail.pro_file }"
						title="${productDetail.pro_name} 상품 사진">
				</div>
				<div class="ct-right col-xs-12 col-md-6">
					<div class="hi mt-3">
						<h3 id="proName">${productDetail.pro_name}</h3>
					</div>
					<div class="price mt-3">
						<strong class="proPrice"><fmt:formatNumber value="${productDetail.pro_price}"
							pattern="###,###,###" /> 원</strong>
					</div>
					<hr>
					<div class="proAmount mt-3">
						<input type="button" onclick='countInDetail(-1)' value=" - " class="amoBtn">
						<span id='selectAmount' class="amoBtn">1</span>
						<input type="button" onclick='countInDetail(1)' value=" + " class="amoBtn">
					</div>
					<hr>
					<div class="proResultPrice">
						총 가격 :
						<strong id="resultPrice" class="resultPrice"><fmt:formatNumber value="${productDetail.pro_price}"
							pattern="###,###,###" /> 원</strong>
						<input type="hidden" id="proNum" value="${productDetail.pro_num}">
					</div>
					<div class="proBtn mt-3">
						<div class="col-4">
							<button type="button" onclick="listBtn()" class="link">목록버튼</button>
						</div>
						<div class="col-4">
							<button type="button" onclick="inCartInDetail(this)" class="link">장바구니</button>
						</div>
						<div class="col-4">
							<button type="button" onclick="checkLogin(${productDetail.pro_num})" class="link buy">구매</button>
						</div>
					</div>
					
				</div>
			</form>
		</div>
		
		<hr>
		
		<div class="proDesc">
			${productDetail.pro_desc}
		</div>
		
		<hr>
		
		<% if (session.getAttribute("user_id") != null) { %>
		<input type="hidden" id="logined" value="${user_id }">
		<% } %>
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

	<%@ include file="/footer.jsp" %>
</body>
</html>