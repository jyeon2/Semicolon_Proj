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
	rel="stylesheet" />

<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="resources/css/tiny-slider.css" />
<link rel="stylesheet" href="resources/css/aos.css" />
<link rel="stylesheet" href="resources/css/style.css" />
<link href="resources/css/review.css" rel="stylesheet">
</head>
<style type="text/css">
	body {
	    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
	    font-size: 15px;
	    color: #7a7a7a;
	    background: #f9fafb;
	}
	form {
	    margin-top: 0em;
	    width : 600px;
	    /*left : 530px;*/
	    margin: 0 auto;
	}
	.err {
    		font-size: 10px;
    		font-weight: bold;
    		color: red;
    	}
	
</style>

<body>
<%@ include file="header.jsp" %>

<div
  class="hero page-inner overlay"
  style="background-image: url('resources/images/hero_bg_1.jpg')"
>
  <div class="container">
    <div class="row justify-content-center align-items-center">
      <div class="col-lg-9 text-center mt-5">
        <h1 class="heading" data-aos="fade-up">리뷰 수정</h1>

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
             Modify Review
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>

<section>
<br><br>

<div class="container">
	<p align="center">즐거운 여행 되셨나요?<br>리뷰를 남겨보세요!</p>
	<br>
	<form:form commandName="review" action="reviewupdate.rv" name="myform" method="post">
		<div class="form-group">
			<div class="form-group">
				<input type="hidden" name="pno" value="${rb.pno }"> 
				<input type="hidden" name="review_no" value="${rb.review_no }"> 
				<input type="hidden" name="house_no" value="${rb.house_no }"> 
				<input type="hidden" name="gno" value="${rb.gno}">
				<input type="hidden" name="checkin" value="${rb.checkin}">
				<input type="hidden" name="checkout" value="${rb.checkout}">
				
				
				<label for="name"><b>숙소명</b></label> <input type="text" class="form-control" name="name" value="${rb.name }" readonly/><br>
			</div>
			<div class="form-group">
				<label for="name"><b>숙박 기간</b></label> <input type="text" class="form-control" value="${rb.checkin } ~ ${rb.checkout }" readonly/><br>
			</div>

			<label><b>만족도</b></label>
			<br><form:errors cssClass="err" path="total" />
			<div class="form-group star-rating" align="center">
				<input type="radio" id="5-stars" name="total" value="5" /> <label for="5-stars">⭐</label> <input type="radio" id="4-stars" name="total" value="4" /> <label for="4-stars">⭐</label> <input type="radio" id="3-stars"
					name="total" value="3" /> <label for="3-stars">⭐</label> <input type="radio" id="2-stars" name="total" value="2" /> <label for="2-stars">⭐</label> <input type="radio" id="1-star" name="total" value="1" /> <label
					for="1-star">⭐</label>
					
			</div><br>

			<div class="form-group">
				<textarea class="form-control" rows="10" name="text" 
				placeholder="숙소의 청결도, 위치, 호스트와의 의사소통에 대한 솔직한 후기를 남겨주세요.">${rb.text }</textarea>
			</div>
				<form:errors cssClass="err" path="text" />
		</div><br>
		<button type="submit" class="btn btn-primary">수정</button>
	</form:form>
</div>

<br><br>
</section>


<%@ include file="footer.jsp" %>
</body>