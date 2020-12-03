<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Login</title>

</head>

<body>
	<%@include file="../includes/header.jsp"%>	
	
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100" style="background: url('/main_resource/img/main-banner.jpg') no-repeat; background-size:cover;">
			<div class="blog-banner">
				<div class="text-center">
					<h1 >전문가 신청</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/member/mypage">마이페이지</a></li>
              <li class="breadcrumb-item active" aria-current="page">전문가 신청</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
    
	</section>
	<!-- ================ end banner area ================= -->
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4 style="margin-bottom: 50px;">전문가 가입 신청</h4>
							<p>오늘의방과 함께하기 어렵지 않아요. 몇 가지 단계만 진행하시면 고객들을 만나보실 수 있어요!</p>
							<a class="button button-account" href="#">회사소개 보러가기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3 >전문가 신청</h3>
						<form class="row login_form" action="/contractor/register" id="register_form" method="post" >
						<sec:authentication property="principal.member" var="member" />
							<input type="hidden" name="member_seq" value="${member.member_seq }">
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="contractor_bname" name="contractor_bname" placeholder="상호명" onfocus="this.placeholder = ''" onblur="this.placeholder = '상호명'"></div>
							<div class="col-md-12 form-group"><input type="text" class="form-control" style="margin-top: 50px;" id="contractor_name" name="contractor_name" placeholder="사업자대표명" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업자대표명'"></div>
							<div class="col-md-12 form-group member_signup"><input type="text" class="form-control-member_singup"  style="padding-left: 10px;margin-top: 50px;float: left;" id="contractor_address" name="contractor_address" placeholder="사업지주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업지주소'"><button type="button" onclick="openZipSearch(contractor_address)" style="margin-top: 55px;">주소찾기</button></div>
							<div><input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>
							<div class="col-md-10 form-group">
								<button type="submit" value="submit" class="button button-register w-100" style="margin-top: 80px; background: #384aeb;">전문가 신청</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
	<%@include file="../includes/footer.jsp"%>

  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="/main_resource/js/member_register.js"></script>
</body>
</html>