<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Aroma Shop - Blog Details</title>
<link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="/main_resource/css/style.css">
<link rel="stylesheet" href="/main_resource/css/board_listdetail.css">



<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>
</head>
<body>
	<!--================ Start Header Menu Area =================-->
	<section>
		<%@include file="../includes/header.jsp"%>
	</section>
	<!--================ End Header Menu Area =================-->


	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="blog">
		<div class="container h-100" id="containerH100"
			style="background-position: center;">
			<div class="blog-banner">
				<div class="text-center" style="background-color: white; opacity:0.7;">
					<h1>
						<c:out value="${board.board_title }" />
					</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
						<ol class="breadcrumb">
							<li class="breadcrumb-item"><a href="#">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Blog
								Details</li>
						</ol>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- ================ end banner area ================= -->



	<!--================Blog Area =================-->
	<section
		class="blog_area single-post-area py-80px section-margin--small">
		<div class="container">
			<div class="row">
				<div class="col-lg-4" id="col-lg-4-detail">
					<ul class="blog_meta list" id="blog_meta-list-member">
						<li class="li_fixed_style"><a href="#"
							class="blog_meta_list_a"> <i class="lnr lnr-user"></i>
								<div class="blog_meta_list_div">${bmember.member_name }</div>

						</a></li>
						<li class="li_fixed_style"><a href="#"
							class="blog_meta_list_a"> <i class="lnr lnr-calendar-full"></i>
								<div class="blog_meta_list_div">
									<fmt:formatDate value="${board.board_date }"
										pattern="yyyy-MM-dd" />
								</div>
						</a></li>
						<li class="li_fixed_style"><a href="#"
							class="blog_meta_list_a"> <i class="lnr lnr-eye"></i>
								<div class="blog_meta_list_div">${board.board_views }
									Views</div>
						</a></li>
						<li class="li_fixed_style"><a href="#"
							class="blog_meta_list_a"> <i class="lnr lnr-bubble"></i>
								<div class="blog_meta_list_div">${board.board_scraps }
									Scraps</div>
						</a></li>
						
						
						<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.member" var="member"/>
							<c:if test="${member.member_seq eq board.member_seq }">
								<li class="li_fixed_style"><a
									href="/board/modify?board_seq=${board.board_seq }"
									class="blog_meta_list_a"> <i class="lnr lnr-cog"></i>
										<div class="blog_meta_list_div">Update</div>
								</a></li>
						
								<li class="li_fixed_style"><a id="removeBoard"
									href="/board/remove?board_seq=${board.board_seq }"
									class="blog_meta_list_a"> <i class="lnr lnr-trash"></i>
										<div class="blog_meta_list_div">Delete</div>
								</a></li>
							</c:if>
						</sec:authorize>
					</ul>
				</div>



				<div class="col-lg-8 posts-list">
					<div class="single-post row">
						<div class="col-lg-12">
							<div class="feature-img">

							</div>
						</div>
						<div class="col-lg-3  col-md-3">
							<div class="blog_info text-right">
								<div class="post_tag">
									<a href="#">Food,</a> <a class="active" href="#">Technology,</a>
									<a href="#">Politics,</a> <a href="#">Lifestyle</a>
								</div>
								<ul class="blog_meta list">
									<li><a href="#">${bmember.member_name } <i
											class="lnr lnr-user"></i>
									</a></li>
									<li><a href="#"><fmt:formatDate
												value="${board.board_date }" pattern="yyyy-MM-dd" /> <i
											class="lnr lnr-calendar-full"></i> </a></li>
									<li><a href="#">${board.board_views } Views <i
											class="lnr lnr-eye"></i>
									</a></li>
									<li>
										<form action="/scrap/register" method="post">
											<a type="hidden" href="#">${board.board_scraps } Scraps <input
												type="hidden" name="board_seq" value="${board.board_seq }">
												<input type="hidden" name="member_seq"
												value="${member.member_seq }"> <i
												class="lnr lnr-bubble"></i>
											</a> <input class="button button-blog" type="submit"
												value="스크랩하기">
											<div><input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>
										</form>
									</li>
								</ul>
								<ul class="social-links">
									<li><a href="#"> <i class="fab fa-facebook-f"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-twitter"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-github"></i>
									</a></li>
									<li><a href="#"> <i class="fab fa-behance"></i>
									</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-9 col-md-9 blog_details">
							<h2>${board.board_title }</h2>
							<p class="excert">${board.board_content }</p>
						</div>
						<div class="col-lg-12">
							<div class="quotes"><h1><c:out value="${board.board_title}"/></h1></div>
							<div class="row" id="picture_row">
								<div class="col-lg-12 mt-4">
									<p><c:out value="${board.board_content}"/></p>
									<p>MCSE boot camps have its supporters and its detractors.
										Some people do not understand why you should have to spend
										money on boot camp when you can get the MCSE study materials
										yourself at a fraction of the camp price. However, who has the
										willpower.</p>
									<p>MCSE boot camps have its supporters and its detractors.
										Some people do not understand why you should have to spend
										money on boot camp when you can get the MCSE study materials
										yourself at a fraction of the camp price. However, who has the
										willpower.</p>
								</div>
							</div>
						</div>
					</div>
					<div class="navigation-area">
						<div class="row">
							<div
								class="col-lg-6 col-md-6 col-12 nav-left flex-row d-flex justify-content-start align-items-center">
								<div class="thumb">
									<a href="#"> <img class="img-fluid"
										src="${pageContext.request.contextPath}/main_resource/img/blog/prev.jpg"
										alt="">
									</a>
								</div>
								<div class="arrow">
									<a href="#"> <span class="lnr text-white lnr-arrow-left"></span>
									</a>
								</div>
								<div class="detials">
									<p>Prev Post</p>
									<a href="#">
										<h4>Space The Final Frontier</h4>
									</a>
								</div>
							</div>
							<div
								class="col-lg-6 col-md-6 col-12 nav-right flex-row d-flex justify-content-end align-items-center">
								<div class="detials">
									<p>Next Post</p>
									<a href="#">
										<h4>Telescopes 101</h4>
									</a>
								</div>
								<div class="arrow">
									<a href="#"> <span class="lnr text-white lnr-arrow-right"></span>
									</a>
								</div>
								<div class="thumb">
									<a href="#"> <img class="img-fluid"
										src="/main_resource/img/blog/next.jpg"
										alt="">
									</a>
								</div>
							</div>
						</div>
					</div>
					<!-- <div class="comments-area"> -->
						<jsp:include page="../comments/comments.jsp"></jsp:include>
					<!-- </div> -->


					<!-- Modal  추가 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<h4 class="modal-title" id="myModalLabel">게시글 삭제</h4>
								</div>
								<div class="modal-body">처리가 완료되었습니다.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" id="removeBTN">Delete</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->



				</div>

			</div>


		</div>
		</div>
	</section>
	<!--================Blog Area =================-->



	<!--================ Start footer Area  =================-->
	<section>
		<%@include file="../includes/footer.jsp"%>
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
			var board_seq = $("input[name='board_seq']").val();

			$(".modal-body").html(board_seq + "번 게시글을 삭제 하시겠습니까?")

			var formObj = $("form");

			$('#removeBoard').on("click", function(e) {

				e.preventDefault();

				$("#myModal").modal("show");

			});

			$("#removeBTN").on("click", function(e) {
				e.preventDefault();

				formObj.attr("action", "/board/remove").attr("method", "post");

				var intput_board_seq = $("input[name='board_seq']").clone();

				formObj.empty();

				formObj.append(intput_board_seq);
				var token = "<input type='hidden' "+"name='${_csrf.parameterName}' "+"value='${_csrf.token}'/>";
				formObj.append(token);

				formObj.submit();
			});
			
			(function(){
				var board_seq = '<c:out value="${board.board_seq}"/>';

				$.getJSON("/board/readAttachList", {board_seq: board_seq}, function(arr){
			        
				       console.log(arr);
				       
				       var str = "";
				       var str2 = "";
				       var str3 = "";
				       
				       $(arr).each(function(i, attach){
				         //image type
				         if (i > 0) {
							
					         if(attach.fileType){
					           var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
					           
					           str += "<div class='col-6'>"+"<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'"+"style='list-style: none'"+ "><div>";
					           str += "<img src='/board/display?fileName="+fileCallPath+"'>";
					           str += "</div>";
					           str +"</li></div>";
					         }else{
					             
					           str += "<div class='col-6'>"+"<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"'"+"style='list-style: none'"+ "><div>";
					           str += "<span> "+ attach.fileName+"</span><br/>";
					           str += "<img src='/main_resource/img/attach.png'></a>";
					           str += "</div>";
					           str += "</li></div>";
					         }
					         
						}
				         
				         if (i == 0) {
					         var thumbnailPath = encodeURIComponent(attach.uploadPath + "/"+attach.uuid +"_"+attach.fileName);
					         str2 += "<img style='width:90%; height:90%;'" + " class='img-fluid'" + " src='/board/display?fileName="+thumbnailPath+"'>";
					         str3 = thumbnailPath;
						}
				       
				         $("#picture_row").prepend(str);
				         str = "";
				       });
				       
				         $(".feature-img").append(str2);
				         $("#containerH100").css({'background-image':"url(/board/display?fileName="+str3+")"});
				       
				       
				     });//end getjson
				
			})();
			

		});
	</script>
</body>
</html>