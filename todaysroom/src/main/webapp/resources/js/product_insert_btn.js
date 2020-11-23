







var i=0;
var tab=0;

$(document).ready(function() {
	$("#myTab").click(function() {
		$("#product_insert_form").after($('#product_insert_form').html())
		
		var names = $('.row').eq(i).find('input').attr('name');
		names += i;
		
		console.log(names);
		
		$('.row').eq(i).find('input').attr('name', names);
		
		i++;		
	});
});