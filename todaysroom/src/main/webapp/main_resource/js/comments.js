/*$(function(){
	$(".pagination b li").addClass("active");
	document.getElementById('page-item').addEventListener('click', function() {
		$(".page-item").after.addClass("active");
	});
})*/

/**
 * 
 */
$(document).ready(function() {
  
	var bnoValue = 11;
	var replyUL = $(".chat");
	showList(1);
	  
	function showList(page){
		CommentsService.commentsList({board_seq:bnoValue,page: page|| 1 }, function(replyCnt, commentsList) {
			
			console.log("replyCnt : "+ replyCnt );
			
		    if(page == -1){
		    	pageNum = Math.ceil(replyCnt/5.0);
		    	showList(pageNum);
		    	return;
		    }
		    
			var str="";
			if(commentsList == null || commentsList.length == 0){
				//replyUL.html("");
				return;
			}
			for (var i = 0, len = commentsList.length || 0; i < len; i++) {
				str +="<div class='single-comment justify-content-between d-flex' data-comments_seq='"+commentsList[i].comments_seq+"'>"
				str +="		<div class='user justify-content-between d-flex'>"
				str +="				<div class='thumb'>"
				str +="					<img src='../../../main_resource/img/blog/c3.jpg' alt=''>"
				str +="				</div>"
				str +="				<div class='desc'>"
				str +="						<h5>"
				str +="							<a href='#'>"+commentsList[i].member_seq+"</a>"
				str +="						</h5>"
				str +="						<p class='comment'>"+commentsList[i].comments_content+"</p>"
				str +="						<p class='date'>"+commentsList[i].comments_date+"</p>"
				str +="				</div>"
				str +="		</div>"
				str +="		<div class='reply-btn'>"
				str +="				<a href='#' class='btn-reply text-uppercase'>reply</a>"
				str +="		</div>"
				str +="</div>"
			}
			     
			     replyUL.html(str);	//$(".chat")를 replyUL에 담아놓음
			     showReplyPage(replyCnt);
		});
	}//end showList
		
		
		
	//var modal = $(".modal");
    var modalInputReply = $(".modal").find("input[name='comments_content']");
    var modalInputReplyer = $(".modal").find("input[name='member_seq']");
    var modalInputReplyDate = $(".modal").find("input[name='admin_seq']");
    
    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");

    
    $("#modalCloseBtn").on("click", function(e){
    	$(".modal").hide();
    });
	
    
    $("#addReplyBtn").on("click", function(e){
      
      $(".modal").find("input").val("");
      modalInputReplyDate.closest("div").hide();
      $(".modal").find("button[id !='modalCloseBtn']").hide();
      
      modalRegisterBtn.show();	//저장 버튼
      
//    $(".modal").modal('show');
      $(".modal").show();
      //console.log("here!"+ $('.modal').is(':visible'));
      //modal.show();
      
    });
	    
	//댓글저장 버튼
    modalRegisterBtn.on("click",function(e){
    	
    	//console.log("here!!  ->  "+ $(this).val());
        //console.log("here!!!  ->  "+ $(this).html());
    	
	    var comments = {
	    	  comments_content: modalInputReply.val(),
	          member_seq:21,
	          board_seq:bnoValue
	    };
	    CommentsService.commentsRegister(comments, function(result){
	      
		    alert(result);
		      
		    $(".modal").find("input").val("");
		    $(".modal").hide();
		      
		    //showList(1);
		    showList(-1);
	      
	    });
      
    });
	//end modalRegister   
    //댓글 저장 버튼(모달 x)
    $("#commentsAddBtn").on("click",function(e){
    	e.preventDefault();
    	console.log("add btn click");
    	
    	var csrfTokenValue = $("#csrf").attr("value");
    	
    	var comments = {
    			comments_content : $("#insert_content").val(),
    			board_seq : 11,
    			member_seq : 21
    	};
    	
    	console.log(comments);
    	CommentsService.commentsRegister(comments, function(result){
  	      
		    alert(result);
		    $(".comments-area").find("#insert_content").val("");
		    //showList(1);
		    showList(-1);
	      
	    });
    	
    })
    
	    
	    
	  //댓글 조회 클릭 이벤트 처리 
    $(".chat").on("click", "li", function(e){
    	var comments_seq = $(this).data("comments_seq");
      
    	CommentsService.commentsRead(comments_seq, function(comments){
    	  
        modalInputReply.val(comments.comments_content);
        modalInputReplyer.val(comments.member_seq);
        modalInputReplyDate.val(CommentsService.displayTime( comments.admin_seq)).attr("readonly","readonly");
        $(".modal").data("comments_seq", comments.comments_seq);
        
        $(".modal").find("button[id !='modalCloseBtn']").hide();
        modalModBtn.show();
        modalRemoveBtn.show();
        
        $(".modal").show();
           
      	});
    });
	  
	  //모달 내 수정하기 버튼
    modalModBtn.on("click", function(e){
        
        var comments = {comments_seq:$(".modal").data("comments_seq"), comments_content: modalInputReply.val()};
        
        CommentsService.commentsModify(comments, function(result){
              
	        alert(result);
	        $(".modal").hide();
	        //showList(1);
	        showList(pageNum);//수정후엔 1페이지가 아닌 수정전에 있던 페이지로 이동
        });
      });
	//end modalModBtn
	   
	
    //모달 내 삭제버튼
      modalRemoveBtn.on("click", function (e){
      	  
    	  var comments_seq = $(".modal").data("comments_seq");
    	  
    	  CommentsService.commentsRemove(comments_seq, function(result){
    	        
    	      alert(result);
    	      $(".modal").hide();
    	      //showList(1);
    	      showList(pageNum);//삭제 후엔 삭제 직전에 있던 페이지로 이동
    	  });
    	});
      //end modalRemoveBtn
      
    
    var pageNum = 1;
    var replyPageFooter = $(".comments_paging");
      
	function showReplyPage(replyCnt){
        
		var endNum = Math.ceil(pageNum / 5.0) * 5;  
		var startNum = endNum - 4; 
		var prev = startNum != 1;
		var next = false;
		
		if(endNum * 5 >= replyCnt){
		 endNum = Math.ceil(replyCnt/5.0);
		}
		
		if(endNum * 5 < replyCnt){
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
		replyPageFooter.html(str);
	};
      
      replyPageFooter.on("click","li a", function(e){
          e.preventDefault();
          console.log("page click");
          
          var targetPageNum = $(this).attr("href");
          
          console.log("targetPageNum: " + targetPageNum);
          
          pageNum = targetPageNum;
          
          showList(pageNum);
        }); 
       
      /* replyPageFooter.on("click","li a", function(e){
         e.preventDefault();
         console.log("page click");
         
         var targetPageNum = $(this).attr("href");
         
         console.log("targetPageNum: " + targetPageNum);
         
         pageNum = targetPageNum;
         
         showList(pageNum);
       });  */
	
	
	
  var operForm = $("#operForm"); 
  
  $("button[data-oper='modify']").on("click", function(e){
    
    operForm.attr("action","/board/modify").submit();
    
  });
  
    
  $("button[data-oper='list']").on("click", function(e){
    
    operForm.find("#bno").remove();
    operForm.attr("action","/board/list")
    operForm.submit();
    
  });  
});

var CommentsService = (function(){
	
	console.log("reply module..........");
	
	function add(comments, callback, error) {
		console.log("add reply...............");
		console.log(comments);
		$.ajax({
			type : 'post',
			url : '/comments/register',
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
			data : JSON.stringify(comments),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}//add함수
	
	/*function getList(param, callback, error) {
		
		var bno = param.bno;
		var page = param.page || 1;

		$.getJSON("/replies/pages/" + bno + "/" + page + ".json",
				function(data) {
					if (callback) {
						callback(data);
					}
				}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}*/
	
	function getList(param, callback, error) {
		console.log("getList......");
		console.log("board_seq : "+param.board_seq);
	    var board_seq = param.board_seq;
	    var page = param.page || 1;
	    
	    $.getJSON("/comments/pages/" + board_seq + "/" + page + ".json",
	        function(data) {
	          if (callback) {
	            //callback(data); // 댓글 목록만 가져오는 경우 
	        	  console.log("data ::::::  "+data);
	            callback(data.replyCnt, data.commentsList); //댓글 숫자와 목록을 가져오는 경우 
	          }
	        }).fail(function(xhr, status, err) {
	      if (error) {
	        error();
	      }
	    });
	  }
	
	function remove(comments_seq, callback, error) {
		$.ajax({
			type : 'delete',
			url : '/comments/' + comments_seq,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	
	function update(comments, callback, error) {

		console.log("RNO: " + comments.comments_seq);

		$.ajax({
			type : 'put',
			url : '/comments/' + comments.comments_seq,
			data : JSON.stringify(comments),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function get(comments_seq, callback, error) {
		$.get("/comments/" + comments_seq + ".json", function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {

			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');

		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	};
	
	return{
		commentsRegister:add,
		commentsList:getList,
		commentsRemove:remove,
		commentsModify:update,
		commentsRead:get,
		displayTime:displayTime
	};
	
	
})();
