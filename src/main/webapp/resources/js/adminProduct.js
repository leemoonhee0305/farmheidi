function infoUpdate(){   
   let user_name = document.getElementById('user_name');
   let oif_ordtel = document.getElementById('oif_ordtel');
   let user_phone = document.getElementById('user_phone');
   let oif_ordaddr1 = document.getElementById('oif_ordaddr1');
   let oif_ordaddr2 = document.getElementById('oif_ordaddr2');
   let oif_ordaddr3 = document.getElementById('oif_ordaddr3');
   let user_mail = document.getElementById('user_mail');

   let oif_shipname = document.getElementById('oif_shipname');
   let oif_shiptel = document.getElementById('oif_shiptel');
   let oif_shipphone = document.getElementById('oif_shipphone');
   let oif_shipaddr1 = document.getElementById('oif_shipaddr1');
   let oif_shipaddr2 = document.getElementById('oif_shipaddr2');
   let oif_shipaddr3 = document.getElementById('oif_shipaddr3');
   let oif_shipmail = document.getElementById('oif_shipmail');
      
   let oif_id = document.getElementById('oif_id');
   
   $.ajax({
      url: "/updateShipInfo.do",
      data : {
         'user_name': user_name.value , 
         'oif_ordtel' : oif_ordtel.value , 
         'user_phone' : user_phone.value ,
         'oif_ordaddr1' : oif_ordaddr1.value ,
         'oif_ordaddr2' : oif_ordaddr2.value ,
         'oif_ordaddr3' : oif_ordaddr3.value ,
         'user_mail' : user_mail.value ,
         'oif_shipname' : oif_shipname.value , 
         'oif_shiptel' : oif_shiptel.value ,
         'oif_shipphone' : oif_shipphone.value ,
         'oif_shipaddr1' : oif_shipaddr1.value , 
         'oif_shipaddr2' : oif_shipaddr2.value , 
         'oif_shipaddr3' : oif_shipaddr3.value ,
         'oif_shipmail' : oif_shipmail.value , 
         'oif_id' : oif_id.value
      },
      type:"POST",
      dataType : 'text',
      cache : false,
      success : function(data){
         alert("수정되었습니다.");
      },
      error:function(request,status){
         alert("장바구니에 담을 수 없습니다.");
      }
   });
}



function execDaumPostcode(i) {
    new daum.Postcode({
        oncomplete: function(data) {

            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                document.getElementsByClassName("extraAddress")[i].value = extraAddr;
            
            } else {
                document.getElementsByClassName("extraAddress")[i].value = '';
            }

            document.getElementsByClassName('postcode')[i].value = data.zonecode;
            document.getElementsByClassName("address")[i].value = addr;
            document.getElementsByClassName("detailAddress")[i].focus();
        }
    }).open();
}

