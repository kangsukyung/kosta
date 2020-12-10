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
  
  <link rel="stylesheet" href="/main_resource/css/member_idpwfound.css">
  <link rel="stylesheet" href="/main_resource/css/member_signup.css">
</head>

<body>
	<%@include file="../includes/header.jsp"%>
	
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100" style="background: url('/main_resource/img/main-banner.jpg') no-repeat; background-size:cover;">
			<div class="blog-banner">
				<div class="text-center">
					<h1>판매자 신청</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/member/mypage">마이페이지</a></li>
              <li class="breadcrumb-item active" aria-current="page">판매자 신청</li>
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
							<h4 style="margin-bottom: 50px;">입점신청</h4>
							
						<p style="text-align: left;">ㆍ작성해주신 정보를 바탕으로 카테고리별 담당 MD가 입점을 검토하여 이메일을 드립니다.</p>
						<p style="text-align: left;">ㆍ입점 불가에 대한 통보는 불가 사유와 함께 이메일로 보내드립니다. 회신을 주셔도 답변이 불가한 점 양해 부탁드립니다.</p>
						<p style="text-align: left;">ㆍ사업자가 이미 등록되어 있어 입점 신청이 불가한 경우 sellers@bucketplace.net으로 이메일을 보내주세요.</p>
						<p style="text-align: left;">ㆍ입점 신청과 관련된 내용은 일반 고객센터 접수가 불가능합니다. 참고 바랍니다.</p>
							
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3 >입점 신청</h3>
						<form class="row login_form" action="/vendor/register" id="register_form" method="post">
							<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
							<sec:authentication property="principal.member" var="member" />
							<input type="hidden" name="member_seq" value="${member.member_seq }">
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="vendor_name" name="vendor_name" placeholder="회사이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '회사이름'"></div>
							<div class="col-md-12 form-group"><input type="text" class="form-control" style="margin-top: 50px;" id="vendor_license" name="vendor_license" placeholder="사업자등록번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '사업자등록번호'"></div>
							<div class="col-md-12 form-group member_signup"><input type="text" class="form-control-member_singup"  style="margin-top: 50px;" id="vendor_address" name="vendor_address" placeholder="사업지주소"  onblur="this.placeholder = '사업지주소'" readonly="readonly"><button type="button" onclick="openZipSearch(vendor_address)" style="margin-top: 55px;">주소찾기</button></div>
			<div class="col-md-12 form-group"><div class="sorting" style="margin-top: 50px;">
              <select id="vendor_category"  name="vendor_category">
                <option>선택해주세요</option>
                <option value="주방">주방</option>
                <option value="생활용품">생활용품</option>
                <option value="가구">가구</option>
                <option value="홈데코/조명">홈데코/조명</option>
                <option value="반려동물">반려동물</option>
                <option value="패브릭">패브릭</option>
                <option value="수납/정리">수납/정리</option>
                <option value="가전">가전</option>
                <option value="DIY/공구">DIY/공구</option>
              </select></div></div>

							<div class="col-md-10 form-group">
								<button type="submit" value="submit" class="button button-register w-100" style="margin-top: 50px; background: #384aeb;">입점 신청</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>


<%@include file="../includes/footer.jsp"%>
  <script src="/main_resource/js/member_register.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>