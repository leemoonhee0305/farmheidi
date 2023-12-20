<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="noticeMenu.jsp" %>  

<!DOCTYPE html>
<html><head>
<meta charset="UTF-8">
<style>
#content1{	
	background-color : white;	
	color : gray;
}
#footer{float: right; padding-right:20px;}
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
	#content1{	
	background-color : white;	
	color : gray;
}
@media(min-width:978px){
.container-fluid{width:80vw;}
}
</style>
</head>
<body>

<div class="container-fluid">
  <form action="insertNotice.do" method="post" enctype="multipart/form-data">
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">제목</span>
      </div>
      <input type="text" class="form-control" name="notice_title" placeholder="제목을 입력하세요." required>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">작성자</span>
      </div>
      <input type="text" class="form-control innm" name="notice_writer" id="idtest" required>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      <textarea class="form-control" rows="10" id="content" name="notice_content" style="resize: none;"></textarea>      
    </div>
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text" style="margin-bottom: 1rem !important;">파일등록</span>
      </div>
      <input type="file" class="form-control innm" name="uploadFile">      
    </div>
    <div id="footer">
    
	  	<button id="conComplete" type="submit" >새글 등록</button>
	  	<button id="conList" type="button" >글목록</button>
	 </div>
  </form>  
</div>

</body>
</html>
