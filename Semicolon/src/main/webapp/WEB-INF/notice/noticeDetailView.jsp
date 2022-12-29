<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function updateNotice(nno,pageNumber){
		location.href="nupdate.nt?nno="+nno+"&pageNumber="+pageNumber;
	}
	function deleteNotice(nno,pageNumber){
		var truefalse = confirm("정말로 삭제하시겠습니까?");
		if(truefalse == true){
			location.href="ndelete.nt?nno="+nno+"&pageNumber="+pageNumber;
		}
		else{
			location.href="ndetail.nt?nno="+nno+"&pageNumber="+pageNumber;
		}
	}
</script>
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="author" content="Untree.co" />
    <link rel="shortcut icon" href="favicon.png" />

    <meta name="description" content="" />
    <meta name="keywords" content="bootstrap, bootstrap5" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="resources/css/aos.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>
    SEMICOLON(;)&nbsp; ADMIN-NOTICE DETAIL page
    </title>
  </head>
  <style>
  	body {
	margin-top: 120px;
}
.table{
	border-top: 2px solid black;
	width:95%;
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
	    transition: color .15s
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
  
	<%@ include file="../admin/ad_top.jsp" %>
	<!-- 상단바 끝나는 부분 -->
	<br>
<br>
<br>
<div class="container">
	<div class="row justify-content-center align-items-center">
		<div class="col-lg-9 text-center">

			<table align="center" width=100% height="60%" class="table">
				<tr>
					<th class="color">제목</th>
					<td colspan="5" align="center">&nbsp;&nbsp;[${notice.cate}] ${notice.title }</td>
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
					<th style="vertical-align: middle;">이미지</th>
					<td colspan="5" align="center">
						<c:if test="${notice.nfile ne null}">
						<img src="${loadingPath }/${notice.nfile}" width="300" height="200">
						</c:if>
						<c:if test="${notice.nfile eq null}">
						&nbsp;&nbsp;없음
						</c:if>
					</td>
					<!-- 유효성검사할때에는 nfile, upload 상관없다. -->
				</tr>
				<tr>
					<th style="vertical-align: middle;">내용</th>
					<td colspan="5" height="300px" style="vertical-align: middle;"><pre>${notice.content }</pre></td>
				</tr>
			</table>
			<br>
			<br>
			<br>
	<form action="nlist.nt" method="get">
		<input type="hidden" name="pageNumber" value=${pageNumber }>
		<input class="btn btn-primary-hover-outline" type="button" value="수정" onclick="updateNotice(${notice.nno},${pageNumber })" >
		<input class="btn btn-primary-hover-outline" type="button" value="삭제" onclick="deleteNotice(${notice.nno},${pageNumber })">
		<input class="btn btn-primary-hover-outline" type="submit" value="목록보기">
	</form>
        </div>
      </div>
     </div>
<br><br><br>
	<%@ include file="../admin/ad_bottom.jsp" %>