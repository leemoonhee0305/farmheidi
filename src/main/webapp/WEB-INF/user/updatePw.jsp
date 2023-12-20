<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
body {
	display: block;
}

.hh3 { text-align: center; font-family: 'SBAggroB'; }
.pwupBox { text-align: center; margin-bottom: 100px;}
form { justify-content: center; }
.pwformSize { width: 35%; }
.form-group { margin-bottom: 0.5rem;}
fieldset {
	display: flex;
	justify-content: center;
	border: none;
	width: 100vw;
	align-items: flex-end;
}

input {
	margin-left: 0px;
	padding: auto 0;
	border: 1px solid silver;
	width: 100%;
	height: 35px;
}

[type=button] {
	font-size: 1em;
}

[name=user_id], [name=user_name] {
	background-color: lightgray;
}

input:hover {
	cursor: pointer
}
.editpwB { color:white; background: #17a2b8; border:none; height:35px; width: 49%; }
.editpwCanc { color: white; width: 50%; background: lightgray; height: 35px; border: none;}
@media only screen and (max-width: 600px) { .pwformSize { width: 80%; } .editpwCanc{width:49%;} }
</style>
<script>
$(document).ready(function() {	
	$("#updateUserpw").on("click", function(){
		if($("#user_pw").val==""){
			alert("현재 비밀번호를 입력해주세요");
			$("#user_pw").focus();
			return false;
		}
		if ($("#upPw").val() != $("#upPw1").val()) {
			alert("변경비밀번호가 일치하지 않습니다.");
			$("#upPw1").focus();
			return false;
		}
		$.ajax({
			url : "/updateUserpw.do",
			type : "POST",
			data : {user_id:'${user_id }', upPw: $('#upPw').val()},
			success: function(data){				
				if(data==0){
					alert("패스워드가 틀렸습니다.");
					return;
				}else{
					if(confirm("변경하시겠습니까?")){
						$("#pwUpdateForm").submit();
					}					
				}
			}
		
		});	
	});
})
function infoBack() {
		location.href = "myinfoUser.do";
	}
</script>
		<%@ include file="mypageMenu.jsp"%>
</head>
<body>
<div class="upPwpage">
	<h3 class="hh3">비밀번호 변경하기</h3>
	<fieldset>
		<form method="post" class="pwformSize" action="updateUserpw.do" id="pwUpdateForm">
			<input type="hidden" name="user_id" value="${user_id }">
			<div class="pwupBox">
				<p class="lead">변경하실 비밀번호를 입력해 주세요.</p>
				<div class="form-group">
					<input type="password" name="user_pw" placeholder="현재 비밀번호" />
				</div>
				<div class="form-group">
					<input type="password" name="upPw" id="upPw" placeholder="새 비밀번호" />
				</div>
				<div class="form-group">
					<input type="password" name="upPw1" id="upPw1"placeholder="새 비밀번호 확인" />
				</div>
				<button type="button" id="updateUserpw" name="updateUserpw"	class="editpwB">비밀번호 변경</button>
				<button type="button" onclick="infoBack()" class="editpwCanc">취소</button>
			</div>			
		</form>
	</fieldset>
</div>	
	<%@ include file="/footer.jsp"%>
</body>
</html>