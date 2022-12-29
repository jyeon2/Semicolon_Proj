<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
    
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HOST_JOIN page</title>

    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="resources/css/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="resources/css/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
	
	<link rel="stylesheet" href="resources/css/bootstrap-login.css" />
	<link rel="stylesheet" href="resources/css/app.css" />
	
	<meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="author" content="Untree.co" />

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
    	.margin_bottom {
    		margin-bottom: .7rem;
    	}
    	.err {
    		font-size: 10px;
    		font-weight: bold;
    		color: red;
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
		.message {
			margin: auto 0;
		}
    </style>
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
	   //alert(1);
	   var use;
	   var isCheck = false;
	   
	   $('form').find('#email_check').click(function(){
	      //alert(2);
	      isCheck = true;
	      
	      if($('input[name="email"]').val().length == 0) {
	            alert("이메일을 입력하세요.(중복체크)");
	            $('input[name="email"]').focus();
	            return;
	       } //if
	       
	       $.ajax({
	          url : "emailCheck.ht",
	          data : { 
	                useremail :$('input[name="email"]').val() 
	                },
	          success : function(data){
	             	//alert(data);
	                   if($.trim(data) == '사용가능'){
	                      $('#emailmessage').html("<font color=blue>사용 가능한 이메일입니다.</font>");
	                      use = "possible";
	                      $('#emailmessage').show();
	                   }else{
	                      $('#emailmessage').html("<font color=red>이미 사용 중인 이메일입니다.</font>");
	                      use = "impossible";
	                      $('#emailmessage').show();
	                   }
	                }//success
	       }); // ajax
	      
	   }); // email_check click
	   
	   $('input[name="email"]').keydown(function(){
	      //alert(3);
	      
	      $('#emailmessage').css('display','none');
	      isCheck = false;
	      use = "";
	   });
	   
	   
	   $('#sub').click(function(){
	      if(use == "impossible"){
	         alert("이미 사용 중인 이메일입니다.");
	         return false;
	      }
	      else if(isCheck == false){
	         alert("중복확인 먼저 하세요.");
	         return false;
	      }
	      
	   });
	}); // ready
	</script>
    
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
        <h1 class="heading" data-aos="fade-up">호스트 회원가입</h1>

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
              Sign Up
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
            <h4 class="mb-0">회원가입</h4>
        </div>
        
	    <div class="card-content">
	        <div class="card-body">
	            <form:form commandName="host" class="form form-vertical" action="join.ht" method="post">
	                <div class="form-body">
	                    <div class="row">
	                    	<div class="col-12">
	                            <div class="form-group has-icon-left">
	                                <label for="email-id-icon">Email</label>
	                                <div class="position-relative">
	                                    <input type="email" class="form-control" name="email" value="${host.email }"
	                                        placeholder="이메일을 입력하세요" id="email-id-icon">
	                                    <div class="form-control-icon">
	                                        <i class="bx bx-envelope"></i>
	                                    </div>
	                                    <form:errors cssClass="err" path="email" />
	                                </div>
	                            </div>
	                        </div>
							<div class="col-12 d-flex justify-content-start margin_bottom">
	                            <button type="button" id="email_check"
                                   class="btn btn-primary me-1 mb-1">중복확인</button>
                                &nbsp;&nbsp;<span class="message" id="emailmessage" style="display:none;"></span>
	                        </div>

							<div class="col-12">
	                            <div class="form-group has-icon-left">
	                                <label for="password-id-icon">Password</label>
	                                <div class="position-relative">
	                                    <input type="password" class="form-control" name="password" value="${host.password }"
	                                        placeholder="비밀번호를 입력하세요" id="password-id-icon">
	                                    <div class="form-control-icon">
	                                        <i class="bx bxs-lock"></i>
	                                    </div>
	                                    <form:errors cssClass="err" path="password" />
	                                </div>
	                            </div>
	                        </div>

	                        <div class="col-12">
	                            <div class="form-group has-icon-left">
	                                <label for="first-name-icon">Name</label>
	                                <div class="position-relative">
	                                    <input type="text" class="form-control" name="name" value="${host.name }"
	                                        placeholder="이름을 입력하세요"
	                                        id="first-name-icon">
	                                    <div class="form-control-icon">
	                                        <i class="bx bx-user"></i>
	                                    </div>
	                                    <form:errors cssClass="err" path="name" />
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <div class="col-12">
	                            <div class="form-group has-icon-left">
	                                <label for="mobile-id-icon">Phone</label>
	                                <div class="position-relative">
	                                    <input type="tel" class="form-control" name="phone" value="${host.phone }"
	                                        placeholder="전화번호를 입력하세요" id="mobile-id-icon">
	                                    <div class="form-control-icon">
	                                        <i class="bx bx-phone"></i>
	                                    </div>
	                                    <form:errors cssClass="err" path="phone" />
	                                </div>
	                            </div>
	                        </div>

	                        <div class="col-12 d-flex justify-content-start margin_bottom">
	                            <input type="submit" value="회원가입" id="sub"
                                   class="btn btn-primary me-1 mb-1">
	                            <button type="reset"
	                                class="btn btn-light-secondary me-1 mb-1">다시 작성</button>
	                        </div>
	                    </div>
	                </div>
	            </form:form>
	        </div>
	    </div>
	</div>
</div>


<br><br>
<%@ include file="footer.jsp" %>

</body>