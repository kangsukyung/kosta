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
	   
//	   $(".selling-option-form-content__list").hide().load("../main_resource/js/product_select.html", function() {
//		   $(this).fadeIn();
//	   });
      return false;
   })	
	
   $(function() {
   $("#select_option").on("change", function() {
      $("#select3").empty();
      if (this.value == "bang") {
         $("#select3").hide().load("../main_resource/js/board_bang.html", function() {
            $(this).fadeIn().trigger("create");
            background_color_ch();
         });
      }else if (this.value == "knowhow") {
         $("#select3").hide().load("../main_resource/js/board_knowhow.html", function() {
            $(this).fadeIn();
         });
      }else if (this.value == "qa") {
         $("#select3").empty();
      }
      return false;
   });
});
   
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