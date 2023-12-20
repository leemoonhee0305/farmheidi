<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ include file="/header.jsp" %>
<%@ include file="mypageMenu.jsp" %> 
<link rel="stylesheet" href="../../resources/css/mypage.css">
<body>
	<div class="alldiv">
		<h3 class="hh3">내 정보 수정</h3>
		<br>
		<fieldset>
			<div class="ec-base-table">
				<form name="miu" method="post" action="updateUser.do">
					<div>
						<table class="tab">
							<tr>
								<th scope="row">아이디</th>
								<td class="td"><input type="text" class="inp"
									name="user_id" value="${user_id }" readonly disabled></td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td class="td"><input type="text" class="inp" name="user_name" value="${user.user_name }" readonly disabled></td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td class="td"><input type="email" class="inp" name="user_mail" value="${user.user_mail }"></td>
							</tr>
							<tr>
								<th scope="row">전화번호</th>
								<td class="td"><input type="text" class="inp" name="user_phone" onkeyup="phoneNum(this);" value="${user.user_phone }"> <br></td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td class="td"><a href="updatePw.do" id="pwsize" class="btn btn-block">비밀번호변경</a></td>
							</tr>
							<!-- 						<tr> -->
							<!-- 							<td>비밀번호확인</td> -->
							<!-- 							<td><input type="password" name="user_pw2" id="password2" required></td> -->
							<!-- 						</tr> -->
							<%-- 					</c:when> --%>
							<%-- 				</c:choose> --%>
						</table>
					</div>
					<br>
					
					<div class="btncla">
						<input type="submit" class="btn btn-block btnsize" value="수정하기">
					</div>
					
					<div class="btncla">
						<input type="reset" class="btn btn-block btnsize" value="초기화">
					</div>					
					<br>
					<br>
					<div class="btncla" id="delbtn">
						<input type="button" class="btn btn-block btnsize backg" onclick="deleteConf('${user.user_id}');" value="탈퇴하기">
					</div>
				</form>
			</div>
		</fieldset>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>