<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험 예약 신청</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<%@ include file="/header.jsp"%>
<style>
* { border-box: border-box; }

body { font-weight: bold; }
small { font-weight: bold; }

div.resv-title {
   margin-bottom: 40px;
   text-align: center;
}

div.resv-title>h4 {   margin: 10px 10px;   text-align: center;	font-family: 'SBAggroB';}

div.resv-list>table {
   margin: 0 auto;
}

div.resv-list>table>tbody>tr>td {
   padding-top: 8px;
   padding-bottom: 8px;
}

div.resv-list>table>tbody>tr>.submit-td {
   padding-top: 30px;
   padding-bottom: 30px;
}

div.resv-list>table>tbody>tr>td>button {
   padding: 10px 10px;
   text-align: center;
   width: 100%;
}

input[name="resv_pname"], input[name="resv_headprice"] {
   background-color: #efefef;
}

div#content1{
   background-color : white;
}

a#content1{
   color : gray;
}
   
div.container {
      margin-bottom: 80px;
}

.resvSub{
   background-color: #26588d;
   color: #e0ffff;
   border: 1px solid #26588d;
}

.user-info{
/*    margin-right : 30px; */
}

form[name="resvForm"]{
   margin-bottom : 50px;
   border : 1px dotted #26588d;
   padding : 15px;
   border-radius: 4px;
}
hr {
	border: 1px dotted #dfdfdf;
}

button.action-btn{
   background-color: #26588d; color: #e0ffff; border: 1px solid #26588d;
}

button.action-btn:hover{
   background: #00a9ff; color: white; border: none; 
}

button.action-btn-active{
   color: white; background: lightgray; border: none; 
}
/* desktop */
/* @media only screen and (min-width: 979px) { */
	form[name="resvForm"]>.userDiv>.user-info {
		display:inline-block;
		width:48.99%;
		margin:7px 0;
	}
	form[name="resvForm"]>.userDiv>.user-info>span:first-child {
		display:inline-block;
		width:90px;
	}
	form[name="resvForm"]>.userDiv>.user-info>span:nth-child(2) {
		display:inline-block;
		width:calc(100% - 90px);
		border: 0px solid yellowgreen;
	}
	form[name="resvForm"]>.userDiv>.user-info>span:nth-child(2)>input {
		width:80%;
		border: 1px solid #26588d;
		border-radius: 3px;
		padding: 5px;
	}

	form[name="resvForm"]>.resvDiv>.user-info {
		display:inline-block;
		width:48.99%;
		margin:7px 0;
	}
	/* 인원수 span 등 관련 start */
	form[name="resvForm"]>.resvDiv>.user-info:nth-child(2)>span:first-child {
		display:inline-block;
		width:160px;
	}
	form[name="resvForm"]>.resvDiv>.user-info:nth-child(2)>span:first-child>span:first-child {
		display:inline-block;
		width:90px;
	}
	form[name="resvForm"]>.resvDiv>.user-info:nth-child(2)>span:first-child>span:nth-child(2) {
		display:inline-block;
		width:60px;
	}
	form[name="resvForm"]>.resvDiv>.user-info:nth-child(2)>span:nth-child(2) {
		display:inline-block;
		width:calc(100% - 150px - 12px);
	}
	form[name="resvForm"]>.resvDiv>.user-info:nth-child(2)>span:nth-child(2)>span:first-child {
		display:inline-block;
		width:90px;
		margin-left: 60px;
	}
	input[name="resv_headcount"], input[name="resv_youthheadcount"] {
	   width:60px;
	   border: 1px solid #26588d;
	   border-radius: 3px;
	   padding: 5px;
	}
	/* 인원수 span 등 관련 end. */

	form[name="resvForm"]>.resvDiv>.user-info>span:first-child {
		display:inline-block;
		width:90px;
	}
	form[name="resvForm"]>.resvDiv>.user-info>span:nth-child(2) {
		display:inline-block;
		width:calc(100% - 90px);
	}
	form[name="resvForm"]>.resvDiv>.user-info>span:nth-child(2)>input {
		width:80%;
		border: 1px solid #26588d;
		border-radius: 3px;
		padding: 5px;
	}
	textarea[name="user-req"] {
		width:calc(100% - 95px);
		height:70px;
		border: 1px solid #26588d;
		border-radius: 3px;
		padding: 5px;
	}
	
	form[name="resvForm"]>.btnDiv {
		margin: 13px;
		text-align: center;
	}
	form[name="resvForm"]>.btnDiv>#pay {
		width: 230px;
		padding: 10px;
		border-radius: 4px;
	}

	/* 유저정보, 예약내용, 항목별 서브타이틀 - 메뉴폰트로 설정 */
	form[name="resvForm"]>.userDiv>p>b {
		font-family: 'SUITE-Regular';
	}
	form[name="resvForm"]>.userDiv>.user-info>span:first-child {
		font-family: 'SUITE-Regular';
	}
	form[name="resvForm"]>.resvDiv>p>b {
		font-family: 'SUITE-Regular';
	}
	form[name="resvForm"]>.resvDiv>.user-info>span:first-child {
		font-family: 'SUITE-Regular';
	}

	/* 인원수 폰트 설정 */
	.mCnt {
		font-family: 'notosans';
	}

/* } */


/* mobile */
@media only screen and (max-width: 978px) {
	form[name="resvForm"]>.userDiv>.user-info {
		display:inline-block;
		width:99.99%;
	}
	form[name="resvForm"]>.resvDiv>.user-info {
		display:inline-block;
		width:99.99%;
	}
	
	/* 인원수 span 등 관련 start */
	form[name="resvForm"]>.resvDiv>.user-info:nth-child(2)>span:nth-child(2)>span:first-child {
		width:72px;
		margin-left: 0;
	}
	input[name="resv_headcount"], input[name="resv_youthheadcount"] {
	   width:40px;
	}
	/* 인원수 span 등 관련 end. */
	
	form[name="resvForm"]>.userDiv>.user-info>span:nth-child(2)>input {
		width:94%;
	}
	form[name="resvForm"]>.resvDiv>.user-info>span:nth-child(2)>input {
		width:94%;
	}
	textarea[name="user-req"] {
		width:96%;
	}

}
</style>


<%   Date nowDate = new Date();
   SimpleDateFormat toDay = new SimpleDateFormat("yyyy-MM-dd");
   String dateStr = toDay.format(nowDate);   %>


<script>
//예약신청폼 체크 함수 : 아래 유효성 체크 함수에서 체크함..
function resvFormCheck() {
	var inputDate = document.resvForm.resv_date; //폼 예약입력날짜 input
	var inputCount = document.resvForm.resv_headcount; //폼 성인인원 input
	var inputYCount = document.resvForm.resv_youthheadcount; //폼 청소년인원 input

	var resvDateStrs = String('<%if(request.getAttribute("resvDateStrs")!=null){%><%=request.getAttribute("resvDateStrs")%><%}%>');
	var holidayStrs = String('<%if(request.getAttribute("holidayStrs")!=null){%><%=request.getAttribute("holidayStrs")%><%}%>');
	var holidayArrs = new Array();
		holidayArrs = String(holidayStrs).split(","); //구분자(,)로 분리

	if(inputDate != null && inputCount != null && inputYCount != null) {
		var date = new Date();
		var todayDate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate(); //오늘 날짜
		
		//공휴일 요일 수(0:일, 1:월, 2:화, 3:수, 4:목, 5:금, 6:토)
			var inputdayOfWeek = new Date(String(inputDate.value)).getDay();
			var resvDateCheck = "n"; //예약가능 여부값(y:가능, n:불가능)
		if(inputdayOfWeek == 1 || inputdayOfWeek == 2) { //월,화 날짜
			for(var i=0; i<holidayArrs.length; i++) {
					var holidayOfWeek = new Date(String(holidayArrs[i])).getDay();
				if(String(inputDate.value) == String(holidayArrs[i])) { //(월,화)입력날짜 == 공휴일날짜)
					resvDateCheck = "y"; //가능값(y) 설정
					break;
				}
			}
			//alert(inputdayOfWeek+" , resvDateCheck = " + resvDateCheck); //가능여부값 확인..
		}
		
		if(inputCount.value < 1) {
			alert("성인인원을 입력하지 않았습니다.");
			return false;
		}
		if(inputYCount.value < 1) {
			alert("청소년인원을 입력하지 않았습니다.");
			return false;
		}
		if(inputDate.value.length != 10) {
			alert("예약날짜를 입력하지 않았습니다.");
			return false;
		}
		if( String(todayDate) == String(inputDate.value) ) {
			alert("오늘 날짜는 예약할 수 없습니다.");
			return false;
		}
		if( (inputdayOfWeek == 1 || inputdayOfWeek == 2) && (resvDateCheck == "n") ) {
			alert("공휴일이 아닌 월요일,화요일 날짜는 예약할 수 없습니다.");
			return false;
		}
		if(String(resvDateStrs).indexOf(String(inputDate.value)) != -1) {
			//alert("예약 날짜["+inputDate.value+"] 있음 : "+resvDateStrs);
			alert("입력하신 예약날짜는 이미 예약하신 날짜입니다.");
			return false;
		} else {
			//alert("예약 날짜["+inputDate.value+"] 없음 : "+resvDateStrs);
			//alert("예약가능한 날짜입니다.");
			return true; //폼 액션경로 실행..
		}
	}
	return false;
}


$(function(){
              $('#samePnum').click(function(){
                var same = this.checked;
                $('#resv_sptel').val(same ? $('#resv_tel').val():'');
           
                if(same == true){
                      $('#resv_sptel input').filter('input:text')
                     .attr('readonly',true)
                     .css('opacity', 0.5);
                  }else{
                    $('#resv_sptel input').filter('input:text').attr('readonly',false)
                     .css('opacity', 1);
                  } 
              });
            });



//유효성 체크
$(function(){
      $('#pay').on('click',function(){
         var resv_headcount = document.resvForm.resv_headcount.value !='';
         var resv_youthheadcount = document.resvForm.resv_youthheadcount.value !='';
         var resv_date = document.resvForm.resv_date.value !='';
         var resv_sptel = document.resvForm.resv_sptel.value !='';
         var cancelChk = $('input[name="cancelChk"]').is(":checked");
         var payChk = document.resvForm.payChk.value;
         
          if (!resv_headcount) {
              alert('성인 인원을 입력해주세요');
              return false;
         }

          if (!resv_youthheadcount) {
              alert('청소년 인원을 입력해주세요');
              return false;
         }

          if(!resv_date){
             alert('날짜를 지정해주세요');
             return false;
          }

          
          //////////: 여기부터 내용 추가 ~~
	  		var date = new Date();
			var todayDate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate(); //오늘 날짜
			var inputDate = document.resvForm.resv_date; //폼 예약입력날짜 input
	
			var resvDateStrs = String('<%if(request.getAttribute("resvDateStrs")!=null){%><%=request.getAttribute("resvDateStrs")%><%}%>');
			var holidayStrs = String('<%if(request.getAttribute("holidayStrs")!=null){%><%=request.getAttribute("holidayStrs")%><%}%>');
			var holidayArrs = new Array();
				holidayArrs = String(holidayStrs).split(","); //구분자(,)로 분리
	
			if(inputDate != null) {
				var date = new Date();
				var todayDate = date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate(); //오늘 날짜
				
				//공휴일 요일 수(0:일, 1:월, 2:화, 3:수, 4:목, 5:금, 6:토)
					var inputdayOfWeek = new Date(String(inputDate.value)).getDay();
					var resvDateCheck = "n"; //예약가능 여부값(y:가능, n:불가능)
				if(inputdayOfWeek == 1 || inputdayOfWeek == 2) { //월,화 날짜
					for(var i=0; i<holidayArrs.length; i++) {
							var holidayOfWeek = new Date(String(holidayArrs[i])).getDay();
						if(String(inputDate.value) == String(holidayArrs[i])) { //(월,화)입력날짜 == 공휴일날짜)
							resvDateCheck = "y"; //가능값(y) 설정
							break;
						}
					}
					//alert(inputdayOfWeek+" , resvDateCheck = " + resvDateCheck); //가능여부값 확인..
				}
	
				if( String(todayDate) == String(inputDate.value) ) {
					alert("오늘 날짜는 예약할 수 없습니다.");
					return false;
				}
				if( (inputdayOfWeek == 1 || inputdayOfWeek == 2) && (resvDateCheck == "n") ) {
					alert("공휴일이 아닌 월요일,화요일 날짜는 예약할 수 없습니다.");
					return false;
				}
				if(String(resvDateStrs).indexOf(String(inputDate.value)) != -1) {
					//alert("예약 날짜["+inputDate.value+"] 있음 : "+resvDateStrs);
					alert("입력하신 예약날짜는 이미 예약하신 날짜입니다.");
					return false;
				} else {
					//alert("예약 날짜["+inputDate.value+"] 없음 : "+resvDateStrs);
					//alert("예약가능한 날짜입니다.");
					//return true; //: 아래 루틴 실행..
				}
			}
          //////////: 여기까지 내용 추가함.

          
          if (!resv_sptel) {
              alert('예비 휴대폰 번호를 입력해 주세요');
              return false;
         }

          if(!cancelChk){
            alert('환불 약관에 동의해주세요');
           return false;
        }
         
         if(payChk = 'card'){
            // 여기서 결제함수 타기
            goPay();
         }else if(payChk = 'account-trans'){
            location.href="/resvMain.do"
         }else{
            alert('결제방식을 선택해 주세요');
            return false;
         }
      });
      
      // 2자리 넘어가면 null로 만들기
      $(".mCnt").keyup(function(){
         let val = $(this).val();
         if( val != '') {
            if(val > 9 ){
               $(this).val('');
               alert('9명까지만 입력 가능합니다.');
            }
         }
      });
   });
   
// 총 결제 금액 계산
function totalprice(){
   console.log("totalprice() 들어옴")
   var youthCount = $("#resv_youthheadcount").val();
   var adultCount = $("#resv_headcount").val();
   console.log("youthCount : " + youthCount);
   console.log("adultCount : " + adultCount);
   var totalCount = youthCount*30000 + adultCount*45000;
   console.log("totalCount : " + totalCount);
   return totalCount;
}
   
//주문 번호 생성 함수
function oifId() {
   // 니알아서 번호 다시 만들어
   var now = new Date();
   var yyyy = "" + now.getFullYear();
   var yy = yyyy.substr(2,2);
   var MM = now.getMonth() + 1;
   if(MM < 10){MM = "0"+MM;}
   var dd = now.getDate();
   if(dd < 10){dd = "0"+dd;}
   var SS = now.getHours();
   if(SS < 10){SS = "0"+SS;}
   var mm = now.getMinutes();
   var ss = now.getSeconds();
   var mmm = now.getMilliseconds();
   
   var oif_id = yy + MM + dd + SS + mm + ss + mmm;
   return oif_id;
}

// 결제함수
function goPay(){
   // 주문번호 생성 / 저장
   var oif_id = oifId();
   console.log(oif_id);
   // 인잇페이 가맹점 번호(이건 바꿀필요 없음)
   var IMP = window.IMP;
   IMP.init('imp28373434');
   
   // 앱/모바일 판단해서 t/f 반환
   var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ? true : false;
   
   var price = totalprice();
   console.log("price:" + price);
    
   // 웹일 경우
    if(!isMobile) {
          IMP.request_pay({
             // api 돌릴때 필요한 코드
             pg: 'html5_inicis.INIpayTest',
             // 어떤걸로 결제하는지
             pay_method: 'card',
             // 주문 번호
             merchant_uid: oif_id ,
             // 상품명
          name: '[하이디농장 패키지]',
         //결제금액
             amount: price,
             // 주문자 정보들
             buyer_email: $("#resv_email").val(),
             buyer_name: $("#resv_name").val(),
             buyer_tel: $("#resv_tel").val(),
//              buyer_addr: $("#oif_ordaddr2").val() + $("#oif_ordaddr3").val(),
//              buyer_postcode: $("#oif_ordaddr1").val(),
             }, function (rsp) {
                console.log(rsp);
                // 결제 성공시
                if (rsp.success) {
                   // 주문번호
                   var msg = rsp.merchant_uid;
                   
                   chk = true;
                  // 테이블에 데이터를 넣는 작업 
                  document.resvForm.action = "/resv.do?resv_num="+oif_id;
                  document.resvForm.method= "post";
                  document.resvForm.submit();
                } else {
                   // 실패
                   var msg = '결제에 실패하였습니다.';
                   msg += '\n에러내용 : ' + rsp.error_msg;
                   alert(msg);
                }
          });
        
    } else {
    	//모바일인 경우 스크립트
    	var queryString = $("#resvForm").serialize();

	       
        IMP.request_pay({
			 pg: 'html5_inicis.INIpayTest',
           pay_method: 'card',
           merchant_uid: oif_id,
           name: '[하이디농장 패키지]',
           amount: price,
           buyer_email: $("#resv_email").val(),
           buyer_name: $("#resv_name").val(),
           buyer_tel: $("#resv_tel").val(),
           m_redirect_url: 'http://www.farmheidi.kro.kr/resv.do?resv_num='+oif_id+'&'+queryString,
           }, function (rsp) {
              console.log(rsp);
        });
   }
}

</script>
</head>

<body>
   <div>
      <%@ include file="resvMenu.jsp"%>
   </div>
   
   <div class="container">
      <div class="resv-wrap">

         <div class="resv-title">
            <h4>체험 예약 신청</h4>
         </div>

            <form name="resvForm" id="resvForm">
               
               <div class="userDiv">
                  <p><b class="menu-font">&lt; 유저 정보 &gt;</b></p>
<!--                   <small>&gt; 다른 내용이 있을경우 유저 페이지에서 수정 부탁드립니다.</small><br> -->
                  <span class="user-info">
	                  <span>상품명</span><span><input type="text" value="${packPName}" readonly></span>
                  </span><br>
                  <span class="user-info">
	                  <span>예약자명</span><span><input type="text" id="resv_name" name="resv_name" value="${user_name }" readonly></span>
                  </span>
                  <span class="user-info">
	                  <span>아이디</span><span><input type="text" id="resv_userId" name="resv_userId" value="${user_id }" readonly></span>
                  </span>
                  <span class="user-info">
	                  <span>이메일</span><span><input type="text" id="resv_email" name="resv_email" value="${user_mail }" readonly></span>
                  </span>
                  <span class="user-info">
	                  <span>휴대폰</span><span><input type="text" id="resv_tel" name="resv_tel" value="${user_phone }" readonly></span>
                  </span>
               </div>
                  <br><hr><br>
               <div class="resvDiv">
                  <p><b>&lt; 예약 내용 &gt;</b></p>
                  <span class="user-info">
	                  <span><!-- mCnt -->
	                  	  <span>성인</span><span><input type="number" class="mCnt" id="resv_headcount" name="resv_headcount" min="0" max="9" value="0" required></span>
	                  </span><span>
		                  <span>청소년</span><span><input type="number" class="mCnt" id="resv_youthheadcount" name="resv_youthheadcount" min="0" max="9" value="0" required></span>
	                  </span>
                  </span>
                  <span class="user-info">
	                  <span>예약날짜</span><span><input type="date" max="2024-01-31" min="<%=dateStr%>" name="resv_date" required></span>
                  </span>
                  <span class="user-info">
	                  <span>예비연락처</span><span><input type="text" id="resv_sptel" name="resv_sptel" placeholder="비상 연락처"></span>
                  </span>
                  <span class="user-info">
	                  <input type="checkbox" id="samePnum" name="samePnum">
	                  <label for="samePnum">예비연락처가 없으면 체크</label>
                  </span><br>
                  <label for="user-req">요청사항</label><br>
                  <textarea name="user-req" placeholder="요청사항을 입력해주세요. ex) 유제품에 알러지가 있어 점심 식사시 유의가 필요합니다."></textarea><br>
                  <input type="checkbox" name="cancelChk">
                  <label for="cancelChk">환불 약관에 동의합니다.</label><br>
               </div>
                  <label><input type="radio" name="payChk" value="card"> 카드</label>
                  <label style="margin-left:10px;"><input type="radio" name="payChk" value="account-trans"> 계좌이체</label>
               <div class="btnDiv">
                  <button id="pay" class="action-btn" type="button">예약하기</button>
               </div>
            </form>
         </div>
      </div>


<%@ include file="/footer.jsp"%>
</body>
</html>
