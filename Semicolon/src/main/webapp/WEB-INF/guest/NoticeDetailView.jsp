<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="author" content="Untree.co" />
<link rel="shortcut icon" href="favicon.png" />

<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

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

<title>Semicolon Notice_Detail page</title>

<style>
	.table{
		border-top: 2px solid black;
		border-bottom: 2px solid black;
	}
	
	td{
		padding: 8px 16px;
		border: 1px solid #ced4da;
		text-align: left;
	}
	th{
		width:170px;
		height:40px;
		border: 1px solid #ced4da;
		background-color: #b7c1cb !imiportant;
	}
	.row>* {
		padding: 0px !important;
		margin-bottom: 0px !important;
	}
	
	
	/* modal style */
	#myform fieldset{
	    display: inline-block;
	    direction: rtl;
	    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 3em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#reviewContents {
	    width: 100%;
	    height: 150px;
	    padding: 10px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 16px;
	    resize: none;
	}
	.card-body{
		padding : 7px;
		width:550px;
	}	
	.span{
		font-size: 15pt;
		position : relative;
		float: left;
		top:20px;
	}
	textarea{
		border: none;
		width:700px;
	}
	.table > :not(caption) > * > * {
    	padding: 0.5rem 1rem;
    }
    pre {
    	font-family: "Work Sans", sans-serif;
    	font-size: 14px;
    }
    .padding-10 {
    	padding: 0px 10px;
    }
</style>

<script>
	function insert_Coupon(guestInfo,nno,pageNumber){
		//alert(guestInfo)
		if(guestInfo==""){
			alert("로그인이 필요한 항목입니다");
			location.href="login.gt";
		} else{
			//alert(guestInfo)
		 
		 	var code = myform.code.value;
		 	//alert(code)
		 	if(code==""){
				alert("코드를 입력하세요");
				return;
			}
	 
			location.href="downCoupon.gt?code="+code+"&nno="+nno+"&pageNumber="+pageNumber; 
		}
	}
		
</script>

</head>
<body>

<%@ include file="header.jsp"%>
<!-- 상단바 끝나는 부분 -->
<div
      class="hero page-inner overlay login"
      style="background-image: url('resources/images/hero_bg_1.jpg')"
    >
  <div class="container">
    <div class="row justify-content-center align-items-center">
      <div class="col-lg-9 text-center mt-5">
        <h1 class="heading" data-aos="fade-up">공지사항</h1>

        <nav
          aria-label="breadcrumb"
          data-aos="fade-up"
          data-aos-delay="200"
        >
          <ol class="breadcrumb text-center justify-content-center">
            <li class="breadcrumb-item"><a href="gnlist.gt">Notice</a></li>
            <li
              class="breadcrumb-item active text-white-50"
              aria-current="page"
            >
              Notice Detail
            </li>
          </ol>
        </nav>
      </div>
    </div>
  </div>
</div>

<br><br>

<div class="container">
	<div class="row justify-content-center align-items-center">
		<div class="col-lg-10 text-center">

			<table align="center" width=100% height="60%" class="table">
				<tr>
					<th id="bg_grey">제목</th>
					<td colspan="5" align="center">[${notice.cate}]&nbsp;${notice.title }</td>
				</tr>
				<tr>
					<th id="bg_grey" width="60">작성날짜</th>
					<fmt:parseDate var="date" value="${notice.nt_date}" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="nt_date" value="${date }" pattern="yyyy-MM-dd"/>
					<td>${nt_date}</td>
					<th id="bg_grey" width="60">작성자</th>
					<td>관리자</td>
					<th id="bg_grey" width="60">조회수</th>
					<td>${notice.n_readcount }</td>
				</tr>
				<tr>
					<th id="bg_grey">공지대상</th>
					<td colspan="5">전체</td>
				</tr>
				<tr>
					<th id="bg_grey" style="vertical-align: middle;">이미지</th>
					<c:if test="${notice.nfile ne null}">
						<td colspan="5" align="center">
						<img src="${loadingPath }/${notice.nfile}" width="300" height="200">
						</td>
					</c:if>
					<c:if test="${notice.nfile eq null}">
						<td colspan="5" align="center">
							없음
						</td>
					</c:if>
					<!-- 유효성검사할때에는 nfile, upload 상관없다. -->
				</tr>
				<tr>
					<th id="bg_grey" style="vertical-align: middle;">내용</th>
					<td colspan="5" height="300px" style="vertical-align: top;"><pre>${notice.content }</pre></td>
				</tr>
			</table>
			<br>
			<br>
			<br>
			<form action="gnlist.gt" method="get">
				<input type="hidden" name="pageNumber" value=${pageNumber }>
				<input class="btn btn-primary btn-primary-hover-outline" type="submit" value="목록보기">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<c:if test="${notice.cate eq '쿠폰' }">
					<input type="button" class="btn btn-primary btn-primary-hover-outline" value="쿠폰 다운로드"  data-toggle="modal" data-target="#myModal">
				</c:if>
			</form>
		</div>
	</div>
</div>
<br>
<br>
<div align="center">${pageInfo.pagingHtml }</div>
<br>
<br>

<!-- The Modal -->
  <div class="modal fade" id="myModal">
    <div class="modal-dialog modal-lg modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">&nbsp;&nbsp;쿠폰등록</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <form class="mb-3" name="myform" id="myform" method="post">
			<fieldset class="filedset1">
			</fieldset>
			<div class="padding-10">
				<input class="col-auto form-control" type="text" id="reviewContents" name="code"
						  placeholder="쿠폰코드를 입력하세요"></input>
			</div>
		  </form>		
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onClick="insert_Coupon('${guestInfo}','${nno }','${pageNumber }')">다운로드</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal">닫기</button>
        </div>
        
      </div>
    </div>
  </div>
  
<%@ include file="footer.jsp"%>
</body>