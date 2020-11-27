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
	
//	console.log($('#inquiry-submit'));
	
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
	
	$('#product-inquiry-list').on('click', 'button.hw-inquiry-modify',function(e){
		var parent = $(this).closest('.comment-list');
		
		var pi_type = parent.find('p.date').text();
		var contents = parent.find('p.comment').text();
		var pi_seq = parent.find('.inquiry-seq').text();
		
		
		$('#exampleModal input[name=pi_type]').each(function(index, item){
			if($(item).attr('value')==pi_type){
				$(item).attr('checked', 'true');
			}
		});
		
		$('#exampleModal textarea.form-control').val(contents);
		$('#exampleModal #pi_seq').val(pi_seq);
	});
	
	$('#inquiry-modify').click(function(e){
		e.preventDefault();
		
		$.ajax({
			url:"/productInquiry/modify",
			type : "post",
			data : $('#my-form').serialize(),
			success : function(data){
				if(data){
					alert("문의가 수정되었습니다.");
					
					var inquiry;
					
					$('.comment-list').each(function(index,item){
						console.log($(this).find('.inquiry-seq').text());
						console.log(data.pi_seq);
						if($(this).find('.inquiry-seq').text() == data.pi_seq){
							inquiry=$(this);
							return;
						}
					});
					
					inquiry.find('.date').text(data.pi_type);
					inquiry.find('.comment').text(data.pi_content);
					
					$('#exampleModal').modal("hide");
				}else{
					alert("양식을 다시 확인해주세요.");
				}
			}
			
			
		});
		
	});
	
	$('#inquiry-remove').click(function(e){
		e.preventDefault();
		
		var tokken_name = $('#security-tokken').attr('name');
		var tokken_value = $('#security-tokken').attr('value');
		
		
		$.ajax({
			url:"/productInquiry/remove/"+$("#my-form #pi_seq").val(),
			type : "post",
			data : { _csrf :tokken_value },
			success : function(data){
				if(data){
					alert("문의가 삭제 처리되었습니다.");
					
					$('.comment-list').each(function(index,item){
						if($(this).find('.inquiry-seq').text() == data){
							$(this).remove();
							return;
						}
					});
					
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
