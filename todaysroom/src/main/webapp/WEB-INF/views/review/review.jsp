<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 	<link rel="icon" href="../../../main_resource/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../../../main_resource/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../../../main_resource/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../../../main_resource/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../../../main_resource/vendors/linericon/style.css">
  <link rel="stylesheet" href="../../../main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../../../main_resource/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../../../main_resource/vendors/nice-select/nice-select.css">

  <link rel="stylesheet" href="../../../main_resource/css/style.css"> -->
  <link rel="stylesheet" href="../../../main_resource/css/review.css">
  


</head>
<body>
	<!-- modal start -->
	<!-- 필요한 input들(?) -->
	<input type="hidden"  id="review_store_seq" name="review_store_seq" value="${store.store_seq}">
	<input type="hidden" id="review_member_seq" name="review_member_seq" value="${store.member_seq}"><!-- 글 쓴 사람 seq? -->
	<div id="my_modal">
	    <div class="review-modal__title">
			리뷰작성
		</div>
			<form class="review-modal__form"><!-- enctype="multipart/form-data" -->
			<!-- <div class="review-modal__form"> -->
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member" var="member"/>	<!-- 로그인 한 사람 seq? -->
				</sec:authorize>
					<input type="hidden" id="my_member_seq" name="my_member_seq" value="${member.member_seq}">
					<input type="hidden" id="review_store_seq" name="review_store_seq" value="${review.store_seq}">
					<input type="hidden" id="member_profile" name="member_profile" value="${member.member_profile}">
					<input type="hidden" id="member_path" name="member_path" value="${member.member_path}">
					<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="review-modal__form__product">
					<img class="review-modal__form__product__image" src="../../main_resource/img/product/product1.png">
					<div class="review-modal__form__product__contents">
						<div class="review-modal__form__product__contents__brand">제품명</div>
						<div class="review-modal__form__product__contents__name">제품명</div>
						<div class="review-modal__form__product__contents__options"></div>
					</div>
				</div>
				<!-- <div class="col-md-12 text-left">
					<input type="file" class="ti-search" name="review_picture">
				</div> -->
				<div class="review_box">
					<div class="col-md-12 text-left">
						<!-- <ul class="list">
							<li><a href="#"><i class="fa fa-star fa-star1"></i></a></li>
							<li><a href="#"><i class="fa fa-star fa-star2"></i></a></li>
							<li><a href="#"><i class="fa fa-star fa-star3"></i></a></li>
							<li><a href="#"><i class="fa fa-star fa-star4"></i></a></li>
							<li><a href="#"><i class="fa fa-star fa-star5"></i></a></li>
						</ul> -->
						<p id="star_grade">
					        <a href="#" id="1">★</a>
					        <a href="#" id="2">★</a>
					        <a href="#" id="3">★</a>
					        <a href="#" id="4">★</a>
					        <a href="#" id="5">★</a>
						</p>
					</div>
				</div>
				<div class="review-modal__section">
					<div class="review-modal__section__title">리뷰 내용</div>
					<div class="form-group">
	                    <textarea class="form-control different-control w-100" name="review_content" id="message" cols="30" rows="5" placeholder="Enter Message"></textarea>
	                </div>
					<div class="review-modal__form__review-input__length">
						<!-- <span class="review-modal__form__review-input__length__value">0</span> --><!-- 글자수 체크해주는거 -->
					</div>
				</div>
				<div class="col-md-12">
					<button id="reviewAddBtn" class="btn primary-btn">리뷰쓰기</button>
					<button id="reviewModBtn" class="btn primary-btn">리뷰쓰기</button>
				</div>
			<!-- </div> -->
			</form>
	    <a class="modal_close_btn">닫기</a>
	</div>
	<!-- modal end -->

	<!-- review list start-->
	<div class="col-lg-12 review_sidebar_jsb">
		<%-- <c:if test="${list2.totalCount > 0}"> --%>
			<div class="review_sidebar_count_jsb" >
				<h4 >리뷰  ${reviewCnt}</h4>
			</div>
			<sec:authorize access="isAnonymous()">
				<div class="review_sidebar_button_jsb">
					<a id="popup_open_btn" onclick="location.href='/login'">로그인 후 리뷰쓰기</a>
				</div>
			</sec:authorize>
			<sec:authorize access="isAuthenticated()">
				<div class="review_sidebar_button_jsb">
					<a id="popup_open_btn">리뷰쓰기</a>
				</div>
			</sec:authorize>
				<div class="review_sidebar_select_jsb">
	                 <div class="nice-select" tabindex="0"><span class="current">상품옵션</span>
	                  <ul class="list">
						<c:forEach items="${list}" var="product" varStatus="status">
	                  		<li data-value="${status.count}" id="${product.product_name}" class="option selected focus" >${product.product_name}
								<input type="hidden" name='product_seq' value="${product.product_seq }">
								<input type="hidden" class="product_uploadpath"  value="${product.product_uploadpath }">
		               		    <input type="hidden" class="product_uuid"  value="${product.product_uuid }">
		                       	<input type="hidden" class="product_filename"  value="${product.product_fname }">
	                        	<input type="hidden" class="img-fluid"  src="">
	                  		</li>
	   						
	   					</c:forEach>
	                  </ul>
	                 </div>
		   		</div>
	        <div class="blog_left_sidebar">
	        	<!-- <a class="review_sidebar_alig_jsb">최신순</a>
	        	<a class="review_sidebar_alig_jsb">평점순</a> -->
	        	<!-- review list 시작 -->
	            <div class="production-review-item__container">
	            </div>
	            <div class="review_paging"></div>
	        </div>
    </div>
              <!-- review list end -->
              
 <!-- <script src="../../../main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
 <script src="../../../main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
 <script src="../../../main_resource/vendors/skrollr.min.js"></script>
 <script src="../../../main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
 <script src="../../../main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
 <script src="../../../main_resource/vendors/jquery.ajaxchimp.min.js"></script>
 <script src="../../../main_resource/vendors/mail-script.js"></script>
 <script src="../../../main_resource/js/main.js"></script> -->
 <script type="text/javascript">
 	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
 </script>
 <script src="../../../main_resource/js/review.js"></script>

</body>
</html>