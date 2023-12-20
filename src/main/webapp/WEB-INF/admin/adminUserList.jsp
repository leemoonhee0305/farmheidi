<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="adminMenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 - 관리자</title>
<style>
.usercont {
	width: 55%;
	margin: auto;
	text-align: center;
}

.user-list-table {
	margin: auto;
	border-collapse: collapse;
	width: 100%;
	padding: 10px;
}

.th1 {
	border-bottom: 2px solid #ccc;
	padding: 10px;
	background-color: #F0F8FF;
}

.td1 {
	border-bottom: 1px solid #ccc;
	padding: 10px;
}

input.shear {
	border: 1px solid #ccc;
	padding: 1px 4px;
	height: 24px;
	margin: 0;
}

#shrbtn {
	border: 1px solid #ccc;
	height: 27.34px;
	padding: 1px 4px;
}

select#sel1.form-control {
	height: 27.33px;
	border: 1px solid #ccc;
}

.aul-search {
	margin-bottom: 20px;
}

.user-title-section {
	margin-bottom:
}
.userDetailbtn { background-color: #7695B7; border:none; color:white; width: 45px; height:30px; border-radius:4px;}
.userExitbtn { background-color: #b77676; border:none; color:white; width: 45px; height:30px; border-radius:4px;}
a.atg {
	text-decoration: none;
	display: inline-block;
	width: 2rem;
	height: 2rem;
	border-radius: 0.2rem;
	margin: 0 0 5px 5px;
	color: #7695B7;
	cursor: pointer;
}

div.num {
	text-decoration: none;
	background-color: white;
	display: inline-block;
	color: #7695B7;
	font-weight: bold;
	width: 2rem;
	height: 2rem;
	border: 1px solid #7695B7;
	border-radius: 1rem;
}
div.num:hover{
	cursor: pointer;
	background-color: #7695B7;
}
a.num:hover{
	color: white;
}

a.num {
	text-decoration: none;
	display: inline-block;
	padding: 5px;
	color: #7695B7;
}
b.num{
	text-decoration: none;
	display: inline-block;
	padding: 5px;
	color: white;
}

b.num:hover{
	color: white;
}

div.bnum {
	text-decoration: none;
	background-color: #7695B7;
	display: inline-block;
	font-weight: bold;
	width: 2rem;
	height: 2rem;
	border: 1px solid #7695B7;
	border-radius: 1rem;
}

@media screen and (max-width: 415px) {
	body { width: 415px; }
	.usercont { width: 85%; }
	.pag { margin-bottom: 30px; }
	.td1 { padding: 0; }
.th1 {padding: 5px; } 
.userDetailbtn, .userExitbtn { padding: 2px 10px; width:50px; height:25px; }
}

</style>
<script>
	var a;
	function deleteConf(a) {
		if (confirm("정말 탈퇴하시겠습니까?")) {
			location.href = "adminexitUser.do?user_id=" + a;
			alert("탈퇴되었습니다.");
			console.log(a);
		} else {
			alert("취소되었습니다");
		}
	}
</script>
</head>
<body>
	<div class="container usercont">
		<div class="user-title-section">
			<h2>회원 목록</h2>
			<div class="aul-search">
				<form class="allform" action="adminUserList.do" method="post">
					<select class="form-control shear" id="sel1" name="searchCondition"
						style="display: inline-block !important; margin-right: 10px;">
						<option value="${conditionMap['ID']}">ID</option>
						<option value="${conditionMap['이름']}">이름</option>
					</select> <input type="text" class="shear" name="searchKeyword"
						placeholder="이름, 아이디로 검색"><input type="submit" id="shrbtn"
						value="검색">
				</form>
			</div>
		</div>
		<div id="userListTb" class="aul-list">
			<table class="user-list-table">
				<tr>
					<th class="th1">회원번호</th>
					<th class="th1">아이디</th>
					<th class="th1">이름</th>
					<th class="th1">상세</th>
					<th class="th1">탈퇴</th>
				</tr>
				<c:choose>
					<c:when test="${adminUserList ne null }">
						<c:forEach var="user" items="${adminUserList}">
							<tr>
								<td class="td1">${user.user_num}</td>
								<td class="td1">${user.user_id}</td>
								<td class="td1">${user.user_name}</td>
								<td class="td1"><button class="userDetailbtn" type="button"
										onclick="location.href='adminUserInfo.do?user_id=${user.user_id}'">상세</button>
								<c:choose>
									<c:when test="${user.user_exit eq 'Y'}">
										<td class="td1">탈퇴</button></td>
									</c:when>
									<c:otherwise>
										<td class="td1"><button class="userExitbtn" type="button" onclick="deleteConf('${user.user_id}');">탈퇴</button></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="4">회원 목록이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
		</div>
		<br>
		<br>
		<div id="pageList" class="aul-paging">
			<div style="display: block; text-align: center;" class="pag">
				<c:if test="${paging.startPage >  1 }">
					<a
						href="/adminUserList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}"
						class="atg">&lt;</a>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
					var="userp">
					<c:choose>
						<c:when test="${userp == paging.nowPage }">
							<div class="bnum"><b class="num">${userp }</b></div>
						</c:when>
						<c:when test="${userp != paging.nowPage }">
							<div class="num">
								<a href="/adminUserList.do?nowPage=${userp }&cntPerPage=${paging.cntPerPage}" class="num">${userp }</a>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
				<c:if test="${paging.endPage != paging.lastPage }">
					<a href="/adminUserList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" class="atg">&gt;</a>
				</c:if>
			</div>
		</div>

	</div>

</body>
</html>