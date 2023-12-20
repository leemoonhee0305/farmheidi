<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>하이디 농장</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" >
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header.css">
  <script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/qnaheader.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/reviewheader.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/product.js"></script> 
  <style>
  	body{
  		font-family : 'HakgyoansimWoojuR';  		
  	}
  
	img#logo {
	width : 90px;
   }
   
   	img.logo {
	width : 90px;
   }
   
   @media only screen and (max-width : 978px){
 	img#logo{
   		width : 60px;
   	}
   	
   	img.logo{
   		width : 60px;
   	}
   }
   
  	div.top{
	background-image : linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ),url("${pageContext.request.contextPath}/resources/img/mainback.jpg");
/* 	background-image : linear-gradient( rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5) ),url("/resources/img/mainback.jpg"); */
	background-size : cover;
	height : 500px;
}
  </style>
</head>