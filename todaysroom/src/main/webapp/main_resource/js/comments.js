
$(document).ready(function() {
  
	var bnoValue = $("#comments_board_seq").val();
	var memValue = $("#comments_member_seq").val();
	var myMemValue = $("#my_member_seq").val();
	var myMemProfile = $("my_member_profile").val();
	console.log("myMemValue" + myMemValue);
	var replyUL = $(".chat");
	showList(1);
	  
	function showList(page){
		CommentsService.commentsList({board_seq:bnoValue,page: page|| 1 }, function(replyCnt, commentsList) {
			
			console.log("replyCnt : "+ replyCnt );
			
		    if(page == -1){
		    	pageNum = Math.ceil(replyCnt/5.1);
		    	//console.log("new pageNum : "+ pageNum);
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
				str +="			<div class='thumb'>"
				str +="				<img src='C:\\upload\\"+myMemProfile+"' alt=''>"
				str +="			</div>"
				str +="			<div class='desc'>"
				str +="			<h5>"
				str +="				<a href='#'>"+commentsList[i].member_seq+"</a>"
				str +="			</h5>"
				str +="			<p class='comment'>"+commentsList[i].comments_content+"</p>"
				str +="			<p class='date'>"+commentsList[i].comments_date
				str +="				<ul>"
										if(myMemValue == commentsList[i].member_seq){
				str +="					<li id='comments_modify_btn' data-seq='"+commentsList[i].comments_seq+"' >수정하기</li>"
				str +="					<li id='comments_remove_btn' data-seq='"+commentsList[i].comments_seq+"'>삭제하기</li>"
										}else{
				str +="					<li id='report_register_btn' data-seq='"+commentsList[i].comments_seq+"'>신고하기</li>"
										}
				str +="				</ul>"
				str +="			</p>"
				str +="			</div>"
				str +="		</div>"
				str +="		<div class='reply-btn'>"
				str +="			<a href='#' class='btn-reply text-uppercase'>reply</a>"
				str +="		</div>"
				str +="</div>"
			}
			     
			     replyUL.html(str);	//$(".chat")를 replyUL에 담아놓음
			     showReplyPage(replyCnt);
		});
	}//end showList
		
    
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
    
    //댓글 저장 버튼
    $("#commentsAddBtn").on("click",function(e){
    	e.preventDefault();
    	console.log("add btn click");
    	
    	var csrfTokenValue = $("#csrf").attr("value");
    	
    	var comments = {
    			comments_content : $("#insert_content").val(),
    			board_seq : bnoValue,
    			member_seq : $("#my_member_seq").val()
    	};
    	
    	console.log(comments);
    	CommentsService.commentsRegister(comments, function(result){
  	      
		    alert(result);
		    $(".comments-area").find("#insert_content").val("");
		    showList(1);
		    //showList(-1);
	      
	    });
    	
    })
    
	 //수정하기
    $(".chat").on("click", "#comments_modify_btn", function(e){
    	e.preventDefault();
    	var csrfTokenValue = $("#csrf").attr("value");
    	var comments_no = $(this).data("seq");
    	console.log("comments_no : "+ comments_no);
    	
    	//p태그 input태그로 바꾸기
   		$(this).parents().prevAll(".comment").contents().unwrap().wrap( '<input class="comments_modify_accept">' );
    	
   		//삭제랑 수정버튼 숨기기
        $("#comments_remove_btn").hide();
        $("#comments_modify_btn").hide();
        
        //수정완료버튼 생성
        $(this).wrap("<li id='comments_modify_accept_btn'>수정 완료</li>");
        
        //수정완료버튼 누르면 실행되는 function
        $(".chat").on("click", "#comments_modify_accept_btn", function(e){
        	var comments_content = $(".comments_modify_accept").val();
        	var comments = {comments_seq : comments_no, comments_content: comments_content};
            
            CommentsService.commentsModify(comments, function(result){
                  
    	        alert(result);
    	        showList(pageNum);//수정후엔 1페이지가 아닌 수정전에 있던 페이지로 이동
            });
        });
        
      });
    
    
	
    //삭제버튼
    $(".chat").on("click", "#comments_remove_btn", function(e){
      	  
    	  var comments_seq = $(this).data("seq");
    	  
    	  console.log("comments_seq : "+ comments_seq);
    	  
    	  CommentsService.commentsRemove(comments_seq, function(result){
    	        
    	  alert(result);
    	  showList(pageNum);//삭제 후엔 삭제 직전에 있던 페이지로 이동
    	  });
    	});
      //end modalRemoveBtn 
    
    //신고하기 모달
    $(".chat").on("click", "#report_register_btn", function(e){
    	e.preventDefault();
    	var comments_seq = $(this).data("seq");
    	
    	modal('#report_modal');
    	$("html, body").css("overflow",'hidden');
    	
    	//신고하기
    	$('.reportAddBtn').on('click', function(e) {
	    	e.preventDefault();
	    	var report = {
	        		report_reason : $("#report_content").val(),
	        		comments_content : comments_seq,
	        		member_seq : memValue
	        }
	    	
	    	
	    	//CommentsService.commentsReportRegister(report, function(result){
	    	//alert(result);
	    	//$("#bg").remove();
	        //$('#report_modal').css("display",'none');
	        //$("html, body").css("overflow",'auto');
	    });
    	console.log("member_seq : "+ memValue);
    	
    });
    
    
    function modal(id) {
	    var zIndex = 9999;
	    
	    // 모달 div 뒤에 희끄무레한 레이어
	    var bg = $('document').wrap('<div class="bg></div>"');
	    $("#bg").css({
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
	    	$("#bg").remove();
	        $('#report_modal').css("display",'none');
	        $("html, body").css("overflow",'auto');
	    });
	
	    $('#report_modal').css({
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
    
    
	
	//댓글저장 버튼
    /*modalRegisterBtn.on("click",function(e){
    	
    	//console.log("here!!  ->  "+ $(this).val());
        //console.log("here!!!  ->  "+ $(this).html());
    	
	    var comments = {
	    	  comments_content: modalInputReply.val(),
	          member_seq:$("#my_member_seq").val(),
	          board_seq:bnoValue
	    };
	    CommentsService.commentsRegister(comments, function(result){
	      
		    alert(result);
		      
		    $(".modal").find("input").val("");
		    $(".modal").hide();
		      
		    //showList(1);
		    showList(-1);
	    });
    });*/
	//end modalRegister  
	    
	  //댓글 조회 클릭 이벤트 처리 
    /*$(".chat").on("click", "li", function(e){
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
    });*/

    
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
		  str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'><</a></li>";
		}
		
		for(var i = startNum ; i <= endNum; i++){
		  var active = pageNum == i? "active":"";
		  str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
		}
		
		if(next){
		  str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>></a></li>";
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
		console.log("remove_seq : "+comments_seq);
		$.ajax({
			type : 'delete',
			url : '/comments/' + comments_seq,
			beforeSend: function(xhr) {
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue)
			},
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

		console.log("comments_seq :: " + comments.comments_seq);
		console.log("comments_content :: " + comments.comments_content);

		$.ajax({
			type : 'put',
			url : '/comments/' + comments.comments_seq,
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
	
	
	function commentsReportRegister(report, callback, error){
		console.log("report_content : "+ report.report_reason);
		
		/*$.ajax({
			type : 'put',
			url : '/report/' + report.comments_seq,
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
		});*/
	}
	
	return{
		commentsRegister:add,
		commentsList:getList,
		commentsRemove:remove,
		commentsModify:update,
		commentsRead:get,
		displayTime:displayTime,
		commentsReportRegister:commentsReportRegister
	};
	
	
})();
