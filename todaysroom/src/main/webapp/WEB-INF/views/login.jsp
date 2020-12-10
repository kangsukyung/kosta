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
              <li class="breadcrumb-item active" aria-current="page"><a href="/member/register">회원가입</a></li>
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
							<a class="button button-account" href="/member/register">회원 가입하러 가기</a>
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
								<a href="#" id="idFound" class="id_found">아이디 찾기</a>
								<a href="#" id="passwordFound" class="pw_found">비밀번호 찾기</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<!--modal  -->
	  <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content" style="margin-top: 200px;">
            <div class="modal-header">
              <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
              <div id="id_div" class="form-group">
                <label style="width: 18%;">아이디: </label> 
                <input type="text" class="form-control" id="member_id" name='member_id' style="width:70%; display :inline-block !important;">
              </div>
              <div id="name_div" class="form-group">
                <label style="width: 18%;">이름: </label> 
                <input type="text" class="form-control" id="member_name" name='member_name' style="width:70%; display :inline-block !important;">
              </div>
              <div id="phone_div"class="form-group" >
                <label style="width: 18%;">휴대폰번호: </label> 
                <input type="tel" class="form-control" id="member_phone" name='member_phone' style="width:70%; display :inline-block !important;"><button id="phone_sub"type="button" style="height: 35px;float: right;border-color: #007bff;background: #007bff;color: #fff;">인증</button>
              </div>
              <div id="ph_check"class="form-group" style=" display:none;" >
                <label style="width: 18%;">인증번호: </label> 
                <input type="text" class="form-control" id="chek_phone" name='chek_phone' style="width:70%; display :inline-block !important;"><button id="phone_chk"type="button" style="height: 35px;float: right;border-color: #007bff;background: #007bff;color: #fff;">확인</button>
              </div>
              
              <div id="phone_id_div"class="form-group" >
                <label style="width: 18%;">휴대폰번호: </label> 
                <input type="tel" class="form-control" id="member_id_phone" name='member_id_phone' style="width:70%; display :inline-block !important;"><button id="id_phone_sub"type="button" style="height: 35px;float: right;border-color: #007bff;background: #007bff;color: #fff;">인증</button>
              </div>
              <div id="ph_id_check"class="form-group" style=" display:none;" >
                <label style="width: 18%;">인증번호: </label> 
                <input type="text" class="form-control" id="chek_id_phone" name='chek_id_phone' style="width:70%; display :inline-block !important;"><button id="id_phone_chk"type="button" style="height: 35px;float: right;border-color: #007bff;background: #007bff;color: #fff;">확인</button>
              </div>      
              <div id="password_div" class="form-group">
                <label style="width: 18%;">비밀번호: </label> 
                <input type="password" class="form-control" id="member_password" name='member_password' style="width:70%; display :inline-block !important;">
              </div>
              <div id="password_ch_div" class="form-group">
                <label style="width: 18%; font-size :13px">비밀번호확인:</label> 
                <input type="password" class="form-control" id="check_password" name='check_password' style="width:70%; display :inline-block !important;">
              </div>
      
            </div>
	  <div class="modal-footer">
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      
      	 <form action="/member/update" method="post" id="updateMember">
      		<input type="hidden" name="memberID" id="memberID" />  
		    <input type="hidden" name="memberPassword" id="memberPassword">   
			<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
		</form>
      
		<%@include file="includes/footer.jsp"%>
		
<script>

var modal=$(".modal");
//var modalInputReplyDate=modal.find("input[name='replyDate']");
var modalRegisterBtn=$("#modalRegisterBtn");

var ph_check=document.getElementById("ph_check");
var ph_id_check=document.getElementById("ph_id_check");
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;// 휴대폰 번호 정규식
var pswJ = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;//패스워드 정규식

var namet=$("#member_name");//모달  이름창
var id_phonet=$("#member_id_phone");//모달 아이디 핸드폰번호창
var id_chek_phonet=$("#chek_id_phone");//모달 아이디 인증번호 체크

var phonet=$("#member_phone");//모달 핸드폰 번호창
var member_idt=$("#member_id");//모달 아이디창
var chek_phonet=$("#chek_phone");//모달 인증번호 확인창
var cerNum="";//인증번호 들어감
var cerName="";//아이디 조회시 아이디 들어감

var member_passwordt=$("#member_password");//모달 패스워드
var check_passwordt=$("#check_password");//모달 패스워드 체크
var updateMember=document.getElementById("updateMember");

  $(document).ready(function(){
	  $("#idFound").click(function() {
		$(".modal-title").html("아이디 찾기");
		$(".modal").modal("show");
		$("#name_div").show();
		$("#phone_id_div").show();
		
		$("#phone_div").hide();
		$("#id_div").hide();
		$("#password_ch_div").hide();
		$("#password_div").hide();
		modalRegisterBtn.hide();
   	  });
	  
	  $("#passwordFound").click(function() {
		    $(".modal-title").html("패스워드 찾기");
			$(".modal").modal("show");
			$("#phone_div").show();
			$("#id_div").show();
			
			$("#phone_id_div").hide();
			$("#password_ch_div").hide();
			$("#password_div").hide();
			$("#name_div").hide();
			modalRegisterBtn.hide();
   	  });
	  
	  $("#id_phone_chk").click(function() {
		  var id_chek_phone=id_chek_phonet.val();
		  console.log(id_chek_phone);
		  if(cerNum==id_chek_phone){
			  namet.val("");
			  id_phonet.val("");
			  id_chek_phonet.val("");
			  document.getElementById("modalCloseBtn").click();
			  alert("아이디는 "+cerName+" 입니다.");
		  }else{
			  alert("인증번호가 일치하지 않습니다.");
		  }
	  });
	  
	  $("#id_phone_sub").click(function() {//아이디 찾기 휴대폰 인증
		var member_name=namet.val();//모달  이름창
		var id_phone=id_phonet.val();//모달 아이디 핸드폰번호창
		
		console.log(id_phone);
		console.log(member_name);
		if(phoneJ.test(id_phone)){
			$.ajax({
				url:"/members/idFound",
				type:"post",
				data:{id_phone:id_phone,
					  member_name:member_name},
				beforeSend: function(xhr){
					xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				},
				success: function(data){
					ph_id_check.style.display="block";
					console.log(data);
					cerName=data;
					
					$.ajax({
		                   url:"/members/sendSms.do",
		                   type:"get",
		                   data:{phone: id_phone},
		                   beforeSend: function(xhr){
								xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
							},
		                 	success:function(data){
		    					id_phonet.attr('readonly',true);
		    					namet.attr('readonly',true);
		                 		cerNum=data;
		                 		console.log(cerNum);
		                 		  alert("해당 휴대폰으로 인증번호를 발송했습니다");
		                   }, error : function() {
		                      alert("실패");
		                   }
					 });
					
				},error : function() {
					namet.val("");
					id_phonet.val("");
					namet.focus("");
                    alert("유저정보가 존재하지 않습니다.");
                }
			});
		}else{
			id_phonet.val("");
			id_phonet.focus();
			alert('사용할수없는 휴대폰 번호입니다');	
		}

	  });
	  
	  $("#phone_sub").click(function() {
		  var phone=phonet.val();
		  var member_id=member_idt.val();
		  console.log(phone);
			if(phoneJ.test(phone)){
				$.ajax({
					url:"/members/passwordFound",
					type:"post",
					data:{phone:phone,
						  member_id:member_id},
					beforeSend: function(xhr){
						xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
					},
					success: function(data){
						if(data==member_id){
							
							ph_check.style.display="block";
							 $.ajax({
				                   url:"/members/sendSms.do",
				                   type:"get",
				                   data:{phone: phone},
				                   beforeSend: function(xhr){
										xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
									},
				                 	success:function(data){
				                 		$("#member_id").attr('readonly',true);
				                 		$("#member_phone").attr('readonly',true);
				                 		cerNum=data;
				                 		console.log(cerNum);
				    					$("#memberID").val($("#member_id").val());
				    					console.log($("#memberID").val());
				                 		  alert("해당 휴대폰으로 인증번호를 발송했습니다");
				                   }, error : function() {
				                      alert("실패");
				                   }
							 });
						}else{
							phonet.val("");
							member_idt.val("");
							member_idt.focus();
							alert("가입정보가 일치하지 않습니다.");
						}
					}, error : function() {
	                      alert("실패");
					}
				});
			}else{
			$("#member_phone").val("");
				alert('사용할수없는 휴대폰 번호입니다');			
			}

	  });
	  
	  $("#phone_chk").click(function() {
			var chek_phone=chek_phonet.val();
			if(cerNum==chek_phone){
				alert("인증번호가 일치합니다.");
				$(".modal").modal("show");
				$("#password_ch_div").show();
				$("#password_div").show();
				modalRegisterBtn.show();
				$("#phone_div").hide();
				$("#id_div").hide();
				$("#ph_check").hide();
			}else{
				chek_phonet.val("");
				console.log(chek_phonet.val());
				alert("인증번호가 일치하지 않습니다.");
			}
		  });
	  modalRegisterBtn.click(function name() {
			var member_password=$("#member_password").val();
			var check_password=$("#check_password").val();

			if(pswJ.test(member_password)){
				if(member_password==check_password){
					if(confirm("비밀번호를 변경하시겠습니까?")){
						$("#memberPassword").val(member_password);
						updateMember.submit();
					}
				}else{
					console.log(member_password);
					console.log(check_password);
					check_passwordt.val("");
					check_passwordt.focus();
					alert("비밀번호가 일치하지 않습니다.");
				}
			}else{
				console.log(member_password);
				member_passwordt.val("");
				check_passwordt.val("");
				member_passwordt.focus();
				alert("사용할수없는 패스워드입니다.");
			}
		});
	  
	  $("#modalCloseBtn").click(function() {
		  id_phonet.attr('readonly',false);
		  namet.attr('readonly',false);
		  $("#member_id").attr('readonly', false);
 	  	  $("#member_phone").attr('readonly', false);
	 	  
 	  	  modalRegisterBtn.hide();
	 	  ph_check.style.display="none";
	 	  ph_id_check.style.display="none";
	 	  id_phonet.val("");
	 	  id_chek_phonet.val("");
	 	  member_passwordt.val("");
	 	  check_passwordt.val("");
		  phonet.val("");
		  namet.val("");
		  member_idt.val("");
		  chek_phonet.val("");
		  $(".modal").modal("hide");
	  });
  });
  </script>
  <script>
  window.onload = function () {
	  var ratingNum="<c:out value='${ratingNum}'/>";
		if( ratingNum == "1"){
			if(confirm("계정을 활성화시키겠습니까?")){
				document.getElementById("passwordFound").click();
			}
		}else if(ratingNum == "2"){
			if(confirm("계정을 복구하시겠습니까?")){
				document.getElementById("passwordFound").click();
			}
		}
	}
  </script>
</body>
</html>