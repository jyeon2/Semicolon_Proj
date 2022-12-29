<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

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
        <a href="home.ht" class="logo m-0 float-start">HOST</a>

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
