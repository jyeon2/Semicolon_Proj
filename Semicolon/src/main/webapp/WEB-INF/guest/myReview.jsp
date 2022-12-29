<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Semicolon My_Review page</title>
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
</head>
<style type="text/css">
    	.reservation {
			padding: 24px 50px;
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
		table {
			width: 80%;
		}
		.right {
			text-align: right;
		}
		.reviewBtn {
			padding: 5px 20px;
		}
		.modal .btn-close {
		    background-color: #fff;
		    border-radius: 0.5rem;
		    opacity: 1;
		    padding: 0.635rem;
		    box-shadow: 0 0.125rem 0.25rem rgb(161 172 184 / 40%);
		    transition: all 0.23s ease 0.1s;
		    transform: translate(23px, -25px);
		}
		.modal-footer {
		    display: flex;
		    flex-wrap: wrap;
		    flex-shrink: 0;
		    align-items: center;
		    justify-content: flex-end;
		    padding: 1.25rem;
		    border-top: 0px solid #d9dee3;
		    border-bottom-right-radius: calc(0.5rem - 0px);
		    border-bottom-left-radius: calc(0.5rem - 0px);
		}
		.modalTable thead, tbody, tfoot, tr, td, th {
			border-color: inherit;
    		border-style: none;
    		border-width: 0;
		}
		.form-control {
		    font-size: 16px;
		    height: 40px;
		    padding-left: 15px;
		    padding-right: 15px;
		}
		.won {
			text-align: right;
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
    </style>
    
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
		function reviewDetail(gno,pno) {
			//alert(gno);
			//alert(pno);
			
			
			$.ajax({
				url : "reviewDetail.gt",
				data : {
					gno : gno,
					pno : pno
				},
				success : function(data, result) {
					//alert("상세보기 성공");
					//alert(data);
					var arr = data.split(',');
					
					result = arr[4]; //숙소명
					$('#name').html(result);
					result = arr[5]; //체크인날짜
					$('#checkin').html(result);
					result = arr[6]; //체크아웃날짜
					$('#checkout').html(result);
					result = arr[9]; //작성일
					$('#reviewdate').html(result);
					result = arr[7]; //만족도
					$('#total').html(result+" 점");
					result = arr[8]; //한줄평
					$('#text').html(result);
					
					/*
					arr[] = data.split(",");
					alert(arr[0]);
					*/
					
				},
				error : function() {
					//alert("상세보기 실패")
				}
				
			});	
		}
    </script>
<body>

<%@ include file="header.jsp" %>

<div
  class="hero page-inner overlay"
  style="background-image: url('resources/images/hero_bg_1.jpg')"
>
  <div class="container">
    <div class="row justify-content-center align-items-center">
      <div class="col-lg-9 text-center mt-5">
        <h1 class="heading" data-aos="fade-up">리뷰 내역</h1>

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
              Review List
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
            <h4 class="mb-0">리뷰 내역</h4>
          </div>
          
        <div class="section section-properties reservation">
         <c:choose>
		 <c:when test="${empty reviewList}"> 리뷰 내역이 없습니다 </c:when>
		 <c:otherwise>
		  <div class="table-responsive text-nowrap">
		    <table class="table table-hover">
		      <thead>
		        <tr>
		          <th><i class="fab fa-angular fa-lg text-danger me-3"></i>번호</th>
		          <th><i class="fab fa-angular fa-lg text-danger me-3"></i>숙소명</th>
		          <th><i class="fab fa-angular fa-lg text-danger me-3"></i>작성일</th>
		          <th class="right">리뷰 관리<i class="fab fa-angular fa-lg text-danger me-3"></i></th>
		        </tr>
		      </thead>
		      
		      <tbody class="table-border-bottom-0">
		      
		      <c:forEach var="r" items="${reviewList }">

		        <tr>
		          <td onclick="reviewDetail(${r.gno},${r.pno})" data-bs-toggle="modal" data-bs-target="#datailModal"><i class="fab fa-angular fa-lg text-danger me-3"></i> ${r.review_no } </td>
		          <td onclick="reviewDetail(${r.gno},${r.pno})" data-bs-toggle="modal" data-bs-target="#datailModal"><i class="fab fa-angular fa-lg text-danger me-3"></i> ${r.name } </td>
		          <td onclick="reviewDetail(${r.gno},${r.pno})" data-bs-toggle="modal" data-bs-target="#datailModal">
		          	<i class="fab fa-angular fa-lg text-danger me-3"></i><fmt:formatDate value="${r.reviewdate }" pattern="yyyy-MM-dd"/>
		          </td>
		          <td class="right">
		          <a href="reviewupdate.rv?review_no=${r.review_no }&pno=${r.pno}">수정</a> |
		          
		          <a href="reviewdelete.rv?review_no=${r.review_no }">삭제</a>
		          <i class="fab fa-angular fa-lg text-danger me-3"></i>
		          </td>
		        </tr>
		       
		      </c:forEach>
		        
		      </tbody>
		    </table>
		  </div>
		  </c:otherwise>
		  </c:choose>
		  
		</div>
	    </div>
	  </div>
	  
  </div>


<br><br>
</section>

<!-- Modal -->
<div class="modal fade" id="datailModal" tabindex="-1" style="display: none;" aria-hidden="true" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">리뷰 상세 내역</h5>
          <button type="button" id="modalClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          </button>
      </div>
      <div class="modal-body">
		
		<div class="col-lg-12">
		<table class="table site-block-order-table mb-3 modalTable">
          <thead>
            <tr>
              <th><h5>작성한 리뷰</h5></th>
            </tr>
          </thead>
          
           <tbody>
            <tr>
              <td class="col-sm-6">
                <div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">숙소명</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="name" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
                <div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">체크인</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="checkin" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
		        <div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">체크아웃</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="checkout" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
				<div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">작성일</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="reviewdate" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
				<div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">만족도</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="total" class="form-control won"></span>
		                </div>
		              </div>
				</div>
				<div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">한줄평</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="text" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
              </td>
            </tr>
          </tbody>
        </table>
		</div>
        
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