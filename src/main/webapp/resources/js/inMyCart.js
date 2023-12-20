function count(type, count, proNum)  {
	let arr = document.getElementsByName('selectAmount').length;
	let i = count;
	const resultAmount = document.getElementsByClassName('selectAmount')[i];
	const resultPrice = document.getElementsByClassName('resultPrice')[i];
		
	var amount = resultAmount.innerText;
	var price = resultPrice.innerText.replace(',', '');
	var proPrice = price / amount;

	if(type == 1) {
		amount = parseInt(amount) + 1;
		price =  proPrice * amount;
	}else if(type == -1)  {
		if(amount > 1){
			amount = parseInt(amount) - 1;
			price =  proPrice * amount;
		} else { alert('최소수량입니다.'); }
	}
	resultAmount.innerText = amount;
	resultPrice.innerText = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	
	inCartUpdate(proNum, amount, price)
}

function inCartUpdate(proNum, amount, totalP){
	$.ajax({
		url: "/cart/byCart/",
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
	
function delcart(){
	document.cartform.action="/delCart.do";
	document.cartform.method = "post";
	document.cartform.submit();
}

$(document).ready(function(){
	preAllChk();
	allPrice();
	$('#delBtn').on('click', function(){
		document.cartform.action="/delSelCart.do";
		document.cartform.method= "post";
		document.cartform.submit();
	});
	
	$('.result').on('click', function(){
		allPrice();
	});
	
	$("#selBtn").on("click",function(){
		if(!document.getElementById('logined')){
			var ok = confirm('로그인 하시겠습니까?');
			if(ok) {
				location.href="/login.do";
			} else {
				document.cartform.action="/selBuy.do";
		        document.cartform.method ="post";
		        document.cartform.submit();
			}
		} else {
	        document.cartform.action="/selBuy.do";
	        document.cartform.method ="post";
	        document.cartform.submit();
		}
    });
	
	$("#allOrderBtn").on("click",function(){
		if(!document.getElementById('logined')){
			var ok = confirm('로그인 하시겠습니까?');
			if(ok) {
				location.href="/login.do";
			} else {
				location.href="/buyProd.do";
			}
		} else {
			location.href="/buyProd.do";
		}
    });

});



function allPrice() {	
	if(checkBoxes.length != 0){
		var allPrice = 0;
		
		for(var i=0;i<checkBoxes.length;i++){
			 if(checkBoxes[i].checked == true){
				 allPrice += Number(document.getElementsByClassName('resultPrice')[i].innerText.replace(',', ''));
			 }
			var shipPrice = document.getElementById('shipPrice');
			if(allPrice >= 50000){
				shipPrice.innerText = '0';
			} else {
				shipPrice.innerText = '5,000';
			}
		}
		let totalPrc = allPrice + Number(shipPrice.innerText.replace(',', ''));
		let totalPrcPlusKomma = totalPrc.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		document.getElementById('prosPrice').innerText = allPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		document.getElementById('totalPrice').innerText = totalPrc.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
		document.getElementById('totalPrice2').innerText = totalPrcPlusKomma+'원';
	}
}



const checkBoxes = document.getElementsByName('idList');

function checkAllClick(){
	if(document.getElementById('checkAll').checked){
	  for(var i=0;i<checkBoxes.length;i++){
	    checkBoxes[i].checked = true;
	  }
	}else{
	  for(var i=0;i<checkBoxes.length;i++){
	    checkBoxes[i].checked = false;
	  }
	}
}



//장바구니 상품체크박스전체클릭
function preAllChk(){
	if(checkBoxes.length != 0){
		 for(var i=0;i<checkBoxes.length;i++){
			 checkBoxes[i].checked = true; 
		 } 
		 document.getElementById('checkAll').checked = true;
	}
}


//하위 checkbox 체크 여부에 따른 [전체선택] checkbox 체크 변경
function checkBoxValueChanged(){
  var checkedCnt = 0;
  for(let i=0; i<checkBoxes.length;i++){
    if(checkBoxes[i].checked){
      checkedCnt ++;
    }
  }
  if(checkedCnt == checkBoxes.length){
    document.getElementById('checkAll').checked = true;
  }else{
    document.getElementById('checkAll').checked = false;
  }
}


let upButton = document.getElementsByClassName('upButton');
let downButton = document.getElementsByClassName('downButton');
let trashButton = document.getElementsByClassName('cartTrashButton');
function mouseoverU(i){
	upButton[i].setAttribute("src", "/resources/img/productUse/caret-up-fill.svg");
}
function mouseleaveU(i){
    upButton[i].setAttribute("src","/resources/img/productUse/caret-up.svg");
}  
function mouseoverD(i){
	downButton[i].setAttribute("src", "/resources/img/productUse/caret-down-fill.svg");
}
function mouseleaveD(i){
    downButton[i].setAttribute("src","/resources/img/productUse/caret-down.svg");
}  
function mouseoverT(i){
	trashButton[i].setAttribute("src", "/resources/img/productUse/trash3-fill.svg");
}
function mouseleaveT(i){
    trashButton[i].setAttribute("src","/resources/img/productUse/trash3.svg");
}  
