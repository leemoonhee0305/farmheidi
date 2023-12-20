<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="qnaMenu.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#content2{   
   background-color : white;   
   color : gray;}
   #footer{float: right;} 
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
	#content2{	
	background-color : white;	
	color : gray;
}
@media(min-width:978px){
.container-fluid{width:80vw; margin-bottom: 50px;}
}
 .container-fluid{margin-bottom: 80px; margin-bottom: 50px;}
</style>
</head>
<body>
<div class="container-fluid">
  <form action="insertQNA.do" method="post" enctype="multipart/form-data">
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control" name="qna_title" placeholder="제목을 입력하세요." required>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">작성자</span>
      </div>
      <input type="text" class="form-control innm" name="qna_id" value="${user_id }" id="idtest" readonly>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">비밀번호</span>
      </div>
      <input type="text" class="form-control" name="qna_password" id="qna_password" disabled>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      <textarea class="form-control" rows="10" id="qna_content" name="qna_content" style="resize:none;"></textarea>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">파일등록</span>
      </div>
      <input type="file" class="form-control innm" name="uploadFile">      
    </div>
    <div class="form-check form-check-inline mt-3" style="margin-top: 0rem !important; margin-bottom: 1rem !important;">
    	<div class="input-group-prepend">
        	<span class="input-group-text">비밀글</span>
      	</div>
    	 <input class="form-check-input" type="checkbox" name="qna_secret" id="qna_secret" ${qna.qna_secret ? 'checked' : ''} onclick='togglepw(this)'>
    	<label class="form-check-label">비밀글 설정</label>
	</div>
    <br><br>
  
    <div id="footer">
	  	<button  type="submit" >새글 등록</button>
	  	<button id="QNAListget" type="button" >글목록</button>
	 </div>
  </form>  
</div>
<%@ include file="/footer.jsp"%>
</body>
</html>