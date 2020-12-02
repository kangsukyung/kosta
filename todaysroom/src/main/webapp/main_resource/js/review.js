	
$(document).ready(function() {
	
	showList(1);
	
	//리스트 보여주는거
	function showList(page){
		var store_seq = $("#review_store_seq").val();//현재 store번호
		var myMemValue = $("#my_member_seq").val();	//로그인 한 사람의 seq
		console.log("my member value : "+myMemValue);
		var reviewMemValue = $("#review_member_seq").val();	//리뷰 쓴 사람의 seq
		console.log("review_member_seq : "+reviewMemValue);
		ReviewService.getList({store_seq:store_seq,page: page|| 1 }, function(reviewCnt, reviewList) {
			
			console.log("showList - reviewCnt : "+ reviewCnt );
			
		    if(page == -1){
		    	pageNum = Math.ceil(reviewCnt/5.0);
		    	showList(pageNum);
		    	return;
		    }
		    
			var str="";
			if(reviewList == null || reviewList.length == 0){
				return;
			}
			
			str+="<a class='review_sidebar_alig_jsb'>최신순</a><a class='review_sidebar_alig_jsb'>평점순</a>"
			
			for (var i = 0, len = reviewList.length || 0; i < len; i++) {
				str +="<article class='row blog_item blog_item_jsb'>"
				str +="	<div class='thumb'>"
				str +="		<img src='../../../main_resource/img/blog/c1.jpg' alt=''>"
				str +="	</div>"
				str +="	<div class='col-md-9'>"
				str +="		<div class='blog_post'>"
				str +="			<a class='post_tag a_jsb' href='#'>"+reviewList[i].member_seq+"</a>"
				str +="			<p>"+reviewList[i].review_date+"</p>"
				str +="				<div class='d-flex'>"
				str +="					<img src='../../../upload/${head}_small.${pattern}'>"
				str +="				</div>"
				str +="			<img src='../../main_resource/img/blog/main-blog/m-blog-1.jpg alt=''>"
				str +="			<div class='blog_details'>"
				str +="				<p>"+reviewList[i].review_content+"</p>"
				/*str +="				<a class='button button-blog' href='#'>View More?-글자수 제한 둬서 너무많아지면 view more </a>"*/
				str +="			</div>"
				str +="			<div class='update_div'>"
				/*str +="				<a class='date reviewModify'>수정하기</a>"
				str +="				<a class='date reviewRemove'>삭제하기</a>"*/
				str +="			</div>"
				str +="		</div>"
				str +="	</div>"
				str +="</article>"
			}
			     
			     $(".production-review-item__container").html(str);	//$(".chat")를 replyUL에 담아놓음
			     showReplyPage(reviewCnt);	//paging
		});
	}//end showList
	//----------------------------------------------------------------------------------------
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
	
	
	//------------------------------insert----------------------------------------------------------
	//insert
	modalRegisterBtn.on("click",function(e){
		e.preventDefault();
		console.log("modalContent.val():" + $("#message").val());//undifiend
		
		var formData = new FormData();
		var inputFile = $("input[name='review_picture']");
		var files = inputFile[0].files;
		console.log("files : "+files);
		
		//토큰
		var csrfTokenValue = $("#csrf").attr("value");
		
		var review = {
				review_content : $("#message").val(),
				shoporder_seq : 22,	//주문내역있어야됨
				member_seq : $("#my_member_seq").val(),
				store_seq : $("#review_store_seq").val(),
				product_seq : $("#review_store_seq").val(),	//제품 선택해야됨
				store_seq : $("#review_store_seq").val()
				
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


	//-----------------------------modal-----------------------------------------------------------
	//모달

	//var modal = "";

	$('#popup_open_btn').on('click', function() {
	    // 모달창 띄우기
	    modal('#my_modal');
	    $("html, body").css("overflow",'hidden');
	});


	function modal(id) {
	    var zIndex = 9999;
	   
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
	
	
	//----------------------------------store button event------------------------------------------------------
	
	$('#review').css('display',"none");
	
	$('#review-tab').click(function(e) {
		$('#review-tab').addClass('active');
		$('#review').css('display',"");
		$('#home').css('display',"none");
		$('#home-tab').removeClass('active');
	});
	$('#home-tab').click(function(e) {
		$('#home-tab').addClass('active');
		$('#home').css('display','');
		$('#review').css('display',"none");
		$('#review-tab').removeClass('active');
	});
	
	
	//----------------------------------reviewService------------------------------------------------------
	
	
	var ReviewService = (function(){
		console.log("review js service start");
	    
	//getlist
	function getList(param, callback, error) {
		
	    var store_seq = param.store_seq;
	    console.log("store_seq :: "+param.store_seq);
	    var page = param.page || 1;
	    
	    $.getJSON("/review/pages/" + store_seq + "/" + page + ".json",
	        function(data) {
	    	
	          if (callback) {
	        	  console.log("reviewCnt  :   "+data.reviewCnt);
	            callback(data.reviewCnt, data.reviewList); //댓글 숫자와 목록을 가져오는 경우 
	          }
	        }).fail(function(xhr, status, err) {
	      if (error) {
	        error();
	      }
	    });
	}
	
	
	function add(review, callback, error) {
		console.log("add.........");
		console.log("review : "+review.review_content);
		
		
		$.ajax({
			type : 'post',
			url : '/review/register',
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			data : JSON.stringify(review),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				console.log("success");
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				alert("error!");
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
	
	
	
