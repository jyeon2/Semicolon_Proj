<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semicolon My_Profile page</title>
	
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
    	.img-fluid {
			width: 450px;
			height: 450px;
		}
		.wish {
			text-align:right;
		}
		.heart_img{
			position:relative;
			z-index:2;
			top:-120px;
			right: 15px;
			width:30px;
			height:30px;
		}
		.left {
			text-align:left;
		}
		.wishlist {
			padding: 24px;
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
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
    function clickFullHeart(no) {
		//alert(2);
		
		//꽉찬 하트 클릭
		$.ajax({
			url : "deleteHeart.wi",
			data : {
				houseNo : no
			},
			success : function(data) {
				//alert("wishList 다시 불러오기")
				location.href="myWishlist.gt"
			},
			error : function() {
				alert("하트 클릭 에러")
			}
		});
		
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
        <h1 class="heading" data-aos="fade-up">위시리스트</h1>

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
              Wish List
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

	  <div class="col-xxl">
        <div class="card mb-4">
          <div class="card-header d-flex align-items-center justify-content-between border-bottom">
            <h4 class="mb-0">내 위시리스트</h4>
          </div>
          
        <div class="section section-properties wishlist">
		<c:if test="${empty houseList}"> 위시리스트가 없습니다 </c:if>

			<div class="row">
			<c:forEach var="wish" items="${houseList }">
			<!-- .item 시작 -->
			<div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
	          <div class="property-item mb-30 left">
	          
	          <a href="detail.gt?house_no=${wish.house_no }" class="img">
                <c:forEach var="img" items="${wish.photo}" varStatus="status">
	               <c:if test="${status.count eq 1}">
	                  <img src="${fullpath}/${img }" alt="Image" class="img-fluid"/>
	               </c:if>
            	</c:forEach>
                <%-- <img src="${fullpath}/${sub.photo }" alt="Image" class="img-fluid"/> --%>
              </a>
					          
	            <div class="wish">
		           <a href="javascript:clickFullHeart(${wish.house_no})" id="heart_click_${wish.house_no}">
			         <img src="resources/images/heart-solid-24.png" class="full heart_img" /> <!-- 꽉찬하트 -->
			       </a>
				</div>
				  
	            <div class="property-content">
	              <div class="price mb-2"><span>￦<fmt:formatNumber value="${wish.price }" pattern="#,###"/></span></div>
	                <div>
	                  <span class="d-block mb-2 text-black-50"
	                    >${wish.address }</span>
	                  <span class="city d-block mb-3">${wish.name }</span>
	
	                  <a
	                    href="detail.gt?house_no=${wish.house_no }"
	                    class="btn btn-primary py-2 px-3"
	                    >See details</a>
	                </div>
	            </div>
	          </div>
	        </div>
			<!-- .item 끝 -->
			</c:forEach>
			</div>


		</div>
	    </div>
	  </div>
	  
  </div>


<br><br>
</section>

<%@ include file="footer.jsp" %>
   
</body>