<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String uid = (String) session.getAttribute("USER_ID");
%>
<%@ include file="/header.jsp" %>
<!DOCTYPE html><html><head>
<meta charset="UTF-8">
<title>체험 자주 묻는 질문</title>
<style>

.layout {width : 80%; max-width: 600px; margin: 0 auto; margin-bottom : 100px;}

.playQna { list-style: none; margin: 0; padding: 0; margin-bottom : 30px; }

.playQna>li { padding: 10px 0; box-sizing: border-box; }

.playQna>li:nth-child(n+2) { border-top: 1px dashed #aaa; }

.playQna input { display: none; }

.playQna label { font-weight: bold;	color: #000; margin: 20px 0 0;	cursor: pointer; }

.playQna label::before { display: block; content: ""; width: 0; height: 0; border: 8px solid transparent;
	border-left: 8px solid lightgray; margin: 2px 0 0 8px; float: left; }

.playQna input:checked+label::before { border: 8px solid transparent; border-top: 8px solid lightgray;
	border-bottom: 0; margin: 8px 4px 0; }

.playQna div { display: none; color: #666; font-size: 0.9375em; overflow: hidden; padding: 10px 0 10px 30px;
	box-sizing: border-box; transition: max-height 0.4s; }

.playQna input:checked+label+div { display: block; }

.qBtn { text-decoration : none; background-color: #26588d;
    color: #e0ffff;
    border: 1px solid #26588d;
	padding : 5px 13px; float: right; }

.qBtn:hover { background: #00a9ff; color: white; border: none; box-shadow: none; text-decoration : none; }
.qBtn:active{ color: white; background: lightgray; border: none; }

div#content3{
	background-color : white;
}

a#content3{
	color : gray;
}
p	{ font-family: 'SUITE-Regular'; font-weight: bold; }
h4.top{
	width : 30%;
	margin : 0 auto;
	margin-bottom : 25px;
	padding-bottom : 20px;
	border-bottom : 1px solid gray;
	text-align : center;
	font-weight: bold;
}

.top-name{
	width : 80%;
	margin : 0 auto;
}

@media screen and (max-width : 1400px){
	h4.top{
		width : 40%;
	}
}

@media screen and (max-width : 968px){
	a.qBtn{
		display : block;
		margin : 0 auto;
		float : none;
		width : 35%;
		text-align : center;
		min-width : 110px;
	}
}
@media screen and (max-width : 550px){
	h4.top {padding-bottom : 15px;}
}	


</style>
</head>
<body>
<%@ include file="playMenu.jsp" %>
<div class="top-name">
<h4 class="top">FAQ</h4>
</div>

<div class="layout">
	<ul class="playQna">
	<li>
		<input type="checkbox" id="pq-1"> 
		<label for="pq-1">&nbsp;&nbsp;&nbsp;체험시간은 언제 인가요? </label>
			<div>
				<br>
				<p>-&nbsp; 오전과 오후 하루 2번 체험할 수 있습니다. </p>
				<p>-&nbsp; 오전 체험시간 : 09:00 ~ 12:00 </p>				
				<p>-&nbsp; 오후 체험시간 : 14:00 ~ 15:00 </p>				
			</div>
	</li>
	<li>
		<input type="checkbox" id="pq-2"> 
		<label for="pq-2">&nbsp;&nbsp;&nbsp;체험예약은 어떻게 하나요?</label>
			<div>
				<br>
				<p>-&nbsp; 홈페이지 상단 '체험예약' 을 클릭하면 나오는 페이지에서 예약할 수 있습니다. </p>
				<p>-&nbsp; 체험상품 예약페이지에서 '예약하러가기' 버튼 클릭을 하면 예약할 수 있습니다. </p>
			</div>
	</li>
	<li>
		<input type="checkbox" id="pq-3"> 
		<label for="pq-3">&nbsp;&nbsp;&nbsp;식사 제공은 되는 건가요?</label>
			<div>
				<br>
				<p>-&nbsp; 식사는 별도로 제공 되지 않습니다.</p>
				<p>-&nbsp; 쿠킹 클래스 등을 이용하시는 경우에는 해당 체험 파트에서의 음식들이 제공됩니다. </p>
			</div>
	</li>
	<li>
		<input type="checkbox" id="pq-4"> 
		<label for="pq-4">&nbsp;&nbsp;&nbsp;비나 눈이 와도 체험이 가능 한가요?</label>
			<div>
				<br>
				<p>-&nbsp; 폭우, 폭설 등으로 위험할 수 있는 상황에서는 체험이 취소 될 수 있습니다. </p>
				<p>-&nbsp; 이 경우, 실내체험은 가능합니다.  </p>
			</div>
	</li>
	<li>
		<input type="checkbox" id="pq-5"> 
		<label for="pq-5">&nbsp;&nbsp;&nbsp;체험기간 동안 사진 촬영은 가능 한가요?</label>
			<div>
				<br>
				<p>-&nbsp; 일반적인 경우는 사진 촬영이 가능합니다.</p>
				<p>-&nbsp; 다만, 상황상 촬영이 어려운 경우에는 제한될 수 있습니다.</p>
			</div>
	</li>

	<li>
		<input type="checkbox" id="pq-6"> 
		<label for="pq-6">&nbsp;&nbsp;&nbsp;체험예약신청전에 사전 답사를 할 수 있나요?</label>
			<div>
				<br>
				<p>-&nbsp; 하이디농장 사정상 사전답사가 어려울 수 있으니 먼저 아래 연락처로 문의 바랍니다. </p>
				<p>-&nbsp; 하이디농장 tel : 02-3456-7890 </p>				
			</div>
	</li>

	<li>
		<input type="checkbox" id="pq-7"> 
		<label for="pq-7">&nbsp;&nbsp;&nbsp;체험기간에 분실물이 있을 때는 어떻게 하나요?</label>
			<div>
				<br>
				<p>-&nbsp; 하이디농장(02-3456-7890)에 접수된 분실물이 있는지 먼저 확인하시고 </p>
				<p>-&nbsp; 찾지 못할 경우 문의시 연락처를 남겨 주시면 분실물을 찾았을 때 알려드립니다. </p>				
			</div>
	</li>

	<li>
		<input type="checkbox" id="pq-8"> 
		<label for="pq-8">&nbsp;&nbsp;&nbsp;공휴일이나 휴일에도 체험이 가능 한가요?</label>
			<div>
				<br>
				<p>- &nbsp; 공휴일과 휴일에는 모든 체험이 가능합니다. </p>
				<p>- &nbsp; 공휴일과 휴일에는 모든 체험이 가능하고, 평일에는 지정된 체험만 가능합니다. </p>				
			</div>
	</li>
	<li>
		<input type="checkbox" id="pq-9"> 
		<label for="pq-9">&nbsp;&nbsp;&nbsp;농장 휴일은 언제인가요?</label>
			<div>
				<br>
				<p>- &nbsp; 하이디농장의 휴일은 월요일과 화요일입니다. </p>
				<p>- &nbsp; 월요일과 화요일이 법정 공휴일과 대체 공휴일인 경우에는 체험이 가능합니다. </p>				
			</div>
	</li>

	<br>
	</ul>
		<a href="getQNAList.do" class="qBtn">다른질문보기</a>
</div>
<%@ include file="/footer.jsp" %>


</body>
</html>