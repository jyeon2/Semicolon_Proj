<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOST_FINDID page</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="resources/css/vendors/bootstrap-icons/bootstrap-icons.css">
	
	<link rel="stylesheet" href="resources/css/bootstrap-login.css" />
	<link rel="stylesheet" href="resources/css/app.css" />
	
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
    
    <link rel="stylesheet" href="resources/assets/vendor/fonts/boxicons.css" />
    
    <style type="text/css">
    	.login {
    		height: 0px;
    	}
    	.center {
    		margin: 0 auto;
    	}
    	.center2 {
    		text-align: center;
    	}
    	.border_style {
		    width: 100%;
		    display: block;
		    text-align: center;
		    padding: 13px 0 17px;
		    position: relative;
		    z-index: 1;
		}
		.border_style:after {
		    position: absolute;
		    content: "";
		    height: 1px;
		    width: 100%;
		    background-color: #bbc1c9;
		    top: 24px;
		    left: 0;
		    z-index: -1;
		}
		.border_style span {
		    padding: 0 25px;
		    text-align: center;
		    display: inline-block;
		    background-color: #fff;
		}
		.form-group .btn_1 {
		    background-color: #F7E600;
		    border: 1px solid #F7E600;
		}
		.btn_1, .btn_2 {
			width: 100%;
    		display: block;
		    color: #fff;
		    display: inline-block;
		    padding: 11px 23px;
		    text-transform: capitalize;
		    line-height: 16px;
		    font-size: 13px;
		    font-weight: 500;
		    border-radius: 5px;
		    white-space: nowrap;
		    -webkit-transition: .5s;
		    transition: .5s;
		}
		.btn_1 {
			background-color: #3b76ef;
			border: 1px solid #3b76ef;
		}
		.full_width {
			width: 100%;
		}
		.card-header:first-child {
		    border-radius: 0.5rem 0.5rem 0 0;
		}
		.align-items-center {
		    align-items: center !important;
		}
		.justify-content-between {
		    justify-content: space-between !important;
		}
		.card-header {
		    padding: 1.5rem 1.5rem;
		    margin-bottom: 0;
		    background-color: transparent;
		    border-bottom: 0 solid #d9dee3;
		}
		.card-header:first-child {
		    border-radius: 0.5rem 0.5rem 0 0;
		    border-top-left-radius: 0.5rem;
		    border-top-right-radius: 0.5rem;
		    border-bottom-right-radius: 0px;
		    border-bottom-left-radius: 0px;
		}
		h1, h2, h3, h4, h5, h6 {
			font-family: "Work Sans", sans-serif;
			font-weight: 500;
		    line-height: 1.1;
		    color: #566a7f;
		}
		h4 {
			font-size: calc(1.2625rem + 0.15vw);
		}
		.card {
		    border: 0 solid #d9dee3;
		    border-top-color: rgb(217, 222, 227);
		    border-top-style: solid;
		    border-top-width: 0px;
		    border-right-color: rgb(217, 222, 227);
		    border-right-style: solid;
		    border-right-width: 0px;
		    border-bottom-color: rgb(217, 222, 227);
		    border-bottom-style: solid;
		    border-bottom-width: 0px;
		    border-left-color: rgb(217, 222, 227);
		    border-left-style: solid;
		    border-left-width: 0px;
		    border-image-source: initial;
		    border-image-slice: initial;
		    border-image-width: initial;
		    border-image-outset: initial;
		    border-image-repeat: initial;
		    border-radius: 0.5rem;
		    border-top-left-radius: 0.5rem;
		    border-top-right-radius: 0.5rem;
		    border-bottom-right-radius: 0.5rem;
		    border-bottom-left-radius: 0.5rem;
		    box-shadow: 0 0.125rem 0.25rem rgba(161, 172, 184, 0.4);
		}
		body {
			background-color: rgba(0, 32, 74, 0.05);
		}
    </style>
    
    
</head>
<body>

<%@ include file="../guest/header.jsp" %>
<div
  class="hero page-inner overlay"
  style="background-image: url('resources/images/hero_bg_1.jpg')"
>
  <div class="container">
    <div class="row justify-content-center align-items-center">
      <div class="col-lg-9 text-center mt-5">
        <h1 class="heading" data-aos="fade-up">호스트 이메일 찾기</h1>

        <nav
          aria-label="breadcrumb"
          data-aos="fade-up"
          data-aos-delay="200"
        >
          <ol class="breadcrumb text-center justify-content-center">
            <li class="breadcrumb-item"><a href="login.ht">Login</a></li>
            <li
              class="breadcrumb-item active text-white-50"
              aria-current="page"
            >
              Find Email
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>

<br><br>

<div class="col-md-6 col-12 center">
	<div class="card">
	    <div class="card-header d-flex align-items-center justify-content-between border-bottom">
            <h4 class="mb-0">이메일 찾기</h4>
        </div>
	    <div class="card-content">
	        <div class="card-body">
	            <form class="form form-vertical" action="findid.ht" method="post">
	                <div class="form-body">
	                    <div class="row">
	                        <div class="col-12">
	                            <div class="form-group has-icon-left">
	                                <label for="email-id-icon">Name</label>
	                                <div class="position-relative">
	                                    <input type="text" class="form-control" name="name"
	                                        placeholder="이름을 입력하세요" id="email-id-icon" required>
	                                    <div class="form-control-icon">
	                                        <i class="bx bx-user"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                       <div class="col-12">
	                            <div class="form-group has-icon-left">
	                                <label for="mobile-id-icon">Phone</label>
	                                <div class="position-relative">
	                                    <input type="text" class="form-control" name="phone"
	                                        placeholder="전화번호를 입력하세요" id="mobile-id-icon" required>
	                                    <div class="form-control-icon">
	                                        <i class="bx bx-phone"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="form-group col-md-12 text-center">
	                        <button type="submit"
	                                class="btn btn-primary full_width">이메일 찾기</button>
							</div>
	                    </div>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
</div>


<br><br>
<%@ include file="footer.jsp" %>

</body>