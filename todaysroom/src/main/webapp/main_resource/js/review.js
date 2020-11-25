
function showList(page){
	var store_seq = 11;//나중에 수정 해줘야 됨
	
		ReviewService.reiewList({store_seq:store_seq,page: page|| 1 }, function(replyCnt, reviewList) {
			
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

/*function showReplyPage(replyCnt){
    
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
};*/


var ReviewService = (function(){
	console.log("review js service start");
	
	//getlist
	function reviewList(param, callback, error) {

	    var store_seq = param.store_seq;
	    var page = param.page || 1;
	    
	    $.getJSON("/review/pages/" + review_seq + "/" + page + ".json",
	        function(data) {
	    	
	          if (callback) {
	            //callback(data); // 댓글 목록만 가져오는 경우 
	        	  console.log("data ::::::  "+data);
	            callback(data.replyCnt, data.reviewList); //댓글 숫자와 목록을 가져오는 경우 
	          }
	        }).fail(function(xhr, status, err) {
	      if (error) {
	        error();
	      }
	    });
	  }
	
	
	
})



function modal(id) {
    var zIndex = 9999;
    var modal = document.getElementById(id);

    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    bg.setStyle({
        position: 'fixed',
        zIndex: zIndex,
        left: '0px',
        top: '0px',
        width: '100%',
        height: '100%',
        overflow: 'auto',
        // 레이어 색갈은 여기서 바꾸면 됨
        backgroundColor: 'rgba(0,0,0,0.4)'
    });
    document.body.append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    modal.querySelector('.modal_close_btn').addEventListener('click', function() {
        bg.remove();
        modal.style.display = 'none';
        $("html, body").removeClass("not_scroll");
    });

    modal.setStyle({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '45%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
Element.prototype.setStyle = function(styles) {
    for (var k in styles) this.style[k] = styles[k];
    return this;
};

document.getElementById('popup_open_btn').addEventListener('click', function() {
    // 모달창 띄우기
    modal('my_modal');
    $("html, body").addClass("not_scroll");
});

$(function(){
	$(".pagination b li").addClass("active");
	document.getElementById('page-item').addEventListener('click', function() {
		$(".page-item").after.addClass("active");
	});
})