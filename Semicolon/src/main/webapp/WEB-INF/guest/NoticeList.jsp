<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	<link
	href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
	rel="stylesheet" />
	
	<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
	<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />
	
	<link rel="stylesheet" href="resources/css/tiny-slider.css" />
	<link rel="stylesheet" href="resources/css/aos.css" />
	<link rel="stylesheet" href="resources/css/style.css" />
	
	<link rel="stylesheet" href="resources/assets/vendor/fonts/boxicons.css" />
	
	<title>Semicolon Notice page</title>
    
	<style>
	table {
		margin: 20px 0px;
	}
	td{
		border: 1px solid #ced4da;
		height:50px;
		vertical-align: middle;
	}
	
	th{
		height:50px;
		border: 1px solid #ced4da;
		vertical-align: middle;
		background-color: #EAEAEA !important;
	}
	
	.title {
		text-align: left;
	}
	.padding-0 {
		padding: 0px 15px;
	}
	.h40 {
		height: 40px;
	}
	.searchInput {
		width: 100%;
		height: 38px;
	}
	.form-select {
		width: 30%;
	}
	.btn {
		padding: 8px 30px;
	}
	.w100 {
		width: 100%;
	}
	.right {
		text-align: right; !important;
		top: 0;
		right: 0;
		display:inline-block;
		float: right;
	}
	</style>
	
</head>
<body>

<%@ include file="header.jsp" %>
	<!-- 상단바 끝나는 부분 -->
<div
      class="hero page-inner overlay login"
      style="background-image: url('resources/images/hero_bg_1.jpg')"
    >
  <div class="container">
    <div class="row justify-content-center align-items-center">
      <div class="col-lg-9 text-center mt-5">
        <h1 class="heading" data-aos="fade-up">공지사항</h1>

        <nav
          aria-label="breadcrumb"
          data-aos="fade-up"
          data-aos-delay="200"
        >
          <ol class="breadcrumb text-center justify-content-center">
            <li class="breadcrumb-item"><a href="home.gt">Home</a></li>
            <li
              class="breadcrumb-item active text-white-50"
              aria-current="page"
            >
              Notice
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>
<br><br>

   <!-- Bordered Table -->
   <div class="container">
	<div class="row justify-content-center align-items-center">
		<div class="col-lg-10 text-center">
			<form action="gnlist.gt" method="post">
			  <div class="right">
				<div class="navbar-nav-right d-flex align-items-center h40" id="navbar-collapse">
					<select id="defaultSelect" class="form-select" name="whatColumn">
			           <option value="">- 검색 -</option>
			           <option value="cate">카테고리</option>
			           <option value="title">제목</option>
			           <option value="content">내용</option>
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
			<br><br>
                    <table class="table table-bordered">
                        <tr>
                          <th width="10%">번호</th>
                          <th width="50%">제목</th>
                          <th width="25%">작성일</th>
                          <th width="15%">조회수</th>
                        </tr>
                      <tbody>
                        <tbody>
                       		<c:forEach var="n" items="${lists }">
                          	 	<tr onclick="location.href='gndetail.gt?nno=${n.nno}&pageNumber=${pageInfo.pageNumber}'" style="cursor:hand">
                               		<td>${n.nno }</td>
                               		<td class="title"><a href="gndetail.gt?nno=${n.nno}&pageNumber=${pageInfo.pageNumber}">
                               			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>[${n.cate}]</b> ${n.title }</a>
                               		</td>
                               		<td width=25%>
                               			<fmt:formatDate value="${n.nt_date }" pattern="yyyy-MM-dd"/>
                              		</td>
                               		<td width=15%>${n.n_readcount }</td>
                           		</tr>
                        	</c:forEach>
                 		</tbody>
                      </tbody>
                    </table>
               <!-- Bordered Table -->
               
	<br><br>
	<div align="center">${pageInfo.pagingHtml }</div>
	<br><br><br>
	
		</div>
	</div>
</div>

<%@ include file="footer.jsp" %>
</body>