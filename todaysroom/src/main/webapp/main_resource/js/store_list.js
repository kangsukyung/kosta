$(function() {
	$(".commerce-category-tree__entry__header button").click(function(){
		$(this).closest("li").find("li").toggle("slow").removeClass("hidden");
		
	})
	
	
	$("#allsofa").click(function() {
		var str = "";
		$(".lattest-product-area").empty();
		
		$.getJSON("/store/pages/" + "test_lcategory2" + "/" + "1" + ".json", function(data) {
			$.each(data, function(i, item) {
				str += '<div class="row row_product_hw col-lg-4">'
				+'<div class="card text-center card-product">'
				+'	<div class="card-product__img">'
				+'		<img class="card-img"'
				+'			src="/display?fileName=' + item.store_picture + '" alt="상품이미지">'
				+'		<ul class="card-product__imgOverlay">'
				+'			<li><button>'
				+'					<i class="ti-search"></i>'
				+'				</button></li>'
				+'			<li><button>'
				+'					<i class="ti-shopping-cart"></i>'
				+'				</button></li>'
				+'			<li><button>'
				+'					<i class="ti-heart"></i>'
				+'				</button></li>'
				+'		</ul>'
				+'	</div>'
				+'	<div class="card-body">'
				+'		<p>' + item.store_date+'</p>'
				+'		<h4 class="card-product__title">'
				+'			<a href="/store/read?store_seq='+item.store_seq+'">'+item.store_title+'</a>'
				+'		</h4>'
				+'	</div>'
				+'</div>'
				+'</div>'
//				console.log(str);
				$(".lattest-product-area").append(str);
			})
		}).fail(function(xhr, status, err) {
			alert("fail");
		});
		
		return false;
	});
	
		
})