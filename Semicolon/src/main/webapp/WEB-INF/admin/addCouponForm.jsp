<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>

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
    

    <link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="resources/css/aos.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>
      SEMICOLON(;)&nbsp; ADMIN-ADD COUPON page
    </title>
  </head>
  
  <style>
  	body{
  		margin-top : 130px;
  		
  	}
	.err{
		color:red;
		font-size: 8pt;
	}
	.col-12{
		width:80%;
	}
  </style>
  
   <%@ include file="ad_top.jsp" %><br>
    <!-- --------------------- -->
    
    <div class="section">
      <div class="container">
        <div class="row">
          <div
            class="col-lg-3 mb-5 mb-lg-0"
            data-aos="fade-up"
            data-aos-delay="100"
          >
            <div class="contact-info">
              <div class="address mt-2">
                <i class="icon-add"></i>
                <h4 class="mb-2"><a href="addCoupon.ad">쿠폰 추가</a></h4>
                <p>
                  <br />
                  
                </p>
              </div>

              <div class="open-hours mt-4">
                <i class="icon-list"></i>
                <h4 class="mb-2"><a href="couponList.ad">쿠폰 목록</a></h4>
                <p>
                  <br />
                  
                </p>
              </div>
            </div>
          </div>
          <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
            <form:form commandName="coupon" action="addCoupon.ad">
              <div class="row">
                <div class="col-6 mb-3">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="쿠폰 코드"
                    name="code"
                    value="${coupon.code }"
                  />
                  <form:errors cssClass="err" path="code"/>
                </div>
                <div class="col-12 mb-3">
                  <input
                    type="text"
                    class="form-control"
                    placeholder="쿠폰 이름"
                    name="name"
                    value="${coupon.name }"
                  />
                  <form:errors cssClass="err" path="name"/>
                </div>
                <div class="col-12 mb-3">
                <div class="input-group">
                        <span class="input-group-text">할인율</span>
                        <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="percent" value="0"/>
                        <span class="input-group-text">%</span>
                </div></div><br>
                
                 <div class="col-12 mb-3">
                <div class="input-group">
                        <span class="input-group-text">할인율</span>
                        <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="sale" value="0"/>
                        <span class="input-group-text">원</span>
                </div></div><br>

                <div class="col-12">
                  <input
                    type="submit"
                    value="쿠폰 등록"
                    class="btn btn-primary"
                  />
                </div>
              </div>
            </form:form>
          </div>
        </div>
      </div>
    </div>
    <!-- /.untree_co-section -->
    
    <!-- --------------------- -->
     <br><%@ include file="ad_bottom.jsp" %>
    