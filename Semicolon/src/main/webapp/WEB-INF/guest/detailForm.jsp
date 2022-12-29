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

<title>Semicolon House_Detail page</title>

<style>
	.img-icon {
		width: 35px;
		height: 35px;
	}
	
	.icon {
		margin-bottom: 10px;
	}
	
	.btn {
		width: 100%;
	}
	
	.col-lg-10 {
		position: relative;
		width: 100%;
	}
	
	.img-fluid {
		width: 100%;
		height: 500px;
	}
	
	.title {
		position: relative;
	}
	
	.heart {
		display: inline-block;
		width: 20%;
		position: absolute;
		vertical-align: middle;
		text-align: right;
	}
	
	.countWish {
		text-align: right;
		font-size: 15px;
	}
	
	h2 {
		display: inline-block;
		width: 80%;
		text-align: left;
	}
	
	.err {
		color: red;
		font-size: 5pt;
	}
	pre {
    	font-family: "Work Sans", sans-serif;
    	font-size: 14px;
    	margin: 0px;
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
		padding: 0px;
	}
	.box-feature {
       background-color: rgba(0, 32, 74, 0.05);
       border-radius: 4px;
       padding: 30px;
       margin-bottom: 30px;
   }
</style>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
	/* [그냥 지도만 띄울 때]
	 function initMap() {
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
    	var fulladdress = $('input[name="address"]').val();
    	//alert("jquery : "+address);
    	
    	initMap(fulladdress);
    	
    	//체크아웃 날짜 설정하기
    	$('input[name="checkin"]').on('keyup change',function(){

    		var checkin = $('#checkin_date').val();
			$('#checkout_date').attr('min',checkin);
    	})
    	
    	//체크인 날짜 설정하기
    	$('input[name="checkout"]').on('keyup change',function(){
    		
    		var checkout = $('#checkout_date').val();
    		$('#checkin_date').attr('max',checkout)
    	})
    	
    });
	
	function init(city,street){
		//alert("init : "+city+" "+street);
		var fulladdress = city+" "+street;
		initMap(fulladdress)
		
	}
	function initMap(fulladdress) {
	     
		//alert("initMAp : "+fulladdress);
		if(fulladdress==""){
			init();
		}
		
        var mapOptions = {
                            zoom: 18, // 지도를 띄웠을 때의 줌 크기
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
        var address = fulladdress; // DB에서 주소 가져와서 검색하거나 왼쪽과 같이 주소를 바로 코딩.
        var marker = null;
        var geocoder = new google.maps.Geocoder();
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
                alert("Geocode was not successful for the following reason: " + status);
            }
        });
        // Geocoding // *****************************************************
         
    } 
    //google.maps.event.addDomListener(window, 'load', initialize);
    
    //로그인 안한 상태에서 예약하기 버튼 클릭 -> 로그인창 -> 로그인
    function doLogin(no){
    	alert("로그인이 필요한 항목입니다.");
		location.href="login.gt?destination=detail&house_no="+no;
		
    }
    
	//성인인원수 클릭 -> 유아인원수 바꾸기
	//무조건 성인인원수 클릭 먼저 하도록 되어있다
    function adultnumChange(maxnum){
		
		a_sel = myform.adult;
		
		a_selIndex = a_sel.selectedIndex; //몇 행인지
		a_selValue = a_sel[a_selIndex].value; 
		a_selText = a_sel[a_selIndex].text; 
	
		//alert(a_selIndex+","+a_selValue+","+a_selText);
		//1,1,1명

		k_sel = myform.kid;
		k_sel.value="";

		//인원수를 선택하세요 눌렀을때
		if(a_selValue == "") {
			//alert("선택하세요")
			for(i=0; i<k_sel.length; i++) {
				k_sel[i].style.display = "block";
			}
			return;
		}
		
		k_maxnum = maxnum-a_selValue; //유아인원수의 최대수
		
		for(i=0; i<k_sel.length; i++){
			//alert(k_sel[i].value);
			if(k_sel[i].value > k_maxnum) {
				k_sel[i].style.display = "none";
			}
			else {
				k_sel[i].style.display = "block";
			}
		}
		
    }
	
</script>
</head>

<body onload="init('${hb.address }', '${hb.detailed}')">

<%@ include file="header.jsp"%>
	
	<div class="hero page-inner overlay"
		style="background-image: url('resources/images/hero_bg_1.jpg')">
		<div class="container">
			<div class="row justify-content-center align-items-center">
				<div class="col-lg-9 text-center mt-5">
					<h1 class="heading" data-aos="fade-up">숙소</h1>

					<nav aria-label="breadcrumb" data-aos="fade-up"
						data-aos-delay="200">
						<ol class="breadcrumb text-center justify-content-center">
							<li class="breadcrumb-item"><a href="theme.gt">Theme</a></li>
							<li class="breadcrumb-item active text-white-50"
								aria-current="page">House</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</div>
	
	<form:form commandName="order" action="order.od" method="post" name="myform">
	
		  <input type="hidden" name="house_no" value="${hb.house_no }">
	      <input type="hidden" name="num" value="${hb.num }">
	      <input type="hidden" name="price" value="${hb.price }">
	      <input type="hidden" name="photo" value="${hb.photo }">
	      <input type="hidden" name="name" value="${hb.name }">
	      
	<div class="section">
		<div class="container">
			<div class="row justify-content-between">
				
				<input type="hidden" name="address" value="${hb.address }">
				
				<div class="col-lg-7">
					<div class="img-property">
               
                  <!-- 이미지 (시작) -->
                  <%-- <div class="img-property">
                     <img src="${fullpath}/${hb.photo }" alt="Image" class="img-fluid" />
                  </div> --%>
                  
                  <!-- 이미지 시작 -->   
                    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                      crossorigin="anonymous"></script>
                  
                  <div id="demo" class="carousel slide" data-ride="carousel">
                      <div class="carousel-inner">
                        <!-- 슬라이드 쇼 -->
                          <!--가로-->
                          <%String imgurl = request.getContextPath()+"/resources/house_images/";  %>
                        <c:set var="image" value="${fn:split(hb.photo ,',')}"></c:set>
                        <c:forEach var="img" items="${image}" varStatus="status">
                           <c:if test="${status.count eq 1}">
                               <div class="carousel-item active">
                                  <img class="d-block w-100 img-fluid" src="<%=imgurl %>${img }" alt="First slide">
                              </div>
                           </c:if>
                           <c:if test="${status.count > 1}">
                            <div class="carousel-item">
                               <img class="d-block w-100 img-fluid" src="<%=imgurl %>${img }" alt="slide">
                           </div>
                           </c:if>
                        <!-- 인디케이터 -->
                         <ul class="carousel-indicators">
                           <li data-target="#demo" data-slide-to="0" class="active"></li> <!--0번부터시작-->
                           <li data-target="#demo" data-slide-to="1"></li>
                           <li data-target="#demo" data-slide-to="2"></li>
                         </ul>
                      <!-- 인디케이터 끝 -->
                     </c:forEach>
                      </div>
                      <!-- / 슬라이드 쇼 끝 -->
                  
                      <!-- 왼쪽 오른쪽 화살표 버튼 -->
                      <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class = "sr-only">Previous</span>
                      </a>
                      <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class = "sr-only">Next</span>
                      </a>
                      <!-- / 화살표 버튼 끝 -->
                    </div>
                  <!-- 이미지 (끝) -->
                  <hr class="" >
                  <div class="main_content">
                       <div id="map" style="width:100%; height: 50vh;"></div>
                       <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC1__5iJFWWmmXi136vKe3MjSH9JKaS80g&region=kr"></script>
                    </div>
               </div>
				</div>
				
				<div class="col-lg-4">
					<div class="title">
						<h2 class="heading text-primary">${hb.name }</h2>
						<div class="heart">
							<img src="resources/images/heart-solid-24.png" width="20" height="20">
							<span class="countWish"> ${wishCount}</span>
						</div>
					</div>
					<p class="meta">${hb.address }</p>
					
					<!-- 예약하기 박스(시작) -->
					<div class="d-block agent-box p-5">
						<div class="text">
							<h3 class="mb-0">￦<fmt:formatNumber value="${hb.price }" pattern="#,###"/> / 박</h3><br><br>
							<div>
							
							<div class="mb-2 row" align="left">
                        		<label for="html5-date-input" class="col-form-label">체크인 : </label>
                          		<input class="form-control" type="date" name="checkin" value="${order.checkin }" id="checkin_date" min="${now }"/>
                          		<form:errors cssClass="err" path="checkin"/>
                      		</div><br>
                      		
							<div class="mb-2 row">
                        		<label for="html5-date-input" class="col-form-label">체크아웃 : </label>
                          		<input class="form-control" type="date" name="checkout" value="${order.checkout }" id="checkout_date" min="${now }"/>
                          		<form:errors cssClass="err" path="checkout"/>
                      		</div><br>
							
							<div class="mb-2 row">
								<label for="exampleFormControlTextarea1" class="form-label">성인 </label>
								<select class="form-select" aria-label="Default select example" name="adult" onChange="adultnumChange(${hb.maxnum })">
                        			<option value="">인원 수를 선택하세요</option>
                        			
                        			<c:forEach var="i" items="${numberList }">
                        			<option value="${i}" <c:if test="${i eq order.adult }">selected</c:if>>${i}명</option>
                        			</c:forEach>
                      			</select>
                      			<form:errors cssClass="err" path="adult"/>
                      		</div><br>
                      		
                      		<div class="mb-2 row">
	                      		<label for="exampleFormControlTextarea1" class="form-label">유아 </label>
								<select class="form-select" aria-label="Default select example" name="kid" onChange="kidnumChange(${hb.maxnum })">
	                        		<option value="">인원 수를 선택하세요</option>
	                        		<option value="0">0명</option>
                        		
	                        		<c:forEach var="i" begin="1" end="${fn:length(numberList)-1}">
	                        			<option value="${i}" <c:if test="${i eq order.kid }">selected</c:if>>${i}명</option>
	                        		</c:forEach>
                      			</select>
                      			<form:errors cssClass="err" path="kid"/>
                      		</div><br><br>
                      		
                      		&nbsp;※ 이 숙소의 기준 인원은 ${hb.num }명 입니다.<br>
                      		&nbsp;&nbsp;최대 인원은 ${hb.maxnum }명 입니다.<br><br>
                      		&nbsp;&nbsp; 그 외 추가인원은 인당 성인(20,000원),<br>&nbsp;&nbsp; 유아(10,000원) 이 추가됩니다.
                      		
                      		<br><br><br>
                      	
                            </div>
								<c:if test="${guestInfo != null }">
								<button class="btn btn-primary" type="submit">예약하기</button>
								</c:if>
								<!-- 로그인 안했을때 -->
								<c:if test="${guestInfo == null }">
								<button class="btn btn-primary" type="button" onclick="doLogin(${hb.house_no})">예약하기</button>
								</c:if>
							</div>
							
						</div>
						<!-- 예약하기 박스(끝) -->
						
					</div>
				</div>
				
			<br><br>
			<hr class="hr">
			
			<div class="row justify-content-between">
			  <h5 class="mb-0">숙소 상세 설명</h5><br><br>
			  <div class="col-lg-10">
				<pre>${hb.con1 }</pre> <br>
				<pre>${hb.con2 }</pre> <br>
				<pre>${hb.con3 }</pre>
			  </div>
			</div>
			
			<hr>
			
			<div class="row justify-content-between">
			  <h5 class="mb-0">숙소 정책</h5><br><br>
			  <div class="col-lg-10">
				${hb.notice }<br>
				${hb.rule }<br><br>
				
				<fmt:parseDate var="checkin" value="${hb.checkinTime }" type="time" pattern="HH:mm"/>
				체크인 시간 : <fmt:formatDate value="${checkin }" type="time" timeStyle="short"/> <br>
				
				<fmt:parseDate var="checkout" value="${hb.checkoutTime }" type="time" pattern="HH:mm"/>
				체크아웃 시간 : <fmt:formatDate value="${checkout }" type="time" timeStyle="short"/><br>
			  </div>
			</div>			
			
			<hr>
			
			<div class="row justify-content-between">
			  <h5 class="mb-0">편의 시설</h5><br><br>
			  <div class="col-lg-6">
				<c:if test="${fn:contains(hb.facility,'난방') }">
				<div class="icon"><img src="resources/images/난방.png" class="img-icon">&nbsp; 난방 </div>
				</c:if>
				
				<c:if test="${fn:contains(hb.facility,'냉장고') }">
				<div class="icon"><img src="resources/images/냉장고.png" class="img-icon">&nbsp; 냉장고</div>
				</c:if>
				
				<c:if test="${fn:contains(hb.facility,'무선인터넷') }">
				<div class="icon"><img src="resources/images/무선인터넷.png" class="img-icon">&nbsp; 무선인터넷</div>
				</c:if>
				
				<c:if test="${fn:contains(hb.facility,'세탁기') }">
				<div class="icon"><img src="resources/images/세탁기.png" class="img-icon">&nbsp; 세탁기</div>
				</c:if>
				
				<c:if test="${fn:contains(hb.facility,'수영장') }">
				<div class="icon"><img src="resources/images/수영장.png" class="img-icon">&nbsp; 수영장</div>
				</c:if>
			  </div>
			  <div class="col-lg-6">
				<c:if test="${fn:contains(hb.facility,'에어컨') }">
				<div class="icon"><img src="resources/images/에어컨.png" class="img-icon">&nbsp; 에어컨</div>
				</c:if>
				
				<c:if test="${fn:contains(hb.facility,'주방') }">
				<div class="icon"><img src="resources/images/주방.png" class="img-icon">&nbsp; 주방</div>
				</c:if>
				
				<c:if test="${fn:contains(hb.facility,'주차장') }">
				<div class="icon"><img src="resources/images/주차장.png" class="img-icon">&nbsp; 주차장</div>
				</c:if>
				
				<c:if test="${fn:contains(hb.facility,'화재경보기') }">
				<div class="icon"><img src="resources/images/화재.png" class="img-icon">&nbsp; 화재경보기</div>
				</c:if>
				
				<c:if test="${fn:contains(hb.facility,'TV') }">
				<div class="icon"><img src="resources/images/tv.png" class="img-icon">&nbsp; TV</div>
				</c:if>
			  </div>
			</div>
			
			<hr>
			
			<div class="row justify-content-between">
			  <h5 class="mb-0">리뷰<label style="margin-top: 27px;">&nbsp;(⭐</label>${rb.reviewavg})</h5><br><br>
			  <div class="col-lg-10">
			  
			  <c:choose>
		        <c:when test="${empty reviewList}"><br> 리뷰 내역이 없습니다 </c:when>
		        <c:otherwise>
		        <div class="section sec-testimonials">
			    	<div class="container">
			          <div class="row mb-5 align-items-center">
			            <div class="col-md-6"></div>
			            <div class="col-md-6 text-md-end padding0">
			               <div id="testimonial-nav">
			                  <span class="prev" data-controls="prev">Prev</span> <span
			                     class="next" data-controls="next">Next</span>
			               </div>
			             </div>
			           </div>
			         </div>
			         
		             <div class="testimonial-slider-wrap">
		             <div class="testimonial-slider">
		            
		             <c:forEach var="r" items="${reviewList }">
		               <!-- 리뷰 시작 -->
		               <div class="col-6 col-lg-3 tns-item" data-aos="fade-up" data-aos-delay="600">
						<div class="box-feature">
		                 <div class="testimonial"><br>
		                  <h3 class="h5 text-primary mb-4">${r.name }</h3>
		
		                     <div class="star-ratings">
		                           <div class="star-ratings-fill" style="width: ${r.total * 20 * 1.4}%">
		                              <span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span><span>⭐</span></div>
		                           <div class="star-ratings-base">
		                              <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
		                           </div><br>
		                     </div>
		                 </div>
		                 <blockquote>
		                 	<p>&ldquo; ${r.text } &rdquo;</p>
		                 </blockquote>
		                 <p class="text-black-50">${r.gname }</p>
		                </div>
		               </div>
		               <!-- 리뷰 끝 -->
		             </c:forEach>
		             </div>
		             </div>
		         </div>
		   		 </c:otherwise>
		   	   </c:choose>
			  
			  
			  </div>
			</div>
			
			
		</div>
	</div>
	</form:form>
	<%@ include file="footer.jsp"%>
</body>