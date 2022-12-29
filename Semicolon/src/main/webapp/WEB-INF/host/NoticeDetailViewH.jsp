<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="en">

  <head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet" />

<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="resources/css/tiny-slider.css" />
<link rel="stylesheet" href="resources/css/aos.css" />
<link rel="stylesheet" href="resources/css/style.css" />

    <title>
     SEMICOLON(;)&nbsp; HOST-NOTICE DETAIL page
    </title>
  </head>
  <style>
body {
	margin-top: 120px;
}
.table{
	border-top: 2px solid black;
	width:80%;
}

td{
	border: 1px solid #ced4da;
	text-align: left;
}
th{
	width:170px;
	height:40px;
	border: 1px solid #ced4da;
	background-color: #EAEAEA !important ;
}
.btn {
	display: inline-block;
	font-weight: 400;
	color: #fff;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #edb96a;
	border: 1px solid transparent;
	padding: 12px 30px;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: 0.25rem;
	transition: color .15s;
}

.row>* {
	padding: 0px !important;
	margin-bottom: 0px !important;
}


/* modal style */
#myform fieldset{
    display: inline-block;
    direction: rtl;
    border:0;
}
#myform fieldset legend{
    text-align: right;
}
#myform input[type=radio]{
    display: none;
}
#myform label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0;
}
#myform label:hover{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#reviewContents {
    width: 100%;
    height: 150px;
    padding: 10px;
    box-sizing: border-box;
    border: solid 1.5px #D3D3D3;
    border-radius: 5px;
    font-size: 16px;
    resize: none;
}
.card-body{
	padding : 7px;
	width:550px;
}	
.col-sm-10{
	margin:0px;
}
.span{
	font-size: 15pt;
	position : relative;
	float: left;
	top:20px;
}
.col-lg-9 {
    -webkit-box-flex: 0;
    width: 90%;
}
textarea{
	border: none;
	width:700px;
}
pre {
   	font-family: "Work Sans", sans-serif;
   	font-size: 14px;
   }
</style>
  
<%@ include file="header.jsp" %>
	<!-- 상단바 끝나는 부분 -->
	
	<br><br><br>
      <div class="container">
	<div class="row justify-content-center align-items-center">
		<div class="col-lg-9 text-center">

			<table align="center" width=100% height="60%" class="table">
				<tr>
					<th class="color">제목</th>
					<td colspan="5" align="center">&nbsp;&nbsp;[${notice.cate}]${notice.title }</td>
				</tr>
				<tr>
					<th width="60">작성날짜</th>
					<fmt:parseDate var="date" value="${notice.nt_date}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="nt_date" value="${date }" pattern="yyyy-MM-dd"/>
					<td>&nbsp;&nbsp;${nt_date}</td>
					<th width="60">작성자</th>
					<td>&nbsp;&nbsp;관리자</td>
					<th width="60">조회수</th>
					<td>&nbsp;&nbsp;${notice.n_readcount }</td>
				</tr>
				<tr>
					<th>공지대상</th>
					<td colspan="5">&nbsp;&nbsp;전체</td>
				</tr>
				<tr>
               <th id="bg_grey" style="vertical-align: middle;">이미지</th>
               <c:if test="${notice.nfile ne null}">
                  <td colspan="5" align="center">
                  <img src="${loadingPath }/${notice.nfile}" width="300" height="200">
                  </td>
               </c:if>
               <c:if test="${notice.nfile eq null}">
                  <td colspan="5" align="center">
                     &nbsp;&nbsp; 없음
                  </td>
               </c:if>
               <!-- 유효성검사할때에는 nfile, upload 상관없다. -->
            </tr>
				<tr>
					<th style="vertical-align: middle;">내용</th>
					<td colspan="5" height="300px" style="vertical-align: middle;"><pre>${notice.content }</pre></td>
				</tr>
			</table>
	<br><br><br>
	<form action="hnlist.ht" method="get">
		<input type="hidden" name="pageNumber" value=${pageNumber }>
		<input class="btn btn-primary-hover-outline" type="submit" value="목록보기">
	</form>
		</div>
	</div>
</div>
<br><br><br>
<div align="center">${pageInfo.pagingHtml }</div>
<br><br><br>
<%@ include file="footer.jsp" %>