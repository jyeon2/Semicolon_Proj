<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />


<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="resources/css/tiny-slider.css" />
<link rel="stylesheet" href="resources/css/aos.css" />
<link rel="stylesheet" href="resources/css/style.css" />

<title>SEMICOLON(;)&nbsp; HOST NOTICE page</title>
</head>
<style>
body {
	margin-top: 130px;
	/*     overflow-x: hidden; */
}

.table {
	margin: 50px 0px 100px; 
	width: 70%;
	color: var(- -phoenix-table-color);
	vertical-align: top;
	border-color: #00000080;
	border-radius: 0.25rem;
}

.table>:not(caption)>*>* {
	padding: 1rem 0.5rem;
	background-color: #fff;
	border-width: 1px;
}

td {
	border: 1px solid #ced4da;
	height: 55px;
	text-align: center;
	vertical-align: middle;
}

th {
	width: 170px;
	height: 50px;
	border: 1px solid #ced4da;
	vertical-align: middle;
	background-color: #EAEAEA !important;
	text-align: center;
}
 .h40 {
      height: 40px;
      align-items : center;
   }
  .searchInput {
      width: 100%;
      height: 38px;
   }
   .form-select {
      width: 30%;
   }
   .btn {
      padding: 7px 20px;
   }
   .w100 {
      width: 100%;
   }
    .right {
      text-align: right; !important;
      top: 0;
      right: 0;
      display:inline-block;
      float: inherit;
   }
   a{
		color:#424242;
	
	}
  
</style>

<%@ include file="header.jsp"%>
<!-- 상단바 끝나는 부분 -->
<br>
<div class="container">
	<div class="row justify-content-center align-items-center">
		<div class="col-lg-9 text-center">
			<h1>
				<a href="hnlist.ht">NOTICE</a>
			</h1>
		</div>
		<table class="table table-bordered">
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<tbody>
				<c:forEach var="n" items="${lists }">
					<tr
						onclick="location.href='ndetail.nt?nno=${n.nno}&pageNumber=${pageInfo.pageNumber}'"
						style="cursor: hand">
						<td width=10%>${n.nno }</td>
						<td><a href="hndetail.ht?nno=${n.nno}&pageNumber=${pageInfo.pageNumber}">[${n.cate}]
								${n.title }</a>
						</td>
						<td width=25%>
							<fmt:formatDate value="${n.nt_date }" pattern="yyyy-MM-dd" /></td>
						<td width=15%>${n.n_readcount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- Bordered Table -->
		<br>
		<form action="hnlist.ht" method="post" align="center">
           <div class="right">
            <div class="navbar-nav-right d-flex align-items-center h40" id="navbar-collapse">
               <select id="defaultSelect" class="form-select" name="whatColumn">
                    <option value="">- 검색 -</option>
                    <option value="cate">카테고리</option>
                    <option value="title">제목</option>
                  
                 </select>
                 &nbsp;&nbsp;&nbsp;
                <!-- Search -->
                 <div class="navbar-nav align-items-center border h40">
                   <div class=" d-flex align-items-center">
                     &nbsp;&nbsp;&nbsp;
                     <i class="bx bx-search"></i>
                     <input type="text" class="form-control border-0 shadow-none padding-0 searchInput" name="keyword" placeholder="키워드 입력" aria-label="Search...">
                   </div>
                 </div>
                 <!-- /Search -->
                 &nbsp;&nbsp;&nbsp;
                   <input type="submit" class="btn btn-primary" value="검색">
             </div>
           </div>
         </form>
		<br>
		<div align="center">${pageInfo.pagingHtml }</div>
		<br><br><br><br><br>
	</div>
</div>

<%@ include file="footer.jsp"%>