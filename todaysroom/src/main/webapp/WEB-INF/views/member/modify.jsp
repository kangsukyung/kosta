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
  <link rel="stylesheet" href="/main_resource/css/member_idpwfound.css">
  <link rel="stylesheet" href="/main_resource/css/member_signup.css">
</head>
<%@include file="../includes/header.jsp"%>
<body>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100" style="background: url('/main_resource/img/main-banner.jpg') no-repeat; background-size:cover;">
			<div class="blog-banner">
				<div class="text-center">
					<h1>마이페이지</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/member/mypage">마이페이지</a></li>
              <li class="breadcrumb-item active" aria-current="page">유저정보 수정</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->		  
  <sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member"/>	
  <section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">프로필</div>
            <ul class="main-categories">
					<div>
						<a href="/member/modify"><img class="author_img rounded-circle" src="/member/display?fileId=<sec:authentication property="principal.member.member_id"/>" onerror="this.src='/main_resource/img/member_basic.png'" alt="" width="130" height="130"></a>
							<h4 style=" padding-top: 10px;">${member.member_nickname}님 프로필</h4>
							<div class="social_icon">
							<br>	
								<a href="/scrap/list"> <i class="ti-heart"> 스크랩</i></a> 
								<a href="/follow/list"> <i class="fab fa-twitter"> 팔로잉</i></a> 
							</div>
					</div>
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
						<li><a href="/product/list?seq=${member.member_seq}" class="d-flex justify-content-between"><p>마이스토어</p></a></li>			
						<li><a href="/productInquiry/replylist?member_seq=${member.member_seq}" class="d-flex justify-content-between"><p>스토어문의목록</p></a></li>			
					</sec:authorize>
				</ul>
          </div>
        </div>
        <div class="col-xl-9 col-lg-8 col-md-7">
          <section class="lattest-product-area pb-40 category-list">
            		<a id="memberSecession" href="#" style="float:right;">회원탈퇴</a>
            		    <form id="Secession-form" action="/member/secession" method="Post">
								<input type="hidden" name="member_seq" value="${member.member_seq }"/>
								<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
						</form>
						
						<form id="modifyForm" class="row login_form" action="/member/modify?${_csrf.parameterName}=${_csrf.token}"  method="post" enctype="multipart/form-data" onsubmit="return checkForm();">
							<input type="hidden" name="member_seq" value="${member.member_seq }">
							<input type="hidden" name="member_id" value="${member.member_id }">
							<input type="hidden" name="member_path" value="${member.member_path }">
							<input type="hidden" name="member_profile" value="${member.member_profile }">
							
							<div class="col-md-12 form-group member_signup"><h5 style="font-size: 15px;float: left;padding-top: 12px;"></h5><input type="text" class="form-control-member_singup" id="member_nickname" name="member_nickname"  placeholder="별명" onfocus="this.placeholder = ''" onblur="this.placeholder = '별명'" value="${member.member_nickname}">
							<button type="button" class="memberName_btn">중복확인</button></div>
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="member_name" name="member_name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'" value="${member.member_name}"></div>
							<font class="member_font_padding" id="name_check" size="2"></font>
							
							<div class="col-md-12 form-group member_signup"><input type="tel" class="form-control-member_singup" id="member_phone" name="member_phone" placeholder="휴대폰번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '휴대폰번호'" value="${member.member_phone}">
							<button type="button" class="phone_btn" style="margin-top: 7px;">인증하기</button></div>
    			          	<font class="member_font_padding" id="phone_check" size="2"></font>
							
							<div id="checknum" class="col-md-12 form-group member_signup" style="display: none;"><input type="text" class="form-control-member_singup" id="ph_check" name="ph_check" placeholder="인증번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '인증번호'">
							<button type="button" class="check_phone_btn" style="margin-top: 7px;">인증확인</button></div>
							<input type="hidden" name="cerNum" id="cerNum">
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="member_email" name="member_email" placeholder="이메일 주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일 주소'"value="${member.member_email}"></div>
    			          	<font class="member_font_padding" id="mail_check" size="2"></font>
	            			<div class="col-md-12 form-group"><input type="password" class="form-control" class="memberPassword" id="member_password" name="member_password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'"value="${member.member_password}"></div>
    			          	<font class="member_font_padding" id="password_check" size="2"></font>
    			          	<div class="col-md-12 form-group"><input type="password" class="form-control" class="memberPassword" id="userPwChk" name="memberPassword" placeholder="비밀번호확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호확인'"value="${member.member_password}"></div>
    			         	<font class="member_font_padding" id="chkNotice" size="2" style="display: none;">입력한 비밀번호가 일치하지 않습니다</font>
							<div class="col-md-12 form-group member_signup" ><input type="text" class="form-control-member_singup" id="member_address" name="member_address" placeholder="주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '주소'" value="${member.member_address}" style="padding-left: 10px;" readonly="readonly"><button type="button" onclick="openZipSearch(member_address)">주소찾기</button></div>
    			          	
	    			        <img id="profileImg"  class="author_img rounded-circle mypageUpdate_img" src="/member/display?fileId=${member.member_id}" onerror="this.src='/main_resource/img/member_basic.png'" alt="" width="200" height="200">
							<div class="col-md-10 form-group">
								<input type="file" class="mypageUdate_type" name="profile" id="fileChange" accept=".gif, .jpg, .png" onchange="setThumbnail(event);" style="display: none;" >
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
  <script src="/main_resource/js/member_register.js"></script>
  <script src="/main_resource/js/member_signup.js"></script>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  var nickname = document.getElementById("member_nickname");
  var nickcheck=1;
  var membername = document.getElementById("member_name");
  var address = document.getElementById("member_address");
  var phone = document.getElementById("member_phone");
  var email = document.getElementById("member_email");
  var pass = document.getElementById("member_password");
  var userPwChk = document.getElementById("userPwChk");
  var cerNum=document.getElementById("cerNum");
  var ph_check=document.getElementById("ph_check");
  var phone_ok=1;

  var idJ = /^[a-z0-9]{6,12}$/;//아이디 정규식
  var pswJ = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
  var nameJ = /^[가-힣]{2,6}$/;// 이름 정규식
  var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
  var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;// 휴대폰 번호 정규식

  var memberProfile = "<c:out value='${member.member_profile}'/>";
  
  $(document).ready(function name() {
	 $("#memberSecession").click(function() {
		  if (confirm("회원탈퇴하시겠습니까?") == true){  
			document.getElementById('Secession-form').submit();
		  }else{ 
		      return;
		  }
	  });
	 
	 $(".check_phone_btn").click(function() {
			console.log(ph_check);
			console.log(cerNum);
			
			if(cerNum.value==ph_check.value){
				alert("인증에 성공하셧습니다.");
				var con=document.getElementById("checknum");
				con.style.display='none';
				$("#member_phone").attr('readonly',true);
				phone_ok=1;
			}else{
				console.log(cerNum.value);
				console.log(ph_check.value);
				alert("실패!!");
				phone_ok=0;
			}
		});
		
		$(".phone_btn").click(function() {
			var phoneb=$("#member_phone").val();
			if(phoneJ.test(phoneb)){
				if(confirm(phoneb+" 해당 번호로 인증문자를 발송하시겠습니까?")){
					phone_ok=0;
					var con=document.getElementById("checknum");
					con.style.display='block';
			
					 $.ajax({
		                   url:"/members/sendSms.do",
		                   type:"get",
		                   data:{phoneb: phoneb },
		                 	success:function(data){
		                 		  cerNum.value=data;
		                 		  console.log(cerNum.value);
		                 		  alert("해당 휴대폰으로 인증번호를 발송했습니다");
		                   }, error : function() {
		                      alert("실패");
							  }
		                });
				}else{
					phone.value="";	
					phone.focus();
					phone_ok=0;
				}
			}else{
					$("#member_phone").val("");
					phone_ok=0;
				alert('사용할수없는 휴대폰 번호입니다');			
			}
				
				
		});
		
		$(".memberName_btn").click(function() {
	        var userName =  $("#member_nickname").val(); 
	        memberRegister.nameCheck(userName, function(result) {
	        	
	        	if(result=='0'){
	        		if(confirm("사용할수 있는 별명입니다. 사용하시겠습니까?")){
	        			$("#member_nickname").attr('readonly',true);
	        			nickcheck=1;
	        		}else{
	        			nickcheck=0;
	        			nickname.value="";
	        			$("#member_nickname").attr('readonly',false);
	        		}
	        	}else{
		        	alert("사용중인 별명입니다.");
		        	nickname.value="";
	        	}
			});
	    });
		
		$("#profileImg").click(function(e) {
			e.preventDefault();
			$('#fileChange').click();
		});
		
		$("#basicImg").click(function(e) {
			e.preventDefault();
			$('#fileChange').click();
		});
});
  
function checkForm() {
		
		if(nickname.value=='' || nickcheck==0 ) {
			if(nickcheck==0){
				alert("닉네임이 중복되었는지 확인해주세요");
			}else{
				alert("사용할수 없는 닉네임입니다.")
			}
			nickname.focus();
			return false;
		}
		
		if(membername.value==''||nameJ.test(membername.value) == false){
			if(nameJ.test(membername.value) == false){
				alert("사용할수 없는 이름입니다.");
			}else{
				alert("이름을 확인해주세요");
			}
			membername.focus();
			return false;
		}
		
		if(phone.value=='' ||phoneJ.test(phone.value) == false||phone_ok==0){
			if(phone.value==''){
				alert("핸드폰 번호를 입력해주세요");
			}else if(phoneJ.test(phone.value)==false){
				alert("사용할수 없는 휴대폰번호 입니다.");
			}else{
				alert("휴대폰 인증을 받으세요");
			}
			phone.focus();
			return false;
		} 
		if(email.value=='' ||mailJ.test(email.value) == false){
			if(mailJ.test(email.value) == false){
				email.value="";
				alert("사용할수 없는 이메일입니다");
			}else{
				alert("이메일을 확인해주세요");
			}
			email.focus();
			return false;
		}	
		if(userPwChk.value!= pass.value || pswJ.test(pass.value) == false){
			if(userPwChk.value!= pass.value){
				userPwChk.value='';
				userPwChk.focus();
				alert("비밀번호가 일치하지 않습니다.");
			}else{
				userPwChk.value='';
				pass.value='';
				pass.focus();
				alert("사용할수 없는 패스워드입니다.");
			}
				return false;
		}
		
		if(address.value==''){
			alert("주소를 확인해주세요");
			address.focus();
			return false;
		} 
	}
  </script>
  <script>
  function setThumbnail(event) { 
	  console.log(memberProfile);
	  var reader = new FileReader(); 
	  reader.onload = function(event) {
		  	  var img = document.getElementById("profileImg"); 
		  	  img.setAttribute("src", event.target.result); 
		}
	 reader.readAsDataURL(event.target.files[0]); 
  }
  </script>


</body>
</html>