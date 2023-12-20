<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminNoticeInsert.css">
<%@ include file="adminMenu.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/admin.js"></script>
</head>
<body>
<div class="alldiv">
<h2>공지사항 등록</h2>
  <form action="insertNotice.do" class="formcla allcla" method="post" enctype="multipart/form-data">
    <div class="mdiv">
      <div class="namediv">
        <span>제목</span>
      </div>
      <input type="text" class="titlecla allcla" name="notice_title" placeholder="제목을 입력하세요." required>      
    </div>
    <div class="mdiv">
      <div class="namediv">
        <span>작성자</span>
      </div>
      <input type="text" class="writercla allcla" name="notice_writer" required>      
    </div>
    <div class="mdiv">
      <div class="namediv">
        <span>내용</span>
      </div>
      <textarea rows="10" id="content" class="contentcla allcla" name="notice_content" style="resize: none;"></textarea>      
    </div>
	<div class="filebox">
    	<input class="upload-name" value="첨부파일" placeholder="첨부파일">
   		<label for="file">파일찾기</label> 
    	<input type="file" name="uploadFile" id="file">
	</div>
    <div id="footer">
    
	  	<button id="conComplete" type="submit" class="newbtn btn">새글 등록</button>
	  	<button id="conList" type="button" class="listbtn btn" onclick="location.href='/adminNoticeList.do'">글목록</button>
	 </div>
  </form>  
</div>
</body>
</html>
