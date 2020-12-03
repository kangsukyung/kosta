<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
  <link rel="stylesheet" href="/main_resource/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="/main_resource/vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="/main_resource/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
  <link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="/main_resource/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="/main_resource/vendors/nouislider/nouislider.min.css">
  <link rel="stylesheet" href="/main_resource/css/style.css">
  <link rel="stylesheet" href="/main_resource/css/member_mypage.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	 <%@include file="../includes/header.jsp"%>
	 
	 <section class="blog-banner-area" id="category">
		<div class="container h-100" style="background: url('/main_resource/img/main-banner.jpg') no-repeat; background-size:cover;">
			<div class="blog-banner">
				<div class="text-center">
					<h1>고객센터</h1>
					<br>
          	  <h5>운영시간 : 평일 09:00 ~ 18:00 (주말 & 공휴일 제외)</h5>
          	  <br>
			<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/oneInquriy/register">고객센터</a></li>
              <li class="breadcrumb-item active" aria-current="page"> 1:1문의</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	 
	<!--================ End Header Menu Area =================-->
	<section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">프로필</div>
            <ul class="main-categories">
				<sec:authorize access="isAuthenticated()">
					<sec:authentication property="principal.member" var="member"/>
					<div>
					
					<c:if test="${member.member_profile !=null}">
						<c:set var="head" value="${fn:substring(member.member_profile,0, fn:length(member.member_profile)-4) }"></c:set>
						<c:set var="pattern" value="${fn:substring(member.member_profile, fn:length(head)+1, fn:length(member.member_profile))}"></c:set>
						<c:choose>
							<c:when test="${pattern=='jpg' || pattern=='png' || pattern=='gif' }">
								<a href="/member/modify"><img class="author_img rounded-circle" src="/member/display?fileId=<sec:authentication property="principal.member.member_id"/>" alt="" width="130" height="130"></a>
							</c:when>
							<c:otherwise>
								<c:out value="NO IMAGE"></c:out>
							</c:otherwise>
						</c:choose>					
					</c:if>
					<c:if test="${member.member_profile ==null}">
						<a href="/member/modify"><img class="author_img rounded-circle" src="/main_resource/img/member_basic.png" alt="" width="130" height="130"></a>
					</c:if>
							<h4 style=" padding-top: 10px;"><sec:authentication property="principal.member.member_id"/>님 프로필</h4>
							<div class="social_icon">
							<br>
								<a href="/scrap/list"> <i class="ti-heart"> 스크랩</i></a> 
								<a href="/follow/list"> <i class="fab fa-twitter"> 팔로잉</i></a> 
							</div>
					</div>
				</sec:authorize>
            </ul>
          </div>
          <div class="sidebar-filter">
            <div class="top-filter-head" style="margin-bottom: 10px;">카테고리</div>
 				<ul class="list cat-list mypage_category_list">
					<li><a href="/member/mypage" class="d-flex justify-content-between"><p>마이페이지</p></a></li>
					<li><a href="/productInquiry/list" class="d-flex justify-content-between"><p>상품문의목록</p></a></li>
					<li><a href="/member/modify" class="d-flex justify-content-between"><p>유저정보 수정</p></a></li>
					<sec:authorize access="hasAnyRole('ROLE_1,ROLE_2')">
						<li><a href="/contractor/register" class="d-flex justify-content-between"><p>전문가 신청</p></a></li>
					</sec:authorize>
					<sec:authorize access="hasAnyRole('ROLE_1,ROLE_3')">
						<li><a href="/vendor/register" class="d-flex justify-content-between"><p>판매자 신청</p></a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_2')">
						<li><a href="/product/list" class="d-flex justify-content-between"><p>마이스토어</p></a></li>			
					</sec:authorize>
				</ul>
		          </div>
		        </div>
		        
		  <div class="col-xl-9 col-lg-8 col-md-7">
          <section class="lattest-product-area pb-40 category-list">
          <div class="tracking_box_inner">
              <p style="font-size: 20px; margin-bottom: 10px;">코로나19로 인해 고객센터를 잠정적으로 축소하여 운영중입니다.</p>
              <p style="font-size: 20px; margin-bottom: 10px;">전화 및 1:1문의하기 상담이 지연되고 있는 점 너른 양해 부탁드립니다.</p>
              <p style="font-size: 20px; margin-bottom: 10px;">순차적으로 최대한 빠르게 안내해 드리도록 노력하겠습니다.</p>
			<br>
              <form class="row tracking_form" action="/oneInquriy/register" method="post">
				<sec:authentication property="principal.member" var="member" />
				  <input type="hidden" name="member_seq" value="${member.member_seq }">
				  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
				  
                  <div class="col-md-12 form-group">
                      <input type="text" class="form-control" id="oi_title" name="oi_title" placeholder="제목" onfocus="this.placeholder = ''" onblur="this.placeholder = '제목'">
                  </div>
                  <div class="col-md-12 form-group">
                   <textarea class="form-control" id="oi_content" name="oi_content" style="height: 400px;" placeholder="문의내용" onfocus="this.placeholder = ''" onblur="this.placeholder = '문의내용'"></textarea>
                  </div>
                  <div class="col-md-12 form-group">
                      <button type="submit" value="submit" class="button button-tracking" style="width: 100%;">문의하기</button>
                  </div>
              </form>
          </div>
          </section>
          </div>
       		</div>
        </div>
   </section>
	<!-- ================ start banner area ================= -->	
  



  <!--================ Start footer Area  =================-->	
  <%@include file="../includes/footer.jsp"%>
</html>