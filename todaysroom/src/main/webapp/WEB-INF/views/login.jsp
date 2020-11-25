<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta id="_csrf" name="_csrf" content="${_csrf.token}" /> 
  <meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />

  <title>Aroma Shop - Login</title>
  <link rel="stylesheet" href="/main_resource/css/member_idpwfound.css"> 
    
 </head>
	<%@include file="includes/header.jsp"%>
<body>
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>로그인 </h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">커뮤니티</a></li>
              <li class="breadcrumb-item active" aria-current="page"><a href="${pageContext.request.contextPath}/Member/MemberSignup_Form.do">회원가입</a></li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<div class="hover">
							<h4>웹사이트에 처음 방문하셨나요??</h4>
							<p>First time visiting the website?</p>
							<a class="button button-account" href="${pageContext.request.contextPath}/Member/MemberSignup_Form.do">회원 가입하러 가기</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>로그인</h3>
						<form class="row login_form" action="/login" id="contactForm" method="POST">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="username" name="username" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'">
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'">
							</div>
 							<div class="col-md-12 form-group">
								<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
							</div> 
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-login w-100">로그인</button>
								<a href="#" class="id_found">아이디 찾기</a>
								<a href="#" class="pw_found">비밀번호 찾기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
		<%@include file="includes/footer.jsp"%>
</body>
</html>