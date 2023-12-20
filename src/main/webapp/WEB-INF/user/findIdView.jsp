<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>
<%@ include file="../../header.jsp"%>
<style>
.sub_page {
	padding: 20px 0 90px 0;
}
.mb-2 { font-weight: bold;}
.inner {
	max-width: 1200px;
	margin: 0 auto;
}

.in {
	width: 420px;
    max-width: 90%;
    margin: auto;
}

div {
	text-align: center;
}

button {
	text-align: center;
	margin: 0 auto;
}

.btn {
	border: 0;
/* 	color: #596E79; */
	color: white;
	width: 100%;
	height: 35px;
	margin-top: 10px;
	border: 1px solid #26588d;
	background-color:#26588d;
}
.btn-user:hover { background: #00a9ff; color: white; border: none; }
.small{
	font-size: 15px;
}

form.user {
    margin-bottom: 3px;
}

</style>
</head>
<body>
<%@ include file="../../menu.jsp" %>
	<article class="sub_page">
		<div class="inner">

			<div class="text-center">
				<h1 class="h4 text-gray-900 mb-2">아이디 찾기</h1>
				<p class="mb-4">이름과 이메일을 입력해주세요.</p>
			</div>
			<div class="in mailsendbox">
				<form class="user" action="/idmailSend" method="POST">
					<div class="form-group">
						<input type="text" class="form-control form-control-user"
							id="user_name" name="user_name" placeholder="이름">
					</div>
					<div class="form-group">
						<input type="text" class="form-control form-control-user"
							id="user_mail" name="user_mail" placeholder="메일">
					</div>
					<button type="submit" class="btn btn-user btn-block">찾기</button>
				</form>
				<a href="login.do"
					class="btn btn-facebook btn-user btn-block">로그인</a>
				<div class="text-center">
					<br> <a class="small" href="../../main.jsp">메인페이지</a>
				</div>
			</div>

		</div>
	</article>
	<%@ include file="/footer.jsp"%>
</body>
</html>