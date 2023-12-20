<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 </title>
<%@ include file="../../header.jsp"%>
<script>
	function mkBtn() {
    var idKey = document.getElementById('mail_key').value;

    var ms = '<%= session.getAttribute("mail_key") %>' ;

    if (idKey === ms) {
        document.forms[0].submit();
    } else {
        alert('인증 번호가 일치하지 않습니다.');   
        false;
    }
}
</script>
<style>
form.user  { margin : 20px 0 50px 12px; }
.mkchk { margin: 5 0 0 0; }
span { font-weight:bold; }
.mkBtn { width: 80px; height:30px; color: white; border: 1px solid #26588d; background-color:#26588d; }
.mkBtn:hover { background: #00a9ff; color: white; border: none;  } 
.mailsendbody { margin-bottom: 100px; height:15vw;}
@media (max-width: 600px ){ .mailsendbody { margin-bottom: 100px; height:30vw;} form.user {text-align:center; matgin-top: 30px;}  }
</style>
</head>
<body>
<%@ include file="../../menu.jsp" %>
<div class="mailsendbody">
<span>&nbsp;&nbsp;&nbsp;인증번호가 전송되었습니다. </span>
<span>전송 받은 인증번호를 입력 해 주세요.</span><br>
<div class="mkchk">
<form class="user" action="/findId" id= "findId" method="POST">
<input type="text" id="mail_key" name="mail_key">
<button type="submit" class="mkBtn" onclick="mkBtn()">확인</button>
</form></div>
</div>
<%@ include file="/footer.jsp"%>
</body>
</html>