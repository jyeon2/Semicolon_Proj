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

<title>SEMICOLON(;)&nbsp; THEME LIST page</title>
</head>

<style>
body {
	margin-top: 120px;
}

.section{
	padding-bottom:120px;
	}	
table {
	position : relative;
	top : 0px;
	left:0px;
	border-top: 0 solid #d9dee3;
    border-collapse: collapse;

}
th, td {
    border-bottom: 0 solid #d9dee3;
    padding: 10px;
    height:50px;
    font-size: 15px;
    align: center;
  }
  td{
  	vertical-align: middle;
  }

.col-lg-9{
		position : relative;
		left : -50px;
	}
	.form-check mt-3{
		float:left;
	}
	
</style>

<%@ include file="ad_top.jsp"%><br>
<!-- --------------------- -->

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 mb-5 mb-lg-0" data-aos="fade-up"
				data-aos-delay="100">
				<div class="contact-info">
					<div class="address mt-2">
						<i class="icon-add"></i>
						<h4 class="mb-2">
							<a href="addTheme.ad">테마 추가</a>
						</h4>
						<p>
							<br />

						</p>
					</div>

					<div class="open-hours mt-4">
						<i class="icon-list"></i>
						<h4 class="mb-2">
							<a href="themeList.ad">테마 목록</a>
						</h4>
						<p>
							<br />

						</p>
					</div>

					<div class="email mt-4">
						<i class="icon-add"></i>
						<h4 class="mb-2">
							<a href="addSubTheme.ad">서브테마 추가</a>
						</h4>
						<p>
							<br />

						</p>
					</div>

					<div class="phone mt-4">
						<i class="icon-list"></i>
						<h4 class="mb-2">
							<a href="subList.ad">서브테마 목록</a>
						</h4>
						<p>
							<br />

						</p>
					</div>
				</div>
			</div>
			
			<!-- Bootstrap Table with Caption -->
			<div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
 				<div class="table-responsive text-nowrap">
					<table class="table table-hover">
						<thead>
							<tr align="center">
							<th scope="col">번호</th>
							<th scope="col">테마 이름</th>
							<th scope="col">이미지</th>
							<th scope="col">설명</th>
							<th scope="col">수정/삭제</th>
						</tr>
						</thead>
					<tbody>
						<c:forEach var="th" items="${lists }">
							<tr>
								<td scope="row" align="center">${th.tno }</td>
								<td align="center">${th.name }</td>
								<td align="center"><img src="${fullpath}/${th.img }" width="80" height="80"></td>
								<td align="left">${th.contents }</td>
								<td align="right">
                         			<div class="dropdown">
                          				<button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                            			<i class="bx bx-dots-vertical-rounded"></i>
                          				</button>
                          			<div class="dropdown-menu">
                            		<a class="dropdown-item" href="updateTheme.ad?tno=${th.tno }">
                            		<i class="bx bx-edit-alt me-1"></i> 수정
                           			</a>
                            		<a class="dropdown-item" href="deleteTheme.ad?tno=${th.tno }"> 
                            		<i class="bx bx-trash me-1"></i> 삭제
                           			 </a>
                         			 </div>
                       				</div> 
								</td>
							</tr>
						</c:forEach>
					</tbody>
					</table>
 				</div>
			</div>
			<!-- Bootstrap Table with Caption -->
		</div>
	</div>
</div>

<!-- table start -->



<!-- table end -->


<br>
<%@ include file="ad_bottom.jsp"%>