<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
  <head>
   <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Gentelella Alela! | </title>

    <link href="/main_resource/css/admin_cs/bootstrap.min.css" rel="stylesheet">
    <link href="/main_resource/css/admin_cs/nprogress.css" rel="stylesheet">
    <link href="/main_resource/css/admin_cs/green.css" rel="stylesheet">
    <link href="/main_resource/css/admin_cs/custom.min.css" rel="stylesheet">

</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="/admin/memberRead" class="site_title"><i class="fa fa-paw"></i> <span>오늘의방</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="/main_resource/img/main-banner.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>today_room</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>목록</h3>
                <ul class="nav side-menu">
                  <li><a href="/admin/memberRead"><i class="fa fa-home"></i> 유저목록 <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  <li><a><i class="fa fa-edit"></i> 신고목록 <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  <li><a href="/admin/oneRead"><i class="fa fa-desktop"></i> 문의목록 <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  <li><a><i class="fa fa-table"></i> 판매자 신청목록 <span class="fa fa-chevron-down"></span></a>
                    
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> 전문가 신청목록 <span class="fa fa-chevron-down"></span></a>
              
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout">
                <span id="adminLogout" class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav class="nav navbar-nav">
						<ul class=" navbar-right">
							<li class="nav-item dropdown open" style="padding-left: 15px;">
								<a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
									<img src="/main_resource/img/main-banner.jpg" alt="">오늘의방
								</a>
								<div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
									<a class="dropdown-item" href="javascript:;"> Profile</a>
									<a class="dropdown-item" href="javascript:;">
										<span class="badge bg-red pull-right">50%</span>
										<span>Settings</span>
									</a>
									<a class="dropdown-item" href="javascript:;">Help</a>
									<a class="dropdown-item" href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
								</div>
							</li>

						
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>문의목록</h3>
						</div>

						<div class="title_right">
							<div class="col-md-5 col-sm-5  form-group pull-right top_search">
								
							</div>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-sm-12 ">
							<div class="x_panel">
								<div class="x_title">
									<h2>1:1문의 <small>답변</small></h2>
									
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form id="demo-form2"  action="#" class="form-horizontal form-label-left">
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">문의 번호<span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 ">
												<input type="text" id="first-name" required="required" class="form-control"  value="${one.oi_seq }" readonly="readonly">
											</div>
										</div>
										<div class="item form-group">
											<label class="col-form-label col-md-3 col-sm-3 label-align" for="last-name">제목 <span class="required" >*</span>
											</label>
											<div class="col-md-6 col-sm-6 ">
												<input type="text" id="last-name" name="last-name" required="required" class="form-control" value="${one.oi_title }" readonly="readonly" >
											</div>
										</div>
										<div class="item form-group">
											<label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">내용</label>
											<div class="col-md-6 col-sm-6 ">
												<textarea rows="10" cols="10" style="width: 100%; resize: none; background-color: #e9ecef"  readonly="readonly">${one.oi_content }</textarea>
											</div>
										</div>
										<div class="item form-group">
											<label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">답변</label>
											<div class="col-md-6 col-sm-6 ">
												<textarea id="one_answer" style="width:100%;" ></textarea>
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="item form-group">
											<div class="col-md-6 col-sm-6 offset-md-3">
												<button id="one_button" class="btn btn-success" style="float: right;">답변하기</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
			
		<form action="/admin/oneReadModify" method="post" id="updateOne">
      		<input type="hidden" name="oi_seq" id="oi_seq" value="${one.oi_seq}"/>  
		    <input type="hidden" name="oi_answer" id="oi_answer">   
			<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/>
		</form>

			<footer>
				<div class="pull-right">
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
		
    <script src="/main_resource/js/admin_js/jquery.min.js"></script>		
	<script>
	
	 $(document).ready(function(){
		 
	 	 $("#adminLogout").click(function() {
	  		if (confirm("로그아웃하시겠습니까?") == true){  
	  			document.getElementById('logout-form').submit();
	  		  }else{ 
	  		      return;
	  		  }
	   	});
	  	 
	  	$("#one_button").click(function(e) {
	 		   e.preventDefault();
	 		   if(confirm("답변을 등록하시겠습니까?")){
		 			$("#oi_answer").val($("#one_answer").val());
		 			document.getElementById("updateOne").submit();
	 		   }else{
	 			   return ;
	 		   }
	 		});
	 });
  </script>

</body></html>
