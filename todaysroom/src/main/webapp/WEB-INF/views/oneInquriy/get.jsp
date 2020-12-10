<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!DOCTYPE html>
<html>
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
  <link rel="stylesheet" href="/main_resource/css/oneInquriys.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	 <%@include file="../includes/header.jsp"%>
	 <sec:authentication property="principal.member" var="member"/>
	 <section class="blog-banner-area" id="category">
		<div class="container h-100" style="background: url('/main_resource/img/main-banner.jpg') no-repeat; background-size:cover;">
			<div class="blog-banner">
				<div class="text-center">
					<h1>고객센터</h1>
					<br>
          	  <h5>운영시간 : 평일 09:00 ~ 18:00 (주말 & 공휴일 제외)</h5>
          	  <br>
			<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/oneInquriy/register">고객센터</a></li>
              <li class="breadcrumb-item active" aria-current="page"> 1:1문의</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
	 
	<!--================ End Header Menu Area =================-->
	<section class="section-margin--small mb-5">
    <div class="container">
      <div class="row">
        <div class="col-xl-3 col-lg-4 col-md-5">
          <div class="sidebar-categories">
            <div class="head">프로필</div>
            <ul class="main-categories">
				<sec:authorize access="isAuthenticated()">
					<div>
					
						<a href="/member/modify"><img class="author_img rounded-circle" src="/member/display?fileId=<sec:authentication property="principal.member.member_id"/>" onerror="this.src='/main_resource/img/member_basic.png'" alt="" width="130" height="130"></a>
							<h4 style=" padding-top: 10px;"><sec:authentication property="principal.member.member_id"/>님 프로필</h4>
							<div class="social_icon">
							<br>
								<a href="/scrap/list"> <i class="ti-heart"> 스크랩</i></a> 
								<a href="/follow/list"> <i class="fab fa-twitter"> 팔로잉</i></a> 
							</div>
					</div>
				</sec:authorize>
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
          <div class="row">
  <div class="col-lg-12">
    <h1 class="page-header" style="margin: 0px; padding-bottom: 40px;">문의 상세내역</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">내용</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
        <label>글번호</label> <input class="form-control" id="seq" name='seq'
            value="${one.oi_seq }" readonly="readonly">
        </div>

        <div class="form-group">
          <label>제목</label> <input class="form-control" id="title" name='title'
            value="${one.oi_title }" readonly="readonly">
        </div>

        <div class="form-group">
          <label>내용</label>
          <textarea class="form-control" rows="3" id="content" style="padding-bottom: 100px;"
          name='content' readonly="readonly"><c:out value="${one.oi_content}"/></textarea>
        </div>

        <div class="form-group">
          <label>작성자</label> <input class="form-control" name='name'
            value="${member.member_nickname }" readonly="readonly">
        </div>
        
        <div class="form-group">
        
          <label>날짜</label> <input class="form-control" name='oi_date'
         value=<fmt:formatDate pattern="yyyy-MM-dd" value="${one.oi_date }"/>  
         readonly="readonly">
        </div>
    <div>
<c:if test="${one.oi_answer==null}">
	<button data-oper='modify' class="btn btn-default" id="modifyButton" style="background-color: #e9ecef; display: none;">수정</button>
	<button data-oper='modify' class="btn btn-default" id="modifyButtonForm" style="background-color: #e9ecef;">수정</button>
	<button data-oper='delete' class="btn btn-info" id="deleteButton"style="background: #c5322d;">삭제</button>
	<button data-oper='list' class="btn btn-info" id="listButton">목록</button>
</c:if>
	</div>
<form id='listForm' action="/oneInquriy/list" method="get">
  <input type='hidden' name='pageNum' value="${cri.pageNum}">
</form>

<form id='deleteForm' action="/oneInquriy/delete" method="get">
  <input type='hidden' name='seq' value="${one.oi_seq }">
</form>

<form id='modifyForm' action="/oneInquriy/modify" method="post">
   <input type='hidden' name='oi_seq' value="${one.oi_seq}">
  <input type='hidden' id='oi_title' name='oi_title'>
  <input type='hidden' id='oi_content' name='oi_content'>   	
  <input type='hidden' name='pageNum' value="${cri.pageNum}">
  <input type='hidden' name='amount' value="${cri.amount}">
  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
</form>

      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<c:if test="${one.oi_answer!=null}">
<div class='row'>

  <div class="col-lg-12">

    <div class="panel panel-default">    
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i>답변<button class="btn btn-primary btn-xs pull-right" id="listButton" style="border-color: #f5f5f5;height: 30px;font-size: 13px;color: black; background-color: white;">목록</button>
      </div>      
      <div style="padding-left: 20px;">${one.oi_answer}</div>
      
      <div class="panel-body">        
      
        <ul class="chat">

        </ul>
      </div>

	<div class="panel-footer"></div>
	</div>
  </div>
</div>
</c:if>
          </section>
          </div>
       		</div>
        </div>
   </section>
  

  <%@include file="../includes/footer.jsp"%>
 
 <script>
  $(document).ready(function(e){
	  
	  $("#modifyButtonForm").click(function() {
		  if(confirm("수정하시겠습니까?")==true){
			  $("#title").attr('readonly',false);
			  $("#content").attr('readonly',false);
			  $("#title").focus();
			  $("#modifyButton").show();
			  $("#modifyButtonForm").hide();
			  $("#deleteButton").hide();
		  }else{
			  return ;
		  }
	  });

	  $("#listButton").click(function() {
		  document.getElementById('listForm').submit();
   	  });
	  
	  $("#deleteButton").click(function() {
		  if (confirm("삭제하시겠습니까?") == true){  
				  document.getElementById('deleteForm').submit();
			  }else{ 
			      return;
			  }
		});
		
	  $("#modifyButton").click(function() {
		  if (confirm("변경된 내용을 저장하시겠습니까?") == true){  
		  var title=$("#title").val();
		  var content=$("#content").val();
		  
		  document.getElementById("oi_title").value = title;
		  document.getElementById("oi_content").value = content;

		  document.getElementById('modifyForm').submit();
		  }else{ 
		      return;
		  }
	  });	  	
  })
  </script>
</html>
