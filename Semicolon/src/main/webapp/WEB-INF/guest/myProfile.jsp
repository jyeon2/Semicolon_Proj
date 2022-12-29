<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semicolon My_Profile page</title>
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="resources/css/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="resources/css/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
	
	<link rel="stylesheet" href="resources/css/bootstrap-login.css" />
	
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
    
    <link rel="stylesheet" href="resources/assets/vendor/fonts/boxicons.css" />
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    <style type="text/css">
    	.padding {
    		padding: 100px;
    	}
    	.vertical {
			padding: 13px;
    	}
    	.font {
    		padding: 13px;
    		font-size: 14px;
    		font-weight: bold;
    	}
    	.left {
    		text-align: left;
    	}
    	.border-bottom {
    		border-bottom: 1px;
    	}
    	.profile {
    		padding: 24px !important;
    	}
		.btn {
			display: inline-block;
		    font-weight: 400;
		    line-height: 1.5;
		    text-align: center;
	        vertical-align: middle;
		    border-radius: 30px;
		    border-width: 2px;
		    padding-top: 15px;
		    padding-bottom: 15px;
		    padding-left: 30px;
		    padding-right: 30px;
		}
		table {
			font-family: var(--bs-body-font-family);
		}
		.modalBtn {
    		width: 20%;
    		height: 90%;
		    color: #697a8d;
		    border-color: #697a8d;
		    background: transparent;
		    font-weight: 500;
		    line-height: 1.5;
		    text-align: center;
		    vertical-align: middle;
		    -moz-user-select: none;
		    user-select: none;
		    padding: 13px;
		    font-size: 0.9375rem;
		    border-radius: 0.375rem;
		    transition: all .2s ease-in-out;
		    border: 1px solid;
    	}
    	.h60 {
    		height: 60px;
    	}
    	.modal-header {
		    display: -webkit-box;
		    display: -ms-flexbox;
		    display: flex;
		    -ms-flex-negative: 0;
		    flex-shrink: 0;
		    -webkit-box-align: center;
		    -ms-flex-align: center;
		    align-items: center;
		    -webkit-box-pack: justify;
		    -ms-flex-pack: justify;
		    justify-content: space-between;
		    padding: 1rem 1rem;
		    border-bottom: 1px solid #dee2e6;
		    border-top-left-radius: calc(0.3rem - 1px);
		    border-top-right-radius: calc(0.3rem - 1px);
		}
		.ml10 {
			margin-left: 10px;
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
		.input-group-text {
			color: #526e8a;
			background-color: #fff;
		}
    </style>
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script>
    	function deleteGuest() {
    		var answer = confirm('정말로 탈퇴하시겠습니까? \n(보유하신 포인트, 쿠폰, 정기권이 모두 삭제됩니다.)');
    		//alert(answer);
    		if(answer == true) {
    			location.href= "delete.gt"; //확인눌렀을때
    		}
    		else {
    			location.href="myProfile.gt"; //취소눌렀을때
    		}
    	}
    </script>
    
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
        <h1 class="heading" data-aos="fade-up">회원정보</h1>

        <nav
          aria-label="breadcrumb"
          data-aos="fade-up"
          data-aos-delay="200"
        >
          <ol class="breadcrumb text-center justify-content-center">
            <li class="breadcrumb-item"><a href="mypage.gt">My Page</a></li>
            <li
              class="breadcrumb-item active text-white-50"
              aria-current="page"
            >
              Profile
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>


<section class="features-1">
<br><br>

<!-- Content -->
<div class="container">

  <!-- Basic Layout & Basic with Icons -->
  <div class="row">
    <!-- Basic with Icons -->
    <div class="col-xxl">
      <div class="card mb-4">
        <div class="card-header d-flex align-items-center justify-content-between border-bottom">
          <h4 class="mb-0">내 정보</h4>
        </div>
        <div class="card-body profile">
            <div class="row mb-3">
              <label class="col-sm-2 col-form-label font" for="basic-icon-default-fullname">이름</label>
              <div class="col-sm-10">
                <div class="input-group input-group-merge">
                  <span id="basic-icon-default-fullname2" class="input-group-text">
                  <i class="bx bx-user"></i></span>
                  <span id="basic-icon-default-fullname" class="form-control vertical left">
                  ${guest.name }</span>
                    
                </div>
              </div>
            </div>
            
            <div class="row mb-3">
              <label class="col-sm-2 col-form-label font" for="basic-icon-default-email">이메일</label>
              <div class="col-sm-10">
                <div class="input-group input-group-merge">
                  <span id="basic-icon-default-fullname2" class="input-group-text">
                  <i class="bx bx-envelope"></i></span>
                  <span id="basic-icon-default-fullname" class="form-control vertical left">
                  ${guest.email }</span>
                </div>
              </div>
            </div>
            
            <div class="row mb-3">
              <label class="col-sm-2 form-label font" for="basic-icon-default-phone">전화번호</label>
              <div class="col-sm-10">
                <div class="input-group input-group-merge">
                  <span id="basic-icon-default-fullname2" class="input-group-text font">
                  <i class="bx bx-phone"></i></span>
                  <span id="basic-icon-default-fullname" class="form-control vertical left">
                  ${guest.phone }</span>
                </div>
              </div>
            </div>
            <div class="row mb-3">
              <label class="col-sm-2 form-label font" for="basic-icon-default-message">포인트</label>
              <div class="col-sm-10">
                <div class="input-group input-group-merge">
                  <span id="basic-icon-default-message2" class="input-group-text">
                  <i class="bx bxs-purchase-tag-alt"></i></span>
                  <span id="basic-icon-default-fullname" class="form-control vertical left">
                  ${guest.mypoint } point</span>
                </div>
              </div>
            </div>
            <div class="row mb-3">
              <label class="col-sm-2 form-label font" for="basic-icon-default-message">쿠폰함</label>
              <div class="col-sm-10 left padding13">
			    	<!-- Button modal -->
			    	<button type="button" class="modalBtn" data-bs-toggle="modal" data-bs-target="#ModalCoupon">
			    		내 쿠폰함
			    	</button>
              </div>
            </div>
            <div class="row mb-3">
              <label class="col-sm-2 form-label font" for="basic-icon-default-message">정기권</label>
              <div class="col-sm-10 left">
			    	<!-- Button modal -->
			    	<button type="button" class="modalBtn" data-bs-toggle="modal" data-bs-target="#ModalSeasonT">
			    		구매한 정기권
			    	</button>
              </div>
            </div>
            <div class="row justify-content-end">
              <div class="col-sm-10">
                <a href="javascript:deleteGuest()" class="btn btn-primary float-end ml10" >회원 탈퇴</a>
                <a href="update.gt" class="btn btn-primary float-end">정보 변경하기</a>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- / Content -->

<br><br>
</section>

<!-- ModalCoupon -->
<div class="modal fade" id="ModalCoupon" tabindex="-1" style="display: none;" aria-hidden="true" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">나의 쿠폰함</h5>
          <button type="button" id="modalClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          </button>
      </div>
      <div class="modal-body">
      
      <c:if test="${empty couponList}" >
      	<div class="row">
          <div class="col mb-3">
            <div class="input-group">
              	쿠폰함이 비었습니다.
            </div>
          </div>
        </div>
      </c:if>
      
      <c:if test="${couponList != null }" >
      <c:forEach var="coupon" items="${couponList}">
       
        <div class="row">
          <div class="col mb-3">
            <div class="input-group h60">
			  <div class="form-control h60" >
				<label for="${coupon.coupon_no }" >
				${coupon.name }  ( <c:if test='${coupon.percent != 0}'>${coupon.percent}%</c:if><c:if test='${coupon.sale != 0}'>${coupon.sale}원</c:if> 할인 )
				<br>
				<fmt:parseDate var="period" value="${coupon.period }" pattern="yyyy-MM-dd"/>
				<span class="small">유효기간 : ~<fmt:formatDate value="${period }" pattern="yyyy년 MM월 dd일"/>까지 </span>
				</label>
			  </div>
             </div>
           </div>
         </div>
       
      </c:forEach>
      </c:if>
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal 끝 -->

<!-- ModalSeasonT -->
<div class="modal fade" id="ModalSeasonT" tabindex="-1" style="display: none;" aria-hidden="true" role="dialog">
 <div class="modal-dialog modal-dialog-centered" role="document">
   <div class="modal-content">
     <div class="modal-header">
       <h5 class="modal-title" id="modalCenterTitle">나의 정기권</h5>
         <button type="button" id="modalClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
         </button>
     </div>
     <div class="modal-body">
     
     <c:if test="${empty seasonTList}" >
     	<div class="row">
         <div class="col mb-3">
           <div class="input-group">
             	구매한 정기권이 없습니다.
           </div>
         </div>
       </div>
     </c:if>
     
	  <c:if test="${seasonTList != null}" >
	  <c:forEach var="seasonT" items="${seasonTList}">
        <div class="row">
          <div class="col mb-3">
             <div class="input-group">
		      <div class="form-control h60">
			    <label for="seasonT_${seasonT.st_no }">
			    <fmt:formatNumber value="${seasonT.ticket_choice }" /> 원권 
			    <br>
		 	    <span class="small">( 남은 금액 : <fmt:formatNumber value="${seasonT.money }"/>원 )</span>
		 	    </label>
		      </div>
            </div>
          </div>
        </div>
       
      </c:forEach>
	  </c:if>
      
      
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal 끝 -->


<%@ include file="footer.jsp" %>
   
</body>
