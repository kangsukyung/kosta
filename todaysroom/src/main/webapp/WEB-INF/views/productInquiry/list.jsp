<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Blog</title>
<link rel="icon" href="/resources/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="/resources/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/resources/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="/resources/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="/resources/main_resource/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/resources/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/resources/main_resource/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet"
	href="/resources/main_resource/css/style.css">
<link rel="stylesheet"
	href="/resources/main_resource/css/product_inquiry.css">

</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="comments-area" id="product-inquiry-list">
		<h4>상품문의 목록</h4>

		<c:forEach var="inquiry" items="${list }">
			<div class="comment-list">
				<div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
						<!-- 					<div class="thumb"> -->
						<!-- 						<img src="/resources/main_resource/img/blog/c1.jpg" alt=""> -->
						<!-- 					</div> -->
						<div class="desc">
							<h5>
								<span hidden="hidden" class="inquiry-seq">${inquiry.pi_seq }</span>
								<a href="#">{inquiry.key.product_name}</a>
								<!-- 상품 이름 출력 -->
							</h5>
							<p class="date">${inquiry.pi_type }</p>
							<!-- 상품 문의 유형 출력 -->
							<p class="comment">${inquiry.pi_content }</p>
							<!-- 상품 문의 내용 출력 -->
						</div>
					</div>
					<div class="reply-btn">
						<a href="#" class="btn-reply text-uppercase" id="hw-reply">답변</a>
					</div>
				</div>
			</div>

			<!-- 위쪽: 고객의 문의 // 밑쪽: 운영사측 답변 -->

			<c:if test="${inquiry.pi_answer != null }">
				<div class="comment-list left-padding">
					<div class="single-comment justify-content-between d-flex">
						<div class="user justify-content-between d-flex">
							<!-- 					<div class="thumb"> -->
							<!-- 						<img src="/resources/main_resource/img/blog/c2.jpg" alt=""> -->
							<!-- 					</div> -->
							<div class="desc">
								<h5>
									<a href="#">답변된 내용</a>
								</h5>
								<p class="date"></p>
								<p class="comment">${inquiry.pi_answer }</p>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>
	</div>
	<script
		src="/resources/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script
		src="/resources/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script
		src="/resources/main_resource/vendors/skrollr.min.js"></script>
	<script
		src="/resources/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="/resources/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script
		src="/resources/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
	<script
		src="/resources/main_resource/vendors/mail-script.js"></script>
	<script
		src="/resources/main_resource/js/main.js"></script>
	<script type="text/javascript" src="/resources/main_resource/js/product_inquiry.js"></script>
	<jsp:include page="../footer.jsp"></jsp:include> 		
</body>
</html>