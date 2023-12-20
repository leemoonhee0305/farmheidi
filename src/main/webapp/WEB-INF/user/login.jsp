<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 농장</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/login.css">
<script>
	function findBtn(){
		location.href = "findIdView";
	}
	function findpwBtn(){
		location.href = "findPwView";
	}
	function njBtn() {
		location.href = "getNaverAuthUrl.do";
	}
	function kjBtn(){
		location.href = "getKakaoAuthUrl.do";
	}
	function ujBtn() {
		location.href = "joinForm.do";
	}
</script>

<%@ include file="/header.jsp"%>
</head>
<body>
<%@ include file="/menu.jsp"%>
	<%
	if (request.getAttribute("error") != null) {
		out.print("<script>");
		out.print("alert('아이디와 비밀번호를 확인해주세요.')");
		out.print("</script>");
	}

	if (request.getAttribute("result") != null) {
		out.print("<script>");
		out.print("alert('회원가입이 되었습니다.')");
		out.print("</script>");
	}
	if (request.getAttribute("exitUmsg") != null) {
		out.print("<script>");
		out.print("alert('90일 이내 탈퇴한 회원입니다.')");
		out.print("</script>");
	}
	%>
	<div class="alldiv">
	<article class="sub_page">
		<div class="inner">
			<header>
				<h1 style="font-weight:bold;">로그인</h1>
			</header>
			<div class="in login_w">
				<form action="login.do" method="post">
					<ul class="form">
						<li><input type="text" name="user_id" placeholder="아 이 디 " required></li>
						<li class="pw"><input type="password" name="user_pw" placeholder="비밀번호" required></li>
					</ul>
					<div>
						<button type="submit" class="btn loginBtn" style="background-color:#26588d; color:#e0ffff; border: 1px solid #26588d;" >로그인</button>
					</div>
					<div>
						<button type="button" class="find" onclick="findBtn()">아이디 찾기</button>	
						<button type="button" class="find" onclick="findpwBtn()">비밀번호 찾기</button>
					</div>
					<br>
					<div>
					<div class="join-box">
						<a class="join-text" href="getNaverAuthUrl.do"><img class="llogo" id="naverlogo" src="../resources/img/naverlogo.png"><br>
						<small>네이버 간편가입</small></a>
					</div>
					<div class="join-box">
						<a class="join-text" href="getKakaoAuthUrl.do"><img class="llogo" id="kakaologo" src="../resources/img/kakaologo.png"><br>
						<small>카카오 간편가입</small></a>
						
					</div>
					<div class="join-box">
						<a class="join-text" href="joinForm.do">
							<img class="llogo" id="joinlogo" src="../resources/img/joinlogo.png">
							<small>일반회원가입</small>	
						</a>
					</div>
					</div>
<!-- 					<div> -->
<!-- 						<input type="button" class="na" onclick="njBtn()" id="naverLogin" -->
<!-- 							value="네이버 1초 가입하기"> -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 						<input type="button" class="ka" onclick="kjBtn()" id="kakaoLogin" -->
<!-- 							value="kakao 1초 가입하기"> -->
<!-- 					</div> -->
<!-- 					<div> -->
<!-- 						<input type="button" class="or" onclick="ujBtn()" value="일반회원가입"> -->
<!-- 					</div> -->

				</form>
			</div>
		</div>
	</article>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>