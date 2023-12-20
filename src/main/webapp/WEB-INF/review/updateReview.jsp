<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ include file="reviewMenu.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#imgContentBox {
	width: 600px;
	max-height: 550px;
	overflow: auto;
	position: absolute;
	top: 30%;
	left: 30%;
	border-radius: 5px;
	z-index: 9999999;
}

#imgBoxTitleBar {
	border-bottom: 1px solid #777;
	border-radius: 5px 5px 0 0;
	background-color: #ddd;
	width: 100%;
	padding: 10px;
	text-align: right;
	font-size: 20px;
	font-weight: bolder;
}

#imgBoxImg {
	width: 100%;
	border-radius: 0 0 5px 5px;
}

#closeX {
	padding: 5px 20px;
	border-radius: 5px;
	border: 1px solid #777;
	background-color: red;
	color: #fff;
}

#closeX:hover {
	background-color: #777;
	cursor: pointer;
}

.form-control:disabled, .form-control[readonly] {
	background-color: #fff;
	opacity: 1;
}

button {
	text-decoration: none;
	background-color: #26588d;
	color: #e0ffff;
	border: 1px solid #26588d;
	padding: 5px 13px;
	float: right;
	margin-left: -13px;
}

.qBtn:hover {
	background: #00a9ff;
	color: white;
	border: none;
	box-shadow: none;
	text-decoration: none;
}

.qBtn:active {
	color: white;
	background: lightgray;
	border: none;
}

#idtest {
	background-color: #e9ecef;
}

span {
	width: 100px;
	height: input=vh;
	text-align: center;
	justify-content: center;
}

#content {
	background-color: #e9ecef;
}

#footer {
	float: right;
}

#content3 {
	background-color: white;
	color: gray;
}

.filebox{
	padding: 0;
	height: 303px;
}
.proIMG{height:300px;}

@media ( min-width :978px) {
	.container-fluid {
		width: 80vw;
		margin-bottom: 80px;
	}
}

.container-fluid {
	margin-bottom: 80px;
}

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
		<form action="/updateReview.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="review_num" value="${review.review_num}">
			<div class="input-group mb-3"
				style="margin-bottom: 0.5rem !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control innm" name="review_title"
					value="${review.review_title}" style="background-color: white;">
			</div>

			<div class="input-group mb-3"
				style="margin-bottom: 0.5rem !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input id="idtest" type="text" class="form-control innm"
					name="review_id" value="${review.review_id}" readonly>
			</div>

			<div id="content" class="input-group mb-3"
				style="margin-bottom: 0.5rem !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">내용</span>
				</div>
				<textarea class="form-control innm" rows="10" id="comment"
					name="review_content"
					style="background-color: white; resize: none;">${review.review_content}</textarea>
			</div>

			<c:if test="${review.review_filename ne NULL}">
				<div class="input-group mb-3"
					style="margin-bottom: 0.5rem !important;">
					<div class="input-group-prepend">
						<span class="input-group-text">사진</span>
					</div>

					<div class="form-control innm filebox"
						style="background-color: white;">
						<img class="proIMG"
							src="${pageContext.request.contextPath}/resources/img/${qna.qna_filename}" />
					</div>
				</div>
				
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">파일</span>
					</div>

					<input type="text" class="form-control innm"
						onclick="location.href='delReviewFile.do?review_num=${review.review_num}'"
						id="deletefile" value="${review.review_filename} [파일삭제]"
						style="cursor: pointer;" readonly>

					<script>
						function downloadFile(review_filename) {
							alert('다운로드테스트' + review_filename);
							location.href = "download.do?filename="
									+ review_filename;
						}
					</script>
				</div>
			</c:if>
			<c:if test="${review.review_filename eq NULL}">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text">파일등록</span>
					</div>
					<input type="file" class="form-control innm" name="uploadFile">
				</div>
			</c:if>

			<div id="footer">
				<button type="submit">글수정</button>
				<button id="ReviewListget" type="button" style="margin-right: 16px;">글목록</button>
			</div>
	</div>


	</form>
	</div>
	<div style="margin-top: 60px;">
		<%@ include file="/footer.jsp"%>
	</div>
</body>
</html>
