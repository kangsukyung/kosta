<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Aroma Shop - Cart</title>
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
  <link rel="stylesheet" href="/main_resource/css/basketlist.css">
</head>
<body>
  <!--================ Start Header Menu Area =================-->
  	<%@include file="../includes/header.jsp"%>
	<!--================ End Header Menu Area =================-->

	<!-- ================ start banner area ================= -->	
	<section class="blog-banner-area" id="category">
		<div class="container h-100">
			<div class="blog-banner">
				<div class="text-center">
					<h1>장바구니</h1>
					<nav aria-label="breadcrumb" class="banner-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">장바구니</li>
            </ol>
          </nav>
				</div>
			</div>
    </div>
	</section>
	<!-- ================ end banner area ================= -->
  
  

  <!--================Cart Area =================-->
  <section class="cart_area">
      <div class="container">
      
          <div class="cart_inner">
              <div class="table-responsive">
                  <table class="table">
                      <thead>
                          <tr>
                              <th scope="col">제품명</th>
                              <th scope="col">가격</th>
                              <th scope="col">수량</th>
                              <th scope="col">총계</th>
                          </tr>
                      </thead>
                      <tbody class="tbody_class">
                         <c:forEach items="${list }" var="basket" varStatus="status">
                          <tr>
                              <td>
                                  <div class="media_product">
                                      <div class="media-body">
	  									<input type="hidden" class="product_uploadpath"  value="${basket.productvo.product_uploadpath }">
			                		    <input type="hidden" class="product_uuid"  value="${basket.productvo.product_uuid }">
			                        	<input type="hidden" class="product_filename"  value="${basket.productvo.product_fname }">                                    
	                                    <img class="product_image" src="" alt="" style="width:150px">
                                          <a href="/store/read?store_seq=${basket.productvo.store_seq }">
                                          <p>${basket.productvo.product_name }</p></a>
                                          <button class="carted-product__delete" type="button" aria-label="삭제" data-basket_seq=${basket.basket_seq }>
                                          	<svg width="12" height="12" viewBox="0 0 12 12" fill="currentColor" preserveAspectRatio="xMidYMid meet">
                                          		<path fill-rule="nonzero" d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z">
                                          		</path>
                                          	</svg>
                                          </button>
                                      </div>
                                  </div>
                              </td>
                              <td>
                                  <h5>${basket.productvo.product_price }</h5>
                              </td>
                              <td>
                                  <div class="product_count">
                                      <span class="product_price_hidden" id="${status.count }" hidden="">${basket.productvo.product_price }</span>
                                      <input type="text" name="qty" id="sst" maxlength="12" value="${basket.basket_quantity }" title="Quantity:"
                                          class="input-text">
                                      <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst )) result.value++;return false;"
                                          class="increase items-count" type="button"><i class="lnr lnr-chevron-up"></i></button>
                                      <button onclick="var result = document.getElementById('sst'); var sst = result.value; if( !isNaN( sst ) &amp;&amp; sst > 0 ) result.value--;return false;"
                                          class="reduced items-count" type="button"><i class="lnr lnr-chevron-down"></i></button>
                                  </div>
                              </td>
                              <td>
                              <h5>
                                  <span class="product_one_price" id="${status.count }" data-price="${basket.productvo.product_price * basket.basket_quantity }">${basket.productvo.product_price * basket.basket_quantity }</span>원
                              </h5>
                              </td>
                          </tr>
                          </c:forEach>
                          <tr class="bottom_button">
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="cupon_text d-flex align-items-center">
                                      <a class="primary-btn" href="#">결제</a>

                                  </div>
                              </td>
                          </tr>
                          <tr>
                              <td>

                              </td>
                              <td>

                              </td>
                              <td>
                                  <h5>Subtotal</h5>
                              </td>
                              <td>
                                  <h5>
                                	  <span class="product_total_price">0</span>원
                                  </h5>
                              </td>
                          </tr>
                          
                          <tr class="out_button_area">
                              <td class="d-none-l">

                              </td>
                              <td class="">

                              </td>
                              <td>

                              </td>
                              <td>
                                  <div class="checkout_btn_inner d-flex align-items-center">
                                      <a class="gray_btn" href="http://localhost:8081/store/list?pageNum=1&amount=12">Continue Shopping</a>
                                      <a class="primary-btn ml-2" href="#">Proceed to checkout</a>
                                  </div>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
  </section>
  <!--================End Cart Area =================-->



  <!--================ Start footer Area  =================-->	
<%@include file="../includes/footer.jsp"%>
	<!--================ End footer Area  =================-->



  <script src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="/main_resource/vendors/skrollr.min.js"></script>
  <script src="/main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="/main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="/main_resource/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="/main_resource/vendors/mail-script.js"></script>
  <script src="/main_resource/js/main.js"></script>
  <script type="text/javascript">
  $(function() {
		var totalCost = 0;
		
	    var csrfHeaderName = "${_csrf.headerName}";
	    var csrfTokenValue = "${_csrf.token}";
	   
	    
	    var loadPrice = 0;
		$(".tbody_class .product_one_price").each(function(i, items) {
			var item = $(items);
			loadPrice += parseInt(item.text());
		});
		$(".product_total_price").html(loadPrice);
		
		
		   $(".product_count").on("change", "input", function() {
		   //상품 한 개 가격
		   var productOneCost = Number($(this).parent().find(".product_price_hidden").text());
		   //상품의 가격
		   var productCost = productOneCost * $(this).val();
		   
		   $(this).parent().parent().parent().find(".product_one_price").text(productCost);
		   
		    loadPrice = 0;
			$(".tbody_class .product_one_price").each(function(i, items) {
				var item = $(items);
				loadPrice += parseInt(item.text());
			});
			$(".product_total_price").html(loadPrice);
	   })
	   
	      //이미지 인코딩
   $(".media_product").each(function(i, obj) {
	   	var product_uploadpath = $(this).find(".product_uploadpath").val();
		var product_uuid = $(this).find(".product_uuid").val();
		var product_filename = $(this).find(".product_filename").val();
			
		var product_url = encodeURIComponent(product_uploadpath + "\\" + product_uuid + "_" + product_filename);
		var product_urlstr = "/product/display?fileName="+product_url;
		$(this).find(".product_image").attr("src",product_urlstr);
			
   })
	   
	   
	   	$(".product_count").on("click", "button", function() {
//	 	   var form_id = $(this).attr('id');
	 	   //상품 한 개 가격
	 	   var productOneCost = Number($(this).parent().find(".product_price_hidden").text());
	 	   //상품의 가격
	 	   var productCost = productOneCost * $(this).parent().find(".input-text").val();
	 	   
	 	   $(this).parent().parent().parent().find(".product_one_price").text(productCost);
	 		

		    loadPrice = 0;
			$(".tbody_class .product_one_price").each(function(i, items) {
				var item = $(items);
				loadPrice += parseInt(item.text());
			});
			$(".product_total_price").html(loadPrice);
	   	})
	   
	   	$(".tbody_class .carted-product__delete").on("click", function() {

	   		var basket_seq = $(this).data("basket_seq");
	   		var targetTr = $(this).closest("tr");
			$.ajax({
				type : 'delete',
				url : '/basket/' + basket_seq,
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				success : function(result) {
					targetTr.remove();
					
				},
				error: function(request, status, error) {{
					alert("code:"+request.status+"\n"
							+"message:"+request.responseText+"\n"
							+"error:" +error); 
					}
				}
			}) //end ajax
			
			
		})
	   	
	   	
	})

  </script>
</body>
</html>