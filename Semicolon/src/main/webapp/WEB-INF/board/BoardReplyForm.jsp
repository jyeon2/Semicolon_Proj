<%@page import="java.text.SimpleDateFormat"%>
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
      rel="stylesheet"
    />

    <link rel="stylesheet" href="resources/fonts/icomoon/style.css" />
    <link rel="stylesheet" href="resources/fonts/flaticon/font/flaticon.css" />

    <link rel="stylesheet" href="resources/css/tiny-slider.css" />
    <link rel="stylesheet" href="resources/css/aos.css" />
    <link rel="stylesheet" href="resources/css/style.css" />

    <title>
      SEMICOLON(;)&nbsp; BOARD REPLY page
    </title>

	<style>
 	 .err{
		font-size:9px;
		color : red;
		font-weight: bold; 	
  	}
  	table{
  		border : 1px solid;
		border-collapse:collapse;
	
  	}
  	tr,td,th{
		border : 1px solid;
		height : 50px;
	}
	
	form {
	    margin-top: 0em;
	    width : 600px;
	    margin: 0 auto;
	}
		
	body {
		margin-top:120px;
	    font-family: -apple-system,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,"Noto Sans",sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol","Noto Color Emoji";
	    font-size: 15px;
	    color: #7a7a7a;
	    background: #f9fafb;
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
	</style>
  
  </head>
  
  <body>
  
  <c:if test="${admin != null || hostInfo.email == 'admin@a'}">
	<%@ include file="../admin/ad_top.jsp" %>
  </c:if>
  
  <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
	<%@ include file="../host/header.jsp" %>
  </c:if>
	<!-- 상단바 끝나는 부분 -->
	
	<div class="container">
		<br><br>
		<center>
			<h3>답글 쓰기</h3>
		</center>
			<br><br>
     		 <form:form commandName="bee" action="breply.bo" method="post"  >
			    <c:if test="${admin != null || hostInfo.email == 'admin@a'}">
					<input type="hidden" class="form-control" id="email" name="email" value="${admin.email }" readonly>
				</c:if>
                <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
					<input type="hidden" class="form-control" id="email" name="email" value="${hostInfo.email }" readonly>
				</c:if>
     		 	<input type="hidden" name="ref" value="${ref }">
				<input type="hidden" name="re_step" value="${re_step }">
				<input type="hidden" name="re_level" value="${re_level }">
				<input type="hidden" name="pageNumber" value="${pageNumber }">
               <div class="row">
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black" for="fname">제목</label>
                      <input type="text" class="form-control" id="fname" name="title" value="${bee.title }">
                    	<form:errors cssClass="err" path="title"/>
                    </div>
                  </div>
                  <div class="col-6">
                    <div class="form-group">
                      <label class="text-black" for="lname">이름</label>
                      <!-- 라벨 for이름과 input id가 같아야 한다. input애 name이 없으면 안된다. name은 bean과 같은 이름으로. -->
                      
                      <c:if test="${admin != null || hostInfo.email == 'admin@a'}">
						<input type="text" class="form-control" id="lname" name="writer" value="${admin.name }" readonly>
  					  </c:if>
                      <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
						<input type="text" class="form-control" id="lname" name="writer" value="${hostInfo.name }" readonly>
  					  </c:if>
                      
                    	<form:errors cssClass="err" path="writer"/>
                    </div>
                  </div>
                </div>
                 
                <div class="form-group">
                  <label class="text-black" for="message">답글 내용</label>
                  <textarea name="content" class="form-control" id="message" cols="30" rows="5" >${bee.content }</textarea>
               			<form:errors cssClass="err" path="content"/>
                </div>
                
                <div class="form-group">
                  <label class="text-black" for="password">비밀번호</label>
                  <input type="password" class="form-control" id="password" name="pw">
                  <form:errors cssClass="err" path="pw"/>
                </div>
                <br>
                <br> <br>
                <button type="submit" class="btn btn-primary-hover-outline">답글달기</button> &nbsp; &nbsp;&nbsp; &nbsp;
                <button type="button" class="btn btn-primary-hover-outline" onclick="location.href='blist.bo?pageNumber=${pageNumber}'">돌아가기</button>
              </form:form>
           
	<br><br><br>
	<center>
	${pageInfo.pagingHtml }
	</center>
	<br><br><br>
	
	</div>
	
  <c:if test="${admin != null || hostInfo.email == 'admin@a'}">
	<%@ include file="../admin/ad_bottom.jsp" %>
  </c:if>
  
  <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
	<%@ include file="../host/footer.jsp" %>
  </c:if>
  
    </body>
</html>