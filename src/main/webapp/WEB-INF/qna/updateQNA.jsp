<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="qnaMenu.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
password = "${qna.qna_password }";
secret = "${qna.qna_secret}";
</script>
<style>
#qna_secret { margin-left: 0.75rem;}
button{
 text-decoration : none; background-color: #26588d;
    color: #e0ffff;
    border: 1px solid #26588d;
   padding : 5px 13px; float: right; 
   margin-left:3.5px;}
#idtest{background-color:#e9ecef;}
	span{width:100px; height: input=vh; text-align: center; justify-content: center;}
	#content{background-color: #e9ecef;}
	#footer{float: right;}
.filebox{
	padding: 0;
	height: 303px;
}
.proIMG{height:300px;}	

@media(min-width:978px){
.container-fluid{width:80vw; margin-bottom: 80px;}
}
 .container-fluid{margin-bottom: 80px; margin-bottom: 80px;}
 
 @media screen and (max-width: 500px) {
	.filebox{
		height: 203px;
	}
	.proIMG{height:200px;}
}
 
</style>
</head>
<body>
<div class="container-fluid">
  <form action="updateQNA.do" method="post" enctype="multipart/form-data">
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control" name="qna_title" value="${qna.qna_title }" required>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">작성자</span>
      </div>
      <input type="text" class="form-control innm" name="qna_id" value="${qna.qna_id }" id="idtest" readonly>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      <textarea class="form-control" rows="10" id="content" name="qna_content" style="background-color: white;  resize: none; ">${qna.qna_content}</textarea>      
    </div>
<%-- <c:choose> --%>
    <c:if test="${qna.qna_filename ne NULL}">
		<div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
			<div class="input-group-prepend">
				<span class="input-group-text">사진</span>
			</div>

			<div class="form-control innm filebox"
				style="background-color: white;">
				<img class="proIMG"
					src="${pageContext.request.contextPath}/resources/img/${qna.qna_filename}" />
			</div>
		</div>
    
	    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
			<div class="input-group-prepend">
			  <span class="input-group-text">파일</span>
			</div>  
			<input type="text" class="form-control innm" onclick="location.href='delQNAFile.do?qna_num=${qna.qna_num}'" 
			id="deletefile" value="${qna.qna_filename} [파일삭제]" style="cursor:pointer; background-color: white;" readonly>
		</div>
   			
		<script>
   			function downloadFile(qna_filename){
   		        location.href = "download.do?filename="+qna_filename;
   			}
		</script>
    </c:if>
    <c:if test="${qna.qna_filename eq NULL}">
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
    		<div class="input-group-prepend">
       			<span class="input-group-text">파일등록</span>
     		</div>
     		<input type="file" class="form-control innm" name="uploadFile">      
    	</div>
    </c:if>
<%-- </c:choose> --%>   
<%--       <input type="file" class="form-control innm" name="uploadFile" value="${qna.qna_filename}">      --%>
<div class="form-check form-check-inline mt-3" style="margin-top: 0rem !important; margin-bottom: 0.5rem !important;">
    	<div class="input-group-prepend">
        	<span class="input-group-text" style="margin-top: 0rem !important;">비밀글</span>
      	</div>
<!--     	<input class="form-check-input" type="checkbox" name="qna_secret" id="qna_secret"  onclick='togglepw(this)'> -->
<%--     	<input class="form-check-input" type="checkbox" name="qna_secret" id="qna_secret" ${qna.qna_secret ? 'checked' : ''} onclick='togglepw(this)'> --%>
    	<input class="form-check-input" type="checkbox" name="qna_secret" id="qna_secret" ${qna.qna_secret ? 'checked' : ''} onchange="updatePasswordField(this)">
    	<label class="form-check-label">비밀글 설정</label>
	</div>

     <div class="input-group mb-3" style="margin-bottom: 2rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">비밀번호</span>
      </div>
      <input type="text" class="form-control" name="qna_password" id="qna_password" value="${qna.qna_password }">        
    </div>
  
    <div id="footer">
	  	<button type="submit" >글수정</button>
	  	<button id="QNAListget" type="button" >글목록</button>
	 </div>
  </form>  
</div>
<%@ include file="/footer.jsp"%>
</body>
</html>
