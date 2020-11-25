<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function pressEnter() {
		var str = "<div>Hi</div>";
		$(.enterkeyboom).append(str);
	}
</script>
</head>
<body>
	텍스트 :
	<input type="text" onKeyDown="if(event.keyCode == 13) pressEnter()">
	
	<div class="enterkeyboom">
	
	</div>
</body>
</html>