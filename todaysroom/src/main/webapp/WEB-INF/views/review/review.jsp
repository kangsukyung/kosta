<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="icon" href="../../..//main_resource/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../../..//main_resource/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../../..//main_resource/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../../..//main_resource/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../../..//main_resource/vendors/linericon/style.css">
  <link rel="stylesheet" href="../../..//main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../../..//main_resource/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../../..//main_resource/vendors/nice-select/nice-select.css">

  <link rel="stylesheet" href="../../..//main_resource/css/style.css">
  <link rel="stylesheet" href="../../..//main_resource/css/review.css">
  


</head>
<body>
	<!-- modal start -->
	<div id="my_modal">
	    <div class="review-modal__title">
			리뷰작성
		</div>
			<form class="review-modal__form" action="ReviewInsertAction.do" method="POST" enctype="multipart/form-data">
				<div class="review-modal__form__product">
					<img class="review-modal__form__product__image"
					src="../../main_resource/img/product/product1.png">
					<div class="review-modal__form__product__contents">
						<div class="review-modal__form__product__contents__brand">제품명</div>
						<div class="review-modal__form__product__contents__name">
						제품설명 롸라라라롸라라라라ㅏㄹ
						</div>
						<div class="review-modal__form__product__contents__options"></div>
					</div>
				</div>
				<div class="col-md-12 text-right">
					<input type="file" class="ti-search" name="review_picture">사진 첨부하기
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
					<button type="submit" value="submit" class="btn primary-btn">리뷰쓰기</button>
				</div>
			</form>
	    <a class="modal_close_btn">닫기</a>
	</div>
	<!-- modal end -->

	<!-- review list start-->
	<div class="col-lg-8 review_sidebar_jsb">
		<c:if test="${list2.totalCount > 0}">
			<div class="review_sidebar_count_jsb" >
				<h4 >리뷰  ${list2.totalCount}개</h4>
			</div>
			<div class="review_sidebar_button_jsb">
				<a id="popup_open_btn">리뷰쓰기</a>
			</div>
			<div class="review_sidebar_select_jsb">
	                 <div class="nice-select" tabindex="0"><span class="current">상품옵션</span>
	                  <ul class="list">
	                  <!-- 글번호 불러오면 상품들 다 가져올 수 있다고 함 -->
	                  <li data-value="1" class="option selected focus">안마의자 핑크</li>
	                  <li data-value="1" class="option">안마의자 블랙</li>
	                  <li data-value="1" class="option">안마의자 옐로</li>
	                  </ul>
	                 </div>
	   		</div>
	        <div class="blog_left_sidebar">
	        	<a class="review_sidebar_alig_jsb">추천순</a>
	        	<a class="review_sidebar_alig_jsb">최신순</a>
	        	<a class="review_sidebar_alig_jsb">평점</a>
	            <c:forEach var="r" items="${list2.list}">
	            <div class="production-review-item__container">
		            <article class="row blog_item blog_item_jsb">
		            <div class="thumb">
						<img src="${pageContext.request.contextPath}/main_resource/img/blog/c1.jpg" alt=""><!-- user profile -->
					</div>
		            <div class="col-md-9">
			            <div class="blog_post">
		           	  		<a class="post_tag a_jsb" href="#">글쓴이</a><!-- member_name -->
		           	  		<p>${r.review_date}</p>
		           	  		<c:if test="${r.review_picture != null }">
								<c:set var="head" value="${fn:substring(r.review_picture, 0, fn:length(r.review_picture)-4) }"></c:set>
								<c:set var="pattern" value="${fn:substring(r.review_picture, fn:length(head) +1, fn:length(r.review_picture)) }"></c:set>
									<c:choose>
										<c:when test="${pattern == 'png' || pattern == 'gif' || pattern == 'PNG' || pattern == 'jpg'}">
											<div class="d-flex">
												<img src="${pageContext.request.contextPath}/upload/${head}_small.${pattern}">
											</div>
										</c:when>
										<c:otherwise>
										<c:out value="NO IMAGE"></c:out>
										</c:otherwise>
									</c:choose>
							</c:if>
			                <img src="../../main_resource/img/blog/main-blog/m-blog-1.jpg" alt="">
			                <div class="blog_details">
			                    <p>${r.review_content}</p>
			                    <a class="button button-blog" href="#">View More</a>
			                </div>
			                <div class="update_div">
			                	<a class="date" href="ReviewUpdateAction.do?review_seq=${r.review_seq}">수정하기</a>
			                	<a class="date" href="ReviewDeleteAction.do?review_seq=${r.review_seq}">삭제하기</a>
			                </div>
			            </div>
		            </div>
		            </article>
	            </div>
	            </c:forEach>
	            <nav class="blog-pagination justify-content-center d-flex">
	                <ul class="pagination">
	                    <c:if test="${list2.startPage > 5 }">
							<li class="page-item">
								<a href="ReviewListAction.do?pageNum=${list2.startPage - 1}" class="page-link" aria-label="Previous"> 
									<span aria-hidden="true">
										<span class="lnr lnr-chevron-left" ></span>
									</span>
								</a>
							</li>
						</c:if>
						
						<c:forEach var="pageNo" begin="${list2.startPage}" end="${list2.endPage}">
							<c:if test="${list2.requestPage == pageNo}"><b></c:if>
								<li class="page-item">
									<a href="ReviewListAction.do?pageNum=${pageNo}" class="page-link"  id="page-item-pageno">${pageNo}</a>
								</li>
							<c:if test="${list2.requestPage == pageNo}"></b></c:if>
						</c:forEach>
						
						<c:if test="${list2.endPage < list2.totalPageCount}">
							<li class="page-item">
								<a href="ReviewListAction.do?pageNum=${list2.endPage + 1}" class="page-link" aria-label="Next"> 
									<span aria-hidden="true">
										<span class="lnr lnr-chevron-right"></span>
									</span>
								</a>
							</li>
						</c:if>
	                </ul>
	            </nav>
	        </div>
        </c:if>
        <c:if test="${list2.totalCount == 0 || list2.totalCount == null}">
			리뷰가 없어요 작성해주세요
			<a id="popup_open_btn">리뷰쓰기</a>
        </c:if>
    </div>
              <!-- review list end -->
              
 <script src="../../..//main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
 <script src="../../..//main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
 <script src="../../..//main_resource/vendors/skrollr.min.js"></script>
 <script src="../../..//main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
 <script src="../../..//main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
 <script src="../../..//main_resource/vendors/jquery.ajaxchimp.min.js"></script>
 <script src="../../..//main_resource/vendors/mail-script.js"></script>
 <script src="../../..//main_resource/js/main.js"></script>
 <script src="../../..//main_resource/js/review.js"></script>

</body>
</html>