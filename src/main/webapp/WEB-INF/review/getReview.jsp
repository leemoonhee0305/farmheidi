<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<%@ include file="reviewMenu.jsp"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.modal {
    display: none;
    position: fixed;
    z-index: 1;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
    background-color: #fefefe;
    margin: 10% auto;
    margin-top: 20%;
    margin-bottion: 20%;
    padding: 20px;
    border: 1px solid #888;
    width: 30%;
    text-align: center; 
}
#myModal .modal-content #report_reason {
    width: 100%; /* 입력창이 모달 내에서 꽉 차게 하기 */
    box-sizing: border-box; /* 내용에 padding과 border 포함 */
    margin-bottom: 10px; /* 입력창과 버튼 사이의 간격 조절 */
}

#myModal .modal-content button[type="submit"] {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}
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

span {
	width: 100px;
	height: input=vh;
	text-align: center;
	justify-content: center;
}

h1 {
	text-align: center;
}

#footer {
	float: right;
}

#content3 {
	background-color: white;
	color: gray;
}

button {
	text-decoration: none;
	background-color: #26588d;
	color: #e0ffff;
	border: 1px solid #26588d;
	padding: 5px 13px;
	float: right;
	margin-left: 3.5px;
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

.filebox{
	padding: 0;
	height: 303px;
}
.proIMG{height:300px;}

@media(min-width:978px){
.container-fluid{width:80vw; margin-bottom:80px;}
}
.container-fluid{margin-bottom:80px;}

@media screen and (max-width: 500px) {
	.filebox{
		height: 203px;
	}
	.proIMG{height:200px;}
}
</style>

</head>
<body>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" id="closeModalBtn">&times;</span>
			<h2>신고하기</h2>
			<form id="reportForm" action="insertReviewReport.do" method="post">
				<input type="hidden" class="form-control innm" name="review_num"
					value="${review.review_num}" readonly> <input type="hidden"
					class="form-control innm" name="review_title"
					value="${review.review_title}" readonly> <input
					type="hidden" class="form-control innm" name="review_id"
					value="${review.review_id}" readonly> <input type="hidden"
					class="form-control innm" name="review_date"
					value="${review.review_date}" readonly> <input
					type="hidden" class="form-control innm" name="review_content"
					value="${review.review_content}" readonly>
				<textarea name="report_reason" id="report_reason"
					placeholder="신고 내용을 입력하세요"></textarea>
				<button type="submit">신고 제출</button>
			</form>
		</div>
	</div>
	<div>
	<div class="container-fluid">
		<form name="fm" method="post">
			<input type="hidden" name="review_num" value="${review.review_num}">
			<div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">제목</span>
				</div>
				<input type="text" class="form-control innm" name="review_title"
					value="${review.review_title}" style="background-color: white;"
					readonly>
			</div>

			<div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">작성자</span>
				</div>
				<input id="id" type="text" class="form-control" name="review_id"
					value="${review.review_id}" readonly>
				<div class="input-group-prepend">
					<span class="input-group-text">등록일</span>
				</div>
				<input id="date" type="text" class="form-control "
					name="review_date" value="${review.review_date}" readonly>
			</div>
			<div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">

				<textarea class="form-control innm" rows="10" name="review_content"
					style="background-color: white; resize: none;" readonly>${review.review_content}</textarea>
			</div>


			<div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
				<div class="input-group-prepend">
					<span class="input-group-text">댓글</span>
				</div>
				<textarea class="form-control innm" rows="5"
					style="background-color: white; resize: none;" readonly>${review.review_reply}</textarea>
			</div>
			<div class="input-group mb-3" style="margin-bottom: 0.5rem !important;">
			<div class="input-group-prepend">
					<span class="input-group-text">댓글작성일</span>
				</div>
				<input id="date" type="text" class="form-control "
					name="review_replydate" value="${review.review_replydate}" readonly>
					</div>
	<c:if test="${user_id == review.review_id || user_id == 'farmadmin' }">
		<c:if test="${review.review_filename ne NULL}">
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
		
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<span class="input-group-text">첨부파일</span>
				</div>
	   			<input type="text" value="${review.review_filename} [다운로드]" class="form-control innm" 
	   			style="cursor:pointer;" onclick="downloadFile('${review.review_filename}')" readonly>
			</div>
	    </c:if>
   			
    <c:if test="${review.review_filename eq NULL}">
    <div class="input-group mb-3">
    	<div class="input-group mb-3">
    		<div class="input-group-prepend">
       			<span class="input-group-text">첨부파일</span>
     		</div>
     		<input type="text" class="form-control innm" value="첨부된 파일이 없습니다." readonly>      
    	</div>
    	</div>
    </c:if>
    </c:if>
   			<script>
	   			function downloadFile(review_filename){
	   				alert('다운로드테스트'+review_filename);
	   		        location.href = "download.do?filename="+review_filename;
	   			}
			</script>
        <!-- 모달 버튼 -->
		<button type="button"  id="openModalBtn" style="float:left; margin-left:0px;">신고하기</button>
			<div id="footer">
				<!-- marine부분은 관리자 부분. farmadmin으로 수정해야함. -->
				<c:if test="${user_id == review.review_id || user_id == 'farmadmin'}">
					<button id="Reviewupdate" type="button">글수정</button>
					<button type="button" id="Reviewdelete">글삭제</button>
				</c:if>
				<button type="button" id="ReviewListget" type="button">글목록</button>
				<!-- botton이 form태그 안에 묶여져있으면 submit이 기본값이라 form의 action 을 타게 되는데, 그래서 type이 button 으로 설정이 안되어있으면 버튼실행이 안됨.  -->
			</div>
    		</div>
		</form>
		
		<script>
document.addEventListener('DOMContentLoaded', function () {
    var modal = document.getElementById('myModal');
    var openBtn = document.getElementById('openModalBtn');
    var closeBtn = document.getElementById('closeModalBtn');
    
    
    

    // 모달 열기 버튼에 이벤트 리스너 추가
    openBtn.addEventListener('click', function () {
        modal.style.display = 'block';
    });

    // 모달 닫기 버튼에 이벤트 리스너 추가
    closeBtn.addEventListener('click', function () {
        modal.style.display = 'none';
    });

    // 모달 외부 클릭 시 모달 닫기
    window.addEventListener('click', function (event) {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    // 폼 전송 후 모달 닫기
    var reportForm = document.getElementById('reportForm');
    reportForm.addEventListener('submit', function () {
        modal.style.display = 'none';
    });
});
</script>
	<div style="margin-top: 60px;">
	<%@ include file="/footer.jsp"%>
	</div>
</body>
</html>
