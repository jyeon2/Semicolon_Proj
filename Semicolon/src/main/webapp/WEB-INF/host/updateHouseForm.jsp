<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp"%>
<%@ include file = "Modal.jsp"%>
<%@ include file = "style.jsp"%>

<% 
   String[] numArr = {"1","2","3","4","10",};
   String[] facilityArr1 = {"에어컨","무선인터넷","주방","냉장고","주차장"};
   String[] facilityArr2 = {"수영장","TV","난방","세탁기","화재경보기"};
   
%>

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

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap5" />

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />


<link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
<link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

<link rel="stylesheet" href="resources/css/tiny-slider.css" />
<link rel="stylesheet" href="resources/css/aos.css" />
<link rel="stylesheet" href="resources/css/style.css" />

<title>SEMICOLON(;)&nbsp; HOST-Update page</title>
</head>

<style>
   .section{
   padding-top: 150px;
   padding-bottom:120px;
   }   
   body {
      margin-top: 120px;
   }

   .err {
      color: red;
      font-size: 8pt;
   }
   .form-check mt-3{
      float:left;
   }
   button{
      position : relative;
   }
   .btn-primary:hover {
   	  background: #424242 !important;
      color: #fff !important;
   }
   .btn {
    text-decoration: none !important;
    border-radius: 30px !important;
    padding-top: 15px !important;
    padding-bottom: 15px !important;
    padding-left: 30px !important;
    padding-right: 30px !important;
    border-width: 2px !important;
    border-color: transparent;
    border: none !important;
    top: 0;
    position: relative;
    -webkit-transition: .3s all ease;
    -o-transition: .3s all ease;
    transition: .3s all ease;
}
   .form-label {
    margin-bottom: 0.5rem;
    color : #316e7a;
    font-weight: bold;
    
   }
   .title_Css{
      font-size: 20pt;
   }
   img{
      border-radius: 20px 20px 20px 20px;
      height: 200px !important;
   }
</style>

<script>

   function themeChange(house_no){
      //alert(1)
      
      t_sel = myform.theme;
      
      t_selIndex = t_sel.selectedIndex; //몇 행인지
      t_selValue = t_sel[t_selIndex].value; 
      t_selText = t_sel[t_selIndex].text; 
      
      //alert(t_selValue);
      //1, 인원수, 인원수
      //2, 자연, 자연
      //3, 성별, 성별
      
      //2번째 select에 option넣는 작업 --> (HAddHouseController 이동)
      //location.href="updateSubTheme.ht?t_selValue="+t_selValue+"&house_no="+house_no;
      
      $.ajax({
    	  url: 'selectSubTheme.ht',
    	  type: 'POST',
    	  data: {t_selValue: t_selValue},
    	  success: function(map) {
    		  console.log(map)
    		  
    		  
    		  if(map.slists != null && map.slists != "") {
    			  slists = map.slists;
    			  
    			  $("select#subtheme option").remove();
    			  $("select#subtheme").append("<option value=''>서브테마를 선택하세요</option>");
    			  
    			  for(var i=0; i<slists.length; i++) {
    				  //alert(slists[i].name);
    				  $("select#subtheme").append("<option value='"+slists[i].name+"'>"+slists[i].name+"</option>");
    			  }
    			  
    		  }
    		  
    	  },
    	  error: function() {
    		  alert("변경 실패")
    	  }
      });
      
   }
</script>

<%@ include file="header.jsp"%><br>
<!-- --------------------- -->

<div class="section">
   <div class="container">
      <div class="row">
         <div class="col-lg-4 mb-5 mb-lg-0" data-aos="fade-up" data-aos-delay="100">
            
            <!-- 이미지 시작 -->   
              <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
                integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
                <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
                crossorigin="anonymous"></script>
              <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
                crossorigin="anonymous"></script>
              <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
                crossorigin="anonymous"></script>
            
            <div id="demo" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                  <!-- 슬라이드 쇼 -->
                    <!--가로-->
                    <%String imgurl = request.getContextPath()+"/resources/house_images/";  %>
                  <c:set var="image" value="${fn:split(all.photo ,',')}"></c:set>
                  <c:forEach var="img" items="${image}" varStatus="status">
                     <c:if test="${status.count eq 1}">
                         <div class="carousel-item active">
                            <img class="d-block w-100" src="<%=imgurl %>${img }" alt="First slide">
                        </div>
                     </c:if>
                     <c:if test="${status.count > 1}">
                      <div class="carousel-item">
                         <img class="d-block w-100" src="<%=imgurl %>${img }" alt="slide">
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
         
         
         
            <%-- <img src="${fullPath }/${all.photo}" width=100% height=400> --%>
            
            
            
         </div>
         <div class="col-lg-8" data-aos="fade-up" data-aos-delay="200">
               <div class="title_Css">&nbsp;숙소 수정</div>
            <form:form commandName="all" action="hupdate.ht" method="post" enctype="multipart/form-data" name="myform">
               
               <input type="hidden" name="house_no" value="${all.house_no }">
               <input type="hidden" name="t_selValue" value="${keyword }">
               
               <!-- Form controls -->

               <div class="card-body">
                  
                  <div class="mb-3">
                     <label for="exampleFormControlSelect1" class="form-label">테마</label> 
                     <select class="form-select" id="theme" name="tname" aria-label="Default select example" onChange="themeChange(${all.house_no })">
                        <option value="">테마를 선택하세요</option>
                        <c:forEach var="i" items="${tlists}">
                           <option value="${i.name }" <c:if test="${i.name eq all.tname ||i.name eq keyword}">selected</c:if>>${i.name }</option>
                        </c:forEach>
                     </select>
                     <form:errors cssClass="err" path="tname"/>
                  </div>


                  <div class="mb-3">
                     <label for="exampleFormControlSelect1" class="form-label">서브테마</label> 
                     <select class="form-select" id="subtheme" name="sname" aria-label="Default select example">
                        <option value="">서브테마를 선택하세요</option>
                        <c:forEach var="i" items="${slists}">
                           <option value="${i.name }" <c:if test="${i.name eq all.sname}">selected</c:if>>${i.name }</option>
                        </c:forEach>
                     </select>
                     <form:errors cssClass="err" path="sname"/>
                  </div>
                  <div class="mb-3">
                     <label for="exampleFormControlInput1" class="form-label">숙소 이름</label> 
                     <input type="text" class="form-control" id="exampleFormControlInput1" name="name" value="${all.name }"/>
                     <form:errors cssClass="err" path="name"/>
                  </div>
                  
                      <div class="mb-3">
                         <label class="form-label" for="customFileSm">
                            사진 추가하기
                         </label> <br>
                         <input type="hidden" name="originalImg" value="${all.photo }">
                  <a href="" style="text-decoration: none;">
                  <img src="resources/images/image.png" width="40px" id="img">
                  </a>
                  <!-- <input type="button" class="form-control form-control-sm" id="img" value="이미지 선택하기"> -->
                  <input type="file" accept=".jpg, .png" multiple name="Insert_images" id="imgfile" style="display: none;"> 
                  <%-- <input class="form-control form-control-sm" type="file" accept=".jpg, .png"  multiple name="Insert_images" id="imgfile" value="${all.upload }" style="display: none;"> --%> 
                  
                  
                  <script type="text/javascript"
                     src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
                 <script type="text/javascript">
                  $(document).ready(function(){
                     $('button[name="ok"]').click(function(){
                        var address = $('input[name="modal_address"]').val()
                        
                        $('input[name="address"]').val(address)
                     })
                     
                      //이미지      
                     $('#img').click(function (e) {
                               document.myform.img.value = document.getElementById( 'img' ).src;
                               e.preventDefault();
                               $('#imgfile').click();
                        });      
                  });
                  
                  let regex = new RegExp("(.*?)\.(jpg|png)$");
                      let maxSize = 1048576; //1MB

                   function fileCheck(fileName, fileSize){

                      if(fileSize >= maxSize){
                         alert("파일 사이즈 초과");
                         return false;
                      }
                           
                      if(!regex.test(fileName)){
                         alert("해당 종류의 파일은 업로드할 수 없습니다.");
                         return false;
                      }
                      
                      return true;      
                          
                       }
                  </script>
                  
                  <div id='Insert_image_preview'>
                     <div id='i_att_zone' data-placeholder='파일을 첨부 하려면 버튼을 클릭하거나 드래그앤드롭 하세요'>
                         
                     </div>
                  </div>
                         <form:errors cssClass="err" path="upload"/>
                      </div>
                      
                      
                      <div class="mb-3">
                          <label for="exampleFormControlInput1" class="form-label">숙소 가격</label>
                      </div>
                      <div class="input-group">
                        <span class="input-group-text">￦</span>
                        <input type="text" class="form-control" aria-label="Amount (to the nearest dollar)" name="price" value="${all.price }"/>
                        <span class="input-group-text">원</span>
                      </div><br>
                        <form:errors cssClass="err" path="price"/>
                  
                  <!-- 주소 -->
                  
                        <div class="mb-3">
                           <label class="form-label" for="inputCity">주소 검색</label> 
                           <input type="button" class="form-control" value="주소 등록하기" data-toggle="modal"  data-target="#myModal">
                        </div><br>
                             
                  <div class="mb-3">
                     <label class="form-label" for="inputAddress">주소</label> 
                     <input class="form-control" id="inputAddress" name="address" value="${all.address }">
                     <form:errors cssClass="err" path="address"/>
                  </div><br>
                  
                  <div class="mb-3">
                     <label class="form-label" for="inputAddress">상세 주소</label> 
                     <input class="form-control" id="inputDetailed" name="detailed" value="${all.detailed }">
                  </div><br>
                  
                  <!-- 주소 -->
                  
                    <!-- Checkboxes and Radios -->
                         <div class="mb-3">
                  <label for="exampleFormControlSelect1" class="form-label">편의시설</label> <br>
                     <c:forEach var="facility1" items="${facilityArr1 }">
                         <input  name="facility" class="form-check-input" type="checkbox" value="${facility1 }"
                            <c:if test="${fn:contains(all.facility,facility1)}">checked</c:if>>
                               <label class="form-check-label" for="defaultRadio1" style="margin-right: 15px;"> ${facility1} </label> &nbsp;&nbsp;&nbsp;
                     </c:forEach><br>
                     <c:forEach var="facility2" items="${facilityArr2 }">
                         <input  name="facility" class="form-check-input" type="checkbox" value="${facility2}"
                            <c:if test="${fn:contains(all.facility,facility2) }">checked</c:if>>
                               <label class="form-check-label" for="defaultRadio1" style="margin-right: 15px;"> ${facility2} </label> &nbsp;&nbsp;&nbsp;
                     </c:forEach><br>
                     <form:errors cssClass="err" path="facility"/>
                          <br><br>
                          
                           
                           
                  </div>
                  <!-- ---- -->
                  
                  <div class="mb-3">
                     <label for="exampleFormControlTextarea1" class="form-label">숙소 인원 제한</label>
                     <select class="form-select" aria-label="Default select example" name="num">
                              <option value="">인원 수를 선택하세요</option>
                              <c:forEach var="i" begin="0" end="${fn:length(numArr)-1 }" step="1">
                                 <option value="${numArr[i] }" <c:if test="${numArr[i] eq all.num }">selected</c:if>>${numArr[i]}인</option>
                              </c:forEach>
                            </select>
                            <form:errors cssClass="err" path="num"/>
                         </div><br>
                  
                  <div class="mb-3">
                        <label for="exampleFormControlTextarea1" class="form-label">숙소 최대 인원</label>
                           <select class="form-select" aria-label="Default select example" name="maxnum">
                              <option value="">최대 인원 수를 선택하세요</option>
                              <c:forEach var="i" begin="0" end="${fn:length(numArr)-1 }" step="1">
                                 <option value="${numArr[i] }" <c:if test="${numArr[i] eq all.maxnum }">selected</c:if>>${numArr[i]}인</option>
                              </c:forEach>
                            </select>
                            <form:errors cssClass="err" path="maxnum"/>
                        </div><br>
                  
                  <div class="mb-3">
                     <label for="exampleFormControlTextarea1" class="form-label">숙소 상세 설명(1)</label>
                     <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="숙소에 대한 간략한 설명" name="con1">${all.con1 }</textarea>
                     <form:errors cssClass="err" path="con1"/>
                  </div><br>
                  <div class="mb-3">
                     <label for="exampleFormControlTextarea1" class="form-label">숙소 상세 설명(2)</label>
                     <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="숙소에 대한 간략한 설명" name="con2">${all.con2 }</textarea>
                     <form:errors cssClass="err" path="con2"/>
                  </div><br>
                  <div class="mb-3">
                     <label for="exampleFormControlTextarea1" class="form-label">숙소 상세 설명(3)</label>
                     <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="숙소에 대한 간략한 설명" name="con3">${all.con3 }</textarea>
                     <form:errors cssClass="err" path="con3"/>
                  </div><br>
                  <div class="mb-3">
                     <label for="exampleFormControlTextarea1" class="form-label">주의사항 설명</label>
                     <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="ex.금연, 고성방가 금지 등등" name="notice">${all.notice }</textarea>
                  </div><br>
                  <div class="mb-3">
                     <label for="exampleFormControlTextarea1" class="form-label">이용규칙 설명</label>
                     <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="ex.보일러 온도를 유지해주세요 등등" name="rule">${all.rule }</textarea>
                  </div><br>
                  <div class="mb-3">
                           <label for="html5-time-input" class="col-md-2 col-form-label">체크인 시간</label>
                             <input class="form-label" type="time" value="${all.checkinTime }" id="html5-time-input" name="checkinTime"/>
                        </div>
                        <div class="mb-3">
                           <label for="html5-time-input" class="col-md-2 col-form-label">체크아웃 시간</label>
                             <input class="form-label" type="time" value="${all.checkoutTime }" id="html5-time-input" name="checkoutTime"/>
                        </div>
                      </div>

               <!-- Form controls 끝 -->
               <button class="btn btn-primary" type="submit">수정하기</button>
            </form:form>
         </div>
      </div>   
   </div>
</div>
<!-- /.untree_co-section -->
<script type="text/javascript">

( /* i_att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  Insert_imageView = function (i_att_zone, btn){
   //alert(1);
    var attZone = document.getElementById(i_att_zone);
    var imgfile = document.getElementById(btn)
    var sel_files = [];
    
    // 이미지와 체크 박스를 감싸고 있는 div 속성
    var div_style = 'display:inline-block;position:relative;margin:auto;'
                  + 'width:150px;height:120px;margin:5px;border:1px #368AFF;z-index:1';
    // 미리보기 이미지 속성
    var img_style = 'width:100%;height:100%;z-index:none';
    // 이미지안에 표시되는 체크박스의 속성
    var chk_style = 'width:30px;height:30px;position:absolute;font-size:15px;'
                  + 'right:0px;bottom:0px;z-index:999;background-color:#368AFF;color:#ffffff;border: 1px #ffffff;';
  
    imgfile.onchange = function(e){
      var files = e.target.files;
      var fileArr = Array.prototype.slice.call(files)
      for(f of fileArr){
        imageLoader(f);
      }
    }  
    
    // 탐색기에서 드래그앤 드롭 사용
    attZone.addEventListener('dragenter', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
    
    attZone.addEventListener('dragover', function(e){
      e.preventDefault();
      e.stopPropagation();
    }, false)
  
    attZone.addEventListener('drop', function(e){
      var files = {};
      e.preventDefault();
      e.stopPropagation();
      var dt = e.dataTransfer;
      files = dt.files;
      for(f of files){
        imageLoader(f);
      }
    }, false)
    

    
    /*첨부된 이미리즐을 배열에 넣고 미리보기 */
    imageLoader = function(file){
      sel_files.push(file);
      var reader = new FileReader();
      reader.onload = function(ee){
        let img = document.createElement('img')
        img.setAttribute('style', img_style)
        img.src = ee.target.result;
        attZone.appendChild(makeDiv(img, file));
      }
      
      reader.readAsDataURL(file);
    }
    
    /*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
    makeDiv = function(img, file){
      var div = document.createElement('div')
      div.setAttribute('style', div_style)
      
      var btn = document.createElement('input')
      btn.setAttribute('type', 'button')
      btn.setAttribute('value', 'x')
      btn.setAttribute('delFile', file.name);
      btn.setAttribute('style', chk_style);
      btn.onclick = function(ev){
        var ele = ev.srcElement;
        var delFile = ele.getAttribute('delFile');
        for(var i=0 ;i<sel_files.length; i++){
          if(delFile== sel_files[i].name){
            sel_files.splice(i, 1);      
          }
        }
        
        dt = new DataTransfer();
        for(f in sel_files) {
          var file = sel_files[f];
          dt.items.add(file);
        }
        imgfile.files = dt.files;
        var p = ele.parentNode;
        attZone.removeChild(p)
      }
      div.appendChild(img)
      div.appendChild(btn)
      return div
    }
  }
)('i_att_zone', 'imgfile') //imgfile or videofile 

</script>
<!-- --------------------- -->
<br><%@ include file="footer.jsp"%>