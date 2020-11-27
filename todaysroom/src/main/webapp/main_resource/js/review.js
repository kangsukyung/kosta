$(document).ready(function() {
	showList();
	



function showList(page){
	console.log("여기를 오기는 오ㄴ");
	var store_seq = 3;//나중에 수정 해줘야 됨
//	console.log("혹시 페이지가 없어서 그런거니"+page);
	var page = 1;
		ReviewService.getList({store_seq:store_seq,page: page|| 1 }, function(replyCnt, reviewList) {
			
			console.log("replyCnt : "+ replyCnt );
		    //console.log(reviewList);
			
		    if(page == -1){
		    	pageNum = Math.ceil(replyCnt/10.0);
		    	showList(pageNum);
		    	return;
		    }
		    
			var str="";
			if(reviewList == null || reviewList.length == 0){
				return;
			}
			for (var i = 0, len = reviewList.length || 0; i < len; i++) {
				str +="<article class='row blog_item blog_item_jsb'>"
					str +="	<div class='thumb'>"
					str +="		<img src='../../../main_resource/img/blog/c1.jpg' alt=''>"
					str +="	</div>"
					str +="	<div class='col-md-9'>"
					str +="		<div class='blog_post'>"
					str +="			<a class='post_tag a_jsb' href='#'>글쓴이</a>"
					str +="			<p>"+reviewList[i].review_date+"</p>"
					str +="							<div class='d-flex'>"
					str +="								<img src='../../../upload/${head}_small.${pattern}'>"
					str +="							</div>"
					str +="			<img src='../../main_resource/img/blog/main-blog/m-blog-1.jpg alt=''>"
					str +="			<div class='blog_details'>"
					str +="				<p>"+reviewList[i].review_content+"</p>"
					str +="				<a class='button button-blog' href='#'>View More?????????????? </a>"
					str +="			</div>"
					str +="			<div class='update_div'>"
					str +="				<a class='date reviewModify'>수정하기</a>"
					str +="				<a class='date reviewRemove'>삭제하기</a>"
					str +="			</div>"
					str +="		</div>"
					str +="	</div>"
					str +="</article>"
			}
			     
			     $(".production-review-item__container").html(str);	//$(".chat")를 replyUL에 담아놓음
			     //showReplyPage(replyCnt);	//paging
		});
	}//end showList
});
function showReplyPage(replyCnt){
    
	var endNum = Math.ceil(pageNum / 10.0) * 10;  
	var startNum = endNum - 9; 
	var prev = startNum != 1;
	var next = false;
	
	if(endNum * 10 >= replyCnt){
	 endNum = Math.ceil(replyCnt/10.0);
	}
	
	if(endNum * 10 < replyCnt){
	 next = true;
	}
	
	var str = "<ul class='pagination pull-right'>";
	
	if(prev){
	  str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
	}
	
	for(var i = startNum ; i <= endNum; i++){
	  var active = pageNum == i? "active":"";
	  str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	}
	
	if(next){
	  str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
	}
	
	str += "</ul></div>";
	console.log(str);
	$(".blog-pagination justify-content-center d-flex").html(str);	//페이징 넣을 위치
};


var ReviewService = (function(){
	console.log("review js service start");
	
	//getlist
	function getList(param, callback, error) {
		console.log("rrrrr");
		console.log("param : "+param);
		
	    var store_seq = param.store_seq;
	    var page = param.page || 1;
	    
	    console.log("store_seq :: "+store_seq);
	    console.log("page :: "+page);
	    
	    
	    $.getJSON("/review/pages/" + store_seq + "/" + page + ".json",
	        function(data) {
	    	
	          if (callback) {
	            //callback(data); // 댓글 목록만 가져오는 경우 
	        	  console.log("data ::::::  "+data.replyCnt);
	        	  console.log("data ::::::  "+data.reviewList);
	            callback(data.replyCnt, data.reviewList); //댓글 숫자와 목록을 가져오는 경우 
	          }
	        }).fail(function(xhr, status, err) {
	      if (error) {
	        error();
	      }
	    });
	  }
	
	
	return {getList:getList};
	
	
})();



