<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Product Details</title>
<link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
<link rel="stylesheet" href="/main_resource/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="/main_resource/css/style.css">
<link rel="stylesheet" href="/main_resource/css/store.css">
<link rel="stylesheet" href="/main_resource/css/product_inquiry.css">
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<!--================ End Header Menu Area =================-->
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<!-- ================ start banner area ================= -->

	<section class="blog-banner-area" id="blog">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>제품 상세 페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">상품
								디테일</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="owl-carousel owl-theme s_Product_carousel">
						<div class="single-prd-item">

							<img class="img-fluid"
								<%-- src="/display?fileName=${store.store_picture}" alt=""> --%>
								src="#" alt="">
						</div>
						<!-- <div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div>
						<div class="single-prd-item">
							<img class="img-fluid" src="img/category/s-p1.jpg" alt="">
						</div> -->
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>${store.store_title }</h3>
						<c:forEach items="${list }" var="product" varStatus="status"
							begin="0" end="0">
							<h2 class="product_price">${product.product_price }원외</h2>
						</c:forEach>
						<button class="production-selling-header_action_button_hw"
							type="button">
							<svg class="icon--stroke" aria-label="스크랩" width="24" height="24"
								fill="currentColor" stroke="currentColor" stroke-width="0.5"
								viewBox="0 0 24 24" preserveAspectRatio="xMidYMid meet">
								<path
									d="M11.53 18.54l-8.06 4.31A1 1 0 0 1 2 21.97V3.5A1.5 1.5 0 0 1 3.5 2h17A1.5 1.5 0 0 1 22 3.5v18.47a1 1 0 0 1-1.47.88l-8.06-4.31a1 1 0 0 0-.94 0z"></path>
							</svg>
							<%-- <span class=scraps_count>${store.store_scraps }</span> --%>
						</button>


						<div class="production-select-dropdown">
							<div class="production-select-dropdown__button">
								<button class="production-select-button" type="button">
									<div class="production-select-button__production">
										<div class="production-select-button__production__blank">상품을
											선택하세요.</div>
										<div class="production-select-button__production__icon">
											<svg width="1em" height="1em" viewBox="0 0 16 16"
												preserveAspectRatio="xMidYMid meet">
												<path fill="currentColor" fill-rule="evenodd"
													d="M2.87 4L1.33 5.5 8 12l6.67-6.5L13.13 4 8 9z"></path></svg>
										</div>
									</div>
								</button>
							</div>
						</div>

						<div class="production-select-dropdown__list-container">
							<ul class="production-select-list production-select-dropdown__list">
								<c:forEach items="${list }" var="product" varStatus="status">
									<li class="production-select-list__item">
									<input type="hidden" name='product_seq' value="${product.product_seq }">
									<button value="${status.count}" class="production-select-item" id="product_seq" type="button">
											<div class="production-select-item__index">${status.count }</div>
											<div class="production-select-item__image">
												<%-- <img class="image" id="product_image" alt="" src="/display?fileName=${product.product_fname}"> --%>
												<img class="image" id="product_image" alt="" src="#">
											</div>
											<div class="production-select-item__contents">
												<span class="production-select-item__contents__name" id="product_name"> ${product.product_name }</span>
												<span class="production-item-price production-select-item__contents__price">
												<span class="production-item-price__price" id="product_price">${product.product_price }원
													</span>
												</span>
											</div>
										</button>
									</li>
								</c:forEach>
							</ul>
						</div>
						<form action="/basket/register" method="post">
						<sec:authorize access="isAuthenticated()">
		                  <sec:authentication property="principal.member" var="member"/>
		                  <input type="hidden" name="member_seq" value="${member.member_seq }">
		                </sec:authorize>
						<div><input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>
							<ul class="selling-option-form-content__list">
								<div class="checkpoint">

								</div>
							</ul>
							<p class="selling-option-form-content__price">
								<span class="selling-option-form-content__price__left">총
									주문금액</span><span class="selling-option-form-content__price__right"><span
									class="selling-option-form-content__price__number">0</span>원</span>
							</p>

							<div class="product_count">
								<button class="button normal-btn" type="submit">장바구니에
									담기</button>
								<a class="button primary-btn" href="#">구매하기</a>

							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!--================Product Description Area =================-->
	<section class="product_description_area">
		<div class="container">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link" id="home-tab"
					data-toggle="tab" href="#home" role="tab" aria-controls="home"
					aria-selected="true">제품 상세</a></li>
				<li class="nav-item"><a class="nav-link active" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">리뷰</a></li>
				<li>
					<button type="button" class="btn btn-primary" id="inquiry-button"
						data-toggle="modal" data-target="#exampleModal">문의하기</button>
				</li>
			</ul>
			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel" aria-hidden="true"
				data-backdrop="static">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title" id="exampleModalLabel">상품 문의하기</h4>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<form id="my-form" me>
								<div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-default btn-lg"> <input
										type="radio" name="pi_type" value="product"> 상품
									</label> <label class="btn btn-default btn-lg"> <input
										type="radio" name="pi_type" value="shipping"> 배송
									</label> <label class="btn btn-default btn-lg"> <input
										type="radio" name="pi_type" value="return"> 반품
									</label> <label class="btn btn-default btn-lg"> <input
										type="radio" name="pi_type" value="exchange"> 교환
									</label> <label class="btn btn-default btn-lg"> <input
										type="radio" name="pi_type" value="refund"> 환불
									</label> <label class="btn btn-default btn-lg"> <input
										type="radio" name="pi_type" value="etc"> 기타
									</label>
								</div>
								<div class="form-group">
									<label for="message-text" class="control-label">문의내용</label>
									<textarea class="form-control" id="message-text"
										name="pi_content"></textarea>
								</div>
								<input hidden="hidden" name="member_seq" value="1">
								<!-- value 값 추후 조정 필요 -->
								<input hidden="hidden" name="product_seq" value="1">
							</form>
							<div>문의내용에 대한 답변은 ‘마이페이지 &gt; 나의 쇼핑 &gt; 나의 문의내역’ 또는 ‘상품
								상세페이지’에서 확인 가능합니다.</div>
						</div>
						<div class="modal-footer">
							<button type="submit" form="my-form" class="btn btn-primary"
								id="inquiry-submit">문의하기</button>
						</div>
					</div>
				</div>
			</div>
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade" id="home" role="tabpanel"
					aria-labelledby="home-tab">
					<p>${board.board_content }</p>
				</div>
<%-- 				<jsp:include page="../review/review.jsp"></jsp:include> --%>
				<div class="tab-pane fade" id="contact" role="tabpanel"
					aria-labelledby="contact-tab">
					<div class="row">
						<div class="col-lg-6">
							<div class="comment_list"></div>
						</div>
					</div>
					<div class="tab-pane fade show active" id="review" role="tabpanel"
						aria-labelledby="review-tab">
						<div class="row">
							<div class="col-lg-6">
								<div class="row total_rate">
									<div class="col-6">
										<div class="box_total">
											<h5>Overall</h5>
											<h4>4.0</h4>
											<h6>(03 Reviews)</h6>
										</div>
									</div>
									<div class="col-6">
										<div class="rating_list">
											<h3>Based on 3 Reviews</h3>
											<ul class="list">
												<li><a href="#">5 Star <i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i> 01
												</a></li>
												<li><a href="#">4 Star <i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i> 01
												</a></li>
												<li><a href="#">3 Star <i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i> 01
												</a></li>
												<li><a href="#">2 Star <i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i> 01
												</a></li>
												<li><a href="#">1 Star <i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i><i
														class="fa fa-star"></i><i class="fa fa-star"></i> 01
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="review_list">
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="/main_resource/img/product/review-1.png" alt="">
											</div>
											<div class="media-body">
												<h4>Blake Ruiz</h4>
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
									</div>
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="/main_resource/img/product/review-2.png" alt="">
											</div>
											<div class="media-body">
												<h4>Blake Ruiz</h4>
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
									</div>
									<div class="review_item">
										<div class="media">
											<div class="d-flex">
												<img src="/main_resource/img/product/review-3.png" alt="">
											</div>
											<div class="media-body">
												<h4>Blake Ruiz</h4>
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i> <i class="fa fa-star"></i> <i
													class="fa fa-star"></i>
											</div>
										</div>
										<p>Lorem ipsum dolor sit amet, consectetur adipisicing
											elit, sed do eiusmod tempor incididunt ut labore et dolore
											magna aliqua. Ut enim ad minim veniam, quis nostrud
											exercitation ullamco laboris nisi ut aliquip ex ea commodo</p>
									</div>
								</div>
							</div>
							<div class="col-lg-6">
								<div class="review_box">
									<h4>Add a Review</h4>
									<p>Your Rating:</p>
									<ul class="list">
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
										<li><a href="#"><i class="fa fa-star"></i></a></li>
									</ul>
									<p>Outstanding</p>
									<form action="#/" class="form-contact form-review mt-3">
										<div class="form-group">
											<input class="form-control" name="name" type="text"
												placeholder="Enter your name" required>
										</div>
										<div class="form-group">
											<input class="form-control" name="email" type="email"
												placeholder="Enter email address" required>
										</div>
										<div class="form-group">
											<input class="form-control" name="subject" type="text"
												placeholder="Enter Subject">
										</div>
										<div class="form-group">
											<textarea class="form-control different-control w-100"
												name="textarea" id="textarea" cols="30" rows="5"
												placeholder="Enter Message"></textarea>
										</div>
										<div class="form-group text-center text-md-right mt-3">
											<button type="submit"
												class="button button--active button-review">Submit
												Now</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</section>
	<%-- 	<section>
	<jsp:include page="../review/review.jsp"></jsp:include>
	</section> --%>
	<!--================End Product Description Area =================-->

	<!--================ Start related Product area =================-->

	<!--================ end related Product area =================-->

	<!--================ Start footer Area  =================-->

	<!--================ End footer Area  =================-->
	<section>
		<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	</section>


	<script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/main_resource/vendors/skrollr.min.js"></script>
	<script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="/main_resource/vendors/mail-script.js"></script>
	<script src="/main_resource/js/main.js"></script>
	<script src="/main_resource/js/store_read.js"></script>
	<!-- <script type="text/javascript" src="/main_resource/js/product_inquiry.js"></script> -->
	<!-- <script src="/main_resource/js/review.js"></script> -->
</body>
</html>