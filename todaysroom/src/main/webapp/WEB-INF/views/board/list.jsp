<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Blog</title>
<link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="/main_resource/css/style.css">
<link rel="stylesheet" href="/main_resource/css/board_list.css">
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<section>
<%-- 			<%@include file="/WEB-INF/views/header.jsp"%> --%>
	</section>
	<!--================ End Header Menu Area =================-->


	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<div class="container h-100" id="main-banner">
			<div class="blog-banner">
				<div class="text-center">
					<h1>TodayRoom</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">오늘의</a></li>
							<li class="breadcrumb-item active" aria-current="page">방</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Blog Area =================-->
	<section class="blog_area" id='hw-blog'>
		<div class="container">
			<div class="row">
				<div class="col-lg-4" id="board_list_category" style="margin-bottom: 260px;">
					<div class="blog_right_sidebar" style="position: sticky; top: 300px;">
						<aside class="single_sidebar_widget post_category_widget">
							<h4 class="widget_title">Post Catgories</h4>
							<ul class="list cat-list">
								<li><a href="#" class="d-flex justify-content-between">
										<p>HOME</p>
										<p>
											<c:out value="${pageMaker.total }" />
										</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>방들이</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>전문가방들이</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>노하우</p>
								</a></li>
								<li><a href="#" class="d-flex justify-content-between">
										<p>질문과답변</p>
								</a></li>
							</ul>
						</aside>
					</div>
				</div>

				<div class="col-lg-8">
					<div class="blog_left_sidebar">
						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li class="page-item"><a
										href="${pageMaker.startPage - 1 }" class="page-link"
										aria-label="Previous"> <span aria-hidden="true"> <span
												class="lnr lnr-chevron-left"></span>
										</span>
									</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
									<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a
										href="${num }" class="page-link">${num }</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next }">
									<li class="page-item"><a href="${pageMaker.endPage + 1 }"
										class="page-link" aria-label="Next"> <span
											aria-hidden="true"> <span
												class="lnr lnr-chevron-right"></span>
										</span>
									</a></li>
								</c:if>
							</ul>

							<form id="actionForm" action="/board/list" method="get">
								<input type="hidden" name="pageNum"
									value="${pageMaker.cri.pageNum }"> <input type="hidden"
									name="amount" value="${pageMaker.cri.amount }">
							</form>

						</nav>

						<c:forEach var="board" items="${board }">
							<c:forEach var="member" items="${memberList }">
								<c:if test="${board.member_seq eq member.member_seq }">
									<article class="row blog_item">
										<div class="col-md-3">
											<div class="blog_info text-right">
												<div class="post_tag">
													<a href="#">${board.board_classification }/</a> <a
														class="active" href="#">Technology,</a> <a href="#">Politics,</a>
													<a href="#">Lifestyle</a>
												</div>
												<ul class="blog_meta list">
													<li><a href="#"> ${member.member_name } <i
															class="lnr lnr-user"></i>
													</a></li>
													<li><a href="#"><fmt:formatDate
																value="${board.board_date }" pattern="yyyy-MM-dd" /> <i
															class="lnr lnr-calendar-full"></i> </a></li>
													<li><a href="#">${board.board_views } Views <i
															class="lnr lnr-eye"></i>
													</a></li>
													<li><a href="#">${board.board_scraps } Scraps <i
															class="lnr lnr-bubble"></i>
													</a></li>
												</ul>
											</div>
										</div>
										<div class="col-md-9">
											<div class="blog_post">
												<img
													src="${pageContext.request.contextPath}/main_resource/img/blog/main-blog/m-blog-1.jpg"
													alt="">
												<div class="blog_details">
													<a class="move" href="<c:out value='${board.board_seq }'/>">
														<h2>
															<c:out value="${board.board_title }" />
														</h2>
													</a>
													<p>${board.board_content }</p>
													<a class="button button-blog"
														href='/board/read?board_seq=<c:out value="${board.board_seq }"/>'>View
														More</a>
												</div>
											</div>
										</div>
									</article>
								</c:if>
							</c:forEach>
						</c:forEach>


						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">
								<c:if test="${pageMaker.prev }">
									<li class="page-item"><a
										href="${pageMaker.startPage - 1 }" class="page-link"
										aria-label="Previous"> <span aria-hidden="true"> <span
												class="lnr lnr-chevron-left"></span>
										</span>
									</a></li>
								</c:if>

								<c:forEach var="num" begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }">
									<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }"><a
										href="${num }" class="page-link">${num }</a></li>
								</c:forEach>

								<c:if test="${pageMaker.next }">
									<li class="page-item"><a href="${pageMaker.endPage + 1 }"
										class="page-link" aria-label="Next"> <span
											aria-hidden="true"> <span
												class="lnr lnr-chevron-right"></span>
										</span>
									</a></li>
								</c:if>
							</ul>

							<form id="actionForm" action="/board/list" method="get">
								<input type="hidden" name="pageNum"
									value="${pageMaker.cri.pageNum }"> <input type="hidden"
									name="amount" value="${pageMaker.cri.amount }">
							</form>

						</nav>
					</div>
				</div>

			</div>
		</div>
	</section>
	<!--================Blog Area =================-->

	<!--================ Start footer Area  =================-->
	<section>
<%-- 	<%@include file="/WEB-INF/views/footer.jsp"%> --%>
	</section>
	<!--================ End footer Area  =================-->



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
		$(document).ready(function() {
			var actionForm = $("#actionForm");
			$(".page-item a").on("click", function(e) {
				e.preventDefault();

				console.log('click');

				actionForm.find("input[name = 'pageNum']").val($(this).attr("href"));
										
				actionForm.submit();
									
			});

			$(".move").on("click", function(e) {
												
				e.preventDefault();

				actionForm.append("<input type='hidden' name = 'board_seq' value = '" + $(this).attr("href") + "'>'");
				actionForm.attr("action", "/board/get");
				actionForm.submit();
			});
		});
	</script>

</body>
</html>