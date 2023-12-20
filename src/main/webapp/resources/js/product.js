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
   
     
}

$(function(){
   $("#modalClose, #modalClose2").on("click", function(){
      $("#modalCont").hide();
      $("#madalBack").hide();
   } );
   
    $(window).on('resize', function(){
            let w = $("body").width()+"px" ;
            let h = $("body").height()+"px" ;
         $("#madalBack").css({
            "width" : w
            , "height": h
         });
      });
   
});


function cartMove(){
   let cid = $("input[name=cart_ckid]").val();
   location.href ="/inMyCart.do?cart_ckid="+cid;
}

function listCart(proNum, totalP, thisObj){
   $.ajax({
      url: "/cart/byList/",
      type:"POST",
      data : {'pro_num': proNum , 'cart_amount' : 1, 'cart_totalp' : totalP  },
      cache : false,
      success : function(data){
         modalShow(thisObj, data);
      },
      error:function(request,status){
            console.log("이거??");
         alert("장바구니에 담을 수 없습니다.");
      }
   });
}

function pageList(page){
   const searchParams = new URLSearchParams(location.search);
   if(searchParams.has('search')){
      var listBy = searchParams.get('search');
      location.href="/productList.do?page="+page+"&search="+listBy;
   } else {
      location.href="/productList.do?page="+page;
   }
   if(searchParams.has('searchKeyword')){
      var searchKeyword = searchParams.get('searchKeyword');
      location.href="/productList.do?page="+page+"&searchKeyword="+searchKeyword;
   }
}