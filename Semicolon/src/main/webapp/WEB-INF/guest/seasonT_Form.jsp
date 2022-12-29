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
    <link
      href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="resources/css/aos.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
	
	<!-- Fonts -->
	
	<!-- Icons. Uncomment required icon fonts -->
	
	<!-- Core CSS -->
	
	<!-- Vendors CSS -->
	
	<!-- Page CSS -->
	
	<!-- Helpers -->
	
	<!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
	<!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->

    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="resources/assetss/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="resources/assetss/lib/animate.css/animate.css" rel="stylesheet">
    <link href="resources/assetss/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="resources/assetss/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="resources/assetss/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="resources/assetss/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="resources/assetss/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="resources/assetss/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="resources/assetss/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="resources/assetss/css/style.css" rel="stylesheet">
	<title>SEMICOLON(;)&nbsp; SEASON_TICKET page</title>
	
	<style type="text/css">
		.font_color{
			 text-decoration: underline;
			 font-size: 16px;
		}
		
		body {
		    font-family: "Work Sans", sans-serif;
		    font-weight: 400;
		    font-size: 14px;
		    overflow-x: hidden;
		}
		a {
		    -webkit-transition: .3s all ease;
		    -o-transition: .3s all ease;
		    transition: .3s all ease;
		    text-decoration: none;
		}
	</style>
	
	<script>
		function check(guestInfo,price){
			if(guestInfo==""){
				alert("로그인이 필요한 항목입니다.")
				location.href="login.gt?destination=buyTicket";
			}
			else{
				var answer = confirm("결제하시겠습니까?")
				if(answer == true){
					location.href="buyTicket.gt?ticket_choice="+price;					
				}else{
					location.href="seasonT.gt";
				}
			}
		}
	</script>
	
	</head>
	<body>
		<%@ include file="header.jsp"%>
	
		<div
		  class="hero page-inner overlay"
		  style="background-image: url('resources/images/hero_bg_1.jpg')"
		>
		  <div class="container">
		    <div class="row justify-content-center align-items-center">
		      <div class="col-lg-9 text-center mt-5">
		        <h1 class="heading" data-aos="fade-up">정기권 결제</h1>
		
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
		              Season Ticket
		            </li>
		          </ol>
		        </nav>
		      </div>
		    </div>
		  </div>
		</div>
	
		<br>
		<br>
	
		<!-- Content wrapper -->
		<div class="content-wrapper">
			<!-- Content -->
	
			<div class="container-xxl flex-grow-1 container-p-y padding">
	
				<!-- Basic Layout & Basic with Icons -->
				<div class="row">
					<!-- Basic with Icons -->
					<div class="col-xxl">
						<div class="card mb-4">
						<!-- 시작 -->
						<section class="module">
							<div class="container">
								<div class="row multi-columns-row">
										<div>
										<span style="background-color: black; color: white;">※ 만원 단위 입니다 ※</span>
										</div>
									<div class="col-sm-6 col-md-3 col-lg-3">
										<div class="price-table font-alt"><h4>Light</h4>
											<div class="borderline"></div>
											<p class="price"><span>₩</span>10</p>
											<ul class="price-details">
												<li>결제 금액</li>
												<li class="font_color">9.5만원</li>
												<li></li>
												<li>정기권결제로</li>
												<li>많은 혜택을 누려보세요</li>
											</ul>
											<a class="btn btn-d btn-round" href="javascript:check('${guestInfo}',100000)">결제하기</a>
										</div>
									</div>
									<div class="col-sm-6 col-md-3 col-lg-3">
									 <div class="price-table font-alt"><h4>Basic</h4>
									 	<div class="borderline"></div><p class="price"><span>₩</span>30</p>
									 	<ul class="price-details">
									 		<li>결제 금액</li>
									 		<li class="font_color">27만원</li>
									 		<li></li>
											<li>정기권결제로</li>
											<li>많은 혜택을 누려보세요</li>
									 	</ul><a class="btn btn-d btn-round" href="javascript:check('${guestInfo }',300000)">결제하기</a>
									 </div>
									</div>
									<div class="col-sm-6 col-md-3 col-lg-3">
									 <div class="price-table font-alt"><h4>Advanced</h4>
									 <div class="borderline"></div><p class="price"><span>₩</span>50</p>
									 <ul class="price-details">
									 	<li>결제 금액</li>
									 	<li class="font_color">42만5천원</li>
									 	<li></li>
										<li>정기권결제로</li>
										<li>많은 혜택을 누려보세요</li>
									 </ul><a class="btn btn-d btn-round" href="javascript:check('${guestInfo }',500000)">결제하기</a>
									 </div>
									</div>
									<div class="col-sm-6 col-md-3 col-lg-3">
										<div class="price-table font-alt"><h4>Premiun</h4>
											<div class="borderline"></div><p class="price"><span>₩</span>100</p>
											<ul class="price-details">
												<li>결제 금액</li>
												<li class="font_color">80만원</li>
												 <li></li>
												<li>정기권결제로</li>
												<li>많은 혜택을 누려보세요</li>
											</ul><a class="btn btn-d btn-round" href="javascript:check('${guestInfo }',1000000)">결제하기</a>
										</div>
									</div>
								</div>
								<div class="row mt-40">
									<div class="col-sm-6 col-sm-offset-3 align-center">
									
									</div>
								</div>
							</div>
						</section>
						</div>
						
					</div>
				</div>
			</div>
			<!-- / Content -->
		</div>
	
	
	
		<br>
		<br>
		<%@ include file="footer.jsp"%>
		<!--  
	    JavaScripts
	    =============================================
	    -->
	    <script src="resources/assetss/lib/jquery/dist/jquery.js"></script>
	    <script src="resources/assetss/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	    <script src="resources/assetss/lib/wow/dist/wow.js"></script>
	    <script src="resources/assetss/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	    <script src="resources/assetss/lib/isotope/dist/isotope.pkgd.js"></script>
	    <script src="resources/assetss/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	    <script src="resources/assetss/lib/flexslider/jquery.flexslider.js"></script>
	    <script src="resources/assetss/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	    <script src="resources/assetss/lib/smoothscroll.js"></script>
	    <script src="resources/assetss/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	    <script src="resources/assetss/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	    <script src="resources/assetss/js/plugins.js"></script>
	    <script src="resources/assetss/js/main.js"></script>
	</body>
</html>