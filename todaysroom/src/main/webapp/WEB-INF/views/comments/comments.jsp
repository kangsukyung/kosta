<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="../../../main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="../../../main_resource/vendors/skrollr.min.js"></script>
	<script src="../../../main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="../../../main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="../../../main_resource/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="../../../main_resource/vendors/mail-script.js"></script>

<link rel="icon" href="../../../main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="../../../main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../../../main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../../../main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../../../main_resource/vendors/linericon/style.css">
<link rel="stylesheet" href="../../../main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../../../main_resource/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="../../../main_resource/css/style.css">
<link rel="stylesheet" href="../../../main_resource/css/comments.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="comments-area">
	<h4>Comments</h4>
	<div class="form-group col-lg-10 col-md-6 name comments_reply_jsb">
		<form class="comments_register_form">
			<input type="hidden"  name="${comments.board_seq}" value="${comments.board_seq}">
			<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="text" class="form-control" id="insert_content" name="comments_content" 
					placeholder="댓글내용을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '댓글내용을 입력해주세요'">
			<div class="register-reply-btn">
				<button class="btn primary-btn" id="commentsAddBtn">작성하기</button>
			</div>
		</form>
	</div>
	<div class="comment-list chat">
			<!-- <div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
							<div class="thumb">
									<img src="img/blog/c1.jpg" alt="">
							</div>
							<div class="desc">
									<h5>
											<a href="#">Emilly Blunt</a>
									</h5>
									<p class="date">December 4, 2017 at 3:12 pm </p>
									<p class="comment">
											Never say goodbye till the end comes!
									</p> 
							</div>
					</div>
					<div class="reply-btn">
							<a href="#" class="btn-reply text-uppercase">reply</a>
					</div>
			</div> -->
	</div>
		<!-- 대댓 시작 -->
	<div class="comment-list left-padding">
		<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
						<div class="thumb">
								<img src="img/blog/c2.jpg" alt="">
						</div>
						<div class="desc">
								<h5>
										<a href="#">Elsie Cunningham</a>
								</h5>
								<p class="date">December 4, 2017 at 3:12 pm </p>
								<p class="comment">
										Never say goodbye till the end comes!
								</p>
						</div>
				</div>
				<div class="reply-btn">
						<a href="#" class="btn-reply text-uppercase">reply</a>
				</div>
		</div>
	</div>
	<!-- paging -->
	<div class="comments_paging">
	</div>
	<!-- 대댓 끝 -->
</div>

</body>
</html>
 <script type="text/javascript">
 	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
 </script>
<script type="text/javascript" src="../../../main_resource/js/comments.js"></script>