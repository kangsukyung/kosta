$(function(){
	$('#hw-search').on('click', function(e){
		$('#hw-searchbar').addClass('active');
		
		$('#hw-search').on('click', function(e){
			var keyword = $('#hw-searchbar input').val();
			
			if(keyword == ''){
				return;
			}
			
			location.href='listAction.do?keyword='+keyword;
		})
	});
});