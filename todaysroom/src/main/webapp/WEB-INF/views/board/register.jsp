<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Aroma Shop - Login</title>
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
<link rel="stylesheet" href="/main_resource/css/style.css">
<link rel="stylesheet" href="/main_resource/css/board.css">
<script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/main_resource/vendors/skrollr.min.js"></script>
<script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
<script
	src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/main_resource/vendors/mail-script.js"></script>
<script src="/main_resource/js/main.js"></script>
<script src="/main_resource/js/board.js"></script>
</head>
<body>
	<section> <%-- 	<jsp:include page="../header.jsp"></jsp:include> --%>
	</section>
	<!-- ================ start banner area ================= -->
	<section class="blog-banner-area" id="category">
	<div class="container h-100">
		<div class="blog-banner">
			<div class="text-center">
				<h1>글 등록</h1>
				<nav aria-label="breadcrumb" class="banner-breadcrumb">
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">글 등록</li>
				</ol>
				</nav>
			</div>
		</div>
	</div>
	</section>
	<!-- ================ end banner area ================= -->

	<!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
	<div class="container">
		<div class="row">
			<div class="contents-col-lg-6">
				<div class="login_form_inner register_form_inner">
					<h3>필수 입력 사항</h3>
					<form role='form' class="contents-row login_form"
						action="/board/register" id="contents-register_form" method="post"
						encytype="multipart/form-data">

						<div class="col-md-12 form-group">

							<div class="contents-form-control">
								<div class="row">
									<div class="col-md-12">
										<div class="dropdown_bang_selection">게시판 선택</div>

										<div class="selectoption">
											<select id="select_option" name="board_classification"
												size="1">
												<option value="">선택해주세요.</option>
												<option value="bang">방들이</option>
												<option value="knowhow">노하우</option>
												<option value="qa">질문과 답변</option>
											</select>
										</div>

									</div>
								</div>
							</div>

						</div>

						<div class="select33" id="select3">
						
						
						
						</div>

						<!-- start 파일 업로드 -->
						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="title"
								name="board_thumbnail" placeholder="Thumbnail">
						</div>

						<!-- picture -->
						<div class="row">
							<div class="col-md-12 form-group">
								<div class="panel panel-default">

									<div class="panel-heading"></div>
									<!-- /.panel-heading -->
									<div class="panel-body">
										<div class="form-group uploadDiv">
											<input type="file" class="form-control" name='board_picture' multiple>
										</div>

										<div class='uploadResult'>
											<ul>

											</ul>
										</div>


									</div>
									<!--  end panel-body -->
								</div>
								<!--  end panel-body -->
							</div>
							<!-- end panel -->
						</div>
						<!-- /.row -->
						<!-- end 파일 업로드 -->


						<div class="col-md-12 form-group">
							<input type="text" class="form-control" id="title"
								name="board_title" placeholder="제목을 입력해주세요.">
						</div>

						<div class="col-md-12 form-group">
							<textarea rows="30%" cols="70" class="form-control" id="contents"
								name="board_content" placeholder="내용을 입력해주세요."></textarea>
						</div>

						<div class="col-md-12 form-group">
							<button type="submit" value="submit"
								class="button button-register w-100">글 등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</section>

	<a href="/board/list">여기를 눌러봐~</a>
	<!--================End Login Box Area =================-->


	<section> <%--  	<jsp:include page="../footer.jsp"></jsp:include> --%>
	</section>

	<script type="text/javascript">
		$(document).ready(function(e) {

			var formObj = $("form[role='form']");

			$("button[type='submit']").on("click", function(e) {

				e.preventDefault();

				console.log("submit clicked");
				
				var str = "";
			    
			    $(".uploadResult ul li").each(function(i, obj){
			      
			      var jobj = $(obj);
			      
			      console.dir(jobj);
			      console.log("-------------------------");
			      console.log(jobj.data("filename"));
			      
			      
			      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
			      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
			      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
			      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
			      
			    });
			    
			    console.log(str);
			    
			    formObj.append(str).submit();

			});

			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880; //5MB

			function checkExtension(fileName, fileSize) {

				if (fileSize >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				return true;
			}

			$("input[type='file']").change(function(e) {

				var formData = new FormData();

				var inputFile = $("input[name='board_picture']");

				var files = inputFile[0].files;

				for (var i = 0; i < files.length; i++) {

					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);

				}
				
				
				function showUploadResult(uploadResultArr) {
					if (!uploadResultArr || uploadResultArr.length == 0) {return;}
					
					var uploadUL = $(".uploadResult ul");
					
					var str = "";

					$(uploadResultArr).each(function(i, obj) {
						//image type
						if(obj.image){
							var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
							str += "<li data-path='"+obj.uploadPath+"'"+" style='float: left;width: 33%;'";
							str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
							str +" ><div>";
							str += "<span> "+ obj.fileName+"</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' "
							str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/display?fileName="+fileCallPath+"'>";
							str += "</div>";
							str +"</li>";
						}else{
							var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
						    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						      
							str += "<li  style='float: left;width: 33%;'"
							str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
							str += "<span> "+ obj.fileName+"</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
							str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/resources/img/attach.png'></a>";
							str += "</div>";
							str +"</li>";
						}
					});

					uploadUL.append(str);
				}
				

				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						showUploadResult(result); //업로드 결과 처리 함수 

					}
				}); //$.ajax

			});
			
			
			//첨부파일 삭제 처리
			$(".uploadResult").on("click", "button", function(e){
				console.log("delete file");
			      
			    var targetFile = $(this).data("file");
			    var type = $(this).data("type");
			    
			    var targetLi = $(this).closest("li");
			    
			    $.ajax({
			      url: '/deleteFile',
			      data: {fileName: targetFile, type:type},
			      dataType:'text',
			      type: 'POST',
			        success: function(result){
			           alert(result);
			           
			           targetLi.remove();
			        }
			    }); //$.ajax
			});

		});
	</script>

</body>
</html>