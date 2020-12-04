/*$(function() {
	product_sort();
})

function productAdd(item) {
	var html = '<section><div class="dropdown">' + item.title + '</div></section>';
    
    $("#select3").append(html);
    
    html = "";
}

function product_sort() {
	$("#select_option").on("change", function() {
		$("#select3").empty();
		if (this.value == "bang") {
			$.ajax({
				url : "../main_resource/js/category.json",
				type : "get",
				dataType : "json",
				success : function(data) {
					console.log(data);
					$.each(data, function(idx, item) {
						productAdd(item);
					})
				},
				error: function(request, status, error) {
					console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			})
		}
	})
}*/

$(function() {
	$("#select_option").on("change", function() {
		$("#select3").empty();
		if (this.value == "bang") {
			$("#select3").hide().load("/main_resource/js/board_bang.html", function() {
				$(this).fadeIn().trigger("create");
				background_color_ch();
			});
		}else if (this.value == "knowhow") {
			$("#select3").hide().load("/main_resource/js/board_knowhow.html", function() {
				$(this).fadeIn();
			});
		}else if (this.value == "qa") {
			$("#select3").empty();
		}
		return false;
	});
});

background_color_ch = function() {
	var background_color_ch = document.getElementById("board_color_select_option");
	background_color_ch.style.backgroundColor = background_color_ch.value;
}

