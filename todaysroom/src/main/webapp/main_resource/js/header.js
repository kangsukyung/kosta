$(function(){
	$('#hw-search-icon').on('click', function(e){
		
		$('#hw-searchbar').addClass('active');
		
		$('#hw-searchbar input').autocomplete({
	        source : function( request, response ) {
	        	$.ajax({
	                type: 'get',
	                url: "/search/autocompletelist",
	                data: {keyword : $('#hw-searchbar input').val()},
	                success: function(data) {
	                    //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
	                    response(
	                        $.map(data, function(item) {
	                            return {
	                                label: item,
	                                value: item
	                            }
	                        })
	                    );
	                }
	           });
	            },
	        //조회를 위한 최소글자수
	        minLength: 1,
	        select: function( event, ui ) {
	            // 만약 검색리스트에서 선택하였을때 선택한 데이터에 의한 이벤트발생
	        }
	    });


		
		$('#hw-search-icon').on('click', function(e){
			var keyword = $('#hw-searchbar input').val();
			
			if(keyword == ''){
				return;
			}
			
			location.href='board/list?keyword='+keyword;
//			location.href='board/list';
		})
	});
});