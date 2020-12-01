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
<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/scrap_style.css">
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
	
	
	
	
	
	<section class="blog">
      <div class="container">
        <!-- <div class="section-intro pb-60px">
          <p>My Store</p>
          <h2>todayRoom's <span class="section-intro__style">My STORE</span></h2>
        </div> -->


          
        <c:forEach var="scrap" items="${list}">
          <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">
            <div class="card card-blog" id="product_card-blog">

		              <div class="card-blog__img">
		                <img class="card-img rounded-0" src="/board/display?fileName=s_${scrap.boardAttachList[0].uuid}_${scrap.boardAttachList[0].fileName}">
		              </div>
	          		<c:forEach var="scrap" items="${list2}">
		              <div class="card-body">
		                <ul class="card-blog__info">
		                  <li><a href="#">스크랩번호 </a></li>
		                  <li><a href="#"><i class="ti-comments-smiley"></i> ${scrap.scrap_seq }</a></li>
		                </ul>
		                <h4 class="card-blog__title"><a href='/board/read?board_seq=<c:out value="${scrap.board.board_seq }"/>'>${scrap.board.board_title }</a></h4>
		                <p>${product.product_price }</p>
		                <a class="card-blog__link" href='/scrap/remove?scrap_seq=<c:out value="${scrap.scrap_seq }"/>'>삭제하기 
		                <i class="ti-arrow-right"></i></a>
		              </div>
	           		</c:forEach>

            </div>
        </div>
       </c:forEach>



 

      </div>
    </section>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<div class="scrap_list">
	
		<div class="scrap_1_list">
				<%-- <c:forEach var="scrap" items="${list2}">
					<div class="scrap_img">
						<img alt="글썸네일" src="/display?fileName=${scrap.board.board_thumbnail }">
						<img alt="글썸네일"
						src="/board/display?fileName=${scrap.boardAttachList.uuid }_${scrap.boardAttachList.fileName}" alt="상품이미지">
					</div>
				</c:forEach>	 --%>
			
			<!-- <div class="scrap_Alist"> -->
	
				<%-- 	<div class="scrap_img">
						<c:forEach var="scrap" items="${list}">
							<img class="card-img"
 							src="/board/display?fileName=s_${scrap.boardAttachList.uuid}_${scrap.boardAttachList.fileName}">
							<label>${scrap.board.board_title }</label>
						</c:forEach>
					</div> --%>
					
						<c:forEach var="scrap" items="${list}">
							<div class="TEST">
							<div class="scrap_img">
								<img src="/board/display?fileName=s_${scrap.boardAttachList[0].uuid}_${scrap.boardAttachList[0].fileName}">
	 							<%-- <c:out value="${scrap.boardAttachList[0].uuid}">uuid</c:out> --%>
	 							<%-- <c:out value="${scrap.boardAttachList[0].fileName}">파일네임</c:out> --%>
							</div>
							</div>
						</c:forEach>
						
						
						<c:forEach var="scrap" items="${list2}">
							<div class="scrap_board_title">
								<a id="board_title" href='/board/read?board_seq=<c:out value="${scrap.board.board_seq }"/>'>${scrap.board.board_title }</a>
							
							</div>
						</c:forEach>
		
			<!-- </div> -->

		</div>

	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	






 <jsp:include page="../../footer.jsp"></jsp:include>



</body>
</html>