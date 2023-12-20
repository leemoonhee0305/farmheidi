<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.spring.farm.util.PagingVO" %>
<%-- <%@ include file="./adminHeader.jsp"%> --%>
<%
	PagingVO pageInfo = (PagingVO)request.getAttribute("paging");
	int listCount=pageInfo.getTotal();
	int nowPage=pageInfo.getNowPage();
	int maxPage=pageInfo.getLastPage(); //최대 페이지 개수
	int startPage=pageInfo.getStartPage();
	int endPage=pageInfo.getEndPage(); //endPage는 보여지는 것 중 마지막 페이지 - LastPage는 찐 마지막 페이지
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 - 관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/adminProduct.js"></script>
<style>

.container {
	max-width: 1400px;
	margin: 0 auto;
}

.btn3 {
	display: block;
	margin: 10px 5px;
	float: right;
	border: none;
	background: #26588d;
	color: #e0ffff;
	padding: 13px;
	border-radius: 10px;
}
button:hover{
	cursor:pointer;
	background: #00a9ff; 
	color: white; 
	border: none;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th {
	border-bottom: 2px solid #ccc;
	padding: 15px;
}

td {
	border-bottom: 1px solid #ccc;
	text-align: center;
}

img {
	width: 50px;
}

fieldset.selStop {
	border: none;
	padding: 0;
	display: inline-block;
}

.proNameList {
	text-decoration: none;
	color: black;
}

.applyBtn {
	display: inline-block;
	border: none;
	background: #26588d;
	color: #e0ffff;
	padding: 6px;
	border-radius: 5px;
}

button {
	display: inline-block;
	border: none;
	background: #db453b;;
	color: #e0ffff;
	padding: 6px;
	border-radius: 5px;
}

button.deleteBtn {
	background: #d04343;
}

.deleteBtn:hover{
	background: #f39a28; 
	color: white; 
}

/* 페이지 버튼 스타일 start */
	
		section#pageList {
			margin-top: 20px;
			text-align: center;
		}
		section.pageList>button {
			margin:0 0 5px 5px;
			background-color: #7695B7;
			color: #e0ffff;
			border: 1px solid #26588d;
			cursor: pointer;
		}
		section.pageList>button:hover {
			background: #00a9ff;
			color: white;
			border: none;
		}
		section.pageList>button:active {
			background: lightgray;
			color: white;
			border: none;
		}
		section#pageList>button.prevbtn {
		   width:2rem; height:2rem;
		   border: none;
		   background: none;
		   color: black;
		}
		section#pageList>button.listbtn {
			width:2rem; height:2rem;
			border:1px solid #888;
			border-radius:1rem;
		}
		section#pageList>button.viewbtn {
			background-color: white; /*#00a9ff*/
			color: #26588d;
			border: 1px solid #26588d;
			font-weight: bold;
		}
		section#pageList>button.nextbtn {
		   width:2rem; height:2rem;
		   border: none;
		   background: none;
		   color: black;
		}
		section#pageList>button.notlinkbtn {
			cursor: default;
		}
		section.pageList>button.notlinkbtn:active {
			background: #00a9ff;
			color: white;
			border: none;
		}
		/* 페이지 버튼 스타일 end. */		
</style>


<script>
function pageList(page){
	   const searchParams = new URLSearchParams(location.search);
	   if(searchParams.has('search')){
	      var listBy = searchParams.get('search');
	      location.href="/adminProduct.do?page="+page+"&search="+listBy;
	   } else {
	      location.href="/adminProduct.do?page="+page;
	   }
	   if(searchParams.has('searchKeyword')){
	      var searchKeyword = searchParams.get('searchKeyword');
	      location.href="/adminProduct.do?page="+page+"&searchKeyword="+searchKeyword;
	   }
	}

	$(document).ready(function() {
		var newForm = document.createElement("form");
				
		//상품관리자페이지 선택삭제
		$('#delBtn').on('click', function() {
			var ok = confirm("정말로 삭제하시겠습니까?");
			if(ok){
			newForm.setAttribute("method", "POST");
			newForm.setAttribute("action", "/delSelProd.do");
					
			const testDiv = document.getElementsByName('idList');
			for(var i=0; i < testDiv.length; i++){
				if(testDiv[i].checked){
					let cloneIn = testDiv[i].cloneNode(true);
					newForm.appendChild(cloneIn);
				}
			}
			document.body.appendChild(newForm);
			newForm.submit();
				
			}
			});
		
	});

	const checkBoxes = document.getElementsByName('idList');

	function checkAllClick() {
		if (document.getElementById('checkAll').checked) {
			for (var i = 0; i < checkBoxes.length; i++) {
				checkBoxes[i].checked = true;
			}
		} else {
			for (var i = 0; i < checkBoxes.length; i++) {
				checkBoxes[i].checked = false;
			}
		}
	}

	//하위 checkbox 체크 여부에 따른 [전체선택] checkbox 체크 변경
	function checkBoxValueChanged() {
		var checkedCnt = 0;
		for (let i = 0; i < checkBoxes.length; i++) {
			if (checkBoxes[i].checked) {
				checkedCnt++;
			}
		}
		if (checkedCnt == checkBoxes.length) {
			document.getElementById('checkAll').checked = true;
		} else {
			document.getElementById('checkAll').checked = false;
		}
	}

	// 판매중지
		function stopBtn(proNum, i){
			$.ajax({
			url: "/stop.do",
			data : {'pro_num': proNum, 'stop': $('input[type="radio"]:checked')[i].value},
			type:"POST",
			dataType : 'text',
			cache : false,
			success : function(data){
				alert('판매 상태를 변경했습니다.');
			},
			error:function(request,status){
				console.log(i);
				console.log($('input[type="radio"]:checked')[i].value);
				alert("판매 상태를 변경할 수 없습니다");
			}
		});
		
	}	

	
	function allChange() {
		var allProNum = document.getElementsByName("idList");
		var checked = $('input[type="radio"]:checked');
		for(var i=0; i<checked.length; i++){
			$.ajax({
				url: "/stop.do",
				data : {'pro_num': allProNum[i].value, 'stop': checked[i].value},
				type:"POST",
				dataType : 'text',
				cache : false,
				success : function(data){
				},
				error:function(request,status){
					alert("판매 상태를 변경할 수 없습니다");
				}
			});
			
		}
		alert('판매 상태를 변경했습니다.');
		
	}
	
	function del(proNum){
		$.ajax({
			url: "/delAdmProd.do",
			data : {'pro_num': proNum},
			type: "post",
			cache : false,
			success:function(data){
				console.log(data);
				if(data==0){
					alert('배송중인 상품입니다.');				
					return false;
				}else{
					document.location.reload();
					alert('삭제되었습니다.');
				}
			}
		})
	}
	
	function registerProd(){
		location.href="/inup.do?fn=i";
	}
	
	
</script>
</head>
<body>
	<%@ include file="./adminMenu.jsp"%>

<div class="container">
<!-- 	<a href="/inup.do?fn=i">상품등록</a> -->
<div id="btngroup" >
	<button id='delBtn' type="button" class="btn3 deleteBtn">선택삭제</button>
	<button type="button" onclick="allChange()" class="btn3">일괄변경</button>
	<button onclick="registerProd()" class="btn3">상품등록</button>
</div>	
<!-- 	<form name="adminform"> -->
	<%int count = 0; %>
		<table>
			<tr>
				<th><input type="checkbox" id="checkAll" class="result" onclick="checkAllClick()"></th>
				<th>상품번호</th>
				<th>사진</th>
				<th>상품명</th>
				<th>가격</th>
				<th>등록 날짜</th>
				<th>판매/중지</th>
				<th>삭제</th>
			</tr>
			<c:forEach items="${admProList}" var="list">
				<tr>
					<td>
						<input type="checkbox" name="idList" onclick="checkBoxValueChanged()" class="result" value="${list.pro_num}">
					</td>
					<td>${list.pro_num}</td>
					<td>
						<a href="/productDetail.do?pro_num=${list.pro_num}" class="productInList"> <img src="/resources/img/productPicture/${list.pro_file}"
							title="${list.pro_name} 상품 사진"></a>
					</td>
					<td><a href="/inup.do?pro_num=${list.pro_num}&fn=u" class="proNameList">${list.pro_name}</a></td>
					<td><fmt:formatNumber value="${list.pro_price}"
							pattern="#,###"></fmt:formatNumber></td>
					<td>${list.pro_date}</td>
					<td class="radioTd">
						<form>
							<c:choose>
								<c:when test="${list.stop eq 'Y'}">
									<fieldset class="selStop">
										<input type="radio" name="stop" class="stop" value="Y" checked>판매
										<input type="radio" name="stop" class="stop" value="N">중지
									</fieldset>
								</c:when>
								<c:otherwise>
									<fieldset class="selStop">
										<input type="radio" name="stop" class="stop" value="Y">판매
										<input type="radio" name="stop" class="stop" value="N" checked>중지
									</fieldset>
								</c:otherwise>
							</c:choose>
							<button type="button" onclick="stopBtn(${list.pro_num}, <%=count%>)" class="applyBtn">적용</button>
						</form>
					</td>
					<td>
						<button type="button" onclick="del(${list.pro_num})" class="deleteBtn">삭제</button>
					</td>
				</tr>
			<%count++;%>
			</c:forEach>
		</table>
		
	<section id="pageList" class="pageList">
			<% if(nowPage<=1){ %>
				<button type="button" class="prevbtn notlinkbtn">&lt;</button>
			<%}else{ %>
				<button type="button" class="prevbtn" onclick="pageList('<%=nowPage-1 %>','${searchKeyword}')">&lt;</button>
			<%} %>
			
			<%for(int a=startPage;a<=endPage;a++){
					if(a==nowPage){%>
						<button type="button" class="listbtn viewbtn notlinkbtn"><%=a%></button>
					<%}else{ %>
						<button type="button" class="listbtn" onclick="pageList('<%=a %>','${searchKeyword}')"><%=a%></button>
					<%} %>
			<%} %>
				
			<%if(nowPage>=maxPage){ %>
				<button type="button" class="nextbtn notlinkbtn">&gt;</button>
			<%}else{ %>
				<button type="button" class="nextbtn" onclick="pageList('<%=nowPage+1 %>','${searchKeyword}')">&gt;</button>
			<%} %>
		</section>
</div>
</body>
</html>