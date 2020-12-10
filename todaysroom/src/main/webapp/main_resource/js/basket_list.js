$(function() {
	var totalCost = 0;
    var csrfHeaderName = "${_csrf.headerName}";
    var csrfTokenValue = "${_csrf.token}";	
	
	
	   $(".product_count").on("change", "input", function() {
		   
//	   var hidden_check_id = $(this).parent().find(".product_price_hidden").attr('id');
//	   var price_check_id = $(this).parent().parent().parent().find(".product_one_price").attr('id');
	   
	   //상품 한 개 가격
	   var productOneCost = Number($(this).parent().find(".product_price_hidden").text());
	   //상품의 가격
	   var productCost = productOneCost * $(this).val();
	   
//	   totalCost = totalCost + parseInt($(this).val() * productOneCost);
	   //총 결제 금액 버그있음
	   totalCost += productCost;
//	   $(".product_one_price").text(productCost);
	   $(this).parent().parent().parent().find(".product_one_price").text(productCost);
		
	   $(".product_total_price").text(totalCost);

   })
   
   //이미지 인코딩
   $(".tbody_class").each(function(i, obj) {
	   	var product_uploadpath = $(this).find(".product_uploadpath").val();
		var product_uuid = $(this).find(".product_uuid").val();
		var product_filename = $(this).find(".product_filename").val();
			
		var product_url = encodeURIComponent(product_uploadpath + "\\" + product_uuid + "_" + product_filename);
		var product_urlstr = "/product/display?fileName="+product_url;
		$(this).find(".product_image").attr("src",product_urlstr);
			
   })
   
   
   	$(".product_count").on("click", "button", function() {
// 	   var form_id = $(this).attr('id');
 	   //상품 한 개 가격
 	   var productOneCost = Number($(this).parent().find(".product_price_hidden").text());
 	   //상품의 가격
 	   var productCost = productOneCost * $(this).parent().find(".input-text").val();
 	   
// 	   totalCost = totalCost + parseInt($(this).val() * productOneCost);
 	   //총 결제 금액 버그있음
 	   totalCost += productCost;
 	   $(this).parent().parent().parent().find(".product_one_price").text(productCost);
 		
 	   $(".product_total_price").text(totalCost);
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
		})
	})
   	
   	
})

$(document).ajaxSend(function(e, xhr, options) {
         var csrfHeaderName = "${_csrf.headerName}";
         var csrfTokenValue = "${_csrf.token}";
         
         xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
      });