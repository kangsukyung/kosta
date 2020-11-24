<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
	 <%@include file="../includes/header.jsp"%>
	<!--================ End Header Menu Area =================-->
  
	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>고객센터</h1>
					<br>
          	  <h5>운영시간 : 평일 09:00 ~ 18:00 (주말 & 공휴일 제외)</h5>
          	  <br>
			<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">고객센터</a></li>
              <li class="breadcrumb-item active" aria-current="page"> 1:1문의</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  
  <!--================Tracking Box Area =================-->
  <section class="tracking_box_area section-margin--small">
      <div class="container">
          <div class="tracking_box_inner" style="padding-left: 150px;">
              <p style="font-size: 20px; margin-bottom: 10px;">코로나19로 인해 고객센터를 잠정적으로 축소하여 운영중입니다.</p>
              <p style="font-size: 20px; margin-bottom: 10px;">전화 및 1:1문의하기 상담이 지연되고 있는 점 너른 양해 부탁드립니다.</p>
              <p style="font-size: 20px; margin-bottom: 10px;">순차적으로 최대한 빠르게 안내해 드리도록 노력하겠습니다.</p>
			<br>
              <form class="row tracking_form" action="/oneInquriy/register" method="post">
				<sec:authentication property="principal.member" var="member" />
				  <input type="hidden" name="member_seq" value="${member.member_seq }">
				  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
				  
                  <div class="col-md-12 form-group">
                      <input type="text" class="form-control" id="oi_title" name="oi_title" placeholder="제목" onfocus="this.placeholder = ''" onblur="this.placeholder = '제목'">
                  </div>
                  <div class="col-md-12 form-group">
                   <textarea class="form-control" id="oi_content" name="oi_content" style="height: 400px;" placeholder="문의내용" onfocus="this.placeholder = ''" onblur="this.placeholder = '문의내용'"></textarea>
                  </div>
                  <div class="col-md-12 form-group">
                      <button type="submit" value="submit" class="button button-tracking" style="width: 100%;">문의하기</button>
                  </div>
              </form>
          </div>
      </div>
  </section>
  <!--================End Tracking Box Area =================-->



  <!--================ Start footer Area  =================-->	
  <%@include file="../includes/footer.jsp"%>
  
</html>