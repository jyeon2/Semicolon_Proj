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
<link
   href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
   rel="stylesheet" />

<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="resources/css/tiny-slider.css" />
<link rel="stylesheet" href="resources/css/aos.css" />
<link rel="stylesheet" href="resources/css/style.css" />

<title>Semicolon Search page</title>

<style type="text/css">
	.img-fluid {
		width: 500px;
		height: 500px;
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

</style>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">

	//로그인 안했을때 하트 클릭 -> 로그인하라고 한 후 로그인 창으로 가게 하기
	function doLogin(name) {
		alert("로그인이 필요한 항목입니다.");
		//alert(name);
		if(name == "") {
			location.href="login.gt?destination=theme";
		}
		else {
			location.href="login.gt?destination=theme&name="+name;
		}
	}
	
	
	//로그인 했을때 빈 하트 클릭 -> 꽉 찬 하트로 바꾸기
	function clickEmptyHeart(no) {
		//alert(1);
		
		//빈 하트 클릭
		$.ajax({
			url : "insertHeart.wi",
			data : {
				houseNo : no
			},
			success : function(data) {
				//alert("꽉찬 하트로 바꾸기");
				$('#heart_click_'+no).html('<img src="resources/images/heart-solid-24.png" class="full heart_img"/>');
				$('#heart_click_'+no).prop('href','javascript:clickFullHeart('+no+')');
			},
			error : function() {
				//alert("빈 하트 클릭 에러");
			}
		});
	}
	
	//로그인 했을때	꽉찬 하트 클릭 -> 빈 하트로 바꾸기
	function clickFullHeart(no) {
		//alert(2);
		
		//꽉찬 하트 클릭
		$.ajax({
			url : "deleteHeart.wi",
			data : {
				houseNo : no
			},
			success : function(data) {
				//alert("빈 하트로 바꾸기")
				$('#heart_click_'+no).html('<img src="resources/images/heart-regular-24.png" class="empty heart_img"/>');
				$('#heart_click_'+no).prop('href','javascript:clickEmptyHeart('+no+')');
			},
			error : function() {
				//alert("꽉 찬 하트 클릭 에러")
			}
		});
		
	}
	
</script>

</head>
<body>

<%@ include file="header.jsp" %>

  <c:set var="str" value="${slists }"/>
  
   <div class="hero page-inner overlay"
      style="background-image: url('resources/images/hero_bg_1.jpg')">
      <div class="container">
         <div class="row justify-content-center align-items-center">
            <div class="col-lg-9 text-center mt-5">
               <h1 class="heading" data-aos="fade-up">검색 결과</h1>

               <nav aria-label="breadcrumb" data-aos="fade-up"
                  data-aos-delay="200">
                  <ol class="breadcrumb text-center justify-content-center">
                     <li class="breadcrumb-item"><a href="home.gt">Home</a></li>
                     <li class="breadcrumb-item active text-white-50"
                        aria-current="page">조건에 맞는 숙소 : ${fn:length(str)}개</li>
                  </ol>
               </nav>
            </div>
         </div>
      </div>
   </div>
<div class="section section-properties">
      <div class="container">
        <div class="row">
        
        <c:if test="${empty slists }">
           <h6 style="text-align: center"> 검색한 결과가 없습니다 </h6>
        </c:if>
        
        <c:forEach var="h" items="${slists }">

		 <%String imgurl = request.getContextPath()+"/resources/house_images/";  %>
         <c:set var="image" value="${fn:split(h.photo ,',')}"></c:set>

           <!-- .item 시작 -->
         <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
            <div class="property-item mb-30">
              <a href="detail.gt?house_no=${h.house_no }" class="img" style="z-index:2;">
                 <c:forEach var="img" items="${image}" varStatus="status">
               <c:if test="${status.count eq 1}">
                  <img src="<%=imgurl %>${img }" alt="Image" class="img-fluid" style="position:relative;z-index:1;"/>
               </c:if>
            	</c:forEach>
                <%-- <img src="${fullpath}/${h.photo }" alt="Image" class="img-fluid" style="position:relative;z-index:1;"/> --%>
              </a>
             <div class="wish">
              <c:choose>
	              <c:when test="${guestInfo != null}"> <%-- 로그인 했을때 : 자신이 클릭한 하트, 클릭하지 않은 하트 나오도록 --%>
	              	<c:if test="${fn:contains(houseNos,h.house_no) == false}">
	              		<a href="javascript:clickEmptyHeart(${h.house_no})" id="heart_click_${h.house_no}">
		                  <img src="resources/images/heart-regular-24.png" class="empty heart_img"/> <!-- 빈하트 -->
		                </a>
	              	</c:if>
	              	
	              	<c:if test="${fn:contains(houseNos,h.house_no)}">
	              		<a href="javascript:clickFullHeart(${h.house_no})" id="heart_click_${h.house_no}">
		                  <img src="resources/images/heart-solid-24.png" class="full heart_img"/> <!-- 꽉찬하트 -->
		                </a>
	              	</c:if>
				  </c:when>
			  
	              <%-- 로그인 안했을때 : 모든 하트 버튼 클릭 X --%>
			  	  <c:otherwise>
			  	  	<a href="javascript:doLogin('${h.tname}')">
	                  <img src="resources/images/heart-regular-24.png" class="heart_img"/> <!-- 빈하트 -->
	                </a>
			  	  </c:otherwise>
			  </c:choose>
			  </div>

              <div class="property-content">
                <div class="price mb-2"><span>￦<fmt:formatNumber value="${h.price }" pattern="#,###"/></span></div>
                <div>
                  <span class="d-block mb-2 text-black-50"
                    >${h.address }</span
                  >
                  <span class="city d-block mb-3">${h.name }</span>
                  
                  <a
                    href="detail.gt?house_no=${h.house_no }"
                    class="btn btn-primary py-2 px-3"
                    >See details</a
                  >
                </div>
              </div>
            </div>
          </div>
            <!-- .item 끝 -->
        </c:forEach>
        
      </div>
   </div>
</div>

<%@ include file="footer.jsp" %>
</body>
</html>