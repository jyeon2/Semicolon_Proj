<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
	function updateBoard(bno,bemail,pageNumber,pw){
		location.href="bupdate.bo?bno="+bno+"&email="+bemail+"&pageNumber="+pageNumber;
	}
	function deleteBoard(bno,pageNumber){
		location.href="bdelete.bo?bno="+bno+"&pageNumber="+pageNumber;
	}
	function replyBoard(ref,re_step,re_level,pageNumber){
		location.href="breply.bo?ref="+ref+"&re_step="+re_step+"&re_level="+re_level+"&pageNumber="+pageNumber;
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
     SEMICOLON(;)&nbsp; BOARD DETAIL page
    </title>
	<style>
 body {
	margin-top: 120px;
}
.table{
	border-top: 2px solid black;
	width:70%;
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
.col-lg-8 {
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
  </head>
  
  <body>
  <c:if test="${admin != null || hostInfo.email == 'admin@a'}">
	<%@ include file="../admin/ad_top.jsp" %>
  </c:if>
  
  <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
	<%@ include file="../host/header.jsp" %>
  </c:if>
  <!-- 상단바 끝나는 부분 -->
  
	<br><br><br>
      <div class="container">
	<div class="row justify-content-center align-items-center">
		<div class="col-lg-8 text-center">

			<table align="center" width=90% height="60%" class="table">
				<tr>
					<th class="color">제목</th>
					<td colspan="5" align="center">&nbsp;&nbsp;${bee.title }</td>
				</tr>
				<tr>
					<th width="60">작성날짜</th>
					<fmt:parseDate var="date" value="${bee.write_date}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="nt_date" value="${date }" pattern="yyyy-MM-dd"/>
					<td>&nbsp;&nbsp;${nt_date}</td>
					<th width="60">작성자</th>
					<td>&nbsp;&nbsp;${bee.writer}</td>
					<th width="60">조회수</th>
					<td>&nbsp;&nbsp;${bee.readcount }</td>
				</tr>
				<tr>
					<th style="vertical-align: middle;">내용</th>
					<td colspan="5" height="300px" style="vertical-align: middle;"><pre>&nbsp;&nbsp;${bee.content }</pre></td>
				</tr>
			</table>
	<br><br><br>
	<form action="blist.bo" method="get">
		<input type="hidden" name="pageNumber" value=${pageNumber }>
            <input class="btn btn-primary-hover-outline" type="button" value="답글 쓰기" onclick="replyBoard(${bee.ref},${bee.re_step},${bee.re_level},${pageNumber})">
            <input class="btn btn-primary-hover-outline" type="button" value="수정" onclick="updateBoard(${bee.bno},'${bee.email}',${pageNumber },'${bee.pw }')" >
            <input class="btn btn-primary-hover-outline" type="button" value="삭제" onclick="deleteBoard(${bee.bno},${pageNumber })">
            <input class="btn btn-primary-hover-outline" type="submit" value="목록보기">
         </form>
          </div>
        </div>
      </div>


<br><br><br>
<div align="center">${pageInfo.pagingHtml }</div>
<br><br><br>
  <c:if test="${admin != null || hostInfo.email == 'admin@a'}">
	<%@ include file="../admin/ad_bottom.jsp" %>
  </c:if>
  
  <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
	<%@ include file="../host/footer.jsp" %>
  </c:if>
    </body>
</html>