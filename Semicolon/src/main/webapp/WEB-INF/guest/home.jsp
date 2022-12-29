<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	rel="stylesheet" />

<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="resources/css/tiny-slider.css" />
<link rel="stylesheet" href="resources/css/aos.css" />
<link rel="stylesheet" href="resources/css/style.css" />

<title>SEMICOLON(;)&nbsp; HOMEPAGE</title>
</head>

<style type="text/css">
	
	.img-fluid2 {
	   max-width:100%;
	   width: 500px;
	     height: 500px;
	}
	img {
          width: 33%;
          heigth: 10%;
          margin: 10px 0;
       }
    .star-ratings {
	color: #aaa9a9;
	position: relative;
	unicode-bidi: bidi-override;
	width: max-content;
	-webkit-text-fill-color: transparent; /* 덮어써지는 색깔 */
	-webkit-text-stroke-color: #2b2a29;
	justify-content: center;
	
	}

	.star-ratings-fill {
	color: #ffc107;
	padding: 0;
	position: absolute;
	z-index: 1;
	display: flex;
	top: 0;
	left: 0;
	overflow: hidden;
	-webkit-text-fill-color: #ffc107;
	}

	.star-ratings-base {
	z-index: 0;
	padding: 0;
	}
	
	.sec-testimonials {
  	padding-bottom: 8rem;
 	background-color: rgba(0, 32, 74, 0.05);
  	 }
</style>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
/* function initMap() {
	
	  var seoul = { lat: 37.5642135 ,lng: 127.0016985 };
	  map = new google.maps.Map( document.getElementById('map'), {
	      zoom: 12,
	      center: seoul
	    });

	  new google.maps.Marker({
	    position: seoul,
	    map: map,
	    label: "서울 중심 좌표"
	  });
} */
$(document).ready(function(){
	
	$.ajax({
		url : "allAddress.gt",
		success : function(data){
			//alert("data"+data);
			initMap(data);
		},
		error : function(){
			alert("주소가져오기 실패")
		}
		
	});//ajax
	initMap();
})//ready

function initMap(data) {
   // alert("initMap 진입"+data)

	if(data==""){
		//alert("data null임")
	}
    var mapOptions = {
                        zoom: 7, // 지도를 띄웠을 때의 줌 크기
                        mapTypeId: google.maps.MapTypeId.ROADMAP
                    };
     
     
    var map = new google.maps.Map(document.getElementById("map"), // div의 id과 값이 같아야 함.
                                mapOptions);
     
    var size_x = 40; // 마커로 사용할 이미지의 가로 크기
    var size_y = 40; // 마커로 사용할 이미지의 세로 크기
 
    // 마커로 사용할 이미지 주소
    var image = new google.maps.MarkerImage( '주소 여기에 기입!',
                                                new google.maps.Size(size_x, size_y),
                                                '',
                                                '',
                                                new google.maps.Size(size_x, size_y));
     
    // Geocoding *****************************************************

    
    //var address = fulladdress; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
    var marker = null;
    var geocoder = new google.maps.Geocoder();
    
    var arr = data.split(',');
    var i,result;
    for(i=0;i<arr.length;i++){
	    address = arr[i];
    	//alert("address:"+address)
    geocoder.geocode( { 'address': address}, function(results, status) {
		if (status == google.maps.GeocoderStatus.OK) {
        	
            map.setCenter(results[0].geometry.location);
            marker = new google.maps.Marker({
                            map: map,
                            //icon: image, // 마커로 사용할 이미지(변수)
                            // title : '', 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀
                            position: results[0].geometry.location
                        });

            //var content = "한밭도서관<br/><br/>Tel: 042-580-4114"; // 말풍선 안에 들어갈 내용
         
            // 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
            //var infowindow = new google.maps.InfoWindow({ content: content});
            google.maps.event.addListener(marker, "click", function() {infowindow.open(map,marker);});
        } else {
            //alert("Geocode was not successful for the following reason: " + status);
        }
    });
    
	}//for문
	
    // Geocoding // *****************************************************
     
}
//google.maps.event.addDomListener(window, 'load', initialize);
</script>
<body onload="init()">
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

	<div class="hero">
		<div class="hero-slide">
			<div class="img overlay"
				style="background-image: url('resources/images/bg_1.jpg')"></div>
			<div class="img overlay"
				style="background-image: url('resources/images/bg_2.jpg')"></div>
			<div class="img overlay"
				style="background-image: url('resources/images/bg_3.jpg')"></div>
			<div class="img overlay"
				style="background-image: url('resources/images/bg_4.jpg')"></div>
			<div class="img overlay"
				style="background-image: url('resources/images/bg_5.jpg')"></div>
		</div>

		<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-lg-9 text-center">
				<h2 class="heading" data-aos="fade-up">
				원하는 숙소에 대해 검색해보세요
				</h2>
				<form action="search.gt"
					class="narrow-w form-search d-flex align-items-stretch mb-3"
					data-aos="fade-up" data-aos-delay="200">
					<input type="text" class="form-control px-4"
						placeholder="                                         ex)숲"
						name="keyword" />
					<button type="submit" class="btn btn-primary">Search</button>
				</form>
			</div>
		</div>
	  </div>
    </div>
	<div class="section section-4 bg-light">
      <div class="container">
         <div class="row justify-content-center text-center mb-5">
            <div class="col-lg-5">
               <h3>세미콜론에 오신 것을 환영합니다</h3><br>
               <p class="text-black-50">
                세미콜론(;)은 잠시 쉬어감을 의미합니다. <br>
               세미콜론이 문장 안에서의 쉼, 뒤 이어올 다음 문장을 이어주듯<br>
               바쁜 일상 속 지친 우리를 위해 잠시나마 숨을 고를 순간이 필요합니다.<br>
               세미콜론과 함께 스스로에게 일상의 여유를 선물해 보는 건 어떨까요?<br><br>
               잠시 쉬어가, 앞으로의 긴 여정을 위해.</p>
            </div>
         </div>
      </div>
   </div>
	<section class="features-1">
		<div class="container">
			<div class="row">
				<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
					<div class="box-feature">
						<img src=" https://cdn-icons-png.flaticon.com/512/4283/4283261.png">
						<h3 class="mb-3">호스트 되기</h3>
						<p>누구나 호스트가 되어볼 수 있습니다!</p><br>
						<p>
							<a href="login.ht" class="learn-more">read more</a>
						</p>
					</div>
				</div>
				<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
					<div class="box-feature">
						<img src=" https://cdn-icons-png.flaticon.com/512/2839/2839261.png">
						<h3 class="mb-3">숙소 리뷰 / 평점</h3>
						<p>세미콜론을 이용한 게스트들의 리뷰</p><br>
						<p>
							<a href="#review" class="learn-more">read more</a>
						</p>
					</div>
				</div>
				<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
					<div class="box-feature">
						<img src=" https://cdn-icons-png.flaticon.com/512/5455/5455911.png">	
						<h3 class="mb-3">정기권</h3>
						<p>여행러들을 위한 혜택, <br>
						할인된 가격으로 만나보실 수 있습니다</p>
						<p>
							<a href="seasonT.gt" class="learn-more">read more</a>
						</p>
					</div>
				</div>
				<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
					<div class="box-feature">
						<img src=" https://cdn-icons-png.flaticon.com/512/3233/3233514.png">
						<h3 class="mb-3">공지사항</h3>
						<p>세미콜론 이용에 필요한 정보를<br>
						 공지사항에서 확인하세요</p>
						<p>
							<a href="gnlist.gt" class="learn-more">read more</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="section">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-lg-6">
					<h4 class="font-weight-bold text-primary heading">추천 숙소</h4>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="property-slider-wrap">
						<div class="property-slider">
                  
                   <c:forEach var="h" items="${allhouseLists }">
                     <!-- .item 시작-->
                     <div class="property-item">
                        <%-- <a href="detail.gt?house_no=${h.house_no }" class="img"> 
                        <img src="${fullpath}/${h.photo }" alt="Image" class="img-fluid2" />
                        </a> --%>
                        
                        <!-- 나경 추가 부분 -->

                        <!-- 이미지 시작 -->
                        <a href="detail.gt?house_no=${h.house_no }" class="img">
                              <!-- 슬라이드 쇼 -->
                                <!--가로-->
                                <%String imgurl = request.getContextPath()+"/resources/house_images/";  %>
                              <c:set var="image" value="${fn:split(h.photo ,',')}"></c:set>
                              <c:forEach var="img" items="${image}" varStatus="status">
                                 <c:if test="${status.count eq 1}">
                                    <img src="<%=imgurl %>${img }" alt="Image" class="img-fluid2">
                                 </c:if>
                           </c:forEach>
                          </a>
                        <!-- 나경 추가 부분 -->

                        <div class="property-content">
                           <div class="price mb-2">
                              <span>￦<fmt:formatNumber value="${h.price }" pattern="#,###"/></span>
                           </div>
                           <div>
                              <span class="d-block mb-2 text-black-50">${h.address}</span>
                              <span class="city d-block mb-3">${h.name }</span>


                              <a href="detail.gt?house_no=${h.house_no }"
                                 class="btn btn-primary py-2 px-3">숙소 보기</a>
                           </div>
                        </div>
                     </div>
                     <!-- .item 끝-->
                     </c:forEach>

                  </div>

						<div id="property-nav" class="controls" tabindex="0"
							aria-label="Carousel Navigation">
							<span class="prev" data-controls="prev" aria-controls="property"
								tabindex="-1">Prev</span> <span class="next"
								data-controls="next" aria-controls="property" tabindex="-1">Next</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<a name="review"></a>
	<div class="section sec-testimonials">
		<div class="container">
			<div class="row mb-5 align-items-center">
				<div class="col-md-6">
				
					<h4 class="font-weight-bold heading text-primary mb-4 mb-md-0">
						리뷰 및 평점</h4>
				</div>
				<div class="col-md-6 text-md-end">
					<div id="testimonial-nav">
						<span class="prev" data-controls="prev">Prev</span> <span
							class="next" data-controls="next">Next</span>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-4"></div>
			</div>
			<div class="testimonial-slider-wrap">
				<div class="testimonial-slider">
				
				<c:forEach var="r" items="${reviewList }">
				<!-- 리뷰 시작 -->
				<div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
					<div class="box-feature">
						<div class="testimonial"><br>
							<h3 class="h5 text-primary mb-4">숙소) ${r.name }</h3>

							<div class="star-ratings">
									<div class="star-ratings-fill" style="width: ${r.total * 20 * 1.4}%">
										<span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span>
									</div>
									<div class="star-ratings-base">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
									<br>
								</div>
								
							<blockquote>
								<p>&ldquo; ${r.text } &rdquo;</p>
							</blockquote>
							<p class="text-black-50">${r.gname }</p>
						</div>
					</div>
					</div>
					<!-- 리뷰 끝 -->
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<!-- 지도 시작 -->
	
	<div class="section">
      <div class="row justify-content-center footer-cta" data-aos="fade-up">
         <div class="main_content">
        	<div id="map" style="width:100%; height: 60vh;"></div>
        	<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1__5iJFWWmmXi136vKe3MjSH9JKaS80g&region=kr"></script>	
        </div>
        <!-- /.col-lg-7 -->
      </div>
      <!-- /.row -->
    </div>
<!-- 지도 끝 -->
	<div class="site-footer">
      <div class="container">
         <div class="row">
            <div class="col-lg-4">
               <div class="widget">
                  <h3>Contact</h3>
                  <address>서울 마포구 신촌로 176 중앙빌딩 5층,<br> 중앙정보처리학원</address>
                  <ul class="list-unstyled links">
                     <li><u>TEL: 02-561-1911</u></li>
                     <li><u>FAX: 02-393-9218</u></li>
                     <li><u>info@semicolon.com</u>
                     </li>
                  </ul>
               </div>
               <!-- /.widget -->
            </div>
         
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
               <div class="widget">
                  <h3>Links</h3>
                  <ul class="list-unstyled links">
                     <li><a href="#">홈페이지</a></li>
                     <li><a href="login.gt">로그인</a></li>
                     <li><a href="theme.gt">숙소</a></li>
                  </ul>

                  <ul class="list-unstyled social">
                     <li><a href="https://www.instagram.com/""><span class="icon-instagram"></span></a></li>
                     <li><a href="https://twitter.com/?lang=ko"><span class="icon-twitter"></span></a></li>
                     <li><a href="https://www.facebook.com/"><span class="icon-facebook"></span></a></li>
                     <li><a href="https://www.google.co.kr/"><span class="icon-google"></span></a></li>
                     <li><a href="https://www.youtube.com/"><span class="icon-youtube"></span></a></li>
                     <li><a href="https://www.github.com/"><span class="icon-git"></span></a></li>
                  </ul>
               </div>
               <!-- /.widget -->
            </div>
            <!-- /.col-lg-4 -->
            
            <!-- /.col-lg-4 -->
            <div class="col-lg-4">
               <div class="widget">
                  <h3>About Us</h3>
                  <ul class="list-unstyled float-start links">
                     <li>홈페이지 제작</li>
                  </ul>
                  <ul class="list-unstyled float-start links">
                     <li><i>곽은정</i></li>
                     <li><i>김나경</i></li>
                     <li><i>이혜린</i></li>
                     <li><i>양지현</i></li>
                  </ul>
               </div>
               <!-- /.widget -->
            </div>
            
         </div>
         <!-- /.row -->

         <div class="row mt-5">
            <div class="col-12 text-center">
               <!-- 
              **==========
              NOTE: 
              Please don't remove this copyright link unless you buy the license here https://untree.co/license/  
              **==========
            -->

               <p>
                  Copyright &copy;
                  <script>
                     document.write(new Date().getFullYear());
                  </script>
                  . All Rights Reserved. &mdash; Designed with love by <a
                     href="https://untree.co">Untree.co</a>
                  <!-- License information: https://untree.co/license/ -->
               </p>
               <div>
                  Distributed by <a href="https://themewagon.com/" target="_blank">themewagon</a>
               </div>
            </div>
         </div>
      </div>
      <!-- /.container -->
   </div>
   <!-- /.site-footer -->

	<!-- Preloader -->
	<div id="overlayer"></div>
	<div class="loader">
		<div class="spinner-border" role="status">
			<span class="visually-hidden">Loading...</span>
		</div>
	</div>

	<script src="resources/js/bootstrap.bundle.min.js"></script>
	<script src="resources/js/tiny-slider.js"></script>
	<script src="resources/js/aos.js"></script>
	<script src="resources/js/navbar.js"></script>
	<script src="resources/js/counter.js"></script>
	<script src="resources/js/custom.js"></script>
	
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</body>
</html>

