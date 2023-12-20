<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp" %>
<%@ include file="noticeMenu.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.alldiv {
    text-align: center;
    width: 55%;
    margin: auto;
}
.fourdiv {
    display: inline-block;
    width: 50%;
}

span.fourspan {
    display: inline-block;
    border: 1px solid #54aadfd1;
    padding: 1px 3px;
    width: 16%;
    background-color: #54aadfd1;	
    color: white;
    border-radius: 4px 0 0 4px;
}
input.fourinp {
    border: 1px solid #ccc;
    padding-left: 5px;
    width: 83%;
    border-radius: 0 4px 4px 0;
    margin-right: 1px;
}

textarea#comment {
    width: 100%;
    margin: 20px 0;
    resize: none;
}
button#conList {
    border: 1px solid #ccc;
    background-color: #3876bf;
    color: white;
    font-size: 19px;
    padding: 3px 8px;
    margin-bottom: 30px;
    margin-left: auto;

}
.tiwidiv {
    margin-bottom: 2px;
}
.filecla{
	font-size: 18px;
}
div#bottom {
    display: flex;
}
span.filecla:hover {
    cursor: pointer;
}
.filediv {
    width: 10%;
    display: inline-block;
    border: 1px solid #54aadfd1;
    padding: 1px 3px;
    background-color: #54aadfd1;
    color: white;
    border-radius: 4px 0 0 4px;
    float: left;
}
.filedown {
    float: left;
    padding-left: 5px;
}
@media (max-width: 430px) {
input.fourinp {
    width: 69%;
}
span.fourspan {
    width: 30%;
}
.alldiv {
	font-size: 19px;
    width: 90%;
}
.filediv {
    width: 17%;
}
}

</style>
<script>
</script>
</head>
<body>
<div class="alldiv">
  <form>
  <input type="hidden" name="notice_num" value="${notice.notice_num}">
  
  <div class="tiwidiv">
    <div class="titlediv fourdiv">
        <span class="titlespan fourspan">제목</span><input class="titleinp fourinp" type="text" name="notice_title" value="${notice.notice_title}" readonly >      
    </div><div class="writerdiv fourdiv">
        <span class="writerspan fourspan">작성자</span><input class="writerinp fourinp" type="text" name="notice_writer" value="${notice.notice_writer}" id="idtest" readonly>     
   	</div>
   	</div>
   	

   	<div class="dacntdiv">
   	
      <div class="datediv fourdiv">
        <span class="datespan fourspan">등록일</span><input class="dateinp fourinp" type="text" name="notice_date" value="${notice.notice_date}" readonly>      
      </div><div class="cntdiv fourdiv">
        <span class="cntspan fourspan">조회수</span><input class="cntinp fourinp" type="text" name="notice_cnt" value="${notice.notice_cnt}" readonly >      
      </div>
      
     </div>
    
    <div class="textareadiv">
      <c:if test="${user_id == 'farmadmin'}">
      <textarea class="contentcla" rows="10" id="comment" name="notice_content">${notice.notice_content}</textarea>      
      </c:if>
      <c:if test="${user_id != 'farmadmin'}">
       <textarea class="areacla" rows="10" id="comment" name="notice_content" readonly>${notice.notice_content}</textarea>
      </c:if>
    </div>  
      <div class="filediv">
        <span class="filecla">파일</span>
      </div>
      <div class="filedown">
   		<c:if test="${notice.notice_filename ne NULL}">
   			<span onclick="downloadFile('${notice.notice_filename}')" class="filecla">${notice.notice_filename}</span>

   			<script>
	   			function downloadFile(notice_filename){
	   				alert('다운로드테스트'+notice_filename);
	   		        location.href = "download.do?filename="+notice_filename;
	   			}
			</script>
   		</c:if>
      </div>
   		
   		
    <div id="bottom">
    <c:if test="${user_id == 'farmadmin'}"> <!-- marine부분은 관리자 부분. farmadmin으로 수정해야함. -->
	  	<button type="submit">글수정</button>
	  	<button id="conWrite" type="button">글쓰기</button>
	  	<button id="conDel" type="button">글삭제</button>
	  	</c:if>
	<button id="conList" type="button" >글목록</button>
	</div>
</form>  
    </div>
<%@ include file="/footer.jsp"%>
</body>
</html>
