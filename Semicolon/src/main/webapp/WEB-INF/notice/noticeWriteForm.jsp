<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>

<%
	String[] CateArr = {"이벤트","쿠폰","공지사항"};
%>

<c:set var="cate" value="<%=CateArr%>"/>

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
      rel="stylesheet"
    />

    <link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="resources/css/aos.css" />
    <link rel="stylesheet" href="resources/css/style.css" />
  </head>
    <title>
      SEMICOLON(;)&nbsp; ADMIN-NOTICE WRITE page
    </title>
  </head>
  <style>

 	 .err{
		font-size:11px;
		color : red;
		font-weight: bold;
		align-items: left; 	
  	}
 
  	tr,td,th{
		border : 1px solid;
		height : 50px;
	}
	
	.main {
    display: block;
    margin-top: 0em;

    width : 500px;
    height : 500px;
    position: relative;
    left : 530px;
	}
	
	
	body {
	margin-top:120px;
    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
    line-height: 1.8;
    font-size: 15px;
    color: #7a7a7a;
    background:  #f9fafb;
    overflow-x: hidden;
}
	.tox .tox-editor-container {
    display: inline;
    flex: 1 1 auto;
    flex-direction: column;
    overflow: hidden;
}
	.btn {
	    display: inline-block;
	    font-weight: 400;
	    color: #fff;
	    text-align: center;
	    vertical-align: middle;
	    cursor: pointer;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    background-color: #edb96a;
	    border: 1px solid transparent;
	    padding: 12px 30px;
	    font-size: 1rem;
	    line-height: 1.5;
	    border-radius: 0.25rem;
	    transition: color .15s
	}
	
    .form-control{
    padding: 12px 12px 12px 12px;
    }
    .img-fluid {
    max-width: 100%;
    height: auto;
}
	img, svg {
    vertical-align: middle;
}
  </style>
<script type="text/javascript">
	function cateChange(){
		c_sel = myform.cate;
		
		c_selIndex = c_sel.selectedIndex;
		c_selValue = c_sel[c_selIndex].value;
		
		location.href="selectCate.nt?c_selValue="+c_selValue;
	}
	
	function coupone_Change(){
		cou_sel = myform.coupon;
		c_sel = myform.cate;
		
		cou_selIndex = cou_sel.selectedIndex;
		cou_selValue = cou_sel[cou_selIndex].value;
		
		c_selIndex = c_sel.selectedIndex;
		c_selValue = c_sel[c_selIndex].value;
		
		location.href="selectedCoupon.nt?cou_selValue="+cou_selValue+"&c_selValue="+c_selValue;
	}
	
	
</script>
  
  	<%@ include file="../admin/ad_top.jsp" %>
	<!-- 상단바 끝나는 부분 -->
	<br><br>
   	<div class="container">
      <div class="row justify-content-center align-items-center">
        <div class="col-lg-9 text-center">
           <div class="col-lg-6 text-lg-end">
          </div>
			<h3>공지사항 글쓰기</h3>

   			    <!-- Contact Start -->
    <div class="container-fluid pt-5">
      <div class="container">
        <div class="text-center pb-2">
          <p class="section-title px-5">
            <span class="px-2">[이벤트/쿠폰/공지사항 등 게스트·호스트 모두 보는 공간]</span>
          </p>
        </div>
        <div class="row">
          <div class="col-lg-12 mb-9">
            <div class="contact-form">
              <form:form commandName="notice" action="nwrite.nt" method="post" encType="multipart/form-data" name="myform">
              <div id="success"></div>
                <div class="control-group">
                  <input type="text" class="form-control" id="writer" name="nwriter" value="관리자" readonly="readonly" />
                  <p class="help-block text-danger"></p>
                </div>
                <div class="control-group">
               		 <select class="form-select" aria-label="Default select example" id="cate" name="cate" onChange="cateChange()">
						   <option value="">카테고리를 선택하세요</option>
						   		<c:forEach var="i" items="${cate }">
                           			<option value="${i}" <c:if test="${c_selValue eq i}">selected</c:if>>${i }</option>
                           		</c:forEach>
					</select>
					  <form:errors cssClass="err" path="cate" />
				</div><br>
				<!-- select -->
				<c:if test="${c_selValue eq '쿠폰' }">
				<div>
				<div class="mb-3">
					<select class="form-select" aria-label="Default select example" id="coupon" name="coupon" onChange="coupone_Change()">
							<option value="">쿠폰을 선택하세요</option>
						<c:forEach var="i" items="${lists}">
							<option value="${i.name}" <c:if test="${cou_selValue eq i.name }">selected</c:if>>${i.name}</option>
						</c:forEach>
					</select>
      		  </div>
      		  </div>
      		  </c:if>
      		  <div class="control-group">
                  <input type="text" class="form-control" id="name" placeholder="제목 입력" name="title" value="${ notice.title}"/>
                  <p class="help-block text-danger"></p>
                   <form:errors cssClass="err" path="title"/>
                </div>
      		  
      		  <!-- select -->
      		  
      		  <c:if test="${c_selValue ne '쿠폰' }">
               <div class="mb-3">
         		   <input class="form-control" type="file" id="formFile" name="upload">
      		  </div>
      		  </c:if>
      		  
      		 <c:if test="${c_selValue eq '쿠폰' }">
                <div class="control-group">
                  <textarea class="form-control" rows="6" id="textarea" placeholder="내용 입력" name="content"
                  >[${code }]  &#10;&#10;해당 쿠폰코드를 복사해서 쿠폰 등록하기를 눌러 쿠폰을 등록해주세요. &#10;등록한 쿠폰은 마이페이지의 내 쿠폰함을 확인해주세요. </textarea>
                  <p class="help-block text-danger"></p>
                </div>
           	</c:if>
           	
           	<c:if test="${c_selValue ne '쿠폰' }">
                <div class="control-group">
                  <textarea class="form-control" rows="6" id="textarea" placeholder="내용 입력" name="content"
                  ></textarea>
                  <p class="help-block text-danger"></p>
                </div>
           	</c:if>
      		 
         	 <button type="submit" class="btn btn-primary-hover-outline">Upload</button> &nbsp; &nbsp;  &nbsp; &nbsp; 
         	 <button type="button" class="btn btn-primary-hover-outline" onclick="location.href='nlist.nt?pageNumber=${pageNumber}'">Cancel</button>
				</form:form>
            </div>
          </div>
          </div>
  		</div>
  	   </div>
  	  </div>
      </div>	
    </div>        
<center>
${pageInfo.pagingHtml }
</center>
<br><br><br>
	<%@ include file="../admin/ad_bottom.jsp" %>