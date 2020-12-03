$(function() {
	$(".commerce-category-tree__entry__header button").click(function(){
		$(this).closest("li").find("li").toggle("slow").removeClass("hidden");
		
	})
	
	$(".card-product__img").each(function(i, obj) {
		var uploadpath = $(this).find(".uploadpath").val();
		var uuid = $(this).find(".uuid").val();
		var filename = $(this).find(".filename").val();
		
		var url = encodeURIComponent(uploadpath + "\\" + uuid + "_" + filename);
		var urlstr = "/product/display?fileName="+url;
		$(this).find(".card-img").attr("src",urlstr);
		
	})
	
	//필터
	$("#allsofa").click(function() {
		var str = "";
		var category = "";
		$(".lattest-product-area").empty();
		
		$.getJSON("/store/pages/" + "sofa" + "/" + "1" + ".json", function(data) {
			$.each(data, function(i, item) {
				str += '<div class="row row_product_hw col-lg-4">'
				+'<div class="card text-center card-product">'
				+'	<div class="card-product__img">'
				+'		<img class="card-img"'
				+'			src="/display?fileName=' + item.store_picture + '" alt="상품이미지" onerror="this.src=' + "'/main_resource/img/stimg.png'" + '">'
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

	$("#allbed").click(function() {
		var str = "";
		var category = "";
		$(".lattest-product-area").empty();
		
		$.getJSON("/store/pages/" + "living" + "/" + "1" + ".json", function(data) {
			$.each(data, function(i, item) {
				str += '<div class="row row_product_hw col-lg-4">'
				+'<div class="card text-center card-product">'
				+'	<div class="card-product__img">'
				+'		<img class="card-img"'
				+'			src="/display?fileName=' + item.store_picture + '" alt="상품이미지" onerror="this.src=' + "'/main_resource/img/stimg.png'" + '">'
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