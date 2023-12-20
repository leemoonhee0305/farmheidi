<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="adminMenu.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminNotice.css">
<title>Admin - 공지사항 상세보기</title>
<meta charset="UTF-8">
</head>
<body>
<h2 class="header">공지사항 확인 및 수정</h2>
<div class="noticediv">
<div class="container-fluid">
  <form name="fm" action="adminUpdateNotice.do" method="post">
  <input type="hidden" class="form-control" name="notice_num" value="${notice.notice_num}">
    
    <div class="all">
      <div class="spandiv">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control" name="notice_title" value="${notice.notice_title}" >      
    </div>
    <div class="all">
      <div class="spandiv">
        <span class="input-group-text">작성자</span>
      </div>
      <input type="text" class="form-control" name="notice_writer" value="${notice.notice_writer}">      
<%--       <input type="text" class="form-control innm" value="${board.writer}" readonly <%=sts %>>       --%>
    </div>
    <div class="all">
      <div class="spandiv">
        <span class="input-group-text">내용</span>
      </div>
      <textarea rows="10" id="comment" class="text" name="notice_content" style="resize: none;" >${notice.notice_content}</textarea>      
    </div>  
    <div class="all">
      <div class="spandiv">
      <c:if test="${notice.notice_filename ne NULL}">
					<div>
						<div>
							<span class="input-group-text">첨부파일</span>
							<div>
								<input type="text" class="form-control" value="${notice.notice_filename}" onclick="downloadFile('${review.review_filename}')" readonly>
							</div>
						</div>
					</div>
				</c:if>
   			<script>
	   			function downloadFile(notice_filename){
	   				alert('다운로드테스트'+notice_filename);
	   		        location.href = "download.do?filename="+notice_filename;
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
   		
    </div>
      </div>
    <div class="all">
      <div class="input-group-prepend">
        <span class="input-group-text">등록일</span>
      </div>
      <input type="text"  class="form-control" name="notice_date" value="${notice.notice_date}" readonly>      
    </div>
    <div>
      <div>
        <span class="input-group-text">조회수</span>
      </div>
      <input type="text"  class="form-control" name="notice_cnt" value="${notice.notice_cnt}" readonly >      
    </div>
    <div id="footer">
	<button type="submit" class="modibtn">글수정</button> 
	<button type="button" class="backlistbtn" onclick="location.href='adminNoticeList.do'">글목록</button> 
	</div>
  </form>  
	</div>
</div>
</body>
</html>