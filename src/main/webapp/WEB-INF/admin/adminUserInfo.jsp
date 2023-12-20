<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="adminMenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 - 관리자</title>
<style>
.adiv {
	text-align: center;
	margin-top: 50px;
}

.tab {
	margin: auto;
	text-align: center;
	border-collapse: collapse;
}

th[scope="row"] {
	text-align: left;
	padding-left: 10px;
	width: 80px;

}

.rowth{
	border-bottom: 1px solid #ccc;
	padding: 5px 10px;
}
.td2{
	border-bottom: 1px solid #ccc;
	padding: 10px;
}
.subbtn{
	margin	: 15px 0;
}
.readon{
	background: lightgray;
	pointer-events : none;
	border: 1px solid #ccc;
}

input[type="text"]{
	padding: 4px;
}

</style>
</head>
<body>

	<!-- <tr><th>회원번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th><th>이메일</th><th>가입날짜</th><th>탈퇴여부</th></tr> -->
	<%-- <tr><td>${user.user_num}</td><td>${user.user_id}</td><td>${user.user_pw}</td> --%>
	<%-- <td>${user.user_name}</td><td>${user.user_phone}</td><td>${user.user_mail}</td><td>${user.join_date}</td><td>${user.user_exit}</td></tr> --%>
	<div class="adiv">
		<h2>상세보기</h2>
		<form action="adminUserUpdate.do" method="post">
			<table class="tab">
				<tr>
					<th scope="row" class="rowth">회원번호</th>
					<td class="td2"><input type="text" class="readon" name="user_num" value="${user.user_num}" readonly></td>
				</tr>
				<tr>
					<th scope="row" class="rowth">아이디</th>
					<td class="td2"><input type="text" class="readon" name="user_id" value="${user.user_id}" readonly></td>
				</tr>
				<tr>
					<th scope="row" class="rowth">비밀번호</th>
					<td class="td2"><input type="password" class="readon" name="user_pw" value="${user.user_pw}" readonly></td>
				</tr>
				<tr>
					<th scope="row" class="rowth">이름</th>
					<td class="td2"><input type="text" name="user_name" value="${user.user_name}"></td>
				</tr>
				<tr>
					<th scope="row" class="rowth">전화번호</th>
					<td class="td2"><input type="text" name="user_phone" value="${user.user_phone}"></td>
				</tr>
				<tr>
					<th scope="row" class="rowth">이메일</th>
					<td class="td2"><input type="text" name="user_mail" value="${user.user_mail}"></td>
				</tr>
				<tr>
					<th scope="row" class="rowth">가입날짜</th>
					<td class="td2"><input type="text" name="join_date" value="${user.join_date}" readonly></td>
				</tr>
				<tr>
					<th scope="row" class="rowth">탈퇴여부</th>
					<td class="td2"><input type="text" name="user_exit" value="${user.user_exit}" readonly></td>
				</tr>

			</table>
			<div class="subbtn">
				<input type="submit" value="회원정보변경" onclick="location.href='/adminUserUpdate.do'">
			</div>
		</form>
	</div>

</body>
</html>