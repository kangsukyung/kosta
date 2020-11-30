$(function(){
	var empJ = /\s/g;//모든 공백체크 정규식
	var idJ = /^[a-z0-9]{6,12}$/;//아이디 정규식
	var pwJ = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var nameJ = /^[가-힣]{2,6}$/;// 이름 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;// 휴대폰 번호 정규식
//	var nameJ = /([^가-힣\x20a-zA-Z])/i; // 이름 정규식
//	var nameJ =  /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;// 이름 정규식
//	var pwJ = /^[A-Za-z0-9]{4,12}$/;// 비밀번호 정규식
//	var mailJ = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
	
	$('#member_id').blur(function(){
		if(idJ.test($(this).val())){
			$("#id_check").css('display','none');
		}else {
			$('#id_check').text('아이디를 확인해주세요');
			$('#id_check').css('color', 'red');
		}
	});
	
	$('#member_name').blur(function(){
		if(nameJ.test($(this).val())){
			$("#name_check").css('display','none');
		}else {
			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', 'red');
		}
	});
	
	$('#member_email').blur(function(){
		if(mailJ.test($(this).val())){
			$("#mail_check").css('display','none');
		} else {
			$('#mail_check').text('메일을 확인해주세요');
			$('#mail_check').css('color', 'red');
		}
	});

	
	$('#member_phone').blur(function(){
		if(phoneJ.test($(this).val())){
			$("#phone_check").css('display','none');
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요');
			$('#phone_check').css('color', 'red');
		}
	});
	
	$('#member_password').blur(function(){
		if(pwJ.test($(this).val())){
			$("#password_check").css('display','none');
		} else {
			$('#password_check').text('비밀번호를 확인해주세요');
			$('#password_check').css('color', 'red');
		}
	});

    $('#userPwChk').blur(function(){

        if($('#member_password').val() != $('#userPwChk').val()){
          $('#userPwChk').val('');
          $('#chkNotice').css('display','block');
          $('#chkNotice').css('color', 'red');
        } else{
          $('#chkNotice').css('display','none');
        }
        
    });
});