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
              <li class="breadcrumb-item active" aria-current="page"><a href="/login">로그인</a></li>
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
							<a class="button button-account" href="/login">로그인</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner register_form_inner">
						<h3 >계정만들기</h3>
						<form class="row login_form" action="/member/register"  id="register_form" name="register_form"  method="post" onsubmit="return checkForm();">
							<div class="col-md-12 form-group member_signup"><input type="text" class="form-control-member_singup" id="member_id" name="member_id" placeholder="아이디" onfocus="this.placeholder = ''" onblur="this.placeholder = '아이디'">
							<button type="button" class="memberId_btn" style="margin-top: 7px;">중복확인</button></div>
    			          	<font class="member_font_padding" id="id_check" size="2"></font>
							<div class="col-md-12 form-group member_signup"><input type="text" class="form-control-member_singup" id="member_nickname" name="member_nickname" placeholder="별명" onfocus="this.placeholder = ''" onblur="this.placeholder = '별명'">
							<button type="button" class="memberName_btn" style="margin-top: 7px;">중복확인</button></div>
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="member_name" name="member_name" placeholder="이름" onfocus="this.placeholder = ''" onblur="this.placeholder = '이름'"></div>
    			          	<font class="member_font_padding" id="name_check" size="2"></font>
							
							<div class="col-md-12 form-group member_signup"><input type="tel" class="form-control-member_singup" id="member_phone" name="member_phone" placeholder="휴대폰번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '휴대폰번호'">
							<button type="button" class="phone_btn" style="margin-top: 7px;">인증하기</button></div>
    			          	<font class="member_font_padding" id="phone_check" size="2"></font>
							
							<div id="checknum" class="col-md-12 form-group member_signup" style="display: none;"><input type="text" class="form-control-member_singup" id="ph_check" name="ph_check" placeholder="인증번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '인증번호'">
							<button type="button" class="check_phone_btn" style="margin-top: 7px;">인증확인</button></div>
							<input type="hidden" name="cerNum" id="cerNum">
            				
							<div class="col-md-12 form-group"><input type="text" class="form-control" id="member_email" name="member_email" placeholder="이메일 주소" onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일 주소'"></div>
    			          	<font class="member_font_padding" id="mail_check" size="2"></font>
	            			<div class="col-md-12 form-group"><input type="password" class="form-control" class="memberPassword" id="member_password" name="member_password" placeholder="비밀번호" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호'"></div>
    			          	<font class="member_font_padding" id="password_check" size="2"></font>
    			          	<div class="col-md-12 form-group"><input type="password" class="form-control" class="userPwChk" id="userPwChk" name="userPwChk" placeholder="비밀번호확인" onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호확인'"></div>
    			          	<font class="member_font_padding" id="chkNotice" size="2" style="display: none;">입력한 비밀번호가 일치하지 않습니다</font>
     			          	<div><input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>
     			          	<div class="col-md-12 form-group member_signup"><input type="text" class="form-control-member_singup" id="member_address" name="member_address" placeholder="주소" onblur="this.placeholder = '주소'" readonly="readonly"><button type="button" onclick="openZipSearch(member_address)">주소찾기</button></div>
 							<div class="col-md-10 form-group">
								<button type="submit" value="submit" class="button button-register w-100" style="margin-left: 30px;">회원가입</button>
							</div>
						</form>
						
							<%-- <form action="#" method="post" id="cerNumCheck">
      									<input type="hidden" name="pone" id="pone" />   <!-- 인증번호 받을사람 휴대폰 번호 -->
							  			<input type="hidden" name="cerNum" id="cerNum">   <!-- 인증번호를 히든으로 저장해서 보낸다 -->
							  			<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
							</form>   --%>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->
  
</body>
<%@include file="../includes/footer.jsp"%>

<script src="/main_resource/js/member_register.js"></script>
<script src="/main_resource/js/member_signup.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
var id = document.getElementById("member_id");
var idcheck=0;
var nickname = document.getElementById("member_nickname");
var nickcheck=0;
var membername = document.getElementById("member_name");
var address = document.getElementById("member_address");
var phone = document.getElementById("member_phone");
var email = document.getElementById("member_email");
var pass = document.getElementById("member_password");
var userPwChk = document.getElementById("userPwChk");
var cerNum=document.getElementById("cerNum");
var ph_check=document.getElementById("ph_check");
var phone_ok=0;

var idJ = /^[a-z0-9]{6,12}$/;//아이디 정규식
var pswJ = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
var nameJ = /^[가-힣]{2,6}$/;// 이름 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;// 휴대폰 번호 정규식
	
$(document).ready(function() {
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
	$(".memberId_btn").click(function() {
//      var userid =  $("#member_id").val();
        var userid =  id.value;
        if(idJ.test(userid)){
        memberRegister.idCheck(id.value, function(result) {
        	if(result=='0'){
        		if(confirm("사용할수 있는 아이디입니다. 사용하시겠습니까?")){
        			$("#member_id").attr('readonly',true);
	        		idcheck=1;
        		}else{
        			idcheck=0;
		        	id.value="";
        			$("#member_id").attr('readonly',false);
        		}
        	}else{
	        	alert("사용중인 아이디입니다.");
	        	id.value="";
        	}
		});
        }else{
        	alert("사용할수 없는 아이디입니다.");
        	id.value="";
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
});

function checkForm() {
	console.log(userPwChk.value);
	console.log(pass);
	if(id.value=='' || idcheck==0 || idJ .test(id.value) == false){
		if(idcheck==0){
			alert("아이디가 중복되었는지 확인해주세요");
		}else{
			alert("사용할수 없는 아이디입니다")
		}
		id.focus();
		return false;
	}
	
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
</html>