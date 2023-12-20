<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.LocalDate" %>
<%
LocalDate locDate = LocalDate.now();
String strDate = locDate.toString();
String cYear = strDate.split("-")[0]; //현재 연도
String cMonth = strDate.split("-")[1]; //현재 월
int cY = Integer.parseInt(cYear);
int cM = Integer.parseInt(cMonth);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험 내역 확인</title>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<%@ include file="/header.jsp" %>

	<style>
		* { border-box: border-box; }
		
	   div.container {
	   		margin-bottom:100px;
	   }
	   
	   div.resv-title {
	      text-align: center;
	   }
	   div.resv-title>h4 {
	      margin:10px 10px;
	      text-align: center;
	      font-weight: bold;
	   }
	   div#resv-search,div#resv-search>form {
			text-align: right;
	   }
	   div#resv-search>form>span {
			display: inline-block;
			border: 0px solid gray;
			padding: 0;
			vertical-align:middle;
	   }
	   div#resv-search>form>span>select {
			height:29px;
			padding-left:8px; padding-right:8px;
			vertical-align:middle;
			border: 1px solid #26588d;
			border-radius: 3px;
			outline-color: #1e90ff;
	   }
	   div#resv-search>form>span>button[type="submit"] {
			height:29px;
			padding-left:15px; padding-right:15px;
			vertical-align:middle;
			background-color: #26588d;
			color: #e0ffff;
			border: 1px solid #26588d;
			border-radius: 3px;
			cursor: pointer;
	   }
	   div#resv-search>form>span>button[type="submit"]:hover {
			background: #00a9ff;
			color: white;
	   }
	   div#resv-search>form>span>button[type="submit"]:active {
			background: lightgray;
			color: white;
	   }
	   div.resv-count {
	      margin-top: 2px;	   
		  text-align: left;
	   }
	   div.resv-list {
	      margin-top: 5px;
	   }
	   div.resv-list>p {
	      padding: 100px;
	      text-align: center;
	   }
	   div.resv-list>table {
	      width: 100%;
	      text-align: center;
	      border-collapse: collapse;
	      border-top: 1px solid gray;
	      border-bottom: 1px solid gray;
	   }
	   div.resv-list>table>tbody>tr:first-child {
		  border-bottom: 1px solid #bababa;
		  background-color: #F0F8FF;
	   }
	   div.resv-list>table>tbody>tr.status-y {
		  background-color: #efefef;
		  color: #777;
	   }
	   div.resv-list>table>tbody>tr:not(tr#not-hover):hover {
		  background-color: #e0F8FF;
	   }
	   

	   div.resv-list>table>tbody>tr>th,td {
	      border: 0px solid #cdcdcd;
	      padding: 13px 13px;
	   }
	   div.resv-list>table>tbody>tr>td>a {
	      text-decoration: none;
	   }
	   
	   @media screen and (max-width : 576px){
	   		.second-del{
	   			display : none;
	   		}
	   		th, td{
	   			padding : 4px 1px!important;
	   		}
	   }
	   
	   @media screen and (max-width : 968px){
	   		.first-del{
	   			display : none;
	   		}
	   		
	   }
	</style>


	<script>
	//예약취소 함수
	function resvCancel(num, date) {
		//alert(" 취소 할 번호 : "+num+" , 예약날짜 : "+date);
	
		var resvDateArr = new Array();
			resvDateArr = date.split("-"); //예약일(연도-월-일) : 구분자(-)로 분리..
		  
		var now = new Date();
		var year = now.getFullYear(); //연도
		var month = now.getMonth()+1; //월
		var day = now.getDate(); //일
		  
		var stDate = new Date(resvDateArr[0], resvDateArr[1], resvDateArr[2]); //예약일 날짜 설정
		var endDate = new Date(year, month, day); //오늘 날짜 설정
		  
		var btMs = endDate.getTime() - stDate.getTime(); //날짜 일수 시간 계산
		var btDay = btMs / (1000*60*60*24);
		  
		//console.log("오늘 날짜와 예약일과의 일수 차이는 : " + btDay);
		//alert("오늘 날짜와 예약일과의 일수 차이는 : " + btDay);
		
		if(btDay >= 0) {
			alert("예약취소는 예약당일의 전날(예약일 하루전)까지만 할 수 있습니다.");
			return false;
		} else {
			//alert("아래 if(confirm){} 메시지 창에서 확인 클릭시 예약취소시킴.");
		}
	
		var result = confirm("예약을 취소하시겠습니까?")
		if(result) {
			//alert("예약취소 가능 : 확인(true) ");
			document.location.href = "resvCancel.do?num="+num+"&date="+date; //취소 페이지 실행
			return false;
		} else {
			//alert("예약취소 불가능 : 취소(false) ");		
			return false;
		}
		
		return false;
	}
	</script>
</head>

<body>
<div>
<%@ include file="resvMenu.jsp" %>
</div>


<div class="container">
   <div class="resv-wrap">
   
      <div class="resv-title">
         <h4>체험 예약 내역</h4>
      </div>

         <c:if test="${user_id eq NULL}">
         <div class="resv-list">
            <p>체험 상품 예약 내역이 없습니다.</p>
         </div>         
         </c:if>

         <c:if test="${user_id ne NULL}">
            <div id="resv-search" class="resv-search">
            <form name="resvForm" method="post" action="/resvCheck.do">
               <span>
	               <select name="searchYear">
	                  <option value="0">연도 선택</option>
	               <% for(int i=(cY+1); i>=(cY-3); i--) { %>
	                  <option value="<%=i%>" <%if( (request.getParameter("searchYear")!=null) && (Integer.parseInt(request.getParameter("searchYear"))==i) ){%>selected<%}%>><%=i%> 년</option>
	               <% } %>
	               </select>
	               <select name="searchMonth">
	                  <option value="0">월 선택</option>               
	               <% for(int i=1; i<=12; i++) { %>
	                  <option value="<%=i%>" <%if( (request.getParameter("searchMonth")!=null) && (Integer.parseInt(request.getParameter("searchMonth"))==i) ){%>selected<%}%>><%=i%> 월</option>
	               <% } %>
	               </select>
	               <button type="submit"> 검색 </button>
               </span>
            </form>
            </div>
			<div class="resv-count">
				<span>총 : <strong><fmt:formatNumber value="${total}" pattern="#,###"/></strong> 건</span>
			</div>
            
         <div class="resv-list">
            <table class="resv-table">
            <tbody>
               <tr id="not-hover">
                  <th class="first-del">예약번호</th>
                  <th>예약자명</th>                  
                  <th>예약날짜</th>
                  <th class="second-del">예약금액</th>
                  <th>성인인원</th>
                  <th>청소년인원</th>
                  <th>예약상태</th>
               </tr>

            <c:forEach items="${resvList}" var="resv">
					<c:choose>
						<c:when test="${resv.resv_status eq 'n'}">
				<tr class="status-n">
						</c:when>
						<c:otherwise>
				<tr class="status-y">
						</c:otherwise>
					</c:choose>            
                  <td class="first-del">${resv.resv_num}</td>
                  <td>${resv.resv_name}</td>
                  <td>${resv.resv_date}</td>
                  <td class="second-del"><fmt:formatNumber value="${resv.resv_totalprice}" pattern="#,###"/></td>
                  <td>${resv.resv_headcount}</td>
                  <td>${resv.resv_youthheadcount}</td>
                  <td>
                     <c:choose>
                        <c:when test="${resv.resv_status eq 'n'}">
                           <a href="javascript:;" onclick="return resvCancel('${resv.resv_num}', '${resv.resv_date}')">예약취소</a>
                        </c:when>
                        <c:otherwise>
                           <span>취소완료</span>
                        </c:otherwise>
                     </c:choose>
                  </td>
               </tr>
            </c:forEach>
            </tbody>
            </table>
         </div>
         </c:if>
   </div>
</div>

<%@ include file="/footer.jsp" %>


</body>
</html>