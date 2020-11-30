	
$(document).ready(function() {
	
	showList(1);
	
	//리스트 보여주는거
	function showList(page){
		console.log("여기를 오기는 오ㄴ");
		var store_seq = 3;//나중에 수정 해줘야 됨?
	//	console.log("혹시 페이지가 없어서 그런거니"+page);
		ReviewService.getList({store_seq:store_seq,page: page|| 1 }, function(reviewCnt, reviewList) {
			
			console.log("showList - reviewCnt : "+ reviewCnt );
		    //console.log(reviewList);
			
		    if(page == -1){
		    	pageNum = Math.ceil(reviewCnt/5.0);
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
					str +="			<a class='post_tag a_jsb' href='#'>"+reviewList[i].member_seq+"</a>"
					str +="			<p>"+reviewList[i].review_date+"</p>"
					str +="							<div class='d-flex'>"
					str +="								<img src='../../../upload/${head}_small.${pattern}'>"
					str +="							</div>"
					str +="			<img src='../../main_resource/img/blog/main-blog/m-blog-1.jpg alt=''>"
					str +="			<div class='blog_details'>"
					str +="				<p>"+reviewList[i].review_content+"</p>"
					/*str +="				<a class='button button-blog' href='#'>View More?-글자수 제한 둬서 너무많아지면 view more </a>"*/
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
			     showReplyPage(reviewCnt);	//paging
		});
	}//end showList
	
	//페이징
	var pageNum = 1;
	
	function showReplyPage(reviewCnt){
	    console.log("show replyPage reviewCnt  :  "+ reviewCnt );	//리뷰개수
		var endNum = Math.ceil(pageNum / 5.0) * 5;	//끝번호  
		var startNum = endNum - 4; //시작페이지
		var prev = startNum != 1;	//이전
		var next = false;	//다음
		
		if(endNum * 5 >= reviewCnt){
		 endNum = Math.ceil(reviewCnt/5.0);
		}
		
		if(endNum * 5 < reviewCnt){
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
		//console.log(str);
		
		/*var str2 = "<ul class='pagination'>"
		if(priv){
			str2+="<li class='page-item'><a href='"+(startNum -1)+"' class='page-link' aria-label='Previous'> "
			str2+="<span aria-hidden='true'><span class='lnr lnr-chevron-left' ></span></span></a>"
		}
		for(var i = startNum ; i <= endNum; i++){
			var active = pageNum == i? "active":"";
			str2+="<li class='page-item "+active+"'> <a href='"+i+"' class='page-link'  id='page-item-pageno'>"+i+"</a></li>";		
		}
		if(next){
		  str2+= "<li class='page-item'> <a href='"+(endNum + 1)+"' class='page-link' aria-label='Next'>"
		  str2+= "<span aria-hidden='true'><span class='lnr lnr-chevron-right'></span></span></a></li>"
		}
		str2+="</ul>"*/
		
		//$(".blog-pagination justify-content-center d-flex").html(str);	//페이징 넣을 위치
		$(".review_paging").html(str);
	};
	
	$(".review_paging").on("click","li a", function(e){
        e.preventDefault();
        console.log("page click");
        
        var targetPageNum = $(this).attr("href");
        
        console.log("targetPageNum: " + targetPageNum);
        
        pageNum = targetPageNum;
        
        showList(pageNum);
      }); 
	
	var modalContent = $("#message").val();
	var modalRegisterBtn = $("#reviewAddBtn");
	//var modelRemoveBtn = $("#reviewModify");
	
	//insert
	modalRegisterBtn.on("click",function(e){
		e.preventDefault();
		console.log("아아러아ㅓ아ㅏㄹ앙라 ㄹ  왜 안찎형랑너람ㄴㅇ롬ㄴ아ㅗㅁㄴ와ㅣㄹㅇ");
		console.log("modalContent.val():" + $("#message").val());//undifiend
		
		var formData = new FormData();
		var inputFile = $("input[name='review_picture']");
		var files = inputFile[0].files;
		console.log("files : "+files);
		
		//토큰
		var csrfTokenValue = $("#csrf").attr("value");
		
		var review = {
				review_content : $("#message").val(),
				shoporder_seq : 24,
				member_seq : 30,
				store_seq : 3,
				product_seq : 1
		};
		console.log(review);
		
		ReviewService.add(review, function(result){
			console.log("result ::: "+result);
			console.log("review ::: "+review);
			
			$('#my_modal').find("").val("");
			$('#my_modal').hide();
			$('#my_modal').css("display",'none');
			$("html, body").css("overflow",'auto');
			showList(-1);
		});
	});
	});
	
	
	//update
	/*$(document).on("click",".reviewModify",function(){
		console.log("update");
	});*/
	
	//delete
	/*$(document).on("click",".reviewRemove",function(){
		console.log("delete"+$(this).data("member_seq"));
	});*/
	
//모달
function modal(id) {
    var zIndex = 9999;
    //var modal = id;
   
    // 모달 div 뒤에 희끄무레한 레이어
    var bg = document.createElement('div');
    $('document.body').css({
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
    $('document.body').append(bg);

    // 닫기 버튼 처리, 시꺼먼 레이어와 모달 div 지우기
    $('.modal_close_btn').on('click', function() {
        //bg.remove();
        $('#my_modal').css("display",'none');
        $("html, body").css("overflow",'auto');
    });

    $('#my_modal').css({
        position: 'fixed',
        display: 'block',
        boxShadow: '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

        // 시꺼먼 레이어 보다 한칸 위에 보이기
        zIndex: zIndex + 1,

        // div center 정렬
        top: '50%',
        left: '50%',
        transform: 'translate(-50%, -50%)',
        msTransform: 'translate(-50%, -50%)',
        webkitTransform: 'translate(-50%, -50%)'
    });
}

$('#popup_open_btn').on('click', function() {
    // 모달창 띄우기
//	var popH = $(this).offset().top;
//	console.log(popH);
	//$('#my_modal').css("top",popH +'px !important');
    modal('#my_modal');
    $("html, body").css("overflow",'hidden');
});
	
	
	
	var ReviewService = (function(){
		console.log("review js service start");
//		var csrfHeaderName = $("#csrf").attr("name");
//		var csrfTokenValue = $("#csrf").attr("value");
	    
		//getlist
		function getList(param, callback, error) {
			
		    var store_seq = param.store_seq;
		    console.log("store_seq :: "+param.store_seq);
		    var page = param.page || 1;
		    
		    
		    $.getJSON("/review/pages/" + store_seq + "/" + page + ".json",
		        function(data) {
		    	
		          if (callback) {
		            //callback(data); // 댓글 목록만 가져오는 경우 
		        	  console.log("reviewCnt  :   "+data.reviewCnt);
		        	  console.log("reviewList    :    "+data.reviewList);
		            callback(data.reviewCnt, data.reviewList); //댓글 숫자와 목록을 가져오는 경우 
		          }
		        }).fail(function(xhr, status, err) {
		      if (error) {
		        error();
		      }
		    });
		}
		
		
		function add(review, callback, error) {
			console.log(review);
			console.log("1111add review...............");
			console.log("review : "+review.review_content);
			
			/*$.ajax({
				url: '/review/uploadAjaxAction',
				processData: false,
				contentType: false,
				data: fromData,
				type: 'POST',
				success: function(result){
					alert("uploaded");
				}
			});*/
			
			
			$.ajax({
				type : 'post',
				url : '/review/register',
				beforeSend: function(xhr) {
					xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
				},
				data : JSON.stringify(review),
				contentType : "application/json; charset=utf-8",
				success : function(result, status, xhr) {
					console.log("11");
					if (callback) {
						callback(result);
					}
				},
				error : function(xhr, status, er) {
					alert("test1");
					if (error) {
						error(er);
					}
				}
			});
		}
		
		return {
			getList:getList,
			add:add
		};
		
		
	})();
	
	/*$(document).ajaxSend(function(e, xhr, options) {
        var csrfHeaderName = "${_csrf.headerName}";
        var csrfTokenValue = "${_csrf.token}";
        
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
     });*/
	
