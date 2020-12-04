<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/bootstrap/bootstrap.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/fontawesome/css/all.min.css">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/themify-icons/themify-icons.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/nice-select/nice-select.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.theme.default.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/vendors/owl-carousel/owl.carousel.min.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/style.css">
  	<link rel="stylesheet" href="${pageContext.request.contextPath}/main_resource/css/ksk_style.css">
  	
<script src="${pageContext.request.contextPath}/main_resource/js/jquery.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/main_resource/js/product_insert_btn.js" type="text/javascript"></script>


</head>

<body>
<sec:authentication property="principal.member" var="member"/>

	<section class="product_description_area">
		<div class="container">
			
			<ul class="nav nav-tabs ksk-right" id="myTab" role="tablist">
				<li class="nav-item"></li>
			</ul>
			
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="review" role="tabpanel" aria-labelledby="review-tab">
					<div class="row" id="ksk_row">
						<div id="product_picture">


							<div class="card card-blog" id="product_card-blog">
				              <div class="card-blog__img">
				                <div class="test1">
							              	<input type="hidden" class="product_uploadpath"  value="${product.product_uploadpath }">
						                	<input type="hidden" class="product_uuid"  value="${product.product_uuid }">
						                    <input type="hidden" class="product_filename"  value="${product.product_fname }">
							        <img class="card-img rounded-0" id="product_img_list" src="">      	
								</div>
				              </div>
				             </div>






						</div>
						
						<div class="col-lg-6">
							<div class="review_box">
								<h4>상품수정</h4>
								<form class="contents-row login_form" action="/product/modify?${_csrf.parameterName}=${_csrf.token}" id="contents-register_form" method="post">
									<%-- <input type="text" name="product_seq" value="${product.product_seq }"> --%>
									
									<h4 class="card-blog__title">상품번호 : ${product.product_seq }</h4>
									<input type="hidden" name="product_seq" value="${product.product_seq }">
										<div class="form-group">
											<label id="product_insert_label">상품명 </label> 
											<input class="form-control" id="product_insert_input" name="product_name" type="text" placeholder="상품명을 입력하세요." value="${product.product_name}">
										</div>	
																		
										<div class="form-group">
											<label id="product_insert_label">가격 </label> <input class="form-control" id="product_insert_input2" name="product_price" type="text" placeholder="가격을입력하세요." value="${product.product_price}">
										</div>
										
										
										<%-- <div class="form-group">
											<label id="product_insert_label">상품사진 </label> 
											<input class="form-control" id="product_insert_input2" name="product_fname" type="file" placeholder="가격을입력하세요." value="${product.product_fname}">
										</div>
														<div class="select_img">
															<img src="" />
														</div>
														 
										
													</div> --%>
									
										<div class="col-md-12 form-group">
											<button type="submit" value="submit" class="button button-register w-100">수정하기</button>
										</div>
								
								</form>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>


	</section>
<script>

$(document).ready(function() {

	$(".test1").each(function(i,obj){
		var product_uploadpath = $(this).find(".product_uploadpath").val();
		var product_uuid = $(this).find(".product_uuid").val();
		var product_filename = $(this).find(".product_filename").val();
		
		var product_url = encodeURIComponent(product_uploadpath + "\\" + product_uuid + "_" + product_filename);
		var product_urlstr = "/product/display?fileName="+product_url;

		
		$(this).find(".card-img").attr("src",product_urlstr);
		
	})
	

	
})

</script>
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
														<input type="hidden" <%=request.getRealPath("/") %> />s


</body>
</html>