<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
String userId = session.getAttribute("user_id") != null ? session.getAttribute("user_id").toString() : "";
%>
<div class="top">
	
	<div id="active-box">
	<div class="logo-box">
		<a class="navbar-brand" href="/main.jsp"> 
		<img class="logo" src="${pageContext.request.contextPath }/resources/img/mainlogo.png">
		</a>
	</div>	
	<a class="hamberger" href="#" onclick="toggleBox()"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
</svg></a>
	</div>

	<nav id="stNav" class="navbar navbar-expand-sm">
		<div id="logo-box">
		<a class="navbar-brand" href="/main.jsp"> 
		<img id="logo" src="resources/img/mainlogo.png">
		</a>
		</div>
		<ul class="navbar-nav nav-topCenter">
			<li class="nav-item nav-firstItem">
				<a class="nav-link" style="font-family:'SUITE-Regular';" href="/introduce.jsp" id="navbardrop">소개글</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" style="font-family:'SUITE-Regular';" href="/playMain.do" id="navbardrop">체험소개</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" style="font-family:'SUITE-Regular';" href="/resvMain.do">체험예약</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" style="font-family:'SUITE-Regular';" href="/productList.do">상품</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" style="font-family:'SUITE-Regular';" href="/getNoticeList.do" id="navbardrop"> 커뮤니티 </a>
			</li>
		</ul>

		<c:choose>
			<c:when test='${user_id ne NULL}'>
				<c:choose>
				<c:when test='${user_id eq "farmadmin" }'>
					<ul class="navbar-nav nav-right nav-admin">
				</c:when>
				<c:otherwise>
					<ul class="navbar-nav nav-right nav-user">
				</c:otherwise>
				</c:choose>
					<c:choose>
						<c:when test='${user_name ne null}'>
						<li class="nav-item">
							<a class="nav-link">${user_name}님</a>
						</li>
						</c:when>
						<c:otherwise>
								<li class="nav-item">
						<c:choose>
							<c:when test='${user_id eq "farmadmin" }'>
									<a class="nav-link">관리자님</a>
							</c:when>
							<c:otherwise>
									<a class="nav-link">${user_id}님</a>
							</c:otherwise>
						</c:choose>
								</li>
						</c:otherwise>
					</c:choose>
					<c:choose>
							<c:when test='${ user_id eq "farmadmin" }'>
							<li class="nav-item">
								<a class="nav-link center-item" href="/adminMain.do"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill-gear" viewBox="0 0 16 16">
  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z"/>
</svg></a>
							</li>	
							</c:when>
							<c:otherwise>
							<li class="nav-item center-item">
								<a class="nav-link" href="mypage.do?user_id=${user_id}"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-fill" viewBox="0 0 16 16">
  <path d="M3 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H3Zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6Z"/>
</svg></a>
							</li>
							</c:otherwise>
					</c:choose>
					<c:if test='${ user_id ne "farmadmin" }'>
					<li class="nav-item">
					<a class="nav-link" href="/inMyCart.do"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
</svg></a>
					</li>
					</c:if>
					<li class="nav-item nav-lastItem">
					<a class="nav-link" href="/logout.do">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0v2z"/>
  <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
</svg>
					</a>
					</li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="navbar-nav nav-right">
					<li class="nav-item">
						<a class="nav-link" href="/inMyCart.do"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-cart4" viewBox="0 0 16 16">
  <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l.5 2H5V5H3.14zM6 5v2h2V5H6zm3 0v2h2V5H9zm3 0v2h1.36l.5-2H12zm1.11 3H12v2h.61l.5-2zM11 8H9v2h2V8zM8 8H6v2h2V8zM5 8H3.89l.5 2H5V8zm0 5a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
</svg></a>
					</li>
					<li class="nav-item">
					<a class="nav-link" href="login.do"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
  <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
</svg></a>
					</li>
				</ul>
			</c:otherwise>
		</c:choose>
	</nav>
	<a class="hamberger" href="#" onclick="toggleBox()">
		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
</svg>
</a>
<div id="box">
<div class="row">
		<div id="content1" class="col"><a id="content1" class="nav-link item-bottom" style="font-family:'SUITE-Regular';" href="getNoticeList.do">공지사항</a></div>
		<div id="content2" class="col"><a id="content2" class="nav-link item-bottom" style="font-family:'SUITE-Regular';" href="getQNAList.do">질의응답</a></div>
		<div id="content3" class="col"><a id="content3" class="nav-link item-bottom" style="font-family:'SUITE-Regular';" href="getReviewList.do">이용후기</a></div>
	</div>
</div>
	
</div>
<br>
<br>