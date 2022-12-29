<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semicolon My_Page page</title>
	
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
    
    <style type="text/css">
    	img {
    		width: 33%;
    		heigth: 10%;
    		margin: 10px 0;
    	}
    </style>
    
    
</head>
<body>

<%@ include file="header.jsp" %>
<div
  class="hero page-inner overlay"
  style="background-image: url('resources/images/hero_bg_1.jpg')"
>
  <div class="container">
    <div class="row justify-content-center align-items-center">
      <div class="col-lg-9 text-center mt-5">
        <h1 class="heading" data-aos="fade-up">마이페이지</h1>

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
              My Page
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>


    <section class="features-1">
	<br><br>
      <div class="container">
        <div class="row">
          <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
            <div class="box-feature">
              <img src="https://cdn-icons-png.flaticon.com/512/1585/1585316.png">
              <h3 class="mb-3">회원 정보</h3>
              <p><a href="myProfile.gt" class="learn-more">Click</a></p>
            </div>
          </div>
          <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
            <div class="box-feature">
			  <img src="https://cdn-icons-png.flaticon.com/512/1077/1077873.png">
              <h3 class="mb-3">위시리스트</h3>
              <p><a href="myWishlist.gt" class="learn-more">Click</a></p>
            </div>
          </div>
          <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
            <div class="box-feature">
              <img src="https://cdn-icons-png.flaticon.com/512/489/489379.png">
              <h3 class="mb-3">예약 내역</h3>
              <p><a href="myReservation.gt" class="learn-more">Click</a></p>
            </div>
          </div>
          <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
            <div class="box-feature">
              <img src="https://cdn-icons-png.flaticon.com/512/5434/5434787.png">
              <h3 class="mb-3">리뷰 내역</h3>
              <p><a href="myReview.gt" class="learn-more">Click</a></p>
            </div>
          </div>
        </div>
      </div>
	<br><br>
    </section>
    
<%@ include file="footer.jsp" %>
   
</body>
