<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.time.LocalDate"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../header.jsp"%>
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
<title>나의 예약 확인 </title>
<style>
.hh3{ text-align: center; font-family: 'SBAggroB'; }
.resv-wrap { padding: 0px 0 90px 0; font-weight: bold; }
div.resv-title {
	text-align: center;
	margin-bottom: 40px; 
}

div>h4 {
	text-align: center;
	margin-bottom: 1rem;
	font-weight: bold;
	}
div.resv-list {
	margin-top: 20px;
}

.resvlist2 {
	width: 75%;
    margin: 20px auto;
    padding: 30px 40px;
    background-color: none;
	border: 1px solid silver;
}
.bb { color: #007bff;}
div.resv-list>p {
	padding: 100px;
	text-align: center;
}

section.ResvPage {
	margin-top: 15px;
	text-align: center;
}

div.container {
	margin-bottom: 80px;
}
@media (max-width: 978px){
.resvlist2{width: 80%; }

}
@media (max-width: 600px ){
.resvlist2{width: 97%; }
}
</style>


<script>
	function resvCancel() {
		local.href = "";
			}	
		alert("취소되었습니다.");			
				}
		}
	$(fucntion(){
		$(".resvCanc").each(function(){
			var resvCanc = $(this).text().trim();
			if (resvCanc === '취소완료'){
				$(this).css({"color":"red"});
			}
		});
	});
</script>
</head>
<body>
	<div><%@ include file="mypageMenu.jsp"%></div>

	<div class="container">
		<div class="resv-wrap">
			<div class="resv-title">
				<h3 class="hh3">체험 예약 내역</h3>
			</div>

			<c:if test="${user_id eq NULL}">
				<div class="resv-list">
					<p>체험 상품 예약 내역이 없습니다.</p>
				</div>
			</c:if>

			<c:if test="${user_id ne NULL}">
				<div class="resv-list">
					<c:forEach items="${resvList}" var="resv">
						<div class="resvlist2">
						<h4>예약내역</h4>
							<div>상품명 : <c:choose>
								<c:when test="${resv.resv_pnum eq '1'}"><b class="bb">[패키지] 건초+우유+소+치즈+쿠킹 체험</b></c:when>
								<c:otherwise>${resv.resv_pnum}</c:otherwise></c:choose>
							</div>
							<div>예약자 : ${resv.resv_name}</div>
							<div>예약일 : ${resv.resv_date}</div>
							<div>금&nbsp;&nbsp;&nbsp;액 : <fmt:formatNumber value="${resv.resv_totalprice}" pattern="#,###"/> 원</div>
							<div>총인원 : 성인 ${resv.resv_headcount} 명 <b>|</b> 청소년 ${resv.resv_youthheadcount} 명</div>
							<div class="resvCanc">
								<c:choose>
									<c:when test="${resv.resv_status eq 'n'}">상&nbsp;&nbsp;&nbsp;태 : 예약완료 &nbsp;&nbsp;&nbsp;</c:when>
									<c:otherwise>
										<span class="resvCan">상&nbsp;&nbsp;&nbsp;태 : 취소완료</span>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:forEach>
				</div>

			</c:if>
		</div>
	</div>
	<%@ include file="/footer.jsp"%>
</body>
</html>