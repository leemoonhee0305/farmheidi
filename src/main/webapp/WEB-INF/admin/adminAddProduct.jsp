<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 - 관리자</title>
<%@ include file="./adminMenu.jsp"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script> -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> -->

<!-- include summernote css/js -->
<script src="${pageContext.request.contextPath}/resources/js/summernoteJs/summernote-lite.js"></script> 
<script src="${pageContext.request.contextPath}/resources/js/summernoteJs/summernote-ko-KR.js"></script> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/summernoteCss/summernote-lite.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminAddProductADMenu.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminAddProduct.css">

<script>
	$(document).ready(function(){
		$('#pro_num').on('keyup', function(idx,data){
			$(this).val( $(this).val().replace(/[^0-9]/g, "") ); 
		});
		$('#pro_price').on('keyup', function(idx,data){
			$(this).val( $(this).val().replace(/[^0-9]/g, "") ); 
		});
		$('#pro_stock').on('keyup', function(idx,data){
			$(this).val( $(this).val().replace(/[^0-9]/g, "") ); 
		});
		
		 $(document).ready(
		         function() {
		            $('#summernote').summernote(
		                  {
		                     minHeight : 370,
		                     maxHeight : 1300,
		                     focus : true,
		                     lang : 'ko-KR',
		                     width : '100%',
		                     toolbar : [
		                           [ 'style', [ 'style' ] ],
		                           [
		                                 'font',
		                                 [ 'bold', 'italic', 'underline',
		                                       'clear' ] ],
		                           [ 'fontname', [ 'fontname' ] ],
		                           [ 'color', [ 'color' ] ],
		                           [ 'para', [ 'ul', 'ol', 'paragraph' ] ],
		                           [ 'height', [ 'height' ] ],
		                           [ 'table', [ 'table' ] ],
		                           [ 'view', [ 'fullscreen', 'codeview' ] ],
		                           [ 'help', [ 'help' ] ] ]
		                  });
		         });

		
	});
	
	function changeSel(){
	    var x = document.getElementById("selectBox").value;
	    pro_num.value = x;
	}
	
</script>
</head>
<body>
	
	<div id="entireBox">
	<form action="${uri}" method="post" enctype="multipart/form-data">

	<table class="proAddTable">
	<colgroup>
		<col width="30%" />
		<col width="70%" />
	</colgroup>
	<tr>
		<th colspan="2" class="noColor"><h4>상품등록 / 수정</h4></th>
	</tr>
	
	<tr>
		<th><span class="eachBox proIDBox">상품번호</span></th>
		<td>
		<c:choose>
			<c:when test="${pvo.pro_num eq null}">
				<select onchange="changeSel()" id="selectBox"  class="proInputH">
					<option>=카테고리선택=</option>
					<option value="1">우유</option>
					<option value="2">요거트</option>
					<option value="3">치즈</option>
					<option value="4">버터</option>
					<option value="5">잼</option>
					<option value="6">기타</option>
				</select>
				<input type="text" id="pro_num" class="proInputH" name="pro_num" maxlength="4" required/>
			</c:when>
			<c:otherwise>
				<input type="text" id="pro_num" class="proInputH noUpdate" name="pro_num" value="${pvo.pro_num}" readonly />
			</c:otherwise>
		</c:choose>
		</td>
	</tr>
	
	<tr>
		<th><span>상품명</span></th>
		<td>
			<input type="text" id="pro_name" class="proInputH" name="pro_name" value="${pvo.pro_name}" required />
		</td>
	</tr>
	
	<tr>
		<th><span>상품가격</span></th>
		<td>
			<input type="text" id="pro_price" class="proInputH" name="pro_price" value="${pvo.pro_price}" required />
		</td>
	</tr>
	
	<tr>
		<th><span>상품수량</span></th>
		<td>
			<input type="text" id="pro_stock" class="proInputH" name="pro_stock" value="${pvo.pro_stock}" required />
		</td>
	</tr>
	
	<tr>
		<th>
			<span>상품소개</span>
		</th>
		<td>
			<textarea id="summernote" id="pro_desc" name="pro_desc">${pvo.pro_desc}</textarea>
		</td>
	</tr>
	
	<tr>
		<th class="noBottomLine"><span class="input-group-text">상품사진</span></th>
		<td class="noBottomLine">
			<div class="select_img">
			<c:choose>
				<c:when test="${pvo.pro_file ne null}">
					<img class="proIMG" src="/resources/img/productPicture/${pvo.pro_file}"/>
				</c:when>
				<c:otherwise>
					<img src=""/>
				</c:otherwise>         
			</c:choose>
			</div>
		</td>
	</tr>
</table>
	
		
		<input type="file" class="form-control innm" multiple="multiple" name="uploadFile" id="uploadFile">
		
		<div id="submitBtnDiv"><button type="submit" id="submitBtn" class="submitBtn">등록</button></div>
	</form>
	</div>
		 <script>
		  $("#uploadFile").change(function(){
		   if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".select_img img").attr("src", data.target.result).width(300);        
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
		  });
		  
		  
		 </script>

</body>
</html>