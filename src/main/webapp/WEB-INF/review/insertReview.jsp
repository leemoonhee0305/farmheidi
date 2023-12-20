<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="reviewMenu.jsp" %> 
  <% 
   String id = null;

   if(session.getAttribute("user_id")!=null){
      id=(String)session.getAttribute("user_id");
   }else{
      out.println("<script>");
      out.println("alert('로그인이 필요합니다.')");
      out.println("location.href='login.do';");
      out.println("</script>");
      
   }
%>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<style>
 	#imgContentBox {width:600px;max-height:550px;overflow:auto;position:absolute;top:30%;left:30%;border-radius:5px;z-index:9999999;} 
 	#imgBoxTitleBar {border-bottom:1px solid #777;border-radius:5px 5px 0 0;background-color:#ddd;width:100%;padding:10px;text-align:right;font-size:20px;font-weight:bolder;} 
 	#imgBoxImg {width:100%;border-radius: 0 0 5px 5px;} 
 	#closeX {padding:5px 20px;border-radius:5px;border:1px solid #777;background-color:red;color:#fff;} 
 	#closeX:hover {background-color:#777;cursor:pointer;} 
 	.form-control:disabled, .form-control[readonly] {
    background-color: #fff;
    opacity: 1;
}
button{
 text-decoration : none; background-color: #26588d;
    color: #e0ffff;
    border: 1px solid #26588d;
   padding : 5px 13px; float: right; 
   margin-left:3.5px;}

.qBtn:hover { background: #00a9ff; color: white; border: none; box-shadow: none; text-decoration : none; }

.qBtn:active{ color: white; background: lightgray; border: none;
}
#id{background-color:#e9ecef;}
	span{width:100px; height: input=vh; text-align: center; justify-content: center;}
	#content{background-color: #e9ecef;}
	#footer{float: right;}
	#content3{	
	background-color : white;	
	color : gray;
}
@media(min-width:978px){
.container-fluid{width:80vw; margin-bottom:80px;}
}
.container{margin-bottom:80px;}

</style></head>


<body>  
<div class="container-fluid">
  <form  method="post" action="insertReview.do" enctype="multipart/form-data"> 
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend" >
        <span class="input-group-text" >제목</span>
      </div>
      <input type="text" class="form-control innm" name="review_title"  placeholder="제목을 입력하세요."  required>      
    </div>
    
    <div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend" >
        <span class="input-group-text" >작성자</span>
      </div>
      <input id="id" type="text" class="form-control innm" name="review_id" value="${user_id}" readonly>      
	 </div>
	 
    <div id="content" class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">내용</span>
      </div>
      <textarea class="form-control innm" rows="10" id="comment" name="review_content" style="background-color: white; resize:none;" ></textarea>      
    </div>  
    
    <div class="input-group mb-3" id="file" style="margin-bottom: 1rem !important;">
      <div class="input-group-prepend">
        <span class="input-group-text">파일첨부</span>
      </div>
      <input type="file" class="form-control innm" name="uploadFile">
      
     </div>
   
   
    <div id="footer">
	  	<button  type="submit" >새글 등록</button>
	  	<button id="ReviewListget" type="button" >글목록</button>
	</div>
  </form>  
</div>
<div style="margin-top: 60px;">
	<%@ include file="/footer.jsp"%>
	</div>
</body>
</html>
