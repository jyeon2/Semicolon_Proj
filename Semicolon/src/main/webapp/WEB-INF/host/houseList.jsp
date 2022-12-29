<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>


<% 
   String[] countryArr = {"Korea","San Francisco","New York","Seattle","Los Angeles","Chicago"};
   String[] numArr = {"1","2","3","4","10",};
   String[] facilityArr1 = {"에어컨","무선인터넷","주방","냉장고","주차장"};
   String[] facilityArr2 = {"수영장","TV","난방","세탁기","화재경보기"};
   
%>

<c:set var="countryArr" value="<%=countryArr %>"/>
<c:set var="numArr" value="<%=numArr %>"/>
<c:set var="facilityArr1" value="<%=facilityArr1 %>"/>
<c:set var="facilityArr2" value="<%=facilityArr2 %>"/>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

<!-- <script src="../../resources/js/jquery-3.3.1.min.js"></script>
<script src="../../resources/js/bootstrap.bundle.min.js"></script> -->


<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.5.1-beta/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.5.1-beta/css/bootstrap.min.css"></link> -->

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />


<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="resources/css/tiny-slider.css" />
<link rel="stylesheet" href="resources/css/aos.css" />
<link rel="stylesheet" href="resources/css/style.css" />


<title>Semicolon HOST HouseList Page</title>
</head>


<script>
   function action(){
      /* alert(3)
       $('button[type="button"]').click(function(){
         $('div[id="drop-menu"]').dropdown();
      }) */
   }
   
</script>
<style>
   .section{
   padding-bottom:120px;
   }   
   body {
      margin-top: 120px;
      font-style : "Public Sans", -apple-system, BlinkMacSystemFont, "Segoe UI", 
      "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif;
   }
   th{
      color : #566a7f;
      text-transform: uppercase;
       font-size: .95rem;
       letter-spacing: 1px;
       font-weight: 600;
       line-height:1.53;
   }
   td{
      color : color: #697a8d;
      text-transform: uppercase;
       
       color-scheme: light;
       font-size:0.9375rem;
       font-weight:400;
       line-height:1.53;
       -webkit-text-size-adjust: 100%;
       -webkit-tap-highlight-color: rgba(67,89,113,0);
   }
   .form-check mt-3{
      float:left;
   }
   .col-lg-9{
      position : relative;
      left : -50px;
   }
   .err{
      color:red;
      font-size: 5pt;
   }
   .dropdown-menu{
      position: absolute;
    z-index: 1000;
    display: none;
    min-width: 10rem;
    padding: 0.5rem 0;
    margin: 0;
    font-size: 1rem;
    color: #212529;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0, 0, 0, 0.15);
    border-radius: 0.25rem;
   }
   
</style>

<%@ include file="header.jsp"%><br>
<!-- --------------------- -->

<div class="section">
   <div class="container">
      <div class="row">
         <div class="col-lg-3 mb-5 mb-lg-0" data-aos="fade-up"
            data-aos-delay="100">
            <div class="contact-info">
               <div class="address mt-2">
                  <i class="icon-room"></i>
                  <h4 class="mb-2">
                     <a href="addHouse.ht">숙소 추가</a>
                  </h4>
                  <p>
                     <br />

                  </p>
               </div>

               <div class="open-hours mt-4">
                  <i class="icon-clock-o"></i>
                  <h4 class="mb-2">
                     <a href="hlist.ht">숙소 목록</a>
                  </h4>
                  <p>
                     <br />

                  </p>
               </div>

               <div class="email mt-4">
                  <i class="icon-envelope"></i>
                  <h4 class="mb-2">
                     <a href="reservation.ht">예약 목록</a>
                  </h4>
                  <p>
                     <br />

                  </p>
               </div>
            </div>
         </div>
         <div class="col-lg-9" data-aos="fade-up" data-aos-delay="200">
         
                      <!-- Table within card -->
                      
              <div class="table-responsive text-nowrap">
                <table class="table card-table">
                  <thead>
                    <tr>
                      <th>번호</th>
                      <th>&nbsp;&nbsp;숙소이름</th>
                      <th>카테고리</th>
                      <th>등록날짜</th>
                      <th>예약건수</th>
                      <th>수정/삭제</th>
                    </tr>
                  </thead>
                  <tbody class="table-border-bottom-0">
                  <c:forEach varStatus="i" var="lists" items="${all_lists }">
                    <tr>
                      <td>${i.count }</td>
                      <td><i class="fab fa-angular fa-lg text-danger me-3"></i>${lists.name }</td>
                      <td>${lists.tname }-${lists.sname }</td>
                      <td>
                         <fmt:parseDate var="parseDate" value="${lists.house_date}" pattern="yyyy-MM-dd"/>
                         <fmt:formatDate var="house_date" value="${parseDate}" pattern="yyyy-MM-dd"/>
                         ${house_date }
                      </td>
                     <td style="font-weight: bold;"align=center>${lists.cnt }</td>
                     <td align="center">
                         <div class="dropdown">
                          <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                            <i class="bx bx-dots-vertical-rounded"></i>
                          </button>
                          <div class="dropdown-menu">
                            <a class="dropdown-item" href="hupdate.ht?house_no=${lists.house_no }">
                               <i class="bx bx-edit-alt me-1"></i> 수정
                            </a>
                            <a class="dropdown-item" href="delete.ht?house_no=${lists.house_no }"> 
                               <i class="bx bx-trash me-1"></i> 삭제
                            </a>
                          </div>
                       </div> 
                      </td>
                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
              <!--/ Table within card -->
                    
         </div>
      </div>   
   </div>
</div>
<!-- /.untree_co-section -->

<!-- --------------------- -->
<br><%@ include file="footer.jsp"%>