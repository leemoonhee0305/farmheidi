<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminMenu.css">
  	<script src="${pageContext.request.contextPath}/resources/js/adminMenu.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--   	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css"> -->
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
</head>
<body>
 <nav class="navbarAdminMENU">
        <div class="navbar-logoAdminMENU">
        <a class="navbar-brandAdminMENU" href="/main.jsp"> <img id="logo" src="resources/img/mainlogo2.png">
        </a>
    </div>
        <ul class="navbar-menuAdminMENU">
            <li class="nav-itemAdminMENU dropdownAdminMENU experiAdminMENU" id="resvAdmin">
            <a class="nav-linkAdminMENU dropdown-toggleAdminMENU" href="#" id="navbardrop" data-toggle="dropdown"> 체험 예약 관리 </a>
                <div class="dropdown-menuAdminMENU dropdown-contentAdminMENU">
                    <a class="dropdown-itemAdminMENU spenaAdminMENU" href="/adminResvList.do">예약 전체 현황</a> 
                    <a class="dropdown-itemAdminMENU spenaAdminMENU" href="/adminAddPlay.do">체험 상품 등록</a>
                </div></li>
            <li class="nav-itemAdminMENU dropdownAdminMENU" id="productAdmin">
            <a class="nav-linkAdminMENU dropdown-toggleAdminMENU" href="#" id="navbardrop" data-toggle="dropdown"> 상품 판매 관리 </a>
                <div class="dropdown-menuAdminMENU dropdown-contentAdminMENU">
                    <a class="dropdown-itemAdminMENU spenaAdminMENU" href="/getAllOrder.do">주문 배송 현황</a> 
                    <a class="dropdown-itemAdminMENU spenaAdminMENU" href="/adminProduct.do">상품 관리 현황</a>
                </div></li>
            <li class="nav-itemAdminMENU dropdownAdminMENU"  href="#" id="userAdmin">
            <a class="nav-linkAdminMENU dropdown-toggleAdminMENU"  href="#" id="navbardrop" data-toggle="dropdown"> 회원 관리 </a>
                <div class="dropdown-menuAdminMENU dropdown-contentAdminMENU">
                    <a class="dropdown-itemAdminMENU" id="spena1" href="adminUserList.do">회원 목록</a>
                </div></li>
            <li class="nav-itemAdminMENU dropdownAdminMENU"  id="commuAdmin">
            <a class="nav-linkAdminMENU dropdown-toggleAdminMENU" href="#" id="navbardrop" data-toggle="dropdown"> 게시판 관리 </a>
                <div class="dropdown-menuAdminMENU dropdown-contentAdminMENU">
                    <a class="dropdown-itemAdminMENU spena2AdminMENU" href="/adminNoticeList.do">공지사항</a>
                    <a class="dropdown-itemAdminMENU spena2AdminMENU" href="/adminQnaList.do">Q&A</a> 
                    <a class="dropdown-itemAdminMENU spena2AdminMENU" href="/adminReview.do">Review</a>
                    <a class="dropdown-itemAdminMENU" id="spena2" href="/adminReportList.do">신고게시판</a>                    
                </div></li>
        </ul>

          <a class="navbar-toggleBtnAdminMENU">
         <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="biAdminMENUAdminMENU bi-justifyAdminMENU" viewBox="0 0 16 16">
  <path fill-rule="evenodd" d="M2 12.5a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5zm0-3a.5.5 0 0 1 .5-.5h11a.5.5 0 0 1 0 1h-11a.5.5 0 0 1-.5-.5z"/>
</svg>
        </a>
         <button type="button" class="btnAdminMENU navbtnAdminMENU" id="navbtn" style="float: right;">
	         <a href="logout.do">로그아웃</a>
	  </button>
        
    </nav>	
</body>
</html>
