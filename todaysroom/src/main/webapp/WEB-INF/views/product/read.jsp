<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이스토어 - 상품조회</title>
<link rel="icon" href="${pageContext.request.contextPath}/resources/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/linericon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member_mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ksk_style.css">
</head>
<body>	
	<jsp:include page="../header.jsp"/>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>나의 스토어</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">홈</a></li>
							<li class="breadcrumb-item active" aria-current="page">나의스토어</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->



	<!--================Blog Area =================-->
	<section
		class="blog_area single-post-area py-80px section-margin--small">
		<div class="container">
			<div class="row">
				<div class="col-lg-4">
					<div class="blog_right_sidebar">
						<aside class="single_sidebar_widget author_widget">
							<img class="author_img rounded-circle" src="${pageContext.request.contextPath}/main_resource/img/member/member_basicimage.png"alt="">
							
							<h4>Charlie Barber</h4>
							<p>Senior blog writer</p>
							<div class="social_icon">
								<a href="#"> <i class="fab fa-facebook-f"></i>
								</a> <a href="#"> <i class="fab fa-twitter"></i>
								</a> <a href="#"> <i class="fab fa-github"></i>
								</a> <a href="#"> <i class="fab fa-behance"></i>
								</a>
							</div>
							<p>Boot camps have its supporters andit sdetractors. Some
								people do not understand why you should have to spend money on
								boot camp when you can get. Boot camps have itssuppor ters
								andits detractors.</p>
						</aside>
						<aside class="single_sidebar_widget ads_widget">
							<a href="#"> <img class="img-fluid" src="img/blog/add.jpg"
								alt="">
							</a>
							<div class="br"></div>
						</aside>
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Post Catgories</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex justify-content-between">
										<p>프로필</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>주문목록</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>설정</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>전문가신청</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>판매자신청</p>
								</a></li>
							</ul>
						</aside>						
						<aside class="single-sidebar-widget tag_cloud_widget">
							<h4 class="widget_title">Tag Clouds</h4>
							<ul class="list">
								<li><a href="#">Technology</a></li>
								<li><a href="#">Fashion</a></li>
								<li><a href="#">Architecture</a></li>
								<li><a href="#">Fashion</a></li>
								<li><a href="#">Food</a></li>
								<li><a href="#">Technology</a></li>
								<li><a href="#">Lifestyle</a></li>
								<li><a href="#">Art</a></li>
								<li><a href="#">Adventure</a></li>
								<li><a href="#">Food</a></li>
								<li><a href="#">Lifestyle</a></li>
								<li><a href="#">Adventure</a></li>
							</ul>
						</aside>
					</div>
				</div>
				
									<div class="form-group text-center text-md-right mt-3" id="ksk_btn">
										<a href="ProductUpdateActionForm.do?product_seq=${productVO.product_seq}">글 수정</a>
										<input type="submit" class="button button--active button-review" value="삭제">
									</div>
						
						
						
						



					</div>
			</div>
		</div>
	</section>
	<!--================Blog Area =================-->



	<jsp:include page="../footer.jsp"></jsp:include>


	<script src="${pageContext.request.contextPath}/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/main_resource/vendors/skrollr.min.js"></script>
	<script src="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="${pageContext.request.contextPath}/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="${pageContext.request.contextPath}/main_resource/vendors/mail-script.js"></script>
	<script src="${pageContext.request.contextPath}/main_resource/js/main.js"></script>
</body>
</html>
