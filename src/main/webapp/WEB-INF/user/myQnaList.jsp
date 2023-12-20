<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 질문 확인</title>
<style>
@font-face {font-family: 'EASTARJET-Medium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_231029@1.1/EASTARJET-Medium.woff2') format('woff2');
    font-weight: 500; font-style: normal; }
    
.qna-title {
	text-align: center;
	margin-bottom: 40px; 
}
.qnawrap { margin-bottom: 130px;  }
.hh3 {text-align: center; font-family: 'SBAggroB'; } 
table {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

.qlBox {
	width: 80%;
	margin: auto;
}

.hh4 { text-align: left; font-family: 'SUITE-Regular'; }

.qbox { border-top: 1px solid silver; padding: 10px 0; font-family: 'EASTARJET-Medium';}

.qrbox { border: none; padding: 10px 0; font-family: 'EASTARJET-Medium';}

.qnaList { margin: 20px auto; width: 75%; border: none; }

.qnaList2 { border: 1px solid silver; margin: 10px auto; padding: 15px 20px; border-radius: 10px; }
a.myqnaDe { color: black; text-decoration: none; }
a.myqnaDe:hover { color: #26588d; text-decoration: none; }
span.qchild {color:#007bff;}
@media only screen and (max-width: 600px) { .qnaList { width: 85%; } }
</style>

</head>
<body>
	<div><%@ include file="mypageMenu.jsp"%></div>
	<div class="container">
		<div class="qnawrap">
			<div class="qna-title">
				<h3 class="hh3">나의 질문 내역</h3>
			</div>

			<c:if test="${user_id ne NULL }">
				<div class="qnaList">
					<c:forEach var="qnaList" items="${myQnaList }">
						<div class="qnaList2">
							<h4 class="hh4"><a class="myqnaDe" href="getQNA.do?qna_num=${qnaList.qna_num}">&nbsp;${qnaList.qna_title}</a></h4>
							<div class="qbox"><b>&nbsp;질문내용:&nbsp;&nbsp;</b><span>${fn:substring(qnaList.qna_content, 0, 100)}${fn:substring('...', 0, fn:length(qnaList.qna_content) - 100)}</span></div>
							<div class="qrbox"><b>&nbsp;질문답변:&nbsp;</b> 
								<c:choose>
									<c:when test="${qnaList.qna_reply eq null}"><span class="qchild">답변대기</span></c:when>
									<c:otherwise><span class="qchild">${qnaList.qna_reply}</span></c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:if>
		</div>
	</div>
<script>
$(function() { 
	$(".qrbox").each(function(i,o) {
	    var qna_reply = $(this).children('.qchild').text();
	    if (qna_reply === '답변대기') {
	    	$(this).children('.qchild').css({"color": "gray"}); 
	    }
	  });
	});
</script>
	<%@ include file="/footer.jsp"%>
</body>
</html>