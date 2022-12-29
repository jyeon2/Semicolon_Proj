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
      SEMICOLON &mdash; Free Bootstrap 5 Website Template by Untree.co
    </title>

	<style>
	 	body{
	 		margin-top:120px;
	 	}
	 	
	 	.btable{
			border-collapse:collapse;
			width : 400px;
	 	}
	 	
	 	tr,td,th{
			border : 1px solid;
			height : 50px;
		}
		
		.btn {
		    display: inline-block;
		    font-weight: 400;
		    color: #212529;
		    text-align: center;
		    vertical-align: middle;
		    cursor: pointer;
		    -webkit-user-select: none;
		    -moz-user-select: none;
		    -ms-user-select: none;
		    user-select: none;
		    background-color: #96cbb3;
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
  
	<br><br>
      <div class="container">
        <div class="row justify-content-center align-items-center">
          <div class="col-lg-9 text-center">
           <div class="col-lg-6 text-lg-end">
          </div>
            <h3>글 삭제하기</h3>
            <br><br>       
			<form action="bdelete.bo" method="post">
			<input type="hidden" name="bno" value="${bno }">
			<input type="hidden" name="pageNumber" value="${pageNumber }">
				<table align="center" class="btable">
				<tr>
					<th>비밀 번호를 입력해 주세요</th>
				</tr>
				<tr>
					<td>비밀 번호 : <input type="text" name="pw"></td>	
				</tr>
				</table>
				
				<br>
                <button type="submit" class="btn btn-primary-hover-outline">삭제하기</button> &nbsp; &nbsp;
                <button type="button" class="btn btn-primary-hover-outline" onclick="location.href='blist.bo?pageNumber=${pageNumber}'">돌아가기</button>
			</form>
        </div>
      </div>
    </div>
    
	<br><br><br>

  <c:if test="${admin != null || hostInfo.email == 'admin@a'}">
	<%@ include file="../admin/ad_bottom.jsp" %>
  </c:if>
  
  <c:if test="${hostInfo != null && hostInfo.email != 'admin@a'}">
	<%@ include file="../host/footer.jsp" %>
  </c:if>

    </body>
</html>
