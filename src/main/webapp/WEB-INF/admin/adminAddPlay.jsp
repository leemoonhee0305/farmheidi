<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 - 관리자</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminMain.css">
<style>
	* { border-box : border-box; }

	div.header{
		margin-bottom : 80px;
	}
	
	div.content-box{
		width : 90%;
		margin : 0 auto;
		margin-bottom : 150px;
	}
	
	div.playList-box{
		margin-bottom : 100px;
	}
	
	div.insert-div {
		border:1px solid #cfcfcf;
		border-radius:5px;
		padding-top: 55px;
		padding-bottom: 55px;
	}
	form#insert-box{
		width : 60%;
		margin : 0 auto;
		text-align : center;
	}
	
	h2.content-title{
		padding : 30px 0;
		padding-top : 0;
		margin-bottom : 0px;
		text-align: center;
		font-family: 'SBAggroB';
	}
	
	p.noData-P {
		border:1px solid #cfcfcf;
		border-radius: 5px;
		text-align: center;
		padding: 130px 0;
		color: gray;
	}
	
	table.playList-table{
		margin : 0 auto;
		table-layout : fixed;
		width : 100%;
		border-top: 2px solid #888;
		border-bottom: 1px solid #ccc;
		border-collapse: collapse;
	}

	table.playList-table>tbody>tr:first-child {
		background-color: #f3f3f3;
	}

	table.playList-table>tbody>tr:not(first-child) {
		background-color: #F0F8FF;
	}
	table.playList-table>tbody>tr:nth-child(even) {
		background-color: #fff;
	}

	tr > th, td{
		padding : 1rem;
		text-align : center;
		overflow : hidden;
        text-overflow : ellipsis;
        white-space : nowrap;
       
	}
	
	.del-row{
		display : block;
		text-decoration : none;
		color : black;
		width : 50%;
		margin : 0 auto;
		padding : 6px 0;
	}
	
	a.del-row:hover{
		color : red;
		cursor : pointer;
	}

	.col-w5{
		width : 5%;
	}
	.col-w10{
		width : 10%;
	}
	.col-w15{
		width : 15%;
	}

	form#insert-box>span {
		display: inline-block;
		width: 100%;
		margin-bottom: 10px;
	}
	form#insert-box>span:nth-child(3), form#insert-box>span:nth-child(7) {
		margin-top: 4px;
	}
	form#insert-box>span>span {
		border:1px solid #336699;
		border-radius: 3px;
		display: inline-block;
		width: calc(80% - 20px);
		text-align: left;
		padding : 10px 10px;
		font-size : 1rem;
	}
	form#insert-box>span>textarea {
		width: calc(80% - 20px);
		height: 70px;
		padding : 10px 10px;
		border : 1px solid #336699;
		border-radius: 3px;
		font-size : 1rem;
	}

	input[type="text"]{
		width: calc(80% - 20px);
		padding : 10px 10px;
		font-size : 1rem;
		border-radius : 3px;
		border : 1px solid #336699;
	}
	
	input[type="text"]:focus{
		border : 1px solid #lightgray;
	}
	
	button[type="submit"]{
		width : 38%;
		margin-top: 40px;
		padding : 15px 0;
		border : 1px solid #26588d;
		border-radius : 6px;
		background-color: #26588d;
		color: #e0ffff;
		cursor: pointer;
		font-size : 1rem;
	}
	button[type="submit"]:hover {
		background: #00a9ff;
		color: white;
		border: none;
	}
	button[type="submit"]:active {
		background: lightgray;
		color: white;
		border: none;
	}

	input[type="file"]{
		margin-bottom : 50px;
	}
</style>


	<style>
	/* desktop */
	/* @media only screen and (min-width: 979px) { */

	/* } */
	
	/* mobile .. */
	@media only screen and (max-width: 978px) {
		form#insert-box{
			width : 70%;
		}
		form#insert-box>span>span {
			width: calc(90% - 20px);
			font-size : 0.77rem;
		}
		form#insert-box>span>textarea {
			width: calc(90% - 20px);
			font-size : 0.77rem;
		}
	
		input[type="text"]{
			width: calc(90% - 20px);
			font-size : 0.77rem;
		}		
	}
	
	/* mobile .. */
	@media only screen and (max-width: 500px) {
		  div.content-box {
		  	font-size: 0.77rem;
		  }

       /* 체험상품 목록 테이블의 th(td) 3[체험설명]번째 컬럼(칸) */
	   div.playList-box>table>tbody>tr>th:nth-child(3) {
	      display: none;
	   }
	   div.playList-box>table>tbody>tr>td:nth-child(3) {
	      display: none;
	   }

		form#insert-box{
			width : 95%;
		}
		form#insert-box>span>span {
			width: calc(90% - 20px);
			font-size : 0.77rem;
		}
		form#insert-box>span>textarea {
			width: calc(90% - 20px);
			font-size : 0.77rem;
		}
	
		input[type="text"]{
			width: calc(90% - 20px);
			font-size : 0.77rem;
		}
		  
	}
	</style>


<script>
	function delCol(num){
		var result = confirm("해당 체험을 삭제하시겠습니까?");
		if(result){
			alert("삭제되었습니다.");
			location.href="/deletePlay.do?pla_num="+num;
		}
		
	}
</script>
</head>

<body>

<div class="header">
<%@ include file="adminMenu.jsp" %>
</div>


<div class="content-box">

	<div class="playList-box">
		<h2 class="content-title">체험 상품 목록</h2>
		<c:choose>
			<c:when test="${playList ne null }">
				<table class="playList-table">
				<tbody>
					<tr id="tr-top">
						<th class="col-w5">순서</th><th class="col-w15">체험명</th><th>체험설명</th><th class="col-w10">체험가격</th><th class="col-w10">삭제</th>
					</tr>
					<c:forEach var="playList" items="${playList }">
						<tr>
							<td class="col-w5">${playList.pla_num }</td><td class="">${playList.pla_name }</td><td>${playList.pla_content}</td><td><fmt:formatNumber value="${playList.pla_price}" pattern="#,###"/>원</td><td class="col-w10"><a class="del-row" onclick="delCol(${playList.pla_num })" >삭제하기</a></td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<p class="noData-P">체험 상품 내역이 없습니다.</p>
			</c:otherwise>
		</c:choose>
	</div>


	<h2 class="content-title">체험 상품 등록</h2>
	<div class="insert-div">
		<form id="insert-box" action="/insertPlay.do" method="post" enctype="multipart/form-data">
			<span><input type="text" name="pla_name" placeholder="체험 상품명"></span><br>
			
			<span><textarea name="pla_content" placeholder="상품 설명"></textarea></span><br>
			
			<span><input type="text" name="pla_price" placeholder="상품 가격"></span><br>
			
			<span><span><label for="pla_filename">이미지:</label>
			<input type="file" name="pla_filename" value="파일업로드"></span></span><br>
	
			<span><button type="submit">추가하기</button></span><br>
		</form>
	</div>


</div>

</body>
</html>
