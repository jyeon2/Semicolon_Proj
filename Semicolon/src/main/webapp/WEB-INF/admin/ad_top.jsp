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