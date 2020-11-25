<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/bootstrap/bootstrap.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/fontawesome/css/all.min.css">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/themify-icons/themify-icons.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/nice-select/nice-select.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.carousel.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/style.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/ksk_style.css">
  	
<script src="${pageContext.request.contextPath}/main_resource/js/jquery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/main_resource/js/product_insert_btn.js" type="text/javascript"></script>


</head>

<body>

	<section class="product_description_area">
		<div class="container">
			
			<ul class="nav nav-tabs ksk-right" id="myTab" role="tablist">
				<li class="nav-item"></li>
			</ul>
			
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row" id="ksk_row">
						<div id="product_picture">


							<c:if test="${productVO.product_fname != null }">
								<c:set var="head"
									value="${fn:substring(productVO.product_fname, 0, fn:length(productVO.product_fname)-4) }"></c:set>
								<c:set var="pattern"
									value="${fn:substring(productVO.product_fname, fn:length(head) +1, fn:length(productVO.product_fname)) }"></c:set>

								<c:choose>
									<c:when
										test="${pattern == 'png' || pattern == 'gif' || pattern == 'PNG' }">
										<img id="product_img" src="/kosta1200/upload/${head }.${pattern}">
									</c:when>
									<c:otherwise>
										<c:out value="NO IMAGE"></c:out>
									</c:otherwise>
								</c:choose>
							</c:if>






						</div>
						<div class="col-lg-6">
							<div class="review_box">
								<h4>상품수정</h4>
								<form action="/product/modify" class="form-contact form-review mt-3" method="post">
									<input type="hidden" name="product_seq" value="${product.product_seq }">
								
									<div class="form-group">
										<label id="product_insert_label">상품명 </label> <input class="form-control" id="product_insert_input" name="product_name" type="text" placeholder="상품명을 입력하세요." value="${product.product_name}">
									</div>	
																	
									<div class="form-group">
										<label id="product_insert_label">가격 </label> <input class="form-control" id="product_insert_input2" name="product_price" type="text" placeholder="가격을입력하세요." value="${product.product_price}">
									</div>
									 
									<div class="form-group">
										<label id="product_insert_label">가격 </label> <input class="form-control" id="product_insert_input2" name="product_fname" type="text" placeholder="가격을입력하세요." value="${product.product_fname}">
									</div>
									
									<%-- <div class="form-group">
										<label id="product_insert_label">대분류 </label> <input class="form-control" id="product_insert_input2" name="product_lcategory" type="text" placeholder="대분류를 입력하세요." value="${productVO.product_lcategory}">
									</div>
									
									<div class="form-group">
										<label id="product_insert_label">소분류 </label> <input class="form-control" id="product_insert_input2" name="product_scategory" type="text" placeholder="소분류를 입력하세요." value="${productVO.product_scategory}">
									</div> --%>


									
		<div class="form-group text-center text-md-right mt-3" id="ksk_btn">
			<input type="submit" class="button button--active button-review" value="수정하기">
			<button type="submit" class="button button--active button-review">취소하기</button>
		</div>
								</form>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


	</section>




</body>
</html>