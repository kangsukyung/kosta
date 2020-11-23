$(function(){
	$(".pagination b li").addClass("active");
	document.getElementById('page-item').addEventListener('click', function() {
		$(".page-item").after.addClass("active");
	});
	
	
	
})