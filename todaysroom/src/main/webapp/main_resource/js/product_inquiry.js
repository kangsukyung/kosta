$(function(){
	$('#exampleModal').on('show.bs.modal', function (event) {
	  var button = $(event.relatedTarget) // Button that triggered the modal
	  var recipient = button.data('whatever') // Extract info from data-* attributes
	  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
	  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
	  var modal = $(this)
//	  modal.find('.modal-title').text('New message to ' + recipient)
//	  modal.find('.modal-body input').val(recipient)
	});
	
	console.log($('#inquiry-submit'));
	
	$('#inquiry-submit').click(function(e){
		e.preventDefault();
		
		$.ajax({
			url:"/productInquiry/register",
			type : "post",
			data : $('#my-form').serialize(),
			success : function(data){
				if(data>0){
					alert("문의가 접수되었습니다.");
					$('#exampleModal').modal("hide");
				}else{
					alert("양식을 다시 확인해주세요.");
				}
			}
			
			
		});
		
	});
	
	$('.btn-reply').on('click', function(e){
		e.preventDefault();
		
		$(this).parent().parent().parent().parent().find($('form')).remove();
		
		var hidden = $(this).parent().parent().find('.inquiry-seq').text();
		
		var html = '';
		html += '<form action="">';
		html += '<input hidden="hidden" name="pi_seq" value="'+hidden+'">';
		html += '<input name="pi_answer" placeholder="답변하기">';
		html += '<button>답글 등록</button></form>';
		
		$(this).parent().parent().append(html);
	});
	
	$('.comment-list').on('click', 'form button', function(e){
		e.preventDefault();
		
		console.log("1");
		
		$.ajax({
			url : "productInquiry/insertProductInquiryAnswer.do",
			type : "post",
			data : $(this).parent().serialize(),
			success : function(data){
				console.log(data);
				if(data>0){
					alert("등록되었습니다.");
					location.reload();
				}else{
					alert("답변 등록에 실패하였습니다.");
				}
			}
			
		});
	});
})
