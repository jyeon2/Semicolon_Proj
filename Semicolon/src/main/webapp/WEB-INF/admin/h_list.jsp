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

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />


<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="resources/css/tiny-slider.css" />
<link rel="stylesheet" href="resources/css/aos.css" />
<link rel="stylesheet" href="resources/css/style.css" />

<title>
   SEMICOLON(;)&nbsp; ADMIN-HList page
</title>
</head>

<style>
	.section{
	padding-bottom:120px;
	}	
	body {
		margin-top: 120px;
		font-style : "Public Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", 
		"Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
	}
	th{
		color : #566a7f;
		text-transform: uppercase;
    	font-size: .95rem;
    	letter-spacing: 1px;
    	font-weight: 600;
    	line-height:1.53;
	}
	td{
		color : color: #697a8d;
		text-transform: uppercase;
    	
    	color-scheme: light;
    	font-size:0.9375rem;
    	font-weight:400;
    	line-height:1.53;
    	-webkit-text-size-adjust: 100%;
    	-webkit-tap-highlight-color: rgba(67,89,113,0);
	}

	.err {
		color: red;
		font-size: 5pt;
	}
	.form-check mt-3{
		float:left;
	}
	.col-lg-9{
		position : relative;
		left : -50px;
	}
	
</style>
 <body>
 
 <%@ include file="ad_top.jsp" %><br>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 mb-5 mb-lg-0" data-aos="fade-up"
				data-aos-delay="100">
				<div class="contact-info">
					<div class="address mt-2">
					
						<i class="icon-list-ol"></i>
						<h4 class="mb-2">
							<a href="allRHost.ad">HOST 정보</a>
						</h4>
						<p>
							<br/>

						</p>
					</div>

					<div class="open-hours mt-4">
						<i class="icon-money"></i>
						<h4 class="mb-2">
							<a href="allRGuest.ad">GUEST 예약현황</a> <!-- orders select * from  -->
						</h4>
						<p>
							<br/>

						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-9" data-aos="fade-up" data-aos-delay="200">
			
                      <!-- Table within card -->
                      
              <div class="table-responsive text-nowrap">
                <table class="table card-table">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>숙소이름</th>
                      <th>카테고리</th>
                      <th>등록날짜</th>
                      <th>예약건수</th>
                    </tr>
                  </thead>
                  <tbody class="table-border-bottom-0">
                  <c:forEach varStatus="i" var="lists" items="${all_lists }">
                    <tr>
                      <td>${i.count }</td>
                      <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${lists.name }</td>
                      <td>${lists.tname }-${lists.sname }</td>
                      <td>
                      	<fmt:parseDate var="parseDate" value="${lists.house_date}" pattern="yyyy-MM-dd"/>
                      	<fmt:formatDate var="house_date" value="${parseDate}" pattern="yyyy-MM-dd"/>
                      	${house_date }
                      </td>
                      <td style="font-weight: bold;">${lists.cnt }</td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
              <!--/ Table within card -->
                    
			</div>
		</div>	
	</div>
</div>
<!-- /.untree_co-section -->



<%@ include file="ad_bottom.jsp" %>
	
 </body>