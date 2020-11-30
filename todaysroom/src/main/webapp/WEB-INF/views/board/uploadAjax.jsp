<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100px;
}
</style>
</head>
<body>
	<h1>Upload with Ajax</h1>

	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>

	<div class='uploadResult'>
		<ul>

		</ul>
	</div>

	<button id='uploadBtn'>Upload</button>

	<script src="https://code.jquery.com/jquery-3.3.1.min.js"
		integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
		crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;//5MB

			function checkExtension(fileName, fileSize) {
				if (fileName >= maxSize) {
					alert("파일 사이즈 초과");
					return false;
				}

				if (regex.test(fileName)) {
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}

				return true;
			}

			//업로드 하는 파일목록을 보여주는 메서드
			var uploadResult = $(".uploadResult ul");

			function showUploadedFile(uploadResultArr) {
				var str = "";

				$(uploadResultArr).each(function(i, obj) {
					if (!obj.image) {
						var fileCallPath = encodeURIComponent( obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
						
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						
						str += "<li><div><a href='/download?fileName="+fileCallPath+"'>"+
				           "<img src='/resources/img/attach.png'>"+obj.fileName+"</a>"+
				           "<span data-file=\'"+fileCallPath+"\' data-type='file'> x </span>"+
				           "<div></li>"
					} else {
						//str += "<li>" + obj.fileName + "</li>";
						
						var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
				        
						var originPath = obj.uploadPath+ "\\"+obj.uuid +"_"+obj.fileName;
					       
					    originPath = originPath.replace(new RegExp(/\\/g),"/");
						
						//이미지 파일등 파일이 프로젝트 경로가 아닌 다른 경로에서 가져올 때 사용한다.
						//대충 예를 들어서 c드라이브에서 이미지 가져오려면 이렇게 해야한다.
						str += "<li><a href=\"javascript:showImage(\'"+originPath+"\')\">"+
			              "<img src='display?fileName="+fileCallPath+"'></a>"+
			              "<span data-file=\'"+fileCallPath+"\' data-type='image'> x </span>"+
			              "<li>";
					}
				});

				uploadResult.append(str);
			}

			var cloneObj = $(".uploadDiv").clone();

			$("#uploadBtn").on("click", function(e) {

				var formData = new FormData();//자바스크립트 객체

				var inputFile = $("input[name='uploadFile']");

				var files = inputFile[0].files;

				console.log(files);

				//add filedate to formdata
				for (var i = 0; i < files.length; i++) {
					if (!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
					formData.append("uploadFile", files[i]);
				}

				$.ajax({
					url : '/uploadAjaxAction',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);

						showUploadedFile(result);

						//파일 업로드에 성공하면 복사한 cloneObj를 다시 추가해서 초기화시킨다.
						$(".uploadDiv").html(cloneObj.html());
					}
				}); //$.ajax

			});
			
			$(".uploadResult").on("click","span", function(e){
				   
				  var targetFile = $(this).data("file");
				  var type = $(this).data("type");
				  console.log(targetFile);
				  
				  $.ajax({
				    url: '/deleteFile',
				    data: {fileName: targetFile, type:type},
				    dataType:'text',
				    type: 'POST',
				      success: function(result){
				         alert(result);
				       }
				  }); //$.ajax
				  
				  $(this).parents("li").remove();
			});

		});
	</script>

</body>
</html>
