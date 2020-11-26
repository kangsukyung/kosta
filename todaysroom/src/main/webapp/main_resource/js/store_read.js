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
//	   totalCost = totalCost + parseInt($(this).val() * productOneCost);
	   
	   //총 결제 금액 버그있음
	   totalCost += productCost;
	   $(".selling-option-form-content__price .selling-option-form-content__price__number").text(totalCost);
		
	   if($(this).val() > 0) {
		   $(this).parent().parent().parent().find(".selling-option-item__price").find(".selling-option-item__price__number").text(productCost);
	   }
	   

   })
	
   
   $(".checkpoint").on("click", "", function() {
	   
	   
   }) 
   
   
   
})