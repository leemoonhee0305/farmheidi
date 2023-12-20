<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<%@ include file="../../header.jsp"%>
<style>
.jumbotron {
	width: 600px;
	margin: 0 auto;
	padding: 35px 90px;
	background-color: none;
	text-align: center;	
	padding: 0rem 2rem 0 2rem!important;
	font-weight: bold;
}

button {
	text-align: center;
	margin: 0 auto;
}

.btn {
	border: 0;
	color: #596E79;
	width: 100%;
	height: 35px;
	margin-top: 10px;
	border: 1px solid #c7b198;
}
.login {
background-color: #26588d;
	color: #e0ffff;
	border: 1px solid #26588d;
}
.login:hover { background: #00a9ff; color: white; border: none; }
.mainback {
	background-color: #e0ffff;
	color: #09d0ef;
	border: 1px solid #e0ffff;	
}

h4 {
font-family: 'SUITE-Regular'; font-weight: bold;
    color: #00468d
}
.small{
	font-size: 15px;
}
.text-center {margin-bottom:100px;} 
.findidbody {margin-bottom:50px;}
@media (max-width: 600px ) { .jumbotron { width: 400px;	margin: 0 auto; } .findidbody {margin-botoom:20px;} }
</style>
</head>
<body>
<%@ include file="../../menu.jsp" %>
	<div class="findidbody">
		<div class="jumbotron">
			<span>고객님의 아이디는</span><br>
            <h4>${fn:substring(user_id, 0, 3)}${fn:substring('****', 0, fn:length(user_id) - 3)}</h4>
			<span>입니다</span><br><br>
			<button type="button" class="login btn"
				onclick="location.href='login.do'">로그인페이지</button>
				<div class="text-center">
					<br> <a class="small" href="../../main.jsp">메인페이지</a>
				</div>
<!-- 			<button type="button" class="mainback btn" -->
<!-- 				onclick="location.href='../../main.jsp'">메인페이지</button> -->
		</div>
		<%@ include file="/footer.jsp"%>
</body>
</html>