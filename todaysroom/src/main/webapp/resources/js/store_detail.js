$(function() {
	var totalCost = 0;
	
	$('.production-select-dropdown__button').click(function(event) {
		if($('.production-select-dropdown__list-container').hasClass('open')) {
			$('.production-select-dropdown__list-container').removeClass('open');
		}
		else {
			$('.production-select-dropdown__list-container').addClass('open');
		};
	})
	

   $(".production-select-list__item").on("click","button", function() {
	   //상품 클릭하면 장바구니 옵션 폼 생성
	   
	   var item_val = $(this).val();
//	   var product_id = $(this).parent().parent().parent().parent().
//	   parent().find(".selling-option-form-content__list").find(".selling-option-item").attr("id");
	   
	   if($(".selling-option-item").css("display") == "none") {
		   $("#"+item_val).show();		   		   
	   }
	   else {
		   $("#"+item_val).show();		   
	   }
	   
	   
	   
	   
//	  var product_seq2 = this.value;
//	  
//      var product_seq = $("#product_seq").val();
//      
//      alert("this.value : " + this.value); //product.product_seq
//      alert("product_seq : " + product_seq);
//      
//      $.ajax({
//    	  type: "Post",
//    	  async: "true",
//    	  data: "product_seq="+product_seq,
//    	  dataType: "text",
//    	  url : "../main_views/store/storedetail.jsp",
//    	  success: function(data) {
//    		  console.log("hereeeeeeeeeeeeeeeeeeeeeeeeeeee" + data);
//    		  $(".basket-list").append()
//    		  if(data!=null) {
//    			  var html = '<div class = "basket-list">';
//    			  html += '<div class="basket-list-products">' + '${product.product_name }' + '</div>';
//    			  html += '</div>';
//    			  
//    			  $(".basket-list").append(html);
//    			  alert("success2");
//    		  } else {
//    			  alert("fail");
//    		  }
//			
//    		  $.each(data, function(idx, item) { //JSON 값을 html로 변환해주어야 함
//           });
//    		  
//		},
//		error: function(error) {
//			alert("error : " + error);
//		}
//      }) //end ajax
      
      return false;
   })	
	
   
   
//   $("#select_option").on("change", function() {
//	      $("#select3").empty();
//	      if (this.value == "bang") {
//	         $("#select3").hide().load("../main_resource/js/a.html", function() {
//	            $(this).fadeIn().trigger("create");
//	            background_color_ch();
//	         });
//	      }
//	      return false;
//	   });
	
	
   //장바구니 계산값 출력
   $(".selling-option-item__controls").on("change", ".form-control", function() {
	   var form_id = $(this).attr('id');
	   //상품 한 개 가격
	   var productOneCost = Number($(this).parent().parent().parent()
	   .find(".selling-option-item__price").find(".product-one-price").text());
	   //상품의 가격
	   var productCost = productOneCost * $(this).val();
	   
//	   totalCost = totalCost + parseInt($(this).val() * productOneCost);
	   //총 결제 금액 버그있음
	   totalCost += productCost;
	   $(".selling-option-form-content__price .selling-option-form-content__price__number").text(totalCost);
		
	   if($(this).val() > 0) {
		   $(this).parent().parent().parent().find(".selling-option-item__price").find(".selling-option-item__price__number").text(productCost);
	   }
	   
	   


   })
	
})