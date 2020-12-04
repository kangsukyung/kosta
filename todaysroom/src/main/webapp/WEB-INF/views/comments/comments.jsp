<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>


<link rel="stylesheet" href="../../../main_resource/css/style.css">
<link rel="stylesheet" href="../../../main_resource/css/comments.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="comments-area">
	<h4>Comments</h4>
	<div class="form-group col-lg-12 col-md-6 name comments_reply_jsb">
		<sec:authorize access="isAnonymous()">
		<form class="comments_register_form">
			<input type="hidden"  id="comments_board_seq" name="${board.board_seq}" value="${board.board_seq}">
			<input type="hidden"  id="comments_member_seq" name="${member.member_seq}" value="${member.member_seq}"><!-- 글 쓴 사람 seq -->
			<%-- <sec:authentication property="principal.member" var="member"/> --%>	<!-- 로그인 한 사람 seq -->
			<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="text" class="form-control" id="insert_content" name="comments_content" 
					placeholder="댓글내용을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '댓글을 입력하시려면 로그인 하여 주세요'" onclick="location.href='/login'">
			<div class="register-reply-btn">
				<button class="btn primary-btn" id="commentsAddBtn">작성하기</button>
			</div>
		</form>
		</sec:authorize>
		
		<sec:authorize access="isAuthenticated()">
		<form class="comments_register_form">
			<input type="hidden"  id="comments_board_seq" name="${board.board_seq}" value="${board.board_seq}">
			<input type="hidden"  id="comments_member_seq" name="comments_member_seq" value="${member.member_seq}"><!-- 글 쓴 사람 seq -->
			<sec:authentication property="principal.member" var="member"/>	<!-- 로그인 한 사람 seq -->
			<input type="hidden"  id="my_member_seq" name="my_member_seq" value="${member.member_seq}">
			<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="text" class="form-control" id="insert_content" name="comments_content" 
					placeholder="댓글내용을 입력해주세요" onfocus="this.placeholder = ''" onblur="this.placeholder = '댓글내용을 입력해주세요'">
			<div class="register-reply-btn">
				<button class="btn primary-btn" id="commentsAddBtn">작성하기</button>
			</div>
		</form>
		</sec:authorize>
	</div>
	<div class="comment-list chat">
			<!-- <div class="single-comment justify-content-between d-flex">
					<div class="user justify-content-between d-flex">
							<div class="thumb">
									<img src="img/blog/c1.jpg" alt="">
							</div>
							<div class="desc">
									<h5>
											<a href="#">Emilly Blunt</a>
									</h5>
									<p class="date">December 4, 2017 at 3:12 pm </p>
									<p class="comment">
											Never say goodbye till the end comes!
									</p> 
							</div>
					</div>
					<div class="reply-btn">
							<a href="#" class="btn-reply text-uppercase">reply</a>
					</div>
			</div> -->
	</div>
		<!-- 대댓 시작 -->
	<!-- <div class="comment-list left-padding">
		<div class="single-comment justify-content-between d-flex">
				<div class="user justify-content-between d-flex">
						<div class="thumb">
								<img src="img/blog/c2.jpg" alt="">
						</div>
						<div class="desc">
								<h5>
										<a href="#">Elsie Cunningham</a>
								</h5>
								<p class="date">December 4, 2017 at 3:12 pm </p>
								<p class="comment">
										Never say goodbye till the end comes!
								</p>
						</div>
				</div>
				<div class="reply-btn">
						<a href="#" class="btn-reply text-uppercase">reply</a>
				</div>
		</div>
	</div> -->
	<!-- paging -->
	<div class="comments_paging">
	</div>
	<!-- 대댓 끝 -->
</div>
<div id="report_modal">
	    <div class="review-modal__title">
			신고하기
		</div>
			<form class="review-modal__form">
					<input type="hidden"  name="${comments.comments_seq}" value="${comments.comments_seq}">
					<input type="hidden" id="csrf" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<div class="review-modal__section">
					<div class="form-group">
	                    <textarea class="form-control different-control w-100" name="report_content" id="message" cols="30" rows="5" placeholder="신고사유를 입력해주세여"></textarea>
	                </div>
				</div>
				<div class="col-md-12">
					<button id="reportAddBtn" class="btn primary-btn">신고하기</button>
				</div>
			</form>
	    <a class="modal_close_btn">닫기</a>
	</div>
</body>
</html>
 <script type="text/javascript">
 	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
 </script>
<script type="text/javascript" src="../../../main_resource/js/comments.js"></script>