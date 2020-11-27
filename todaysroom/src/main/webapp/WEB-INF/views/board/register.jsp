<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Aroma Shop - Login</title>
<link rel="icon" href="/main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="/main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="/main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="/main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="/main_resource/vendors/linericon/style.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="/main_resource/vendors/owl-carousel/owl.carousel.min.css">
<link rel="stylesheet" href="/main_resource/vendors/nice-select/nice-select.css">
<link rel="stylesheet" href="/main_resource/vendors/nouislider/nouislider.min.css">
<link rel="stylesheet" href="/main_resource/css/style.css">
<link rel="stylesheet" href="/main_resource/css/board.css">
<script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
<script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script src="/main_resource/vendors/skrollr.min.js"></script>
<script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
<script src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
<script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
<script src="/main_resource/vendors/mail-script.js"></script>
<script src="/main_resource/js/main.js"></script>
<script src="/main_resource/js/board.js"></script>
</head>
<style>
		.upload-btn-wrapper {
			position: relative;
			overflow: hidden;
			display: inline-block;
		}
		
		.upload-btn {
			border: 2px solid gray;
			color: gray;
			background-color: white;
			padding: 8px 20px;
			border-radius: 8px;
			font-size: 20px;
			font-weight: bold;
		}
		
		.upload-btn-wrapper input[type=file] {
			font-size: 100px;
			position: absolute;
			left: 0;
			top: 0;
			opacity: 0;
		}
		
		#fileDragDesc {
			width: 100%; 
			height: 100%; 
			margin-left: auto; 
			margin-right: auto; 
			padding: 5px; 
			text-align: center; 
			line-height: 500px; 
			vertical-align:middle;
		}
		
		#form-group-file-upload label {
			width: 100%;
			display: inline-block; 
			padding: .5em .75em; 
			color: #777;
		    font-family: fantasy;
		    font-size: x-large; 
			line-height: normal; 
			vertical-align: middle; 
			background-color: #fdfdfd; 
			cursor: pointer; 
			border: 1px solid #ebebeb; 
			border-bottom-color: #ced4da; 
			border-radius: .25em;
		}

		#form-group-file-upload input[type="file"] { /* 파일 필드 숨기기 */ 
			position: absolute; 
			width: 1px; 
			height: 1px; 
			padding: 0; 
			margin: -1px; 
			overflow: hidden; 
			clip:rect(0,0,0,0); 
			border: 0; 
		}


	</style>
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
						<!-- picture -->
						<div class="row">
							<div class="col-md-12 form-group" style="position: relative;">
								<div class="panel panel-default">

									<div class="panel-heading"></div>
									<!-- /.panel-heading -->
									<div class="panel-body">
										
										<div id="dropZone" style="width: 100%; height: 500px; border: 1px solid #ced4da; border-radius: 0.25em;">
											<div id="fileDragDesc">
												<p style="font-family: fantasy; font-size: xx-large; font-weight: bold;">썸네일 사진을 마우스로 끌어서 넣어주세요!</p>
											</div>
											<div><input type='hidden' name='attachList.uuid' value=''></div>

										</div>
										<div>
											<br><br>
										</div>
									
										<div class="form-group uploadDiv" id="form-group-file-upload">
											<label for="multifileupload">본문 이미지를 추가하시려면 클릭하세요!</label>
											<input type="file" class="form-control" id="multifileupload" name='board_picture' multiple>
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
								name="board_title" placeholder="제목을 입력해주세요." style="width: 882px;
																					    position: absolute;
																					    padding-bottom: 21px;
																					    font-size: 24px;">
							<span style="color: #aaa;
    									 position: absolute;
    									 left: 92%;
    									 margin-top: 10px;" id="counter">(0 / 30)</span>
						</div>
						<br>
						<div class="col-md-12 form-group">
							<textarea rows="30%" cols="70" class="form-control" id="contents"
								name="board_content" placeholder="내용을 입력해주세요."></textarea>
						</div>
						
						<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.member" var="member"/>
						<input type="hidden" name="member_seq" value="${member.member_seq }">
						</sec:authorize>
						
						<div><input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>						
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
		$(document).ajaxSend(function(e, xhr, options) {
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		});
		
		$(document).ready(function(e) {
			
			$("#title").keyup(function(e) {
				var content = $(this).val();
				
				$('#counter').html("("+content.length+" / 30)");//글자수 실시간 카운팅
				
				if (content.length > 30){
			        alert("최대 30자까지 입력 가능합니다.");
			        $(this).val(content.substring(0, 30));
			        $('#counter').html("(30 / 30)");
			    }
			});

			var formObj = $("form[role='form']");
			
			var resultRemove = [{uploadPath:"", uuid:"", filaName:""}];
			
			var j = 0;
			
			$("button[type='submit']").on("click", function(e) {

				e.preventDefault();

				console.log("submit clicked");
				
				var str = "";
			    
			    $("#dropZone div").each(function(i, obj){
				    var jobj = $(obj);
				   	
				    if (jobj.data("type") == true) {
				    	console.dir(jobj);
				    	console.log("-------------------------");
				    	console.log(jobj.data("filename"));
						
				    	str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
				    	str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
				    	str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
				    	str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
				      j += 1;
				    }
			    });
			    
			    $(".uploadResult ul li").each(function(i, obj){
				      if (j == 0) {
					      var jobj = $(obj);
					      
					      console.dir(jobj);
					      console.log("-------------------------");	
					      console.log(jobj.data("filename"));
					      
					      
					      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
				      }else if (j != 0) {
				    	  i += 1;
				    	  var jobj = $(obj);
					      
					      console.dir(jobj);
					      console.log("-------------------------");
					      console.log(jobj.data("filename"));
					      
					      
					      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
				      }
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
							var fileCallPath = encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
							str += "<li data-path='"+obj.uploadPath+"'"+" style='float: left;width: 33%;'";
							str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
							str +" ><div>";
							str += "<span> "+ obj.fileName+"</span>";
							str += "<button type='button' data-file=\'"+fileCallPath+"\' "
							str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
							str += "<img src='/board/display?fileName="+fileCallPath+"'>";
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
							str += "<img src='/main_resource/img/attach.png'></a>";
							str += "</div>";
							str +"</li>";
						}
					});

					uploadUL.append(str);
				}
				

				$.ajax({
					url : '/board/uploadAjaxAction',
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
			
			
			
			$(function() {
				// 파일 드롭 다운
				fileDropDown();
			});
	
			// 파일 드롭 다운
			function fileDropDown() {
				var dropZone = $("#dropZone");
				//Drag기능
				dropZone.on('dragenter', function(e) {
					e.stopPropagation();
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color', '#E3F2FC');
				});
				dropZone.on('dragleave', function(e) {
					e.stopPropagation();
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color', '#FFFFFF');
				});
				dropZone.on('dragover', function(e) {
					e.stopPropagation();
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color', '#b7e2ff');
				});
				dropZone.on('drop', function(e) {
					e.preventDefault();
					// 드롭다운 영역 css
					dropZone.css('background-color', '#FFFFFF');
	
					var files = e.originalEvent.dataTransfer.files;
					
					if (files != null) {
						if (files.length < 1) {
							console.log("폴더 업로드 불가");
							return;
						} else {
							var formData = new FormData();
							
							for (var i = 0; i < files.length; i++) {
								formData.append("uploadFile", files[i]);
							}
							
							$.ajax({
								url : '/board/uploadAjaxAction',
								processData : false,
								contentType : false,
								data : formData,
								type : 'POST',
								dataType : 'json',
								success : function(result) {
									fileRemove(resultRemove);
									console.log("???");
									console.log(resultRemove);
									console.log(result);
									showUploadResult(result);
									resultRemove = result;
								}
							});
						}
					} else {
						alert("ERROR");
					}
				});
			}
			
			//drag and drop 파일 업로드 성공 후 파일 목록 생성
			function showUploadResult(uploadResultArr) {
				if (!uploadResultArr || uploadResultArr.length == 0) {return;}
				
				var uploadUL = $("#dropZone");
				
				var str = "";

				$(uploadResultArr).each(function(i, obj) {
					//image type
					if(obj.image){
						var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/"+obj.uuid +"_"+obj.fileName);
						str += "<div data-path='"+obj.uploadPath+"'"+" style='width:100%; height:100%'";
						str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
						str +=" ><div>";
						str += "<img src='/board/display?fileName="+fileCallPath+"'"+"style='width: 100%; height: 495px;'";
						str += "</div>";
						str += "</div>";
						str += "<input type='hidden' name='board_thumbnail' value='" + obj.fileName +"'>";
					}
				});
				
				uploadUL.empty();
				uploadUL.append(str);
			};
			
	
			//drag and drop파일 삭제 처리
			function fileRemove(result) {
				console.log("delete file");
				var fileCallPath =  encodeURIComponent(result[0].uploadPath+ "/s_"+result[0].uuid +"_"+result[0].fileName);
				var targetFile = fileCallPath;
				var type = "image";
				
			    $.ajax({
			      url: '/board/deleteFile',
			      data: {fileName: targetFile, type:type},
			      dataType:'text',
			      type: 'POST',
			        success: function(result){
			           
			        }
			    }); //$.ajax
			    
			}

		});
	</script>

</body>
</html>