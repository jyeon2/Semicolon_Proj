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

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.5.1-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.5.1-beta/css/bootstrap.min.css"></link>

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />


<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="resources/css/tiny-slider.css" />
<link rel="stylesheet" href="resources/css/aos.css" />
<link rel="stylesheet" href="resources/css/style.css" />



<title>Semicolon HOST Reservation page</title>
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

	.form-check mt-3{
		float:left;
	}

</style>

<%@ include file="header.jsp"%><br>
<!-- --------------------- -->
                      <!-- Table within card -->
  <div class="section">
	<div class="container">
	<div class="col-lg-12" data-aos="fade-up" data-aos-delay="200">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>NO</th>
                      <th>예약자</th>
                      <th>이메일</th> 
                      <th>숙소명</th>
                      <th>숙소위치</th>
                      <th>테마(Main-Sub)</th>
                      <th>머무는 기간</th>
                      <th>총 인원수</th>
                      <th>지불 방법</th>
                      <th>총 금액</th>
                    </tr>
                  </thead>
                  <tbody class="table-border-bottom-0">
                  <c:forEach var="rh" items="${rhList}" varStatus="i">
                    <tr>
                      <td>${i.count}</td>
                   	  <td style="font-weight: bold;">${rh.gname }</td>
            		  <td>${rh.email }</td> 
                      <td>${rh.name}</td>
                      <td>${rh.city}<br> ${rh.street}</td>
                      <td>${rh.tname} / ${rh.sname }</td>
                      <td>
                      	<fmt:parseDate var="parseDate" value="${rh.checkin }" pattern="yyyy-MM-dd"/>
                      	<fmt:formatDate var="checkIn" value="${parseDate}" pattern="yyyy-MM-dd"/>
                      	<fmt:parseDate var="parseDate" value="${rh.checkout }" pattern="yyyy-MM-dd"/>
                      	<fmt:formatDate var="checkOut" value="${parseDate}" pattern="yyyy-MM-dd"/>
                      	${checkIn }
                      	<br> ~ ${checkOut}
                      </td>
                   	  <td>${rh.adult+rh.kid} &nbsp;(유아:${rh.kid})</td><!-- 총인원수임 -->
                   	  <td>${rh.wpay}</td>
                   	  <td style="color: #dc3545; font-weight: bold;"><fmt:formatNumber value="${rh.totalPrice}" pattern="#,###"/>원</td>
                    </tr>
                   </c:forEach>
                  </tbody>
                </table>
              </div>
              <!--/ Table within card -->
			</div>
		</div>	
<!-- /.untree_co-section -->

<!-- --------------------- -->
<br><%@ include file="footer.jsp"%><br>