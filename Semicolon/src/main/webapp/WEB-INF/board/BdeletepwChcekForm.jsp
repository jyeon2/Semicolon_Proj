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
      SEMICOLON &mdash; Free Bootstrap 5 Website Template by Untree.co
    </title>
  <style>
  	body{
  		margin-top:120px;
  		
  	
  	}
  	.bb{
  	
  		color:red;
  	}
  	
  	.btable{
		border-collapse:collapse;
		width : 400px;

	
  	}
  	tr,td,th{
		border : 2px solid;
		height : 55px;
		
	}
  </style>
  </head>
 
  <body>
  
   <c:if test="${admin != null || hostInfo.email == 'admin@a'}">
	<%@ include file="../admin/ad_top.jsp" %>
  </c:if>
  
  <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
	<%@ include file="../host/header.jsp" %>
  </c:if>
	<!-- 상단바 끝나는 부분 -->
	<br><br>
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center">
           <div class="col-lg-6 text-lg-end">
          </div>
            <h3>글 삭제</h3>
            <br><br>       
		<form action="bdelete.bo" method="post">
		<input type="hidden" name="bno" value="${bno }">
		<input type="hidden" name="pageNumber" value="${pageNumber }">
		<table align="center" class="btable">
		<tr>
			<th class="bb">비밀 번호를 입력해 주세요</th>
		</tr>
		<tr>
			<td>비밀 번호 : <input type="text" name="pw"></td>	
		</tr>
		<tr>
		<td align="center">
			<input type="submit" value="글삭제">&nbsp; &nbsp;
			<input type="button" value="목록" onclick="location.href='blist.bo?bno=${bno}&pageNumber=${pageNumber }'" >
		</td>
	</tr>
	</table>
	</form>
          </div>
        </div>
      </div>
<br><br><br>
<center>
${pageInfo.pagingHtml }
</center>
<br><br><br>
<c:if test="${admin != null || hostInfo.email == 'admin@a'}">
	<%@ include file="../admin/ad_bottom.jsp" %>
  </c:if>
  
  <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
	<%@ include file="../host/footer.jsp" %>
  </c:if>
