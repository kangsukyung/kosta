$(function() {
	
	$(".storefilter").click(function() {
		var secondfilter = $(".storefilter option").val();
		$.ajax({
			async: true,
			type : 'Post',
			data : "", // 써야함ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ
			url : "../../store/filterPrice.do",
			dataType: "text",
			success: function(data) {
				console.log(data);
			}
		})
		
	})
	
})