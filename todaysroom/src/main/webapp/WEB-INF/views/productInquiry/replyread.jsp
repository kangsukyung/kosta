<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Aroma Shop - Login</title>
<link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="/main_resource/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="/main_resource/vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="/main_resource/css/style.css">
<link rel="stylesheet" href="/main_resource/css/board.css">
<<<<<<< HEAD
<script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/main_resource/vendors/skrollr.min.js"></script>
<script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/main_resource/vendors/mail-script.js"></script>
<script src="/main_resource/js/main.js"></script>
<script src="/main_resource/js/board.js"></script>
</head>
<style>
.upload-btn-wrapper {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.upload-btn {
	border: 2px solid gray;
	color: gray;
	background-color: white;
	padding: 8px 20px;
	border-radius: 8px;
	font-size: 20px;
	font-weight: bold;
}

.upload-btn-wrapper input[type=file] {
	font-size: 100px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
}

#fileDragDesc {
	width: 100%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
	text-align: center;
	line-height: 500px;
	vertical-align: middle;
}

#form-group-file-upload label {
	width: 100%;
	display: inline-block;
	padding: .5em .75em;
	color: #777;
	font-family: fantasy;
	font-size: x-large;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #ced4da;
	border-radius: .25em;
}

#form-group-file-upload input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.productReply{
    white-space: pre-line;
    margin: 0 10% 2% 10%;
    text-align: left;
    border: outset;
    font-size: larger;
    font-weight: 500;
}

</style>
<body>
<%@include file="../includes/header.jsp"%>
	<section> <%-- 	<jsp:include page="../header.jsp"></jsp:include> --%>
	</section>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>상품 문의 답변</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">상품 문의 답변</li>
				</ol>
				</nav>
			</div>
		</div>
	</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
	<div class="container">
		<div class="row">
			<div class="contents-col-lg-6">
				<div class="login_form_inner register_form_inner">
					<div class="productReply"><b>고객명</b> : ${reply.member_seq}</div>
					<div class="productReply"><b>상품명</b> : ${reply.pi_type}</div>
					<div class="productReply"><b>문의 내용</b> : ${reply.pi_content}</div>
					<br><br>
					<form role='form' class="contents-row login_form" action="/productInquiry/replyread" method="post" style="max-width: 95%">

						<div class="col-md-12 form-group">
							<textarea rows="30%" cols="70" class="form-control" id="contents"
								name="pi_answer" placeholder="답변 내용을 입력해주세요.">${reply.pi_answer }</textarea>
						</div>
						
						<input type="hidden" name="pi_seq" value="${reply.pi_seq}">

						<div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</div>
=======
<script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/main_resource/vendors/skrollr.min.js"></script>
<script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/main_resource/vendors/mail-script.js"></script>
<script src="/main_resource/js/main.js"></script>
<script src="/main_resource/js/board.js"></script>
</head>
<style>
.upload-btn-wrapper {
	position: relative;
	overflow: hidden;
	display: inline-block;
}

.upload-btn {
	border: 2px solid gray;
	color: gray;
	background-color: white;
	padding: 8px 20px;
	border-radius: 8px;
	font-size: 20px;
	font-weight: bold;
}

.upload-btn-wrapper input[type=file] {
	font-size: 100px;
	position: absolute;
	left: 0;
	top: 0;
	opacity: 0;
}

#fileDragDesc {
	width: 100%;
	height: 100%;
	margin-left: auto;
	margin-right: auto;
	padding: 5px;
	text-align: center;
	line-height: 500px;
	vertical-align: middle;
}

#form-group-file-upload label {
	width: 100%;
	display: inline-block;
	padding: .5em .75em;
	color: #777;
	font-family: fantasy;
	font-size: x-large;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #ced4da;
	border-radius: .25em;
}

#form-group-file-upload input[type="file"] { /* 파일 필드 숨기기 */
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.productReply{
    white-space: pre-line;
    margin: 0 10% 2% 10%;
    text-align: left;
    border: outset;
    font-size: larger;
    font-weight: 500;
}

</style>
<body>
<%@include file="../includes/header.jsp"%>
	<section> <%-- 	<jsp:include page="../header.jsp"></jsp:include> --%>
	</section>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>상품 문의 답변</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">상품 문의 답변</li>
				</ol>
				</nav>
			</div>
		</div>
	</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
	<div class="container">
		<div class="row">
			<div class="contents-col-lg-6">
				<div class="login_form_inner register_form_inner">
					<div class="productReply"><b>고객명</b> : ${reply.member_seq}</div>
					<div class="productReply"><b>상품명</b> : ${reply.pi_type}</div>
					<div class="productReply"><b>문의 내용</b> : ${reply.pi_content}</div>
					<br><br>
					<form role='form' class="contents-row login_form" action="/productInquiry/replyread" method="post" style="max-width: 95%">

						<div class="col-md-12 form-group">
							<textarea rows="30%" cols="70" class="form-control" id="contents"
								name="pi_answer" placeholder="답변 내용을 입력해주세요.">${reply.pi_answer }</textarea>
						</div>
						
						<input type="hidden" name="pi_seq" value="${reply.pi_seq}">

						<div>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</div>
						
						<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.member" var="member"/>
						<input type="hidden" name="member_seq" value="${member.member_seq }">
						</sec:authorize>
						
						
>>>>>>> branch 'master' of https://github.com/kangsukyung/kosta.git
						<div class="col-md-12 form-group">
							<button type="submit" value="submit"
								class="button button-tracking w-100"
								style="font-weight: bold; font-size: large;">답변 등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</section>

	<a href="/productInquiry/list">여기를 눌러봐~</a>
	<!--================End Login Box Area =================-->


	<section> <%@include file="../includes/footer.jsp"%></section>


</body>
</html>