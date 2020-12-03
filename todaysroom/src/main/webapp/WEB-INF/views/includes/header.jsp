<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Home</title>
  <link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="/main_resource/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="/main_resource/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="/main_resource/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="/main_resource/css/style.css">
  <link rel="stylesheet" href="/main_resource/css/header.css">
    
</head>
<body>
	<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.member" var="member"/>
	</sec:authorize>
	<header class="header_area">
    <div class="main_menu">
      <nav class="navbar navbar-expand-lg navbar-light">
        <div class="container">
          <a class="navbar-brand logo_h" href="${pageContext.request.contextPath}/board/listAction.do"><img src="/main_resource/img/logoimg2.png" alt=""></a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
            <ul class="nav navbar-nav menu_nav ml-auto mr-auto">
              <li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">커뮤니티</a>
	              <ul class="dropdown-menu">
                   <li class="nav-item"><a class="nav-link" href="/board/list?filter=bang&roomwarming=셀프">방들이</a></li>
                  <li class="nav-item"><a class="nav-link" href="/board/list?filter=bang&roomwarming=전문가">전문가방들이</a></li>
                  <li class="nav-item"><a class="nav-link" href="/board/list?filter=knowhow">노하우</a></li>
                  <li class="nav-item"><a class="nav-link" href="/board/list?filter=qa">질문과답변</a></li>               
                  </ul>
				</li>
              <li class="nav-item submenu dropdown">
                <a href="/store/list?pageNum=1&amount=12" class="nav-link dropdown-toggle">스토어</a>
                <%-- <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/store/listStoreAction.do">카테고리</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">특가</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">베스트</a></li>
                  <li class="nav-item"><a class="nav-link" href="#">기획전</a></li>
                </ul> --%>
				</li>
				<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">인테리어</a>
                <ul class="dropdown-menu">
                  <li class="nav-item"><a class="nav-link" href="/contractor/list">우리지역 업체</a></li>
                  <li class="nav-item"><a class="nav-link" href="/const/register">맞춤업체 추천</a></li>
                </ul>
              </li>
              
              	<li class="nav-item submenu dropdown">
                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"aria-expanded="false">고객센터</a>
                <ul class="dropdown-menu">
                <sec:authorize access="isAnonymous()">
                  <li class="nav-item"><a class="nav-link" href="/login">1:1 문의</a></li>
                  <li class="nav-item"><a class="nav-link" href="/login">1:1 문의 내역</a></li>
                 </sec:authorize>
                 <sec:authorize access="isAuthenticated()">
                  <li class="nav-item"><a class="nav-link" href="/oneInquriy/register">1:1 문의</a></li>
                  <li class="nav-item"><a class="nav-link" href="/oneInquriy/list">1:1 문의 내역</a></li>
                  </sec:authorize>
                </ul>
              </li>
            </ul>
            <ul class="nav-shop">
              <li class="nav-item" id="hw-search"><form id="hw-searchbar" action=""><input name="keyword" placeholder="검색어 입력"></form><button><i class="ti-search" id="hw-search-icon"></i></button></li>
              <li class="nav-item" id="hw-shopping-cart"><button onclick="location.href='/basket/list?member_seq=${member.member_seq}'"><i class="ti-shopping-cart"></i><span class="nav-shop__circle"></span></button> </li>
	
		<sec:authorize access="isAuthenticated()">
              <li class="nav-item"><a href="/member/mypage" class="msk-id"><button onclick=""><sec:authentication property="principal.member.member_id"/></button></a></li>
              <li class="nav-item"><a id="Member_out"class="msk-id" href="#">로그아웃</a></li>
		</sec:authorize>	
		<sec:authorize access="isAnonymous()">
              <li class="nav-item"><a href="/login" class="msk-id">로그인</a></li>
              <li class="nav-item"><a href="/member/register" class="msk-id">회원가입</a></li>
		</sec:authorize>
              <li class="nav-item"><a class="button button-header" href="/board/register">글쓰기</a></li>
            </ul>
          </div>
        </div>
      </nav>
    </div>
    <form id="logout-form" action="/customLogout" method="POST">
			<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>
  </header>
  
  <script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="/main_resource/js/jquery-ui.js"></script>
  <script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="/main_resource/vendors/skrollr.min.js"></script>
  <script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="/main_resource/vendors/mail-script.js"></script>
  <script src="/main_resource/js/main.js"></script>  
  <script src="/main_resource/js/header.js"></script>
  <script>
  $(document).ready(function(e){
  $("#Member_out").click(function() {
	  if (confirm("로그아웃하시겠습니까?") == true){  
		document.getElementById('logout-form').submit();
	  }else{ 
	      return;
	  }
   });
  
  });
  </script>
</body>
</html>