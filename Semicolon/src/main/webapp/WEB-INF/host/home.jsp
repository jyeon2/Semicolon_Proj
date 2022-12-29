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
      Host HOME page
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
            <a href="home.gt" class="logo m-0 float-start">HOST</a>

            <ul
              class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end"
            >
              <c:if test="${admin.email != 'admin@a'}">
              	  <li class="active"><a href="home.ht">홈</a></li>
              </c:if>
              <c:if test="${admin.email == 'admin@a'}">
	              <li class="has-children">
	                <a href="home.ht">홈</a>
	                <ul class="dropdown">
	                  <li><a href="home.gt">Guest</a></li>
	                  <li><a href="home.ht">Host</a></li>
	                  <li><a href="home.ad">Admin</a></li>
	                </ul>
	              </li>
              </c:if>
              <li><a href="addition.ht">숙소관리</a></li>
              <li class="has-children">
                <a href="#">커뮤니티</a>
                <ul class="dropdown">
                  <li><a href="hnlist.ht">공지</a></li>
                  <li><a href="blist.bo">소담소담</a></li>
                </ul>
              </li>
           
	          <c:if test="${hostInfo != null || admin != null}">
	          	  <li><a href="logout.ht">로그아웃</a></li>
	          	  <li><a href="mypage.ht">마이페이지</a></li>
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
            Welcome to the SEMICOLON; HOST Page !
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
    