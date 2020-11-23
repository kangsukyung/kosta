

function ajax(){
	  
	 
    var data = $("form").serialize() ;

    var option = {
    	    url : url,
    	    type : "post",
    	    data : $("#form").serialize(),
    	    success : function(data) {
    	     alert(data);
    	    }
    	   };
    	   $("#form").ajaxSubmit(option);
	


}

