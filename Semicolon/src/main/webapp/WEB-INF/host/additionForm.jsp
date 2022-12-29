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

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    

    <link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="resources/css/aos.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>
     SEMICOLON(;)&nbsp; HOST page
    </title>
  </head>
  
  <style>
  
  	body{
  		margin-top : 130px;
  	}	
  </style>
<body>
<%@ include file="header.jsp" %><br>
    <!-- --------------------- -->
     <section class="features-1">
      <div class="container">
        <div class="row">
          <div class="col-6 col-lg-4" data-aos="fade-up" data-aos-delay="300">
            <div class="box-feature">
              <span class="flaticon-house"></span>
              <h3 class="mb-3">숙소 추가</h3>
              <p><a href="addHouse.ht" class="learn-more">Click</a></p>
            </div>
          </div>
          <div class="col-6 col-lg-4" data-aos="fade-up" data-aos-delay="500">
            <div class="box-feature">
              <span class="flaticon-building"></span>
              <h3 class="mb-3">숙소 목록</h3>
              <p><a href="hlist.ht" class="learn-more">Click</a></p>
            </div>
          </div>
          <div class="col-6 col-lg-4" data-aos="fade-up" data-aos-delay="400">
            <div class="box-feature">
              <span class="flaticon-house-3"></span>
              <h3 class="mb-3">예약 관리</h3>
              <p><a href="reservation.ht" class="learn-more">Click</a></p>
            </div>
          </div>
        </div>
      </div>
    </section>
 <br><br>
<%@ include file="footer.jsp" %> 
</body>


    