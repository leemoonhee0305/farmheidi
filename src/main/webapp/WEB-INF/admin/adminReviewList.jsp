<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="/WEB-INF/admin/adminMenu.jsp"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminReviewList.css">
<meta charset="UTF-8">
<title>리뷰 게시판</title>
</head>
<body>

		<h2 class="header">리뷰</h2>
	<div class="reviewdiv">
		<div class="container-fluid">
			<form action="updateReviewReply.do" method="POST">
				<input type="hidden" name="review_num" value="${review.review_num}" readonly>
				
				<div class="all">
					<div class="spandiv">
						<span class="input-group-text">제목</span>
					</div>
					<input type="text" class="form-control innm" name="review_title" value="${review.review_title}" readonly>
				</div>

				<div class="all">
					<div class="spandiv">
						<span class="input-group-text">작성자</span>
					</div>
					
					<input id="id" type="text" class="form-control" name="review_id" value="${review.review_id}" readonly>
					<div class="input-group-prepend">
						<span class="input-group-text">등록일</span>
					</div>
					
					<input id="date" type="text" class="form-control" name="review_date" value="${review.review_date}" readonly>
				</div>
				
				<div class="all">
				<span class="input-group-text">리뷰</span>
					<textarea class="text" name="review_content" readonly>${review.review_content}</textarea>
				</div>
				
				<c:if test="${review.review_filename ne NULL}">
					<div>
						<div>
							<span class="input-group-text">첨부파일</span>
							<div>
								<input type="text" class="form-control" value="${review.review_filename}" onclick="downloadFile('${review.review_filename}')" readonly>
							</div>
						</div>
					</div>
				</c:if>

				<script>
					function downloadFile(review_filename) {
						alert('다운로드테스트' + review_filename);
						location.href = "download.do?filename="
								+ review_filename;
					}
				</script>
				<c:if test="${review.review_filename eq NULL}">
					<div>
						<div>
							<div>
								<span class="input-group-text">첨부파일</span>
							</div>
							<input type="text" class="form-control" value="첨부된 파일이 없습니다." readonly>
						</div>
					</div>
				</c:if>
				
				<div class="all">
				<div class="input-group-prepend">
						<span class="input-group-text">답변 등록일</span>
				</div>				
					<input id="date" type="text" class="form-control" value="${review.review_replydate}" readonly>
				<span class="input-group-text">답변</span>
					<textarea class="text" name="review_reply">${review.review_reply}</textarea>
				</div>
				<div id="footer">
<%-- 					<c:if test="${user_id == review.review_id || user_id == 'farmadmin'}">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           --%>
						<button type="submit" id="ReviewReply">댓글 쓰기</button>
<%-- 						</c:if> --%>
					<button type="button" class="delbtn" onclick="deleteReview('${review.review_num}', '${review.review_filename}')">글 삭제</button>
					<button type="button" class="btnreviewlist" id="ReviewListget" onclick="location.href='/adminReview.do'">글목록</button>
				</div>
		</form>
	</div>
</div>
<script>
function deleteReview(reviewNum, reviewFilename) {
    var url = 'adminDeleteReview.do?review_num=' + reviewNum + '&review_filename=' + reviewFilename;
    location.href = url;
}
</script>
</body>
</html>