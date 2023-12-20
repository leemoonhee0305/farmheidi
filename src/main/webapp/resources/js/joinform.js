//핸드폰 유효성검사 체크 
const autoHyphen2 = (target) => {
 target.value = target.value
   .replace(/[^0-9]/g, '')
  .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
}
   $(function() {

      $('#idChk').on('click', function() {
         let user_id = $('input[name="user_id"]').val();
         
         $.ajax({
            url : "idChk.do",
            type : "post",
            data : {
               user_id : user_id
            },
            cache : false,
            success : function(result) {
               if (!user_id) {
                  $("#checkId").html('아이디를 입력해 주세요.');
                  $("#checkId").css('color', 'red');
                }
               else if (result == 1) {
                  console.log('success');
                  $("#checkId").html('사용할 수 없는 아이디입니다.');
                  $("#checkId").attr('color', 'red');
               } else if (result == 0) {
                  $("#checkId").html('사용 가능한 아이디입니다.');
                  $("#checkId").attr('color', 'green');
               }
            },

            error : function() {
               alert('error');
            }
         });
      });
   });
   
   
 
 function checkSelectAll()  {
     // 전체 체크박스
     const checkboxes 
       = document.querySelectorAll('input[name="chk2"]');
     // 선택된 체크박스
     const checked 
       = document.querySelectorAll('input[name="chk2"]:checked');
     // select all 체크박스
     const selectAll 
       = document.querySelector('input[name="selectall"]');
     
     if(checkboxes.length === checked.length)  {
       selectAll.checked = true;
     }else {
       selectAll.checked = false;
     }
   }

   function selectAll(selectAll)  {
     const checkboxes 
        = document.getElementsByName("chk2");
     
     checkboxes.forEach((checkbox) => {
       checkbox.checked = selectAll.checked
     });
   }

// 문자인증
   var timer;
   var isRunning = false;

   // 인증번호 발송하고 타이머 함수 실행   


   function sendAuthNum() {
       // $('#user_num').prop('disabled', false).css('background-color', '');
       $("#hidden").css("display", "");
      

      // 남은 시간
      var leftSec = 180, display = document.querySelector('#timer');
      // 이미 타이머가 작동중이면 중지
      if (isRunning) {
         //매초마다 남으 시간을 계산
         clearInterval(timer);
      } else {
         isRunning = true;
      }

      //    startTimer(leftSec, display);
      const user_phone = $('#user_phone').val();
      alert(user_phone+"로 인증번호를 발송 하였습니다.")

      var frm = document.idfindscreen;

      if (frm.user_phone.value == "") {
         alert("핸드폰번호를 정확하게 입력해주세요");
         return;
      }
		
 	$("#hidden").css("display", "block");
 	
      startTimer(leftSec, display);
      $.ajax({
         url : '/check/sendSMS.do',
         type : 'get',
         data : {
            "user_phone" : user_phone
         },
         success : function(data) {
            const checkNum = data;
            
            $('#enterBtn').click(function() {
               const user_num = $('#user_num').val();

               if (checkNum === user_num) {
               	  clearInterval(timer);
                  alert('인증 성공하였습니다.');

               } else {
                  alert('인증 실패하였습니다. 다시 입력해주세요.');
               }
            });

         }
      });

   }

   function startTimer(count, display) {
      display = document.querySelector('#timer');
      var minutes, seconds;
      timer = setInterval(function() {
         minutes = parseInt(count / 60, 10);
         seconds = parseInt(count % 60, 10);
         minutes = minutes < 10 ? "0" + minutes : minutes;
         seconds = seconds < 10 ? "0" + seconds : seconds;

         display.textContent = minutes + ":" + seconds;

         // 타이머 끝
         if (--count < 0) {
            clearInterval(timer);
            alert("인증 시간이 초과되었습니다.");

            //$("#user_num").prop('disabled', true).css('background-color','lightgrey');
            isRunning = false;
         }
      }, 1000);
   }
   
    var pw_passed = true;  // 벨리데이션 처리시 해당 인자값 확인
     function fn_pw_check() {
        var pw = document.getElementById("user_pw").value; //비밀번호
        var pw2 = document.getElementById("user_pwConfirm").value; // 확인 비밀번호

        pw_passed = true;

        var pattern1 = /[0-9]/;
        var pattern2 = /[a-zA-Z]/;
        var pattern3 = /[!@#-_.]/; 
        var pw_msg = "";

        if(pw.length == 0) {
               alert("비밀번호를 입력해주세요");
               return false;              
         } else {
                if( pw  !=  pw2) {
                      alert("비밀번호가 일치하지 않습니다.");
                      return false;                     
                 }
         } 

       if(!pattern1.test(pw)||!pattern2.test(pw)||!pattern3.test(pw)||pw.length<6||pw.length>20){
            alert("영문+숫자+특수기호 6자리 이상으로 구성하여야 합니다.");
            return false;           
        }          

        var SamePass_0 = 0; //동일문자 카운트
        var SamePass_1 = 0; //연속성(+) 카운트
        var SamePass_2 = 0; //연속성(-) 카운트

        for(var i=0; i < pw.length; i++) {
             var chr_pass_0;
             var chr_pass_1;
             var chr_pass_2;
    
             if(i >= 2) {
                 chr_pass_0 = pw.charCodeAt(i-2);
                 chr_pass_1 = pw.charCodeAt(i-1);
                 chr_pass_2 = pw.charCodeAt(i);
                
                  //동일문자 카운트
                 if((chr_pass_0 == chr_pass_1) && (chr_pass_1 == chr_pass_2)) {
                    SamePass_0++;
                  }
                  else {
                   SamePass_0 = 0;
                   }

                  //연속성(+) 카운트
                 if(chr_pass_0 - chr_pass_1 == 1 && chr_pass_1 - chr_pass_2 == 1) {
                     SamePass_1++;
                  }
                  else {
                   SamePass_1 = 0;
                  }
         
                  //연속성(-) 카운트
                 if(chr_pass_0 - chr_pass_1 == -1 && chr_pass_1 - chr_pass_2 == -1) {
                     SamePass_2++;
                  }
                  else {
                   SamePass_2 = 0;
                  } 
             }    
             
            if(SamePass_0 > 0) {
               alert("동일문자를 3자 이상 연속 입력할 수 없습니다.");
               pw_passed=false;
             } 

            if(SamePass_1 > 0 || SamePass_2 > 0 ) {
               alert("영문, 숫자는 3자 이상 연속 입력할 수 없습니다.");
               pw_passed=false;              
             }
            
             if(!pw_passed) {            
                  return false;
                  break;
            }
        }
        document.getElementById("pwStatus").innerHTML = "사용할 수 있는 비밀번호입니다.";
       document.getElementById("pwStatus").style.color = "green";
        return true;
    }
    
    $(document).ready(function(){
      $("#user_mailSel").on("change",function(){
         $("#user_mail02").val($("#user_mailSel").val());
      });
      
      $(".userMail").on("change",function(){
         $("#user_mail").val($("#user_mail01").val() +"@"+$("#user_mail02").val());
      });
      
      $("#user_mailSel").on("change",function(){
         $("#user_mail").val($("#user_mail01").val() +"@"+$("#user_mail02").val());
      });
   })