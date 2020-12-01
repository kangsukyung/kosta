<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>


	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <title>Aroma Shop - Login</title>
  <link rel="icon" href="${pageContext.request.contextPath}/main_resource/img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/fontawesome/css/all.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/themify-icons/themify-icons.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/linericon/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/nouislider/nouislider.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/style.css">

  <script src="${pageContext.request.contextPath}/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/skrollr.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/vendors/mail-script.js"></script>
  <script src="${pageContext.request.contextPath}/main_resource/js/main.js"></script>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/product_style.css">
  	
<script src="${pageContext.request.contextPath}/main_resource/js/jquery.js" type="text/javascript"></script>
<%-- <script src="${pageContext.request.contextPath}/main_resource/js/product_insert_btn.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/main_resource/js/product_insert_all.js" type="text/javascript"></script>
   --%>
  
</head>
<body>
	<style>
.uploadResult {
	width: 60%;
    background-color: #f1eded;
    margin-left: 21em;
}

.uploadResult ul {
	display: flex;
    flex-flow: row;
    justify-content: center;
    align-items: center;
    margi

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>

<style>
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
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>
<section>
	<jsp:include page="../../header.jsp"></jsp:include>
</section>
  <!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="product_header">
		<!-- <img src="/main_resource/img/product_register_img.png"/> -->
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>상품등록</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">STORE</a></li>
              <li class="breadcrumb-item active" aria-current="page">상품등록</li>
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
						<form role="form" class="contents-row login_form" action="/product/register" id="contents-register_form" method="post" enctype="multipart/form-data">
							
							<div class="select33" id="select3">

							</div>
					
							<!-- <div class="col-md-12 form-group">
								<input type="file" class="form-control" id="thumbnail_image" name="thumbnail_image" placeholder="Thumbnail image">
				            </div> -->
				            
				           <div class="col-md-12 form-group">
								<label id="product_insert_label">상품제목 </label>
								<input class="form-control" id="product_insert_input" name="store_title" 
								type="text" placeholder="상품제목을 입력하세요." required="">
				            </div>

								
							<div class="col-md-12 form-group">
								<label id="product_insert_label">스토어명 </label>
								<input class="form-control" id="product_insert_input" name="store_name" 
								type="text" placeholder="스토어명을 입력하세요." required="">
				            </div>
				            
				            <div class="col-md-12 form-group">
								<label id="product_insert_label">분류선택 </label>
								<div>
												<select id="option2" name="store_lcategory" size="1">
													<option value="">선택해주세요.</option>
													<option value="living">쇼파/거실가구</option>
													<option value="bed">침실가구</option>
													<option value="clothes">드레스룸</option>
													<option value="kitchen">주방가구</option>
													<option value="study">학생/서재가구</option>
													<option value="receiving">수납가구</option>
													<option value="table">테이블</option>
												</select>
												
												<select id="ption2" name="store_scategory" size="1">
													<option value="">선택해주세요.</option>
													<option value="living">쇼파</option>
													<option value="bed">침대</option>
													<option value="clothes">드레스룸</option>
													<option value="kitchen">주방</option>
													<option value="study">학생/서재가구</option>
													<option value="receiving">수납</option>
													<option value="table">테이블</option>
												</select>
											
				            		</div>
				            </div>
				            
				            
				            
							
                            
                            
							
							<div class="col-md-12 form-group">
								<label id="product_insert_label">상품가격 </label>
								<input class="form-control" id="product_insert_input" name="store_price" 
								type="text" placeholder="가격을 입력하세요." required="">
				            </div>
				            
				            <div class="col-md-12 form-group">
								<label id="product_insert_label_content">상품내용 </label>
								<textarea rows="30%" cols="70" class="form-control" id="store_content" name="store_content" placeholder="내용을 입력해주세요."></textarea>
				            </div>
				            
				            <div class="form-group">
								<label id="product_insert_label">파일 </label> <input
								class="form-control" id="product_insert_input"
								name='uploadFile' type="file" placeholder="상품명을 입력하세요."
								required="" multiple>
							</div>
												
							<div class="uploadResult">
								<ul>
													
								</ul>			
							</div>
				            
							 
							
					<section class="product_description_area">

						<div class="container">

							<ul class="nav nav-tabs ksk-right" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="review-tab" data-toggle="tab" href="#review" role="tab"
									aria-controls="review" aria-selected="false">상품추가</a></li>
							</ul>

							<div class="tab-content" id="myTabContent">
							
								<div class="tab-pane fade show active" id="review"
									role="tabpanel" aria-labelledby="review-tab">
									<div class="row" id="ksk_row">

										<div class="col-lg-8" style="margin-left: 7px;">
											<div class="review_box">


												<div id="product_register" class="review_box">
												
												<div id="test0">	
													<label id="product_insert_label">상품명 </label>
													<input class="form-control" id="product_insert_input" name="product_name" 
													type="text" placeholder="상품명을 입력하세요." required="">
													
													<label id="product_insert_label">가격 </label> 
													<input class="form-control" id="product_insert_input" name="product_price" 
													type="text" placeholder="가격을 입력하세요." required="">	
													
													
												
													
													
													<div class="col-md-12 form-group">
														 <!-- <label for="gdsImg">상품사진</label>
														 <input type="file" id="gdsImg" name="product_fname" />
														 <div class="select_img"><img src="" /></div> -->
														 
														 <label id="product_insert_label">상품사진 </label>
														<input class="form-control" id="product_insert_input" id="gdsImg" name="product_fname" 
														type="file" placeholder="상품제목을 입력하세요." required="">
														<div class="select_img"><img src="" /></div>
														 
														 <script>
														 
														  $("#gdsImg").change(function(){
														   if(this.files && this.files[0]) {
														    var reader = new FileReader;
														    reader.onload = function(data) {
														     $(".select_img img").attr("src", data.target.result).width(200);        
														    }
														    reader.readAsDataURL(this.files[0]);
														   }
														  }); 
														 </script>
														<input type="hidden" <%=request.getRealPath("/") %> />
													</div>
													
													
												</div>
												
												
												<div class="productResult">
													<ul>
													
													</ul>			
												</div>
												
											</div>	
											
												<!-- <div class="form-group">
													<label id="product_insert_label">파일 </label> <input
														class="form-control" id="product_insert_input"
														name='uploadFile' type="file" placeholder="상품명을 입력하세요."
														required="" multiple>
												</div>
												
												<div class="uploadResult">
													<ul>
													
													</ul>			
												</div> -->
												


											</div>
										</div>
										
								
									</div>
								</div>
								<div class="row" id="ksk_row">

									<div class="col-lg-8" style="margin-left: 7px;"></div>

								</div>

							</div>
					</div>
				</div>
			</div>
						</div>



					</section>

							
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-register w-100">상품등록</button>
							</div>
							
								<sec:authorize access="isAuthenticated()">
						<sec:authentication property="principal.member" var="member"/>
						<input type="hidden" name="member_seq" value="${member.member_seq }">
						</sec:authorize>
						
						<div><input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}"/></div>
						
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->


<script>

$(document).ready(function(e){

	/* 
  var formObj = $("form[role='form']");
  
  $("button[type='submit']").on("click", function(e){
    
    e.preventDefault();
    
    console.log("submit clicked");
    
  }); */

  
  var formObj = $("form[role='form']");
  
  $("button[type='submit']").on("click", function(e){
    
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
    
    
   /*  $(".uploadResult ul li").each(function(i, obj){
        
        var jobj = $(obj);
        
        console.dir(jobj);
        console.log("-------------------------");
        console.log(jobj.data("filename"));
        
        
        str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
        str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
        str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
        str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
        
      }); */
    
    
    
    console.log(str);
    
    formObj.append(str).submit();
    
  });

  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
  var csrfHeaderName = "${_csrf.headerName}";
  var csrfTokenValue = "${_csrf.token}";
  

  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,
      data: formData,
	  type: 'POST',
	  beforeSend: function(xhr) {
          xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
       },
      dataType:'json',
        success: function(result, xhr){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
    
  });  
  
  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
    
        /* //image type
        if(obj.image){
          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
          str += "<li><div>";
          str += "<span> "+ obj.fileName+"</span>";
          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/display?fileName="+fileCallPath+"'>";
          str += "</div>";
          str +"</li>";
        }else{
          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
              
          str += "<li><div>";
          str += "<span> "+ obj.fileName+"</span>";
          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/resources/img/attach.png'></a>";
          str += "</div>";
          str +"</li>";
        } */
		//image type
		
    	if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
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
		      
			str += "<li "
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


  
  
  $(document).ready(function() {
	
	var index=1;
	
	$("#myTab").click(function() {	//추가버튼 누르면
//		$(this).after(bb); 	//'#test3'뒤에 bb추가
		
		
		var a = "";
			a += "<div id='test"+index+"'>";
	    	a += "<label id='product_insert_label'>상품명 </label>";
	    	a += "<input class='form-control' id='product_insert_input' name='product_name'";
	    	a += "type='text' placeholder='상품명을 입력하세요.' required=''>";
		
	    	a += "<label id='product_insert_label'>가격 </label>";
	    	a += "<input class='form-control' id='product_insert_input' name='product_price'" ;
	    	a += "type='text' placeholder='가격을 입력하세요.' required=''></div>";
	    	
	    	a += "<label id='product_insert_label'>상품사진 </label>";
	    	a += "<input class='form-control' id='product_insert_input' name='product_fname'" ;
	    	a += "type='file' id='gdsImg' placeholder='가격을 입력하세요.' required=''></div>";
	    	
	    	
	    	
	    $("#product_register").append(a);
	    
	    index+=1;
		

	});	    	
});		    	 
		    	
		    	
		    	
	
}); 
  


</script>


<section>
 	<jsp:include page="../../footer.jsp"></jsp:include>
</section>


  
</body>
</html>