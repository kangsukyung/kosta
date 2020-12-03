<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이스토어 - 상품조회</title>
<link rel="icon"
	href="${pageContext.request.contextPath}/main_resource/img/Fevicon.png"
	type="image/png">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main_resource/vendors/linericon/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main_resource/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main_resource/css/member_mypage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/main_resource/css/product_style.css">
</head>
<body>
<sec:authentication property="principal.member" var="member"/>

	<%@include file="../includes/header.jsp"%>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>마이페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
							<li class="breadcrumb-item active" aria-current="page">상품조회</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-categories">
						<div class="head">프로필</div>
						<ul class="main-categories">
							<div>
								<input type="hidden" name="seq" value="${member.member_seq }">
								<c:if test="${member.member_profile!=null}">
									<c:set var="head"
										value="${fn:substring(member.member_profile,0, fn:length(member.member_profile)-4) }"></c:set>
									<c:set var="pattern"
										value="${fn:substring(member.member_profile, fn:length(head)+1, fn:length(member.member_profile))}"></c:set>
									<c:choose>
										<c:when
											test="${pattern=='jpg' || pattern=='png' || pattern=='gif' }">
											<a
												href="${pageContext.request.contextPath}/Member/MemberUpdate_form.do"><img
												class="author_img rounded-circle"
												src="/kosta1200/upload/${member.member_profile}" alt=""
												width="130" height="130"></a>
										</c:when>
										<c:otherwise>
											<c:out value="NO IMAGE"></c:out>
										</c:otherwise>
									</c:choose>
								</c:if>
								<c:if test="${member.member_profile ==null}">
									<a
										href="${pageContext.request.contextPath}/Member/MemberUpdate_form.do"><img
										class="author_img rounded-circle"
										src="${pageContext.request.contextPath}/upload/member_basic.png"
										alt="" width="130" height="130"></a>
								</c:if>
								<h4 style="padding-top: 10px;">${member.member_nickname}님
									프로필</h4>
								<div class="social_icon">
									<br> <a href="#"> <i class="ti-heart"> 좋아요</i></a> <a
										href="#"> <i class="fab fa-twitter"> 팔로잉</i></a>
								</div>
							</div>
						</ul>
					</div>
					<div class="sidebar-filter">
						<div class="top-filter-head">카테고리</div>
						<ul class="list cat-list mypage_category_list">
							<li><a
								href="${pageContext.request.contextPath}/Member/Member_Mypage.do"
								class="d-flex justify-content-between"><p>프로필</p></a></li>
							<li><a href="#" class="d-flex justify-content-between"><p>주문목록</p></a></li>
							<li><a
								href="${pageContext.request.contextPath}/Member/MemberUpdate_form.do"
								class="d-flex justify-content-between"><p>설정</p></a></li>
							<li><a
								href="${pageContext.request.contextPath}/Member/ConstractorSignup_form.do"
								class="d-flex justify-content-between"><p>전문가 신청</p></a></li>
							<li><a
								href="${pageContext.request.contextPath}/Member/VendorSignup_form.do"
								class="d-flex justify-content-between"><p>판매자 신청</p></a></li>
							<c:if test="${member.member_rating eq '2' }">
								<li><a href="#" class="d-flex justify-content-between"><p>마이스토어</p></a></li>
							</c:if>
						</ul>
					</div>
				</div>



<!-- ============================PRODUCT LIST========================================= -->

<%-- <div><input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>--%>
<section class="blog">
      <div class="container">
        <div class="section-intro pb-60px">
          <p>My Store</p>
          <h2>todayRoom's <span class="section-intro__style">My STORE</span></h2>
						<sec:authentication property="principal.member" var="member"/>   <!-- 로그인 한 사람 seq -->
        				<input type="hidden"  id="my_member_seq" name="my_member_seq" value="${product.store.member_seq}">
        				<div><input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>
						<a href="/product/register">상품추가</a>
        </div>
	
          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0 ccc">
          
          <c:forEach items="${pList}" var="product">
          
            <div class="card card-blog" id="product_card-blog">
              <div class="card-blog__img">
                <img class="card-img rounded-0" src="/product/display?fileName=${product.product_uuid }_${product.product_fname}">
                <%-- <c:out value="${product.product_uuid }_${product.product_fname}"></c:out> --%>
              </div>
              <div class="card-body">
                <ul class="card-blog__info">
                  <li><a href="#">상품번호 </a></li>
                  <li><a href="#"><i class="ti-comments-smiley"></i> ${product.product_seq }</a></li>
                </ul>
                <h4 class="card-blog__title"><a href="single-blog.html">${product.product_name }</a></h4>
                <p>${product.product_price }</p>
                <a class="card-blog__link" href="/product/modify?product_seq=<c:out value="${product.product_seq}"/>">수정하기 <i class="ti-arrow-right"></i></a>
              </div>
            </div>
            
           </c:forEach>
          </div>



 

      </div>
    </section>
































<!-- <div class="container">
	<div class="section-intro pb-60px">
		<p>Popular Item in the market</p>
			<h2>
				Best <span class="section-intro__style">Sellers</span>
			</h2>
	</div>

	<div class="owl-carousel owl-theme owl-loaded owl-drag" id="bestSellerCarousel">
		<div class="owl-stage-outer">
			<div class="owl-stage" style="transform: translate3d(-3135px, 0px, 0px); transition: all 0.25s ease 0s; width: 4560px;">
					<div class="owl-item cloned" style="width: 255px; margin-right: 30px;">
						<div class="card text-center card-product">
							<div class="card-product__img">
								<img class="img-fluid" src="img/product/product1.png" alt="">
							</div>
							
							<div class="card-body">
								<p>Accessories</p>
									<h4 class="card-product__title">
										<a href="single-product.html">Quartz Belt Watch11</a>
									</h4>
										<p class="card-product__price">$150.00</p>
							</div>
						</div>
					</div>
	
	
			</div>
	
		</div>
							
							
		<div class="owl-nav">
			<button type="button" role="presentation" class="owl-prev">
				<i class="ti-arrow-left"></i>
			</button>
			<button type="button" role="presentation" class="owl-next">
				<i class="ti-arrow-right"></i>
			</button>
		</div>
		<div class="owl-dots disabled"></div>
	</div>
</div> -->

































			</div>
		</div>
	</section>

	<%@include file="../includes/footer.jsp"%>


</body>
</html>