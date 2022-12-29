<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>
     SEMICOLON(;)&nbsp; BOARD page
    </title>
    
 	<style>
 	.p-4 {
    	padding: 1.5rem !important;
	}

	div {
    	display: block;
	}
  	body {
	  	margin-top:150px;
  	}
  	.table {
	    width: 67%;
	    margin:24px 24px 70px;
	    color: var(--phoenix-table-color);
	    vertical-align: top;
	    border-color: #00555573;
	}

	th {
	    display: table-cell;
	    vertical-align: inherit;
	    font-weight: bold;
	    text-align: -internal-center;
	}
	.table>:not(caption)>*>* {
	    padding: 1rem 0.5rem;
	    background-color: #fff;
	    border-bottom-width: 2px;
	    -webkit-box-shadow: inset 0 0 0 9999px var(--phoenix-table-accent-bg);
	    box-shadow: inset 0 0 0 9999px var(--phoenix-table-accent-bg);
	   
	}
	a{
		color:#424242;
	
	}
	.btn.btn-primary {
	    background: #424242;
	    color: #fff;
	    font-size:14px;
	    margin-right: 0px -12px;
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
      width: 25%;
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
   .m-2{
     padding: 15px 30px;
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
  
	<br>
	<div class="container">
        <div class="row justify-content-center align-items-center">
        <div class="col-lg-9 text-center">
           <div class="col-lg-6 text-lg-end">
          </div>
          <h1><a href="blist.bo">BOARD</a></h1>
          </div>
          <div class="container-fluid pt-4 px-5">
              <div class="row g-4">
                  <div class="col-sm-12 col-xl-12">
                      <div class="m-n2" align="right">
                          <button type="button" class="btn btn-primary m-2" onclick="location.href='bwrite.bo'">글쓰기</button>
                      </div>
                  </div>
              </div>
          </div>
	<table class="table table-hover">
	  <thead>
	    <tr>
	      <th scope="col" width="70">번호</th>
	      <th scope="col" style="color: #005555;">제목</th>
	      <th scope="col" width="100">작성자</th>
	      <th scope="col" width="130">작성일</th>
	      <th scope="col" width="75" align="center">조회수</th>
	    </tr>
	  </thead>
	  <tbody>
	  	<c:forEach var="b" items="${lists }" varStatus="i">
	    <tr>
	      <th scope="row">${b.bno }</th>
	      <th>
	        <c:if test="${b.re_level != 0 }">
				<img src="resources/images/white.jpg" width="${b.re_level*20}" height="15" >
				<img src="resources/images/re.png" height="14">
			</c:if>
			<a href="detail.bo?bno=${b.bno}&pageNumber=${pageInfo.pageNumber}">${b.title }</a>
		  </th>
	   	 <td>${b.writer }</td>
		 <td><fmt:formatDate value="${b.write_date }" pattern="yyyy-MM-dd"/></td>
		 <td align="center">${b.readcount }</td>
	    </tr>
	    </c:forEach>	
	  </tbody>
	</table>
	<br><br>
	<form action="blist.bo" method="post" align="center">
           <div class="right">
            <div class="navbar-nav-right d-flex align-items-center h40" id="navbar-collapse">
               <select id="defaultSelect" class="form-select" name="whatColumn">
                    <option value="">- 검색 -</option>
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

  <c:if test="${admin != null || hostInfo.email == 'admin@a'}">
	<%@ include file="../admin/ad_bottom.jsp" %>
  </c:if>
  
  <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
	<%@ include file="../host/footer.jsp" %>
  </c:if>
    
    </body>
</html>
           