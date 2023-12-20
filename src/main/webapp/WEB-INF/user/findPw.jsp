<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<%@ include file="../../header.jsp"%>
<style>
.findpwTxt {font-family:  'HakgyoansimWoojuR'; font-weight: bold; text-align: center;}
.pwfindTitle {font-family: 'HakgyoansimWoojuR'; font-weight: bold; margin-top: 10px; margin-bottom:20px; text-align: center;}
form.user  { margin : 20px 0 50px 12px; }
.in { width: 420px; max-width: 90%; margin: auto; }
.login_w {margin: 5 0 0 0;}
span { font-weight:bold; }
.pwlog { width: 100%; margin-bottom:5px; } 
.pwflog { width: 100%; height:30px; color: white; border: 1px solid #26588d; background-color:#26588d; }
.pwflog:hover  { background: #00a9ff; color: white; border: none;  }
.mailsendbody { margin-bottom: 100px; height:15vw;}
@media (max-width: 600px ){ .mailsendbody { margin-bottom: 200px; height:30vw;} form.user {text-align:center; matgin-top: 30px;}  }
</style>
</head>
<body>
<%@ include file="../../menu.jsp" %>
<div class="mailsendbody">
<div class="findpwTxt">
	<span>임시 비밀번호를 입력하신 메일로 전송하였습니다.<br></span> 
	<span>전송된 메일을 확인 하신 후, 로그인 해주세요.</span> 
</div>
	<div class="pwfindTitle">
		<h2 style="font-weight:bold;">로그인</h2>
	</div>
	<div class="in login_w">
		<form class="user" action="login.do" method="post">
		<input class= "pwlog" type="text" name="user_id" placeholder="아 이 디 " required><br>
		<input class= "pwlog" type="password" name="user_pw" placeholder="비밀번호" required>
		<div>
			<button type="submit" class="pwflog">로그인</button>
		</div>
		</form>
	</div>
</div>

	<%@ include file="/footer.jsp"%>
</body>
</html>