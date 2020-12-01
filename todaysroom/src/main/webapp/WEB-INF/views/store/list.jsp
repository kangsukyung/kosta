<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Category</title>
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

<link rel="stylesheet" href="../../main_resource/css/style.css">
<link rel="stylesheet" href="../../main_resource/css/store.css">
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<jsp:include page="/WEB-INF/header.jsp"></jsp:include>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>스토어</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">가구</a></li>
							<li class="breadcrumb-item active" aria-current="page">소파/거실가구</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->


	<!-- ================ category section start ================= -->
	<div class="testtest">
	</div>
	<section class="section-margin--small mb-5">
		<div class="container">
			<div class="row">
				<div class="col-xl-3 col-lg-4 col-md-5">
					<div class="sidebar-categories">
						<section class="commerce-category-list">
							<h2 class="commerce-category-list__title">
								<a href="/store/category?category=0">가구</a>
							</h2>
							<ul class="commerce-category-tree commerce-category-list__categories">
								<li class="commerce-category-tree__entry">
								<div class="commerce-category-tree__entry__header">
										<a class="commerce-category-tree__entry__title" id="allsofa"
											href="#">소파/거실가구</a>
										<button class="commerce-category-tree__entry__expand open"
											title="펼치기" type="button">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
								</div>
									<div class="open expanded" style="overflow: hidden;">
										<ul
											class="commerce-category-tree commerce-category-tree__entry__children">
											<li class="commerce-category-tree__entry hidden"><div
													class="commerce-category-tree__entry__header">
													<a class="commerce-category-tree__entry__title" id="sofa"
														href="#">소파</a>
													<button class="commerce-category-tree__entry__expand open"
														title="펼치기" type="button">
														<svg class="icon" width="12" height="12"
															fill="currentColor" viewBox="0 0 12 12"
															preserveAspectRatio="xMidYMid meet">
															<path
																d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
													</button>
												</div>
												<div class="open expanded" style="overflow: hidden;">
													<ul
														class="commerce-category-tree commerce-category-tree__entry__children">
														<li class="commerce-category-tree__entry"><div
																class="commerce-category-tree__entry__header">
																<a class="commerce-category-tree__entry__title" id="normalsofa"
																	href="/store/category?category=0_1_0_3">일반소파</a>
															</div></li>
														<li class="commerce-category-tree__entry"><div
																class="commerce-category-tree__entry__header">
																<a class="commerce-category-tree__entry__title" id="binsofa"
																	href="/store/category?category=0_1_0_4">빈백소파</a>
															</div></li>
														<li class="commerce-category-tree__entry"><div
																class="commerce-category-tree__entry__header">
																<a class="commerce-category-tree__entry__title" id="jwasofa"
																	href="/store/category?category=0_1_0_5">좌식소파</a>
															</div></li>
														<li class="commerce-category-tree__entry"><div
																class="commerce-category-tree__entry__header">
																<a class="commerce-category-tree__entry__title" id="bedsofa"
																	href="/store/category?category=0_1_0_6">소파베드</a>
															</div></li>
														<li class="commerce-category-tree__entry"><div
																class="commerce-category-tree__entry__header">
																<a class="commerce-category-tree__entry__title" id="stoolsofa"
																	href="/store/category?category=0_1_0_7">소파스툴</a>
															</div></li>
													</ul>
												</div></li>
											<li class="commerce-category-tree__entry hidden"><div
													class="commerce-category-tree__entry__header">
													<a class="commerce-category-tree__entry__title"
														href="/store/category?category=0_1_2">리클라이너 소파</a>
												</div></li>
											<li class="commerce-category-tree__entry hidden"><div
													class="commerce-category-tree__entry__header">
													<a class="commerce-category-tree__entry__title"
														href="/store/category?category=0_1_7">거실수납장/TV장</a>
													<button class="commerce-category-tree__entry__expand"
														title="펼치기" type="button">
														<svg class="icon" width="12" height="12"
															fill="currentColor" viewBox="0 0 12 12"
															preserveAspectRatio="xMidYMid meet">
															<path
																d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
													</button>
												</div>
												<div class="" style="overflow: hidden;"></div></li>
											<li class="commerce-category-tree__entry hidden"><div
													class="commerce-category-tree__entry__header">
													<a class="commerce-category-tree__entry__title"
														href="/store/category?category=0_1_8">거실/소파테이블</a>
												</div></li>
											<li class="commerce-category-tree__entry hidden"><div
													class="commerce-category-tree__entry__header">
													<a class="commerce-category-tree__entry__title"
														href="/store/category?category=0_1_11">의자</a>
													<button class="commerce-category-tree__entry__expand"
														title="펼치기" type="button">
														<svg class="icon" width="12" height="12"
															fill="currentColor" viewBox="0 0 12 12"
															preserveAspectRatio="xMidYMid meet">
															<path
																d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
													</button>
												</div>
												<div class="" style="overflow: hidden;"></div></li>
										</ul>
									</div></li>
								<li class="commerce-category-tree__entry"><div
										class="commerce-category-tree__entry__header">
										<a class="commerce-category-tree__entry__title"
											href="/store/category?category=0_2">침실가구</a>
										<button class="commerce-category-tree__entry__expand"
											title="펼치기" type="button">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
									</div>
									<div class="" style="overflow: hidden;"></div></li>
								<li class="commerce-category-tree__entry"><div
										class="commerce-category-tree__entry__header">
										<a class="commerce-category-tree__entry__title"
											href="/store/category?category=0_8">드레스룸</a>
										<button class="commerce-category-tree__entry__expand"
											title="펼치기" type="button">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
									</div>
									<div class="" style="overflow: hidden;"></div></li>
								<li class="commerce-category-tree__entry"><div
										class="commerce-category-tree__entry__header">
										<a class="commerce-category-tree__entry__title"
											href="/store/category?category=0_6">주방가구</a>
										<button class="commerce-category-tree__entry__expand"
											title="펼치기" type="button">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
									</div>
									<div class="" style="overflow: hidden;"></div></li>
								<li class="commerce-category-tree__entry"><div
										class="commerce-category-tree__entry__header">
										<a class="commerce-category-tree__entry__title"
											href="/store/category?category=0_5">학생/서재가구</a>
										<button class="commerce-category-tree__entry__expand"
											title="펼치기" type="button">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
									</div>
									<div class="" style="overflow: hidden;"></div></li>
								<li class="commerce-category-tree__entry"><div
										class="commerce-category-tree__entry__header">
										<a class="commerce-category-tree__entry__title"
											href="/store/category?category=0_4">수납가구</a>
										<button class="commerce-category-tree__entry__expand"
											title="펼치기" type="button">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
									</div>
									<div class="" style="overflow: hidden;"></div></li>
								<li class="commerce-category-tree__entry"><div
										class="commerce-category-tree__entry__header">
										<a class="commerce-category-tree__entry__title"
											href="/store/category?category=0_3">테이블</a>
										<button class="commerce-category-tree__entry__expand"
											title="펼치기" type="button">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
									</div>
									<div class="" style="overflow: hidden;"></div></li>
								<li class="commerce-category-tree__entry"><div
										class="commerce-category-tree__entry__header">
										<a class="commerce-category-tree__entry__title"
											href="/store/category?category=0_0">의자/스툴</a>
										<button class="commerce-category-tree__entry__expand"
											title="펼치기" type="button">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
									</div>
									<div class="" style="overflow: hidden;"></div></li>
								<li class="commerce-category-tree__entry"><div
										class="commerce-category-tree__entry__header">
										<a class="commerce-category-tree__entry__title"
											href="/store/category?category=0_7">유아동가구</a>
										<button class="commerce-category-tree__entry__expand"
											title="펼치기" type="button">
											<svg class="icon" width="12" height="12" fill="currentColor"
												viewBox="0 0 12 12" preserveAspectRatio="xMidYMid meet">
												<path
													d="M6.07 7.56l4.39-4.55.87.87-5.25 5.45L.67 3.9 1.53 3z"></path></svg>
										</button>
									</div>
									<div class="" style="overflow: hidden;"></div></li>
							</ul>
						</section>
					</div>
				</div>
				<div class="col-xl-9 col-lg-8 col-md-7">
					<!-- Start Filter Bar -->
					<div class="filter-bar d-flex flex-wrap align-items-center">
						<div class="sorting storefilter">
							<select>
								<option value="1">최신순</option>
								<option value="2">낮은가격순</option>
								<option value="3">높은가격순</option>
							</select>
						</div>
						<div class="sorting mr-auto">
							<select>
								<option value="1">Show 6</option>
								<option value="1">Show 9</option>
								<option value="1">Show 12</option>
							</select>
						</div>
						<div>
							<div class="input-group filter-bar-search">
								<input type="text" placeholder="Search">
								<div class="input-group-append">
									<button type="button">
										<i class="ti-search"></i>
									</button>
								</div>
							</div>
						</div>
					</div>
					<!-- End Filter Bar -->
					<!-- Start Best Seller -->
					<section class="lattest-product-area pb-40 category-list ">
						<c:forEach items="${list }" var="store">
							<c:set var="loop_flag" value="false" />
							<c:forEach items="${attach }" var="attach">
								<c:if test="${store.store_seq eq attach.store_seq and (not loop_flag) }">
							<div class="row row_product_hw col-lg-4">
								<div class="card text-center card-product">
									<div class="card-product__img">
										<img class="card-img"
 											src="/display?fileName=${attach.uuid }_${attach.fileName}" alt="상품이미지"> 
										<ul class="card-product__imgOverlay">
											<li><button>
													<i class="ti-search"></i>
												</button></li>
											<li><button>
													<i class="ti-shopping-cart"></i>
												</button></li>
											<li><button>
													<i class="ti-heart"></i>
												</button></li>
										</ul>
									</div>
									<div class="card-body">
										<p>${store.store_date }</p>
										<%-- <td><a href='/board/get?bno=<c:out value="${board.bno}"/>'><c:out value="${board.title}"/></a></td> --%>
										<h4 class="card-product__title">
											<a href="/store/read?store_seq=${store.store_seq}">${store.store_title }</a>
										</h4>
									</div>
								</div>
							</div>
								<c:set var="loop_flag" value="true" />
								</c:if>	
							</c:forEach>
						</c:forEach>
					</section>

					<!-- End Best Seller -->
				</div>
			</div>
		</div>
		<div class="storepage">
			<ul class="pagination">
				<c:if test="${pageMaker.prev }">
					<li class="page-item"><a href="${pageMaker.startPage - 1 }"
						class="page-link" aria-label="Previous"> <span
							aria-hidden="true"> <span class="lnr lnr-chevron-left"></span>
						</span>
					</a></li>
				</c:if>

				<c:forEach var="num" begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }">
					<li class="page-item ${pageMaker.cri.pageNum == num ? "active":"" }">
						<a href="${num }" class="page-link">${num }</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next }">
					<li class="page-item"><a href="${pageMaker.endPage + 1 }"
						class="page-link" aria-label="Next"> <span aria-hidden="true">
								<span class="lnr lnr-chevron-right"> </span>
						</span>
					</a></li>
				</c:if>
				<form id="actionForm" action="/store/list" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }">
				</form>

			</ul>
		</div>
	</section>
	<!-- ================ category section end ================= -->

	<!-- ================ top product area start ================= -->

	<!-- ================ top product area end ================= -->

	<!-- ================ Subscribe section start ================= -->

	<!-- ================ Subscribe section end ================= -->


	<!--================ Start footer Area  =================-->
	<jsp:include page="/WEB-INF/footer.jsp"></jsp:include>
	<!--================ End footer Area  =================-->



	<script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
	<script src="/main_resource/vendors/skrollr.min.js"></script>
	<script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script
		src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="/main_resource/vendors/nouislider/nouislider.min.js"></script>
	<script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="/main_resource/vendors/mail-script.js"></script>
	<script src="/main_resource/js/main.js"></script>
	<script src="/main_resource/js/store_list.js"></script>
	<script type="text/javascript">
		$(document).ready( function() {
							var actionForm = $("#actionForm");

							$(".page-item a").on(
									"click",
									function(e) {
										e.preventDefault();
										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									})

							$(".move")
									.on(
											"click",
											function(e) {

												e.preventDefault();

												actionForm
														.append("<input type='hidden' name = 'store_seq' value = '"
																+ $(this).attr(
																		"href")
																+ "'>'");
												actionForm.attr("action",
														"/store/list");
												actionForm.submit();
											});
						});
		
		
	</script>
</body>
</html>