<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 농장</title>
<%@ include file="header.jsp" %>

<script>
	$(document).ready(function(){
		$.ajax({
			url : "/main.do",
			type : 'GET',
			cache : false,
			success : function(res){
				$("#include-main").html(res);
			},
			error : function(err){
				console.log('에러메세지', err);
				alert("오류발생");
			}
		});
	});
</script>
</head>
<body>
<!-- 헤더 -->
<div>
<%@ include file="menu.jsp" %>
</div>
<div id="include-main">
</div>
<!-- 내용 -->
<%@ include file="footer.jsp" %>
</body>
</html>