<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="../../../main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
	<script src="../../../main_resource/vendors/skrollr.min.js"></script>
	<script src="../../../main_resource/vendors/owl-carousel/owl.carousel.min.js"></script>
	<script src="../../../main_resource/vendors/nice-select/jquery.nice-select.min.js"></script>
	<script src="../../../main_resource/vendors/jquery.ajaxchimp.min.js"></script>
	<script src="../../../main_resource/vendors/mail-script.js"></script>

<link rel="icon" href="../../../main_resource/img/Fevicon.png" type="image/png">
<link rel="stylesheet" href="../../../main_resource/vendors/bootstrap/bootstrap.min.css">
<link rel="stylesheet" href="../../../main_resource/vendors/fontawesome/css/all.min.css">
<link rel="stylesheet" href="../../../main_resource/vendors/themify-icons/themify-icons.css">
<link rel="stylesheet" href="../../../main_resource/vendors/linericon/style.css">
<link rel="stylesheet" href="../../../main_resource/vendors/owl-carousel/owl.theme.default.min.css">
<link rel="stylesheet" href="../../../main_resource/vendors/owl-carousel/owl.carousel.min.css">

<link rel="stylesheet" href="../../../main_resource/css/style.css">
<link rel="stylesheet" href="../../../main_resource/css/comments.css">

<html>
<body>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Board Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Board Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

          <div class="form-group">
          <label>Bno</label> <input class="form-control" name='bno'
            value='<c:out value="${board.board_seq }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Title</label> <input class="form-control" name='title'
            value='<c:out value="${board.board_title }"/>' readonly="readonly">
        </div>

        <div class="form-group">
          <label>Text area</label>
          <textarea class="form-control" rows="3" name='content'
            readonly="readonly"><c:out value="${board.board_content}" /></textarea>
        </div>

        <div class="form-group">
          <label>Writer</label> <input class="form-control" name='writer'
            value='<c:out value="${board.member_seq }"/>' readonly="readonly">
        </div>

		<button data-oper='modify' class="btn btn-default">
        <a href="/board/modify?bno=<c:out value="${board.board_seq}"/>">Modify</a></button>
        <button data-oper='list' class="btn btn-info">
        <a href="/board/list">List</a></button>


<button data-oper='modify' class="btn btn-default">Modify</button>
<button data-oper='list' class="btn btn-info">List</button>

<form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.board_seq}"/>'>
</form>


<form id='operForm' action="/boad/modify" method="get">
  <input type='hidden' id='bno' name='bno' value='<c:out value="${board.board_seq}"/>'>
  <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
  <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
  <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>  
 
</form> 



      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<div class='row'>
	<div class="col-lg-12">
		<!-- /.panel -->
		<div class="panel panel-default">
			<!--       <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
      </div> -->
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
				<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
			</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<ul class="chat">
				</ul>
				<!-- ./ end ul -->
			</div>
			<!-- /.panel .chat-panel -->
			<div class="panel-footer"></div>
		</div>
	</div>
	<!-- ./ end row -->
</div>

<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>Reply</label> 
                <input class="form-control" name='comments_content' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>Replyer</label> 
                <input class="form-control" name='member_seq' value='replyer'>
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='admin_seq' value='2018-01-01 13:13'>
              </div>
      
            </div>
			<div class="modal-footer">
		        <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
		        <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
		        <button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
		        <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
	      	</div>          
      	</div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

</body>
</html>	
<script type="text/javascript" src="../../../resources/js/reply.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  
	//var bnoValue = '<c:out value="${comments.board_seq}"/>';
	var bnoValue = 11;
	var replyUL = $(".chat");
	//var member_seq = 0;
	showList(1);
	  
	function showList(page){
		CommentsService.commentsList({board_seq:bnoValue,page: page|| 1 }, function(replyCnt, commentsList) {
			
			console.log("replyCnt : "+ replyCnt );
		    console.log("commentsList : " + commentsList);
		    console.log(commentsList);
			
		    if(page == -1){
		    	pageNum = Math.ceil(replyCnt/10.0);
		    	showList(pageNum);
		    	return;
		    }
		    
			var str="";
			if(commentsList == null || commentsList.length == 0){
				//replyUL.html("");
				return;
			}
			for (var i = 0, len = commentsList.length || 0; i < len; i++) {
			       str +="<li class='left clearfix' data-comments_seq='"+commentsList[i].comments_seq+"'>";// name='"+commentsList[i].member_seq+"'
			       str +="  <div><div class='header'><strong class='primary-font'>["
			    	   +commentsList[i].comments_seq+"] "+commentsList[i].member_seq+"</strong>"; 
			       str +="    <small class='pull-right text-muted'>"
			           +CommentsService.displayTime(commentsList[i].admin_seq)+"</small></div>";
			       str +="    <p>"+commentsList[i].comments_content+"</p></div></li>";
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
	          board_seq:bnoValue,
	          admin_seq:1
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
    var replyPageFooter = $(".panel-footer");
      
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
</script>

