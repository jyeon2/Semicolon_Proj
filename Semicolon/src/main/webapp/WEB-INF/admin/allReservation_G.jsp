<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>

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
  SEMICOLON(;)&nbsp; ADMIN-GRESERVATION page
</title>
</head>

<style>
.section{
	padding-bottom:120px;
	}	
body {
	margin-top: 130px;
	
}
table {
	position : relative;
	top : 0px;
	left:0px;
	border-top: 0 solid #d9dee3;
    border-collapse: collapse;

}
th, td {
    border-bottom: 0 solid #d9dee3;
    padding: 10px;
    height:50px;
    font-size: 15px;
    align: center;
  }
  td{
  	vertical-align: middle;
  }

.col-lg-9{
		position : relative;
		left : -50px;
	}

	.err {
		color: red;
		font-size: 8pt;
	}
	.form-check mt-3{
		float:left;
	}
	

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
		
		
</style>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script type="text/javascript">
	function detailView(gno,pno) {
		//alert(gno);
		//alert(pno);
		
		
		$.ajax({
			url : "detailModal.ad",
			data : {
				gno : gno,
				pno : pno
			},
			success : function(data, result) {
				//alert("???????????? ??????");
				//alert(data);
				var arr = data.split(',');
				result = arr[3]; //????????????
				$('#wpay').html(result);
				result = arr[9]; //????????????
				result = numbersWithCommas(result);
				$('#house_price').html(result+" ???");
				result = arr[10]; //??????????????????
				result = numbersWithCommas(result);
				$('#extra_price').html(result+" ???");
				result = arr[11]; //????????????
				result = numbersWithCommas(result);
				$('#discount_price').html("(-) "+result+" ???");
				result = arr[12]; //?????????????????????
				result = numbersWithCommas(result);
				$('#totalPoint').html("(+) "+result+" point");
				result = arr[13]; //??? ????????????
				result = numbersWithCommas(result);
				$('#totalPrice').html(result+" ???");
				
				result = arr[15]; //????????????
				$('#photo').attr("src",result);
				result = arr[16]; //???????????????
				$('#checkin').html(result);
				result = arr[17]; //??????????????????
				$('#checkout').html(result);
				result = arr[18]; //?????????
				$('#adult').html(result+"???");
				result = arr[19]; //????????????
				$('#kid').html(result+"???");
				result = arr[20]; //????????????
				$('#name').html(result);
				
				/*
				arr[] = data.split(",");
				alert(arr[0]);
				*/
				
			},
			error : function() {
				//alert("???????????? ??????")
			}
			
		});	
	}
	
	//????????????????????? , ??????
	function numbersWithCommas(x) {
		return x.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
	
</script>

 <body>
 
 <%@ include file="ad_top.jsp" %><br>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 mb-5 mb-lg-0" data-aos="fade-up"
				data-aos-delay="100">
				<div class="contact-info">
					<div class="address mt-2">
					
						<i class="icon-list-ol"></i>
						<h4 class="mb-2">
							<a href="allRHost.ad">HOST ??????</a>
						</h4>
						<p>
							<br/>

						</p>
					</div>

					<div class="open-hours mt-4">
						<i class="icon-money"></i>
						<h4 class="mb-2">
							<a href="allRGuest.ad">GUEST ????????????</a> <!-- orders select * from  -->
						</h4>
						<p>
							<br/>
						</p>
					</div>
				</div>
			</div>
			<div class="col-lg-9" data-aos="fade-up" data-aos-delay="200">
			
                      <!-- Table within card -->
                    
              <div class="table-responsive text-nowrap">
                <table class="table table-hover">
                  <thead>
                    <tr>
                      <th>HOST.N</th>
                      <th>????????????</th>
                      <th>?????????</th>
                      <th>??????(Main/Sub)</th>
                      <th>??? ?????????</th>
                      <th>????????????</th>
                      <th>??? ????????????</th>
                    </tr>
                  </thead>
                  <tbody class="table-border-bottom-0">
                  <c:forEach var="ag" items="${AGlist }">
                    <tr>
                      <td style="font-style:bolder;">${ag.hsname}</td>
                      <td>${ag.gname }</td>
                      <td>${ag.name }</td>
                      <td>${ag.tname } / ${ag.sname}</td>
                      <td>${ag.adult+ag.kid} &nbsp;(??????:${ag.kid})</td><!-- ??????????????? -->
                      <td style="text-decoration: underline;text-underline-position:under;" onclick="detailView(${ag.gno},${ag.pno})" data-bs-toggle="modal" data-bs-target="#datailModal"><i class="fab fa-angular fa-lg text-danger me-3"></i>??????</td>
   					  <td style="color: #dc3545; font-weight: bold;"><fmt:formatNumber value="${ag.totalPrice}" pattern="#,###"/>???</td>
                     
                      </tr>
                    </c:forEach>
                    <!-- <tr>
                      <td colspan="7" align="right">??????: </td>
                    </tr> -->
                  </tbody>
                </table>
              </div>
              <!--/ Table within card -->
                    
			</div>
		</div>	
	</div>
</div>
<!-- /.untree_co-section -->

<!-- Modal -->
<div class="modal fade" id="datailModal" tabindex="-1" style="display: none;" aria-hidden="true" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="modalCenterTitle">?????? ?????? ??????</h5>
          <button type="button" id="modalClose" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          </button>
      </div>
      <div class="modal-body">
		
		<div class="col-lg-12">
		<table class="table site-block-order-table mb-3 modalTable">
          <thead>
            <tr>
              <th><h5>?????? ??????</h5></th>
            </tr>
          </thead>
          
          <tbody>
            <tr>
              <td class="col-sm-5"><img src="" alt="Image" class="img-fluid" id="photo"/></td>
              <td class="col-sm-6">
                <div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font label" for="basic-icon-default-fullname">?????? ??????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="basic-icon-default-fullname2" class="input-group-text">
		                  <i class="bx bx-user"></i></span>
		                  <span id="name" class="form-control">
		                  </span>
		                    
		                </div>
		              </div>
				</div>
		        <div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font label" for="basic-icon-default-fullname">?????????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="basic-icon-default-fullname2" class="input-group-text">
		                  <i class="bx bx-user"></i></span>
		                  <span id="checkin" class="form-control">
		                  </span>
		                </div>
		              </div>
				</div>
				<div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font label" for="basic-icon-default-fullname">????????????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="basic-icon-default-fullname2" class="input-group-text">
		                  <i class="bx bx-user"></i></span>
		                  <span id="checkout" class="form-control">
		                  </span>
		                </div>
		              </div>
				</div>
				<div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font label" for="basic-icon-default-fullname">??????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="basic-icon-default-fullname2" class="input-group-text">
		                  <i class="bx bx-user"></i></span>
		                  <span id="adult" class="form-control">
				          </span>
		                </div>
		              </div>
				</div>
				<div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font label" for="basic-icon-default-fullname">??????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="basic-icon-default-fullname2" class="input-group-text">
		                  <i class="bx bx-user"></i></span>
		                  <span id="kid" class="form-control">
		                  </span>
		                </div>
		              </div>
				</div>
			  </tr>
          </tbody>
        </table>
        </div>
        
        <div class="col-lg-12">
		<table class="table site-block-order-table mb-5">
          <thead>
            <tr>
              <th><h5>?????? ??????</h5></th>
            </tr>
          </thead>
          
          <tbody>
            <tr>
              <td class="col-sm-6">
                <div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">????????????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="wpay" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
                <div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">????????????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="house_price" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
		        <div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">??????????????????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="extra_price" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
				<div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">????????????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="discount_price" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
				<div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname">?????????????????????</label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span id="totalPoint" class="form-control won">
		                  </span>
		                </div>
		              </div>
				</div>
				
				<hr>
				
				<div class="row mb-3">
		  			<label class="col-sm-3 col-form-label font" for="basic-icon-default-fullname"><strong>??? ????????????</strong></label>
		              <div class="col-sm-9">
		                <div class="input-group input-group-merge">
		                  <span class="form-control won">
		                  	<strong id="totalPrice"></strong>
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
        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">??????</button>
      </div>
    </div>
  </div>
</div>
<!-- Modal ??? -->



<%@ include file="ad_bottom.jsp" %>
 </body>
	