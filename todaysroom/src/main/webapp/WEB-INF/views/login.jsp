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
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel"></h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label style="width: 18%;">아이디: </label> 
                <input type="text" class="form-control" id="member_id" name='member_id' style="width:70%; display :inline-block !important;">
              </div>
              <div class="form-group" >
                <label style="width: 18%;">휴대폰번호: </label> 
                <input type="tel" class="form-control" id="member_phone" name='reply' style="width:70%; display :inline-block !important;"><button id="phone_sub"type="button" style="height: 35px;float: right;border-color: #007bff;background: #007bff;color: #fff;">인증</button>
              </div>
              <div id="ph_check"class="form-group" style=" display:none;" >
                <label style="width: 18%;">인증번호: </label> 
                <input type="text" class="form-control" name='reply' style="width:70%; display :inline-block !important;"><button id="phone_chk"type="button" style="height: 35px;float: right;border-color: #007bff;background: #007bff;color: #fff;">확인</button>
              </div>      
      
            </div>
	  <div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
		<%@include file="includes/footer.jsp"%>
<script>

var modal=$(".modal");
var modalInputReply=modal.find("input[name='reply']");
var modalInputReplyer=modal.find("input[name='replyer']");
var modalInputReplyDate=modal.find("input[name='replyDate']");
var modalModBtn=$("#modalModBtn");
var modalRemoveBtn=$("#modalRemoveBtn");
var modalRegisterBtn=$("#modalRegisterBtn");

var ph_check=document.getElementById("ph_check");
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;// 휴대폰 번호 정규식

var phonet=$("#member_phone");
var member_idt=$("#member_id");

  $(document).ready(function(){
	  $("#idFound").click(function() {
		  if (confirm("ㅎㅎㅎ?") == true){  
			  return ;
		  }else{ 
		      return;
		  }
   	  });
	  
	  $("#passwordFound").click(function() {
			$(".modal").modal("show");
   	  });
	  $("#phone_sub").click(function() {
		  var phone=phonet.val();
		  var member_id=member_idt.val();
		  console.log(phone);
			if(phoneJ.test(phone)){
				if(confirm(phone+" 해당 번호로 인증문자를 발송하시겠습니까?")){
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
								$(".modal").modal("hide");
								alert("히히성공");
							}else{
								$(".modal").modal("hide");
								alert("가입정보가 일치하지 않습니다.");
							}
						}, error : function() {
		                      alert("실패");
						}
					});
/* 				  ph_check.style.display="block";
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
		                }); */
				}else{
					phone.value="";	
					phone.focus();
				}
			}else{
				$("#member_phone").val("");
				alert('사용할수없는 휴대폰 번호입니다');			
			}
	  });
	  
	  $("#modalCloseBtn").click(function() {
		  $(".modal").modal("hide");
	  });
  });
  </script>
</body>
</html>