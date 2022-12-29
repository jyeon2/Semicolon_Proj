<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>

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
            <a href="home.gt" class="logo m-0 float-start">SEMICOLON(;)</a>

            <ul
               class="js-clone-nav d-none d-lg-inline-block text-start site-menu float-end">
               <c:if test="${admin.email != 'admin@a'}">
                  <li class="active"><a href="home.gt">홈</a></li>
               </c:if>
               <c:if test="${admin.email == 'admin@a'}">
                  <li class="has-children"><a href="home.gt">홈</a>
                     <ul class="dropdown">
                        <li><a href="home.gt">Guest</a></li>
                        <li><a href="home.ht">Host</a></li>
                        <li><a href="home.ad">Admin</a></li>
                     </ul></li>
               </c:if>
               <li class="has-children"><a href="theme.gt">테마</a>
                  <ul class="dropdown">
                     <c:forEach var="th" items="${themeLists }">
                     <li class="has-children"><a href="theme.gt?name=${th.name }">${th.name }</a>
                        <ul class="dropdown">
                        <c:forEach var="subth" items="${subthemeLists }">
                        <c:if test="${fn:contains(th.name,subth.theme_cate) }">
                        <li><a href="subtheme.gt?name=${subth.name }">${subth.name }</a></li>
                        </c:if>
                        </c:forEach>
                           
                        </ul></li>
                     </c:forEach>
                  </ul></li>
                  <li><a href="seasonT.gt">정기권</a></li>
               <li><a href="gnlist.gt">공지사항</a></li>
               <c:if test="${guestInfo == null}">
                  <li class="has-children"><a href="login.gt">로그인</a>
                     <ul class="dropdown">
                        <li><a href="login.gt">게스트</a></li>
                        <li><a href="login.ht">호스트</a></li>
                     </ul></li>
               </c:if>
               <c:if test="${guestInfo != null || admin != null}">
                  <li><a href="logout.gt">로그아웃</a></li>
                  <li><a href="mypage.gt">마이페이지</a></li>
               </c:if>
            </ul>

            <a href="#"
               class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
               data-toggle="collapse" data-target="#main-navbar"> <span></span>
            </a>
         </div>
      </div>
   </div>
</nav>