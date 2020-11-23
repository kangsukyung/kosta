<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>마이페이지 설정</title>
  <link rel="stylesheet" href="/resources/main_resource/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="/resources/main_resource/vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="/resources/main_resource/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="/resources/main_resource/vendors/linericon/style.css">
  <link rel="stylesheet" href="/resources/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="/resources/main_resource/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="/resources/main_resource/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="/resources/main_resource/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="/resources/main_resource/css/style.css">
  <link rel="stylesheet" href="/resources/css/member_mypage.css">
</head>
<%@include file="../includes/header.jsp"%>
<body>
	<!-- ================ start banner area ================= -->
	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.member" var="member"/>	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>마이페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/Member/Member_Mypage.do">마이페이지</a></li>
              <li class="breadcrumb-item active" aria-current="page">설정</li>
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
					<c:if test="${member.member_profile!=null}">
						<c:set var="head" value="${fn:substring(member.member_profile,0, fn:length(member.member_profile)-4) }"></c:set>
						<c:set var="pattern" value="${fn:substring(member.member_profile, fn:length(head)+1, fn:length(member.member_profile))}"></c:set>
						<c:choose>
							<c:when test="${pattern=='jpg' || pattern=='png' || pattern=='gif' }">
								<a href="${pageContext.request.contextPath}/Member/MemberUpdate_form.do"><img class="author_img rounded-circle" src="/member/display?fileId=${member.member_id}" alt="" width="130" height="130"></a>
							</c:when>
							<c:otherwise>
								<c:out value="NO IMAGE"></c:out>
							</c:otherwise>
						</c:choose>					
					</c:if>
					
					<c:if test="${member.member_profile ==null}">
						<a href="/member/update"><img class="author_img rounded-circle" src="/resources/img/member_basic.png"alt="" width="130" height="130"></a>
					</c:if>
							<h4 style=" padding-top: 10px;">${member.member_nickname}님 프로필</h4>
							<div class="social_icon">
							<br>
								<a href="#"> <i class="ti-heart"> 좋아요</i></a> 
								<a href="#"> <i class="fab fa-twitter"> 팔로잉</i></a> 
							</div>
					</div>
            </ul>
          </div>
          <div class="sidebar-filter">
            <div class="top-filter-head">카테고리</div>
 				<ul class="list cat-list mypage_category_list">
					<li><a href="${pageContext.request.contextPath}/Member/Member_Mypage.do"><p>프로필</p></a></li>
					<li><a href="#" class="d-flex justify-content-between"><p>주문목록</p></a></li>
					<li><a href="${pageContext.request.contextPath}/Member/MemberUpdate_form.do" class="d-flex justify-content-between"><p>설정</p></a></li>
					<li><a href="${pageContext.request.contextPath}/Member/ConstractorSignup_form.do" class="d-flex justify-content-between"><p>전문가 신청</p></a></li>
					<li><a href="${pageContext.request.contextPath}/Member/VendorSignup_form.do" class="d-flex justify-content-between"><p>판매자 신청</p></a></li>
					<c:if test="${member.member_rating eq '2' }">
					<li><a href="${pageContext.request.contextPath}/Product/ProductListAction.do" class="d-flex justify-content-between"><p>마이스토어</p></a></li>			
					</c:if>
				</ul>
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <section class="lattest-product-area pb-40 category-list">
            		<a href="" style="float:right;">회원탈퇴</a>
						<form class="row login_form" action="/member/update"  method="post" enctype="multipart/form-data">
							<input type="hidden" name="member_seq" value="${member.member_seq }">
							<input type="hidden" name="member_id" value="${member.member_id }">
							<input type="hidden" name="member_path" value="${member.member_path }">
							<input type="hidden" name="member_profile" value="${member.member_profile }">
							<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
							
							<div class="col-md-12 form-group member_signup"><h5 style="font-size: 15px;float: left;padding-top: 12px;"></h5><input type="text" class="form-control-member_singup" id="member_nickname" name="member_nickname"  placeholder="별명" onfocus="this.placeholder = ''" onblur="this.placeholder = '별명'" value=" ${member.member_nickname}">
							<button type="button" class="memberName_btn">중복확인</button></div>
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="member_name" name="member_name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" value="${member.member_name}"></div>
							<div class="col-md-12 form-group member_signup" ><input type="text" class="form-control-member_singup" id="member_address" name="member_address" placeholder="주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'" value="${member.member_address}" style="padding-left: 10px;"><button type="button" onclick="openZipSearch(member_address)">주소찾기</button></div>
							
            				<div class="col-md-12 form-group"><input type="tel" class="form-control"  id="member_phone" name="member_phone" placeholder="전화번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호'" value="${member.member_phone}"></div>
    			          	<font class="member_font_padding" id="phone_check" size="2"></font>
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="member_email" name="member_email" placeholder="이메일 주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일 주소'"value="${member.member_email}"></div>
    			          	<font class="member_font_padding" id="mail_check" size="2"></font>
	            			<div class="col-md-12 form-group"><input type="password" class="form-control" class="memberPassword" id="member_password" name="member_password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'"value="${member.member_password}"></div>
    			          	<font class="member_font_padding" id="password_check" size="2"></font>
    			          	<div class="col-md-12 form-group"><input type="password" class="form-control" class="memberPassword" id="userPwChk" name="memberPassword" placeholder="비밀번호확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호확인'"value="${member.member_password}"></div>
    			          	<font class="member_font_padding" id="chkNotice" size="2" style="height: 30px;width: 100%;"></font>
    			          	
    			     <c:if test="${member.member_profile!=null}">
						<c:set var="head" value="${fn:substring(member.member_profile,0, fn:length(member.member_profile)-4) }"></c:set>
						<c:set var="pattern" value="${fn:substring(member.member_profile, fn:length(head)+1, fn:length(member.member_profile))}"></c:set>
						<c:choose>
							<c:when test="${pattern=='jpg' || pattern=='png' || pattern=='gif' }">
	    			          	<img class="author_img rounded-circle mypageUpdate_img" src="/member/display?fileId=${member.member_id}" alt="" width="200px" height="200">
							</c:when>
							<c:otherwise>
								<c:out value="NO IMAGE"></c:out>
							</c:otherwise>
						</c:choose>					
					</c:if>
					<c:if test="${member.member_profile ==null}">
		    			<img class="author_img rounded-circle mypageUpdate_img" src="/resources/img/member_basic.png" alt="" width="200px" height="200">
					</c:if>
							<div class="col-md-10 form-group">
								<input type="file" class="mypageUdate_type" name="profile" id="fileChange" accept=".gif, .jpg, .png">
							</div>
							
							<div class="col-md-10 form-group">
								<button type="submit" value="submit" class="button button-register w-100 mypageUdate_button_color">회원 정보수정</button>
							</div>
							
						</form>
          </section>       
        			</div>
        		</div>
        	</div>
     </section>
     </sec:authorize>

 <%@include file="../includes/footer.jsp"%>
  <script src="/resources/js/member_register.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  	
	function imgRead() {
		var file1=$("#fileChange").val();
/* 		var fReader=new FileReader();
		fReader.readAsDataURL(input.files[0]);
		fReader.onloadend = function(event){
		    var img = document.getElementById("yourImgTag");
		    img.src = event.target.result;
		}
 *///		var file=$("#fileChange").val();
		console.log(typeof file1);
		console.log(file1);
		console.log("1");
		
/* 	    $.ajax({
	        url: '/members/profileUp/'+file,
	        dataType:'text',
	        type: 'GET',
	        success: function(result){
	             alert(result);
	             
	           }
	      }); */
	}

  </script>
</body>
</html>