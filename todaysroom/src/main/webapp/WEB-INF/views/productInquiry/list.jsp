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
<link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="/main_resource/css/style.css">
<link rel="stylesheet" href="/main_resource/css/product_inquiry.css">

</head>
<body>
	<jsp:include page="../includes/header.jsp"></jsp:include>
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
								<span hidden="hidden" class="inquiry-seq">${inquiry.key.pi_seq }</span>
								<a href="/store/read?store_seq=${inquiry.value.store_seq}">${inquiry.value.product_name}</a>
								<!-- 상품 이름 출력 -->
							</h5>
							<p class="date">${inquiry.key.pi_type }</p>
							<!-- 상품 문의 유형 출력 -->
							<p class="comment">${inquiry.key.pi_content }</p>
							<!-- 상품 문의 내용 출력 -->
						</div>
					</div>
					<div class="reply-btn">
						<!-- 						<a href="#" class="btn-reply text-uppercase" id="hw-reply">답변</a> -->
						<button type="button" class="btn btn-primary hw-inquiry-modify"
							data-toggle="modal" data-target="#exampleModal">문의수정</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>

	<!-- modal start -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true"
		data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">상품 문의수정</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="my-form">
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
<!-- 							<input hidden="hidden" name="member_seq" value=""> -->
<!-- 							<input hidden="hidden" name="product_seq" value=""> -->
						<input
							type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" id="security-tokken"/>
							<input hidden="hidden" name="pi_seq"
							id="pi_seq">
						<!--csrf 토큰 처리 -->
					</form>
					<div>문의내용에 대한 답변은 ‘마이페이지 &gt; 나의 쇼핑 &gt; 나의 문의내역’ 또는 ‘상품
						상세페이지’에서 확인 가능합니다.</div>
				</div>
				<div class="modal-footer">
					<button type="submit" form="my-form" class="btn btn-primary"
						id="inquiry-modify">문의수정</button>
					<button id="inquiry-remove" class="btn btn-primary">문의삭제</button>
				</div>
			</div>
		</div>
	</div>
	<!-- modal end -->


	<script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/main_resource/vendors/skrollr.min.js"></script>
	<script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="/main_resource/vendors/mail-script.js"></script>
	<script src="/main_resource/js/main.js"></script>
	<script type="text/javascript"
		src="/main_resource/js/product_inquiry.js"></script>
	<jsp:include page="../includes/footer.jsp"></jsp:include>
</body>
</html>