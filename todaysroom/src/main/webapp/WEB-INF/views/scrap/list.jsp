<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>마이스토어 - 스크랩</title>
<link rel="icon" href="${pageContext.request.contextPath}/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/linericon/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/member_mypage.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/ksk_style.css">
</head>
<body>	
 	<jsp:include page="../../header.jsp"></jsp:include>
	<!-- ================ start banner area ================= -->	

	<!-- ================ end banner area ================= -->


	
				
				
				
				
<!-- 				
				<div class="ScrapList" id="ProductList_box">
					<div class="comments-area" id="ProductList_area">
						<h4>스크랩한 게시물 목록</h4>
						
					</div>
				</div>
 -->
	<div class="scrapList_header">
		
		<div>
			<h3 class="scrap_title">스크랩북</h3>
			<p class="scrap_nickname">
				<span>닉네임올자리</span>
			</p>
		</div>
		
		
		<div class="scrap_nav">
			<a href="#">모두</a>
			<a href="#">방들이</a>
			<a href="#">노하우</a>
		
		</div>
		
		
	</div>
	
	<div class="scrap_list">
	
		<div class="scrap_1_list">
			
			<div class="scrap_img">
				사진 올 자리	
			</div>
			
			<div class="scrap_board_title">
				글 제목 올 자리
			</div>

	</div>

		


	</div>












	</div>
        	</div>
     </section>

 <jsp:include page="../footer.jsp"></jsp:include>


  <script src="${pageContext.request.contextPath}/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/skrollr.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/nouislider/nouislider.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/mail-script.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/js/main.js"></script>
</body>
</html>