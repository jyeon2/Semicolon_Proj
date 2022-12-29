<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- HTML5 Shim and Respond.js IE10 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 10]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
      <![endif]-->
    <!-- Meta -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
    <meta name="author" content="Codedthemes" />
    <!-- Favicon icon -->
    <link rel="icon" href="resources/aassets/images/favicon.ico" type="image/x-icon">
    <!-- Google font-->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
    <!-- waves.css -->
    <link rel="stylesheet" href="resources/aassets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- Required Fremwork -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/css/bootstrap/css/bootstrap.min.css">
    <!-- waves.css -->
    <link rel="stylesheet" href="resources/aassets/pages/waves/css/waves.min.css" type="text/css" media="all">
    <!-- themify icon -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/icon/themify-icons/themify-icons.css">
    <!-- font-awesome-n -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/css/font-awesome-n.min.css">
    <link rel="stylesheet" type="text/css" href="resources/aassets/css/font-awesome.min.css">
    <link href="https://use.fontawesome.com/releases/v6.2.0/css/all.css" rel="stylesheet">
    <!-- scrollbar.css -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/css/jquery.mCustomScrollbar.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/css/style.css">

   <!-- themify-icons line icon -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/icon/themify-icons/themify-icons.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/icon/font-awesome/css/font-awesome.min.css">
    <!-- ico font -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/icon/icofont/css/icofont.css">
    <!-- morris chart -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/css/morris.js/css/morris.css">
    <!-- Style.css -->
    <link rel="stylesheet" type="text/css" href="resources/aassets/css/style.css">
    <link rel="stylesheet" type="text/css" href="resources/aassets/css/jquery.mCustomScrollbar.css">
   
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
   <style>
	body {
		margin-top: 130px;
	}
	
	.date {
		padding-left: 8px;
		padding-right: 8px;
		height: 35px;
		width: 50%;
	}
	
	.btn {
		border-radius: 2px;
		text-transform: capitalize;
		font-size: 15px;
		padding: 6px 0px;
		text-align: center;
		cursor: pointer;
		height: 35px;
		width: 20%;
	}
	
	.main-body .page-wrapper {
		padding: 20px;
		-webkit-transition: all ease-in 0.3s;
		transition: all ease-in 0.3s;
	}
	
	.pcoded-inner-content {
		padding: 10px 110px;
		padding-top: 30px;
		position: relative;
		z-index: 8;
		text-align: center;
		background-color: rgba(0, 32, 74, 0.05);
	}
	.card-header {
		text-align: left;
	}
	.btn-outline-inverse {
	    color: #1e272b;
	    border-color: #1e272b !important;
	    border: 1px solid !important;
	    background-color: #fff;
	}
	.btn-outline-inverse:hover {
		color: #fff !important;
	}
</style>
   
</head>

<body>

<%@ include file="ad_top.jsp" %>
                    
  <div class="pcoded-content">
      <!--
      <div class="page-header">
          <div class="page-block">
              <div class="row align-items-center">
                  <div class="col-md-8">
                      <div class="page-header-title">
                          <h5 class="m-b-10">가입자수 그래프 및 통계</h5>
                          <p class="m-b-0">You can see the data at a glance with a graph</p>
                      </div>
                  </div>
                  <div class="col-md-4">
                      <ul class="breadcrumb">
                          <li class="breadcrumb-item">
                              <a href="index.ad"> <i class="fa fa-home"></i> </a>
                          </li>
                          <li class="breadcrumb-item">가입자수 그래프 및 통계</li>
                      </ul>
                  </div>
              </div>
          </div>
      </div>
      -->
      
      <div class="pcoded-inner-content">
          <!-- Main-body start -->
          <div class="main-body">
              <div class="page-wrapper">
                  <!-- Page-body start -->
                  <div class="page-body">
                      <div class="row">

                     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
                     <script>
                     $(document).ready(function(){
                        
                        $.ajax({
                           url : 'graphTheme.ad',
                           type : 'POST',
                           success : function(map) {
                              console.log(map)
                              
                              if(map.theme != null && map.theme != "") {
                                 console.log("theme chart")

                                 $.each(map.theme, function(index, item) {
                                    console.log(item.tname);
                                    console.log(item.cnt);
                                    
                                    console.log("index:"+index)
                                    chart1Label.push(item.tname);
                                    chart1data.push({x:item.tname, y:item.cnt});
                                    
                                 });
                                 
                                 console.log(chart1data);
                              }

                              barChart();
                              
                              if(map.subtheme != null && map.subtheme != "") {
                                  console.log("subtheme chart")

                                  $.each(map.subtheme, function(index, item) {
                                     console.log(item.sname);
                                     console.log(item.cnt);
                                     
                                     console.log("index:"+index)
                                     chart2Label.push(item.sname);
                                     chart2data.push({x:item.sname, y:item.cnt});
                                     
                                  });
                                  
                                  console.log(chart2data);
                               }
                               
                               barChart2();
                              
                              
                           },
                           error : function(jqXHR, textStatus, errorThrown){
                              alert(textStatus + " : " + errorThrown);
                           }
                        });   
                        
                     }); //ready
                     
                     var chart1Label = [];
                     var chart1data = [];
                     
                     var chart2Label = [];
                     var chart2data = [];

                     
                     function barChart(){
                        console.log("barchart")
                        console.log(chart1Label)
                        console.log(chart1data)

                     var ctx = $('#barchart').get(0).getContext('2d');
                     var bardata =
                     {
                        labels: chart1Label,
                         datasets:
                            [{
                                labels: '숙소개수',
                                 backgroundColor: '#FFC7C7',
                                 fill: false,
                                 data: chart1data
                             }]
                     };
                     var baroptions = {
                           //responsive: true,
                           legend : {
                              display: false
                           },
                           animation: false,
                           tooltips: {
                              mode: 'x',
                              intersect: false,
                                 displayColors: false, // 툴팁 바 컬러 표시 여부
                                 titleFontColor: '#fff', // 툴팁 폰트 관련
                                 titleAlign: 'center', // 툴팁 폰트 관련
                                 callbacks: {
                                    label: function(tooltipItem, data) {
                                           var item = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].y;
                                           //var label = data.datasets[tooltipItem.datasetIndex].labels[tooltipItem.index];
                                           return '숙소 개수' + ' : '+ item + '개';
                                   }
                                }
                           },
                           scales: {
                              yAxes: [{
                                 ticks: {
                                    beginAtZero: true,
                                    stepSize: 5,
                                    fontSize : 14,
                                 }
                              }]
                           }
                     };
                     var barChart = new Chart(ctx,{          
                        type: 'bar',
                        data: bardata,
                        options: baroptions
                     });
                     }//bar chart
                     
                     
                     //테마 선택 눌렀을 때
                     function themeClick() {
                        chart2Label = [];
                        chart2data = [];
                        
                        $('#linechart').remove();
                        $('#chartjs-line-chart').append('<canvas id="linechart" height="100" width="250"></canvas>');
                        
                        var theme = $('select[name="tname"] option:selected').val();
                        //alert(theme);
                        
                        $.ajax({
                           url : 'graphSubTheme.ad',
                           type : 'POST',
                           data : { theme : theme },
                           success : function(map) {
                              console.log(map)
                              
                              if(map.list != null && map.list != "") {
                                 console.log("subtheme chart")

                                 $.each(map.list, function(index, item) {
                                    console.log(item.sname);
                                    console.log(item.cnt);
                                    
                                    console.log("index:"+index)
                                    chart2Label.push(item.sname);
                                    chart2data.push({x:item.sname, y:item.cnt});
                                    
                                 });
                                 
                                 console.log(chart2data);
                              }
                              
                              barChart2();
                              
                           },
                           error : function(jqXHR, textStatus, errorThrown){
                              alert(textStatus + " : " + errorThrown);
                           }
                        });   
                        
                     }//themeClick
                     
                     function barChart2() {
                    	 console.log("barchart2")
                         console.log(chart2Label)
                         console.log(chart2data)

                      var ctx = $('#linechart').get(0).getContext('2d');
                      var bardata =
                      {
                         labels: chart2Label,
                          datasets:
                             [{
                                 labels: '숙소개수',
                                  backgroundColor: '#8785A2',
                                  fill: false,
                                  data: chart2data
                              }]
                      };
                      var baroptions = {
                            //responsive: true,
                            legend : {
                               display: false
                            },
                            animation: false,
                            tooltips: {
                               mode: 'x',
                               intersect: false,
                                  displayColors: false, // 툴팁 바 컬러 표시 여부
                                  titleFontColor: '#fff', // 툴팁 폰트 관련
                                  titleAlign: 'center', // 툴팁 폰트 관련
                                  callbacks: {
                                     label: function(tooltipItem, data) {
                                            var item = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index].y;
                                            //var label = data.datasets[tooltipItem.datasetIndex].labels[tooltipItem.index];
                                            return '숙소 개수' + ' : '+ item + '개';
                                    }
                                 }
                            },
                            scales: {
                               yAxes: [{
                                  ticks: {
                                     beginAtZero: true,
                                     stepSize: 5,
                                     fontSize : 14,
                                  }
                               }]
                            }
                      };
                      var barChart = new Chart(ctx,{          
                         type: 'bar',
                         data: bardata,
                         options: baroptions
                      });
                    	 
                     }
                     
                     
                     </script>
                    
                    <!-- Bar Chart Start -->
                          <div class="col-md-12 col-lg-12">
                             <div class="card">
                                 <div class="card-header">
                                     <h5>테마별 숙소개수</h5>
                                     <div class="card-header-right">
                                         <ul class="list-unstyled card-option">
                                           <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                           <li><i class="fa fa-window-maximize full-card"></i></li>
                                           <li><i class="fa fa-minus minimize-card"></i></li>
                                           <li><i class="fa fa-refresh reload-card"></i></li>
                                           <li><i class="fa fa-trash close-card"></i></li>
                                         </ul>
                                     </div>
                                     <span>테마별 숙소 개수를 보여줍니다.</span><br>
                                 </div>
                                 <div class="card-block">
                                     <div id="chartjs-bar-chart">
                                        <canvas id="barchart" height="100" width="250"></canvas>
                                     </div>
                                 </div>
                             </div>
                          </div>
                          <!-- Bar Chart Ends -->

                          <!-- Line Chart Start -->
                          <div class="col-md-12 col-lg-6">
                             <div class="card">
                                 <div class="card-header">
                                     <h5>서브테마별 숙소개수</h5>
                                     <div class="card-header-right">
                                         <ul class="list-unstyled card-option">
                                           <li><i class="fa fa fa-wrench open-card-option"></i></li>
                                           <li><i class="fa fa-window-maximize full-card"></i></li>
                                           <li><i class="fa fa-minus minimize-card"></i></li>
                                           <li><i class="fa fa-refresh reload-card"></i></li>
                                           <li><i class="fa fa-trash close-card"></i></li>
                                         </ul>
                                     </div>
                                     <span>테마를 선택하면 해당하는 서브테마의 숙소 개수를 그래프로 볼 수 있습니다.</span><br>
                                     <div class="col-md-12 col-lg-12">
                                       <div class="row">
                                            <select class="form-select date" id="theme" name="tname" >
												<c:forEach var="theme" items="${tlists}">
													<option value="${theme.name}">${theme.name}</option>
												</c:forEach>
											</select>
                                            <button class="btn waves-effect waves-light btn-inverse btn-outline-inverse form-control" onclick="themeClick()">선택</button>
                                       </div>
                                     </div>
                                     <span id="period"></span>
                                 </div>
                                 <div class="card-block">
                                     <div id="chartjs-line-chart">
                                        <canvas id="linechart" height="100" width="250"></canvas>
                                     </div>
                                 </div>
                             </div>
                          </div>
                          <!-- Line Chart Ends -->
                          
                          <div class="col-md-12 col-lg-6">
                              <div class="row">
                                  <!-- sale card start -->
                                  <div class="col-md-6">
                                      <div class="card text-center order-visitor-card">
                                          <div class="card-block">
                                              <h6 class="m-b-0">어제 숙소개수</h6>
                                              <h4 class="m-t-15 m-b-15"><i class="fa-solid fa-house m-r-15 text-c-black"></i>${yesterday_house }</h4>
                                              <p class="m-b-0">어제 등록된 숙소 개수는 <b>${yesterday_house }개</b> 입니다.</p>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                      <div class="card text-center order-visitor-card">
                                          <div class="card-block">
                                              <h6 class="m-b-0">오늘 숙소개수</h6>
                                              <c:if test="${yesterday_house < today_house }">
                                                 <h4 class="m-t-15 m-b-15">
                                                    <i class="fa fa-arrow-up m-r-15 text-c-green"></i>${today_house-yesterday_house }
                                                 </h4>
                                              </c:if>
                                              <c:if test="${yesterday_house == today_house }">
                                                 <h4 class="m-t-15 m-b-15">
                                                    <i class="fa-solid fa-house m-r-15 text-c-black"></i>${yesterday_house-today_house }
                                                 </h4>
                                              </c:if>
                                              <c:if test="${yesterday_house > today_house }">
                                                 <h4 class="m-t-15 m-b-15">
                                                    <i class="fa fa-arrow-down m-r-15 text-c-red"></i>${yesterday_house-today_house }
                                                 </h4>
                                              </c:if>
                                              <p class="m-b-0">오늘 등록된 숙소 개수는 <b>${today_house }개</b> 입니다.</p>
                                          </div>
                                      </div>
                                  </div>
                              </div> 
                              <div class="row">
                                  <div class="col-md-6">
                                      <div class="card text-center order-visitor-card">
                                          <div class="card-block">
                                              <h6 class="m-b-0">이번달 최저 숙소개수</h6>
                                              <h4 class="m-t-15 m-b-15"><i class="fa-solid fa-house m-r-15 text-c-black"></i>${min_house }</h4>
                                              <%-- <p class="m-b-0">이번달에 등록된 최저 숙소 개수는 <b>${min_house }개</b> 입니다.</p> --%>
                                          </div>
                                      </div>
                                  </div>
                                  <div class="col-md-6">
                                      <div class="card text-center order-visitor-card">
                                          <div class="card-block">
                                              <h6 class="m-b-0">이번달 최고 숙소개수</h6>
                                              <h4 class="m-t-15 m-b-15"><i class="fa-solid fa-house m-r-15 text-c-black"></i>${max_house }</h4>
                                              <%-- <p class="m-b-0">이번달에 등록된 최고 숙소 개수는 <b>${max_house }개</b> 입니다.</p> --%>
                                          </div>
                                      </div>
                                  </div>
                                  
                                  <!-- sale card end -->
                              </div>
                          </div>
                          

                      </div>
                  </div>
                  <!-- Page-body end -->
              </div>
              <div id="styleSelector"> </div>
          </div>
      </div>
      <br><br>
  </div>
                    
<%@ include file="ad_bottom.jsp" %>

</body>
</html>