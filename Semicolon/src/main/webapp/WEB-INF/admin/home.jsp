<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
     SEMICOLON(;)&nbsp; ADMIN HOME page
    </title>
  </head>
  <body>
    <div class="site-mobile-menu site-navbar-target">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close">
          <span class="icofont-close js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>

    <nav class="site-nav">
      <div class="container">
        <div class="menu-bg-wrap">
          <div class="site-navigation">
            <a href="home.ad" class="logo m-0 float-start">Admin</a>

            <ul
              class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end"
            >
              <li class="has-children">
                <a href="home.ad">홈</a>
                <ul class="dropdown">
                  <li><a href="home.gt">Guest</a></li>
                  <li><a href="home.ht">Host</a></li>
                </ul>
              </li>
              <li class="has-children">
                <a href="#">관리</a>
                <ul class="dropdown">
                  <li><a href="addition.ad">테마</a></li>
                  <li><a href="coupon.ad">쿠폰</a></li>
                </ul>
              </li>
              <li><a href="allRHost.ad">예약</a></li>
              <li class="has-children">
                <a href="">통계</a>
                <ul class="dropdown">
                  <li><a href="graph.ad">가입자수</a></li>
                  <li><a href="graphTheme.ad">테마별 숙소개수</a></li>
                </ul>
              </li>
             <li class="has-children">
                <a href="#">커뮤니티</a>
                <ul class="dropdown">
                  <li><a href="nlist.nt">공지</a></li>
                  <li><a href="blist.bo">소담소담</a></li>
                </ul>
              </li>
              <%-- 
              admin에서 로그인하기 없애기
              <c:if test="${admin == null}">
		        <li><a href="login.gt">로그인</a></li>
		      </c:if>
		      --%>
		      <c:if test="${admin != null}">
		       	  <li><a href="logout.gt">로그아웃</a></li>
		       </c:if>
              
            </ul>

            <a
              href="#"
              class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
              data-toggle="collapse"
              data-target="#main-navbar"
            >
              <span></span>
            </a>
          </div>
        </div>
      </div>
    </nav>

  <div class="hero">
      <div class="hero-slide">
        <div
          class="img overlay"
          style="background-image: url('resources/images/bg_1.jpg')"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('resources/images/bg_2.jpg')"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('resources/images/bg_3.jpg')"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('resources/images/bg_4.jpg')"
        ></div>
        <div
          class="img overlay"
          style="background-image: url('resources/images/bg_5.jpg')"
        ></div>
      </div>  
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center">
            <h1 class="heading" data-aos="fade-up">
           		관리자 페이지
            </h1>
        </div>
    </div>
  </div>

      
    </div>
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <script src="resources/js/tiny-slider.js"></script>
    <script src="resources/js/aos.js"></script>
    <script src="resources/js/navbar.js"></script>
    <script src="resources/js/counter.js"></script>
    <script src="resources/js/custom.js"></script>
  </body>
</html>
    
