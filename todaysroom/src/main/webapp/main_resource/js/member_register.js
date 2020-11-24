var memberRegister=(function() {	
	function idCheck(userid,callback,error) {
		console.log(userid);
		var id=userid;
	
		
		$.ajax({
			type:'GET',
			url : '/members/'+id,
			data : JSON.stringify(id),
			contentType : "application/json; chareset=uft-8",
			success : function(result, status, xhr) {
				console.log(result);
				if(callback){	
					callback(result);
				}
			},
			error : function(xhr,status,er) {
				console.log(er);
				if(error){
					error(er);
				}
			}
		})
	}
	
	function nameCheck(userName,callback,error) {
		console.log(userName);
		var name=userName;
		
		$.ajax({
			type:'GET',
			url : '/members/nickNameCheck/'+name,
			contentType : "application/json; chareset=uft-8",
			success : function(result, status, xhr) {
				console.log(result);
				if(callback){	
					callback(result);
				}
			},
			error : function(xhr,status,er) {
				console.log(er);
				if(error){
					error(er);
				}
			}
		})
	}

	
	return {idCheck : idCheck
		   ,nameCheck : nameCheck};
})();

function openZipSearch(address) {
    new daum.Postcode({
          oncomplete: function(data) {
              $('[name='+address.name+']').val(data.address);
          }
    }).open();
} 