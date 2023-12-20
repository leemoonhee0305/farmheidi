
function modalShow(thisObj, data) {
   $("input[name=cart_ckid]").val(data);
   var targetTop = $(thisObj).parent().offset().top;
   $("#modalCont").css({"top": targetTop+"px"});
   $("#madalBack").css({
      "width" : $("body").width()+"px" 
      , "height": $("body").height()+"px"
      , "display" : "flex"
      , "justify-content": "center"
   });
   $("#madalBack").show();
   $("#modalCont").show();
   
   a();
   
  function a(){
      $(window).on('resize', function(){
            let w = $("body").width()+"px" ;
            let h = $("body").height()+"px" ;
         $("#madalBack").css({
            "width" : w
            , "height": h
            , "display" : "flex"
            , "justify-content": "center"
         });
      });
   }
}

$(function(){
   $("#modalClose, #modalClose2").on("click", function(){
      $("#modalCont").hide();
      $("#madalBack").hide();
   } );
   
});


function checkLogin(pronum){
   
   var price = document.getElementById('resultPrice').innerText;
   
   let str = price.replace(',', '').replace('원', '');
   
   if(!document.getElementById('logined')){
      var ok = confirm('로그인 하시겠습니까?');
      if(오케이) {
         location.href="/login.do";
      } else {
         checkCart(pronum, str);
      }
      
   } else {
      checkCart(pronum, str);
   }
}

function countInDetail(type)  {
     const resultAmount = document.getElementById('selectAmount');
     const resultPrice = document.getElementById('resultPrice');
     
     var number = resultAmount.innerText;
     var price = resultPrice.innerText;
     var proPrice = "<c:out value='${productDetail.pro_price}'/>";
     
     
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
            if(오케이){
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