<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
  
  <title>Aroma Shop - Login</title>
  <link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="/main_resource/css/member_idpwfound.css">
  <link rel="stylesheet" href="/main_resource/css/member_signup.css">
</head>

<%@include file="../includes/header.jsp"%>
<body>
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>회원가입</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item">커뮤니티</li>
              <li class="breadcrumb-item active" aria-current="page"><a href="${pageContext.request.contextPath}/Member/MemberLogin_Action.do">로그인</a></a></li>
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
					<div class="login_box_img" class="member_signup_height">
						<div class="hover">
							<h4>이미계정이 있습니까?</h4>
							<p>Already have an account?</p>
							<a class="button button-account" href="${pageContext.request.contextPath}/Member/MemberLogin_Action.do">로그인</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3 >계정만들기</h3>
						<form class="row login_form" action="/member/register"  id="register_form"  method="post">
							<div class="col-md-12 form-group member_signup"><input type="text" class="form-control-member_singup" id="member_id" name="member_id" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'">
							<button type="button" class="memberId_btn" >중복확인</button></div>
    			          	<font class="member_font_padding" id="id_check" size="2"></font>
							<div class="col-md-12 form-group member_signup"><input type="text" class="form-control-member_singup" id="member_nickname" name="member_nickname" placeholder="별명" onfocus="this.placeholder = ''" onblur="this.placeholder = '별명'">
							<button type="button" class="memberName_btn">중복확인</button></div>
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="member_name" name="member_name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'"></div>
							<div class="col-md-12 form-group member_signup"><input type="text" class="form-control-member_singup" id="member_address" name="member_address" placeholder="주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'"><button type="button" onclick="openZipSearch(member_address)">주소찾기</button></div>
							
            				<div class="col-md-12 form-group"><input type="tel" class="form-control"  id="member_phone" name="member_phone" placeholder="휴대폰번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '휴대폰번호'"></div>
    			          	<font class="member_font_padding" id="phone_check" size="2"></font>
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="member_email" name="member_email" placeholder="이메일 주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일 주소'"></div>
    			          	<font class="member_font_padding" id="mail_check" size="2"></font>
	            			<div class="col-md-12 form-group"><input type="password" class="form-control" class="memberPassword" id="member_password" name="member_password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'"></div>
    			          	<font class="member_font_padding" id="password_check" size="2"></font>
    			          	<div class="col-md-12 form-group"><input type="password" class="form-control" class="memberPassword" id="userPwChk" name="memberPassword" placeholder="비밀번호확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호확인'"></div>
    			          	<font class="member_font_padding" id="chkNotice" size="2"></font>
     			          	<div><input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>
 							<div class="col-md-10 form-group">
								<button type="submit" value="submit" class="button button-register w-100">회원가입</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
  
</body>
<%@include file="../includes/footer.jsp"%>

<script src="/main_resource/js/member_register.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
$(document).ready(function name() {
	$(".memberId_btn").click(function() {
        
        var userid =  $("#member_id").val(); 
        memberRegister.idCheck(userid, function(result) {
        	
        	if(result=='0'){
        		alert("사용할수 있는 아이디입니다.");
        	}else{
	        	alert("사용중인 아이디입니다.");
        	}
		});
    });
	
	$(".memberName_btn").click(function() {
        
        var userName =  $("#member_nickname").val(); 
        memberRegister.nameCheck(userName, function(result) {
        	
        	if(result=='0'){
        		alert("사용할수 있는 별명입니다.");
        	}else{
	        	alert("사용중인 별명입니다.");
        	}
		});
    });
});

</script>
</html>