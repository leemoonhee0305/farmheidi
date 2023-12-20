<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체험 일정 안내</title>
<style>
body {
	margin : 0;
}

td {
	font-family: "돋움";
	font-size: 9pt;
	color: #595959;
}

th {
	font-family: "돋움";
	font-size: 9pt;
	color: #000000;
}

.divDotText {
	overflow: hidden;
	text-overflow: ellipsis;
}



.day {
	width: 100px;
	height: 30px;
	font-weight: bold;
	font-size: 15px;
	font-weight: bold;
	text-align: center;
}

.sat {
	color: #529dbc;
}

.sun {
	color: red;
}

.today_button_div {
	float: right;
}

.today_button {
	width: 100px;
	height: 30px;
}

.calendar {
/* 	width: 80%; */
	margin: auto;
}

.navigation {
	margin : 30px 0;
	text-align: center;
	font-size: 25px;
	vertical-align: middle;
}

.calendar_body {
	width: 100%;
	background-color: #FFFFFF;
	border: 1px solid white;
	margin-bottom: 50px;
	border-collapse: collapse;
}

.today{
	border: 1px solid white;
	height: 120px;
	background-color: #001087;
	text-align: left;
	vertical-align: top;
}

.calendar_body  {
	border: 1px solid white;
	height: 120px;
	background-color: #c9c9c9;
	text-align: left;
	vertical-align: top;
}

.calendar_body .date {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .breakDate {
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
	color: white;
}

.calendar_body .sat_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sat_day .sat {
	color: #529dbc;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .sun_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	text-align: left;
	vertical-align: top;
}

.calendar_body .sun_day .sun {
	color: red;
	font-weight: bold;
	font-size: 15px;
	padding-left: 3px;
	padding-top: 3px;
}

.calendar_body .normal_day {
	border: 1px solid white;
	height: 120px;
	background-color: #EFEFEF;
	vertical-align: top;
	text-align: left;
}

.before_after_month {
	margin: 10px;
	font-weight: bold;
}

.before_after_year {
	font-weight: bold;
}

.this_month {
	margin: 10px;
}

div#content2 {
	background-color: white;
}

a#content2 {
	color: gray;
}

a.before_after_month:hover {
	text-decoration: none;
	color: #007bff;
}

.breakDay:has(div.breakDate){
	background-color: lightgray;
	border: 1px solid white;
	vertical-align: top;
}

td.breakDay{
	background-color : #EFEFEF;
	border : 1px solid white;
	border-collapse : collapse;
}

.fontR{
	color : red;
}

div.center{
	text-align : center;
}

h4.top{
	text-align : center;
/* 	border-bottom : 1px solid gray; */
	width : 40%;
	margin : 0 auto;
	margin-bottom : 60px;
}

div.info-box{
	width : 80%;
	margin : 0 auto;
	margin-bottom : 40px;
}

p.mini-category{
	padding-bottom : 15px;
	margin-bottom : 0;
	font-size : 1.3rem;
	color : #001087;
	border-bottom : 1px dotted gray;
}



@media screen and (max-width : 968px){
	.calendar_body .sun_day{
		height : 60px;
	}
	
	.calendar_body .breakDay{
		height : 60px;
	}
	
	.calendar_body .sat_day{
		height : 60px;
	}
	
	.calendar_body .normal_day{
		height : 60px;
	}
	.today{
		height : 60px;
	}
	h4.top{
		width : 100%; 
	} 
	
	ul.diary-info{
		padding-left : 0;
	}
}


</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<%@ include file="playMenu.jsp"%>

<div class="container info-box">
		<h4 class="top" ><svg xmlns="http://www.w3.org/2000/svg" width="1.5rem" height="1.5rem" fill="currentColor" class="bi bi-calendar" viewBox="0 0 16 16">
  <path d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5M1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4z"/>
</svg><b>&nbsp;체험 일정 및 휴무</b></h4>

<div class="calendar">

			<!--날짜 네비게이션  -->
			<div class="navigation">
				<%-- 		<a class="before_after_year" href="/playSchedule.do?year=${today_info.search_year-1}&month=${today_info.search_month-1}"> --%>
				<!-- 			&lt;&lt; -->
				<!-- 이전해 -->
				<!-- 		</a>  -->
				 <!-- 이전달 -->
				<c:if test="${count.clickCount>0 }">
				<a class="before_after_month" href="/playSchedule.do?year=${today_info.before_year}&month=${today_info.before_month}&clickCount=${count.clickCount-1}">
					&lt;
				</a>
				</c:if>
				<span class="this_month"> &nbsp;${today_info.search_year}. 
				<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span> 
				<c:if test="${count.clickCount<2 }"> 
				<!-- 다음달 -->
				<a class="before_after_month" href="/playSchedule.do?year=${today_info.after_year}&month=${today_info.after_month}&clickCount=${count.clickCount+1}">
					 &gt;
				</a>
				</c:if>
					
				<!-- 다음해 -->
<%-- 				<a class="before_after_year" href="/playSchedule.do?year=${today_info.search_year+1}&month=${today_info.search_month-1}"> --%>
				<!-- 			&gt;&gt; -->
				<!-- 		</a> -->
			</div>

			<table class="calendar_body">

				<thead>
					<tr bgcolor="#CECECE">
						<td class="day sun">일</td>
						<td class="day">월</td>
						<td class="day">화</td>
						<td class="day">수</td>
						<td class="day">목</td>
						<td class="day">금</td>
						<td class="day sat">토</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<c:forEach var="dateList" items="${dateList}" varStatus="date_status">

							<c:forEach var="holiday" items="${holiday }">
								<c:choose>
									<c:when test="${holiday.holiday_day eq dateList.date }">
										<c:set target="${dateList}" property="value" value="holiday" />
									</c:when>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${date_status.index%7==0}">
									</tr>
									<tr>
										<td class="sun_day">
											<div class="sun">${dateList.date}</div>
											<c:choose>
												<c:when test="${dateList.date != ''}">
													<div class="center"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05"/>
</svg></div>
												</c:when>
											</c:choose>
										</td>
								</c:when>
										<c:when test="${dateList.value eq 'holiday' }">
											<td class="sun_day">
												<div class="sun">${dateList.date}</div>
												<c:choose>
													<c:when test="${dateList.date != ''}">
														<div class="center"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05"/>
</svg>
														</div>
													</c:when>
												</c:choose>
											</td>	
										</c:when>
								<c:when test="${date_status.index%7==1 && dateList.value=='today'}">
									<td class="today">
											<c:choose>
												<c:when test="${dateList.date != ''}">
													<div class="breakDate">${dateList.date}</div>
													<div class="center"><b class="fontR"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-ban" viewBox="0 0 16 16">
  <path d="M15 8a6.973 6.973 0 0 0-1.71-4.584l-9.874 9.875A7 7 0 0 0 15 8M2.71 12.584l9.874-9.875a7 7 0 0 0-9.874 9.874ZM16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0"/>
</svg></b></div>
												</c:when>
											</c:choose>
										</td>
								</c:when>
								<c:when test="${date_status.index%7==2 && dateList.value=='today'}">
									<td class="today">
											<c:choose>
												<c:when test="${dateList.date != ''}">
													<div class="breakDate">${dateList.date}</div>
													<div class="center"><b class="fontR"></b></div>
												</c:when>
											</c:choose>
										</td>
								</c:when>
								<c:when test="${dateList.value=='today'}">
									<td class="today">
										<div class="date">${dateList.date}</div>
										<div class="center"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05"/>
</svg></div>
									</td>
								</c:when>
								<c:when test="${date_status.index%7==1 || date_status.index%7==2}">
										<td class="breakDay">
											<c:choose>
												<c:when test="${dateList.date != ''}">
													<div class="breakDate">${dateList.date}</div>
													<div class="center"><b class="fontR"></b></div>
												</c:when>
											</c:choose>
										</td>
								</c:when>
								<c:when test="${date_status.index%7==6}">
									<td class="sat_day">
										<div class="sat">${dateList.date}</div>
										<c:choose>
											<c:when test="${dateList.date != ''}">
												<div class="center"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05"/>
</svg></div>
											</c:when>
										</c:choose>
									</td>
								</c:when>
								<c:otherwise>
									<td class="normal_day">
										<div class="date">${dateList.date}</div>
										<c:if test="${dateList.date != '' }">
										<div class="center"><svg xmlns="http://www.w3.org/2000/svg" width="1.75rem" height="1.75rem" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05"/>
</svg></div></c:if>
									</td>
								</c:otherwise>
							</c:choose>
						</c:forEach>
				</tbody>
			</table>
		</div>
		

<ul class="diary-info">
	<li><svg xmlns="http://www.w3.org/2000/svg" width="1rem" height="1rem" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
  <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 	0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05"/>
</svg> 해당 표시가 되어있는 날짜만 이용 가능합니다.</li>
<li> 하이디 농장의 정규 휴일은 <b class="fontR">월, 화요일</b>입니다.</li>
<li> 정규 휴일이여도 <b class="fontR"></b>국정 공휴일은 체험 이용이 가능합니다.</li>
</ul>
		</div>
	<%@ include file="/footer.jsp" %>
</body>
</html>