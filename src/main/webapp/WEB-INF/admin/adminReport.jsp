<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/admin/adminMenu.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminReport.css">
<meta charset="UTF-8">
<title>신고 상세보기</title>
<style>
</style>
</head>
<body>

	<h2 class="header">신고보기</h2>
<div class="reptDtdiv">
	<div class="container-fluid">
  		<form name="fm" method="post">
  		<input type="hidden" name="report_num" value="${report.report_num}">
  		<input type="hidden" name="qna_num" value="${report.qna_num}">
  		<input type="hidden" name="review_num" value="${report.review_num}">
    	
    	<div class="all">
      		<div class="spandiv">
        		<span class="input-group-text">제목</span>
      		</div>
      		<input type="text" class="form-control innm" name="report_title" value="${report.report_title}" style="background-color: white;" readonly>      
    	</div>
    	
    	<div class="all">
      		<div class="spandiv">
        		<span class="input-group-text">작성자</span>
      		</div>
      		<input type="text" class="form-control innm" name="report_id" value="${report.report_id}" readonly>      
    	</div>
    	
    	<div class="all">
					<div class="spandiv">
        		<span class="input-group-text">내용</span>
      		</div>
      		<textarea class="text" rows="10"  name="report_content" style="background-color: white; resize:none; " readonly>${report.report_content}</textarea>      
    	</div>  
    	<div class="all">
					<div class="spandiv">
        		<span class="input-group-text">등록일</span>
      		</div>
      	<input type="text" class="form-control innm" name="report_date" value="${report.report_date}" readonly>      
    	</div>
      	<div class="all">
					<div class="spandiv">
        		<span class="input-group-text">신고 내용</span>
      		</div>
      		<textarea class="text" rows="5" name="report_reason" style="background-color: white;" readonly>${report.report_reason}</textarea>      
    	</div>
    	

   
    	<div id="footer">
	  		<button type="button" class="btndelete" onclick="deleteReport()">원본 글 삭제</button>
<%-- 		  	<button type="button" class="btn btn-primary" onclick="QNAinsert('${user_id}')">신고 글 삭제</button> --%>
	  		<button type="button" class="btnreportlist" onclick="getReportList()">글목록</button>
		</div>
  		</form>  
	</div>
</div>
<script>
qna = "${report.qna_num}";
review = "${report.review_num}";
function deleteReport() {
    if (qna == null || qna == '' || qna == 'undefined' || qna == 0) {
    	alert("리뷰 게시판의 "+review+"번 글이 삭제되엇습니다");
    	location.href = "deleteReviewReport.do?review_num="+review;
    } else if(review == null || review == '' || review == 'undefined' || review == 0){
    	alert("qna 게시판의 "+qna+"번 글이 삭제되엇습니다");
        location.href = "deleteQNAReport.do?qna_num="+qna;
    }else{
		alert(qna);
		alert(review);
		alert("오류가 발생했습니다.");
    }
}
function getReportList(){
	location.href = "adminReportList.do";
	
}

</script>

</body>
</html>