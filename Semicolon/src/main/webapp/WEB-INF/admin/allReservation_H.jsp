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
     SEMICOLON(;)&nbsp; ADMIN-HRESERVATION page
</title>
</head>

<style>
		.section{
	padding-bottom:120px;
	}	
body {
	margin-top: 130px;
	
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

	.err {
		color: red;
		font-size: 8pt;
	}
	.form-check mt-3{
		float:left;
	}
	

		.reservation {
			padding: 24px 50px;
		}
		.card-header:first-child {
		    border-radius: 0.5rem 0.5rem 0 0;
		}
		.align-items-center {
		    align-items: center !important;
		}
		.justify-content-between {
		    justify-content: space-between !important;
		}
		.card-header {
		    padding: 1.5rem 1.5rem;
		    margin-bottom: 0;
		    background-color: transparent;
		    border-bottom: 0 solid #d9dee3;
		}
		.card-header:first-child {
		    border-radius: 0.5rem 0.5rem 0 0;
		    border-top-left-radius: 0.5rem;
		    border-top-right-radius: 0.5rem;
		    border-bottom-right-radius: 0px;
		    border-bottom-left-radius: 0px;
		}
		h1, h2, h3, h4, h5, h6 {
			font-family: "Work Sans", sans-serif;
			font-weight: 500;
		    line-height: 1.1;
		    color: #566a7f;
		}
		h4 {
			font-size: calc(1.2625rem + 0.15vw);
		}
		.card {
		    border: 0 solid #d9dee3;
		    border-top-color: rgb(217, 222, 227);
		    border-top-style: solid;
		    border-top-width: 0px;
		    border-right-color: rgb(217, 222, 227);
		    border-right-style: solid;
		    border-right-width: 0px;
		    border-bottom-color: rgb(217, 222, 227);
		    border-bottom-style: solid;
		    border-bottom-width: 0px;
		    border-left-color: rgb(217, 222, 227);
		    border-left-style: solid;
		    border-left-width: 0px;
		    border-image-source: initial;
		    border-image-slice: initial;
		    border-image-width: initial;
		    border-image-outset: initial;
		    border-image-repeat: initial;
		    border-radius: 0.5rem;
		    border-top-left-radius: 0.5rem;
		    border-top-right-radius: 0.5rem;
		    border-bottom-right-radius: 0.5rem;
		    border-bottom-left-radius: 0.5rem;
		    box-shadow: 0 0.125rem 0.25rem rgba(161, 172, 184, 0.4);
		}
		
		.right {
			text-align: right;
		}
		.reviewBtn {
			padding: 5px 20px;
		}
		.modal .btn-close {
		    background-color: #fff;
		    border-radius: 0.5rem;
		    opacity: 1;
		    padding: 0.635rem;
		    box-shadow: 0 0.125rem 0.25rem rgb(161 172 184 / 40%);
		    transition: all 0.23s ease 0.1s;
		    transform: translate(23px, -25px);
		}
		.modal-footer {
		    display: flex;
		    flex-wrap: wrap;
		    flex-shrink: 0;
		    align-items: center;
		    justify-content: flex-end;
		    padding: 1.25rem;
		    border-top: 0px solid #d9dee3;
		    border-bottom-right-radius: calc(0.5rem - 0px);
		    border-bottom-left-radius: calc(0.5rem - 0px);
		}
		.modalTable thead, tbody, tfoot, tr, td, th {
			border-color: inherit;
    		border-style: none;
    		border-width: 0;
		}
		.form-control {
		    font-size: 16px;
		    height: 40px;
		    padding-left: 15px;
		    padding-right: 15px;
		}
		.won {
			text-align: right;
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
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>H.Name</th>
                      <th>이메일</th>
                      <th>연락처</th>
                      <th>가입일</th>
                      <th>예약건수</th>
                      <th>순위</th>
                    </tr>
                  </thead>
                  <tbody class="table-border-bottom-0">
                  <c:forEach var="b" items="${hostb }" varStatus="i">
                    <tr>
                      <td>${i.count}</td>
                      <td>
                      	<a href="hlist.ad?hno=${b.hno}"><i class="fab fa-angular fa-lg text-danger me-3"></i>${b.name }</a></td>
                      <td>${b.email }</td>
                      <td>${b.phone }</td>
                      <td>
                      	<fmt:parseDate var="parseDate" value="${b.joindate}" pattern="yyyy-MM-dd"/>
                      	<fmt:formatDate var="host_joindate" value="${parseDate}" pattern="yyyy-MM-dd"/>
                      	${host_joindate }
                      </td>
                     <td>${b.rv_cnt }</td>
                     <td style="font-weight: bold;">${b.rank }</td>
                      </tr>
                    </c:forEach>
                    <!-- <tr>
                      <td colspan="7" align="right">합계: </td>
                    </tr> -->
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