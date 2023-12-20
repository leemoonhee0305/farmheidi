<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.spring.farm.util.PagingVO" %>
<%
	PagingVO pageInfo = (PagingVO)request.getAttribute("paging");
	int totalCount=pageInfo.getTotal(); //전체(검색) 목록 수
	int nowPage=pageInfo.getNowPage(); //현재페이지 수
	int maxPage=pageInfo.getLastPage(); //최대 페이지 수
	int startPage=pageInfo.getStartPage(); //시작페이지 수
	int endPage=pageInfo.getEndPage(); //마지막페이지 수
%>
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
<title>하이디 - 관리자</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>


	<style>
		* { border-box: border-box; }
		
	   div.container {
	   		margin:38px;
	   }
	   
	   div.resv-title {
	      text-align: center;
	   }
	   div.resv-title>h2 {
	      margin:10px 10px;
	      text-align: center;
	      font-family: 'SBAggroB';
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
	   div#resv-search>form>span>input[name="searchKeyword"] {
			height:24px;
			padding-left:8px; padding-right:12px;
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
	   div.resv-list>table>tbody>.status-n:hover { /*.status-n:hover , tr:hover*/
		  background-color: #e0F8FF;
	   }
	   div.resv-list>table>tbody>tr>th,td {
	      border: 0px solid #cdcdcd;
	      padding: 13px 13px;
	   }
	   div.resv-list>table>tbody>tr>td>a {
	      text-decoration: none;
	   }

		/* 페이지 버튼 스타일 start */
		section#ResvPage {
			margin-top: 20px;
			text-align: center;
		}
		section.ResvPage>button {
			margin:0 0 5px 5px;
			background-color: #26588d;
			color: #e0ffff;
			border: 1px solid #26588d;
			cursor: pointer;
		}
		section.ResvPage>button:hover {
			background: #00a9ff;
			color: white;
			border: none;
		}
		section.ResvPage>button:active {
			background: lightgray;
			color: white;
			border: none;
		}
		section#ResvPage>button.prevbtn {
			width:2rem; height:2rem;
			/*border:1px solid #888;
			border-radius:0.2rem;*/
			border: none;
			background: none;
			color: black;
		}
		section#ResvPage>button.listbtn {
			width:2rem; height:2rem;
			border:1px solid #888;
			border-radius:1rem;
		}
		section#ResvPage>button.viewbtn {
			background-color: white; /*#00a9ff*/
			color: #26588d;
			border: 1px solid #26588d;
			font-weight: bold;
		}
		section#ResvPage>button.nextbtn {
			width:2rem; height:2rem;
			/*border:1px solid #888;
			border-radius:0.2rem;*/
			border: none;
			background: none;
			color: black;
		}
		section#ResvPage>button.notlinkbtn {
			cursor: default;
		}
		section.ResvPage>button.notlinkbtn:active {
			background: #00a9ff;
			color: white;
			border: none;
		}
		/* 페이지 버튼 스타일 end. */		
	</style>

	<style>
	/* desktop */
	/* @media only screen and (min-width: 979px) { */
	
	       /* 예약현황 목록 테이블의 th(td) 1[예약번호],3[예약자ID],5[예약금액]번째 컬럼(칸) */
		   div.resv-list>table>tbody>tr>th:first-child, div.resv-list>table>tbody>tr>th:nth-child(3), div.resv-list>table>tbody>tr>th:nth-child(5) {
		      display: ;
		   }
		   div.resv-list>table>tbody>tr>td:first-child, div.resv-list>table>tbody>tr>td:nth-child(3), div.resv-list>table>tbody>tr>td:nth-child(5) {
		      display: ;
		   }
		   div.resv-wrap {
		   	  font-size: ;
		   }
	/* } */
	
	/* mobile .. */
	@media only screen and (max-width: 978px) {
	
	       /* 예약현황 목록 테이블의 th(td) 1[예약번호],3[예약자ID],5[예약금액]번째 컬럼(칸) */
		   div.resv-list>table>tbody>tr>th:first-child, div.resv-list>table>tbody>tr>th:nth-child(3), div.resv-list>table>tbody>tr>th:nth-child(5) {
		      display: none;
		   }
		   div.resv-list>table>tbody>tr>td:first-child, div.resv-list>table>tbody>tr>td:nth-child(3), div.resv-list>table>tbody>tr>td:nth-child(5) {
		      display: none;
		   }
		   div.resv-wrap {
		   	  font-size: ;
		   }
	
			/* 페이지 버튼 스타일 start */
			section#ResvPage>button.prevbtn {
				width:1.6rem; height:1.6rem;
			}
			section#ResvPage>button.listbtn {
				width:1.6rem; height:1.6rem;
				border-radius:0.8rem;
			}
			section#ResvPage>button.nextbtn {
				width:1.6rem; height:1.6rem;
			}
			/* 페이지 버튼 스타일 end. */	   
	}
	
	/* mobile .. */
	@media only screen and (max-width: 500px) {
		   div.resv-wrap {
		   	  font-size: 0.77rem;
		   }
	}
	</style>


	<script>
	//페이징 처리 함수
	function resvPageList(page, keyword) {
		//alert("keyword :: "+keyword);
		if( (keyword != null) && (keyword != "null") ) {
			document.location.href="/adminResvList.do?page="+page+"&searchKeyword="+keyword;
		} else {
			document.location.href="/adminResvList.do?page="+page;
		}
		return;
	}
	</script>

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
			//관리자는 예약당일도 취소가능하도록 메시지, 조건 사용 안함..
			//alert("예약취소는 예약당일의 전날(예약일 하루전)까지만 할 수 있습니다.");
			//return false;
		} else {
			//alert("아래 if(confirm){} 메시지 창에서 '확인' 클릭시 예약취소시킴.");
		}
	
		var result = confirm("예약을 취소하시겠습니까?")
		if(result) {
			//alert("예약취소 가능 : 확인(true) ");
			document.location.href = "/adminResvCancel.do?num="+num+"&date="+date; //취소 페이지 실행
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

<div class="header">
<%@ include file="adminMenu.jsp" %>
</div>


<div class="container">
	<div class="resv-wrap">
   
		<div class="resv-title">
			<h2>예약 전체 현황</h2>
		</div>
		
		<div id="resv-search" class="resv-search">
			<form name="resvForm" class="resvForm" method="post" action="/adminResvList.do">
				<span>
					<input type="text" name="searchKeyword" value="${searchKeyword}" placeholder=" 이름 또는 아이디 검색 ">
					<button type="submit">검색</button>
				</span>
			</form>
		</div>
		<div class="resv-count">
			<span>총 : <strong><fmt:formatNumber value="${total}" pattern="#,###"/></strong> 건</span>
		</div>
			
		<c:if test="${total == null or total < 1 }">
			<div class="resv-list">
				<table class="resv-table">
				<tbody>
					<tr>
						<th class="">예약번호</th>
						<th>이름</th>
						<th class="">아이디</th>
						<th>예약일</th>
						<th class="">예약금액</th>
						<th>성인</th>
						<th>아동</th>
						<th>상태</th>
					</tr>
				</tbody>
				</table>
			</div>
		</c:if>
		
		<c:if test="${total != null and total > 0 }">
			<div class="resv-list">
				<table class="resv-table">
				<tbody>
					<tr>
						<th class="">예약번호</th>
						<th>이름</th>
						<th class="">아이디</th>
						<th>예약일</th>
						<th class="">예약금액</th>
						<th>성인</th>
						<th>아동</th>
						<th>상태</th>
					</tr>
				<c:if test="${resvList != null }">
					<c:forEach items="${resvList}" var="resv">
						<c:choose>
							<c:when test="${resv.resv_status eq 'n'}">
					<tr class="status-n">
							</c:when>
							<c:otherwise>
					<tr class="status-y">
							</c:otherwise>
						</c:choose>
						<td>${resv.resv_num}</td>
						<td>${resv.resv_name}</td>
						<td>${resv.resv_userId}</td>
						<td>${resv.resv_date}</td>
						<td><fmt:formatNumber value="${resv.resv_totalprice}" pattern="#,###"/></td>
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
				</c:if>
				</tbody>
				</table>
			</div>
		</c:if>


		<section id="ResvPage" class="ResvPage">
			<% if(nowPage<=1){ %>
				<button type="button" class="prevbtn notlinkbtn">&lt;</button>
			<%}else{ %>
				<button type="button" class="prevbtn" title="prev" onclick="resvPageList('<%=nowPage-1 %>','${searchKeyword}')">&lt;</button>
			<%} %>
			
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
						<button type="button" class="listbtn viewbtn notlinkbtn"><%=a%></button>
					<%}else{ %>
						<button type="button" class="listbtn" onclick="resvPageList('<%=a %>','${searchKeyword}')"><%=a%></button>
					<%} %>
			<%} %>
				
			<%if(nowPage>=maxPage){ %>
				<button type="button" class="nextbtn notlinkbtn">&gt;</button>
			<%}else{ %>
				<button type="button" class="nextbtn" title="next" onclick="resvPageList('<%=nowPage+1 %>','${searchKeyword}')">&gt;</button>
			<%} %>
		</section>

	</div>
</div>


</body>
</html>
