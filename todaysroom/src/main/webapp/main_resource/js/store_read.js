$(function() {

	
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
	var product_seq = $(this).parent().find("input[name=product_seq]").val();
	var product_name = $(this).find("#product_name").text();  
	var product_price = $(this).find("#product_price").text();
	var status_count = $(this).val(); 
	 
	var str = "";

		str +='		<input type="hidden" name="product_seq"'
		+'			value=' + product_seq + '>'
		+'		<li><article class="selling-option-item"'
		+'				id=' + status_count+ '>'
		+'				<h1 class="selling-option-item__production">'+product_name+'</h1>'
		+'				<button class="selling-option-item__delete" type="button"'
		+'					aria-label="삭제">'
		+'					<svg width="12" height="12" viewBox="0 0 12 12"'
		+'						fill="currentColor" preserveAspectRatio="xMidYMid meet">'
		+'				<path fill-rule="nonzero"'
		+'							d="M6 4.6L10.3.3l1.4 1.4L7.4 6l4.3 4.3-1.4 1.4L6 7.4l-4.3 4.3-1.4-1.4L4.6 6 .3 1.7 1.7.3 6 4.6z"></path></svg>'
		+'				</button>'
		+'				<div class="selling-option-item__controls"'
		+'					id=' + status_count + '>'
		+'					<div class="selling-option-item__quantity">'
		+'						<div class="input-group select-input option-count-input">'
		+'							<input type="hidden" value ="" name="product_quantity">'
		+'							<select class="form-control" id=' + status_count + '><option'
		+'									value="0">수량</option>'
		+'								<option value="1">1</option>'
		+'								<option value="2">2</option>'
		+'								<option value="3">3</option>'
		+'								<option value="4">4</option>'
		+'								<option value="5">5</option>'
		+'								<option value="6">6</option>'
		+'								<option value="7">7</option>'
		+'								<option value="8">8</option>'
		+'							</select>'
		+'						</div>'
		+'					</div>'
		+'					<p class="selling-option-item__price">'
		+'						<span class="selling-option-item__price__number"'
		+'							id=' + status_count + '>0</span>원 <span'
		+'							class="product-one-price" hidden="">' + product_price + '</span>'
		+'					</p>'
		+'				</div>'
		+'			</article></li>';

		
	//id 같은 내용이 있으면 추가 안함
	//그래야 하는데 2번째부턴 어떻게 찾을까
	if($(".checkpoint").find(".selling-option-item").attr("id") != status_count) {
		$(".checkpoint").append(str);
	}
      return false;
   })
	
	
   //장바구니 계산값 출력
   $(".checkpoint").on("change", ".form-control", function() {
	   var form_id = $(this).attr('id');

	   
	   //물건의 개수 저장
	   var product_quantity = $(this).find(":selected").val();
	   $(this).parent().find("input").val(product_quantity);
	   
	   //상품 한 개 가격
	   var productOneCost = parseInt($(this).parent().parent().parent()
	   .find(".selling-option-item__price").find(".product-one-price").text());
	   
	   //상품의 가격
	   var productCost = productOneCost * $(this).val();
		
	   if($(this).val() > 0) {
		   $(this).parent().parent().parent().find(".selling-option-item__price").find(".selling-option-item__price__number").text(productCost);
	   }
	   
	   var totalCost = 0;
	   //총 가격 계산
	   $(".checkpoint .selling-option-item__price").each(function(i, items) {
		   var item = $(items);
		   totalCost += parseInt(item.text());
	   })
	   $(".selling-option-form-content__price .selling-option-form-content__price__number").text(totalCost);

   })

   
   //요기부터 스토어 추천 리스트 해야함
   var store_status_count = $(".store_status_count").data("count");
   var store_title = $(".store_title").html();
	var store_item_category = $(".store_lcategory").html();
	
   var store_lcategory = $(".store_lcategory").html();
	var store_size = parseInt($(".store_list_hidden .store_size").html());
	var list_str = "";
	
	//인덱스 1씩 더하면서 비교해야함
	for (var i = 0; i < store_size; i++) {
		if(store_lcategory == store_item_category) {
			list_str += '<div class="col-sm-6 col-xl-3 mb-4 mb-xl-0">'
				+'       <div class="single-search-product-wrapper">'
				+'         <div class="single-search-product d-flex">'
				+'           <a href="#"><img src="#" alt=""></a>'
				+'           <div class="desc">'
				+'               <a href="#" class="title">' + store_title + '</a>'
				+'               <div class="price">$170.00</div>'
				+'           </div>'
				+'         </div>'
				+'       </div>'
				+'     </div>'			
		}
	}
   
	$("#recommend_list").append(list_str);
   
})