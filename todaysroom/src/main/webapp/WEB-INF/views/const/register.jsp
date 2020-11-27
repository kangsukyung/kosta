<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%-- <sec:authentication property="principal.member.member_seq" var="member_seq"/> --%>
<!DOCTYPE html>
<html lang="en" class="hw-contractor-common">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>맞춤 업체 찾아보기</title>
<link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet"
	href="/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
<link rel="stylesheet"
	href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet"
	href="/main_resource/vendors/nice-select/nice-select.css">
<link rel="stylesheet"
	href="/main_resource/vendors/nouislider/nouislider.min.css">

<link rel="stylesheet" href="/main_resource/css/style.css">
<link rel="stylesheet" href="/main_resource/css/const.css">
</head>
<body class="hw-contractor-common">
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area hw-contractor-common" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<div class="col-lg-6 hw-consult-form-width">
						<h3>인테리어 시공 신청서</h3>
						<div class="login_form_inner register_form_inner hw-consult-form">

							<form class="row login_form" action="/const/register"
								method="post" id="register_form">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<%-- 보안 토큰 설정 --%>
								<input type="hidden" name="member_seq" value="22">
								<%-- 원래는 value속성 값에 ${member_seq} 가 들어가야함 --%>
								<div class="col-md-12 form-group">
									<div>시공 공간은 몇 평이세요?</div>
									<input type="text" class="form-control" id="const_space"
										name="const_space" placeholder="평 수 입력"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '평 수 입력'" required="required">
									<span>평</span>
								</div>
								<div class="col-md-12 form-group">
									<div>생각하시는 예산을 알려주세요.</div>
									<input type="text" class="form-control" id="const_budget"
										name="const_budget" placeholder="예산 입력"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '예산 입력'" required="required">
									<span>만원</span>
								</div>
								<div class="col-md-12 form-group">
									<div>시공하시려는 공간을 선택해주세요.</div>
									<!-- <input type="text" class="form-control" id="password"
										name="password" placeholder="공간 선택"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '공간 선택'"> -->
									<select name="const_type">
										<option value="">선택해주세요</option>
									</select>
								</div>
								<div class="col-md-12 form-group">
									<div>희망하시는 스타일을 알려주세요.</div>
									<!-- <input type="text" class="form-control" id="confirmPassword"
										name="confirmPassword" placeholder="스타일 선택"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '스타일 선택'"> -->
									<select name="const_style">
										<option value="">선택해주세요</option>
									</select>
								</div>
								<div class="col-md-12 form-group">
									<div>희망하시는 컬러를 선택해주세요.</div>
									<input type="text" class="form-control" id="const_color"
										name="const_color" placeholder="희망하는 색상 선택"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = '희망하는 색상 선택'" required="required">
								</div>
								<div class="col-md-12 form-group">
									<div class="creat_account">
										<input type="checkbox" id="f-option2" name="selector"
											required="required"> <label for="f-option2">회원님께서
											가입하실 때 사용하신 휴대전화로 문자가 갑니다. 동의하십니까?</label>
									</div>
								</div>
								<div class="col-md-12 form-group">
									<a href="javascript:history.back();" id="hw-button"
										class="button">취소</a>
									<button type="submit" value="submit"
										id="hw-submit-button" class="button hw-float-right">신청서 등록</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../footer.jsp"></jsp:include>

	<script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/main_resource/vendors/skrollr.min.js"></script>
	<script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="/main_resource/vendors/mail-script.js"></script>
	<script src="/main_resource/js/main.js"></script>
	<script type="text/javascript">
		$('#hw-submit-button').click(function(e) {
			e.preventDefault();

			$.ajax({
				url : "/const/register",
				type : "post",
				data : $('#register_form').serialize(),
				success : function(data) {
					if (data > 0) {
						alert("신청되었습니다.");
						location.reload();
					} else {
						alert("양식을 다시 확인해주세요.");
					}
				}
			});
		});
	</script>
</body>
</html>