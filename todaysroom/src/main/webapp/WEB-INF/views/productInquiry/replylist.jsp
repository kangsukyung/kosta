<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">
<link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>
<script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
<script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
<script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>
<script src="/resources/dist/js/sb-admin-2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<style type="text/css">

#regBtn {
	border: groove;
}

.replyLimit{

	text-overflow: ellipsis;
	white-space  : nowrap;
	overflow     : hidden;
	
}



</style>

</head>

<body>
<%@include file="../includes/header.jsp"%>
	<div id="wrapper">

		<div id="page-wrapper" style="margin: 0 0 0 0; min-height: auto;">


			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header">
						<a href="/productInquiry/replylist" style="color: #222; font-weight: bold;">상품 문의 목록</a>
					</h1>
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<!-- /.row -->

			<div class="row">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading" style="height: 55px;">
							<button style="font-size: large;" id='regBtn1' type="button" class="btn pull-left" value="all">전체 상품 보기</button>
							<button style="font-size: large;" id='regBtn2' type="button" class="btn pull-left" value="no_answer">답변 미등록 상품보기</button>
							<button style="font-size: large;" id='regBtn3' type="button" class="btn pull-left" value="yes_answer">답변 등록 상품보기</button>
						</div>

						<!-- /.panel-heading -->
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover" style="table-layout: fixed;">
								<thead>
									<tr>
										<th>번호</th>
										<th>상품명</th>
										<th>질문내용</th>
										<th>답변내용</th>
<!-- 										<th></th> -->
									</tr>
								</thead>

								<c:forEach items="${replylist}" var="reply">
									<tr>
										<td><c:out value="${reply.pi_seq}"/></td>

										<td><a class='move' href='<c:out value="${reply.pi_seq}"/>'>
												<c:out value="${reply.pi_type}"/>
											</a>
										</td>

										<td class="replyLimit"><c:out value="${reply.pi_content}"/></td>
										<td class="replyLimit"><c:out value="${reply.pi_answer}"/></td>
<!-- 										<td style="width: 10%; text-align: center;"><button>답변 등록하기</button></td> -->
									</tr>
								</c:forEach>
							</table>

							<div class='row'>
								<div class="col-lg-12">

									<form id='searchForm' action="/productInquiry/replylist" method='get'>
										<select name='type'>
											<option value=""
												<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
											<option value="T"
												<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
											<option value="C"
												<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
											<option value="W"
												<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
											<option value="TC"
												<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
												or 내용</option>
											<option value="TW"
												<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
												or 작성자</option>
											<option value="TWC"
												<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
												or 내용 or 작성자</option>
										</select> 
											<input type='text' name='keyword'
											value='<c:out value="${pageMaker.cri.keyword}"/>' /> 
											<input type='hidden' name='pageNum'
											value='<c:out value="${pageMaker.cri.pageNum}"/>' /> 
											<input type='hidden' name='amount'
											value='<c:out value="${pageMaker.cri.amount}"/>' />
											<input type="hidden" name='result'
											value='<c:out value="${pageMaker.cri.result}"/>' >
											
										<button class='btn btn-default'>Search</button>
									</form>
								</div>
							</div>


							<div class='pull-right'>
								<ul class="pagination">

									<c:if test="${pageMaker.prev}">
										<li class="paginate_button previous"><a
											href="${pageMaker.startPage -1}">Previous</a></li>
									</c:if>

									<c:forEach var="num" begin="${pageMaker.startPage}"
										end="${pageMaker.endPage}">
										<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
											<a href="${num}">${num}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next}">
										<li class="paginate_button next"><a
											href="${pageMaker.endPage +1 }">Next</a></li>
									</c:if>


								</ul>
							</div>
							<!--  end Pagination -->
						</div>

						<form id='actionForm' action="/productInquiry/replylist" method='get'>
							<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
							<input type='hidden' name='amount' value='${pageMaker.cri.amount}'> 
							<input type='hidden' name='type' value='<c:out value="${ pageMaker.cri.type }"/>'> 
							<input type='hidden' name='keyword' value='<c:out value="${ pageMaker.cri.keyword }"/>'>
							<input type="hidden" name="result" value='<c:out value="${pageMaker.cri.result }"/>'>
						</form>

					</div>
					<!--  end panel-body -->
				</div>
				<!-- end panel -->
			</div>
		</div>
		<!-- /.row -->






		<script type="text/javascript">
			$(document).ready(function() {
				var result = '<c:out value="${result}"/>';
				history.replaceState({}, null, null);
				
				$("#regBtn1").on("click", function() {
					var result = $(this).val();
					
					if (result == "all") {
						self.location = "/productInquiry/replylist";
					}
					
				});
				$("#regBtn2").on("click", function() {
					var result = $(this).val();
					
					if (result == "no_answer") {
						self.location = "/productInquiry/replylist?result="+result;
					}
					
				});
				$("#regBtn3").on("click", function() {
					var result = $(this).val();
					
					if (result == "yes_answer") {
						self.location = "/productInquiry/replylist?result="+result;
					}
					
				});

				var actionForm = $("#actionForm");

								
				$(".paginate_button a").on("click", function(e) {
					e.preventDefault();
					console.log('click');
											
					actionForm.find("input[name='pageNum']").val($(this).attr("href"));
					
					actionForm.submit();
				});

								
				$(".move").on("click",function(e) {
					e.preventDefault();
					actionForm.append("<input type='hidden' name='pi_seq' value='"+ $(this).attr("href")+ "'>");
					actionForm.attr("action", "/productInquiry/replyread");
					actionForm.submit();
				});

								
				var searchForm = $("#searchForm");

								
				$("#searchForm button").on("click", function(e) {
					if (!searchForm.find("option:selected").val()) {
						alert("검색종류를 선택하세요");
						return false;
					}

											
					if (!searchForm.find("input[name='keyword']").val()) {
						alert("키워드를 입력하세요");
						return false;
					}

											
					searchForm.find("input[name='pageNum']").val("1");
					e.preventDefault();
					searchForm.submit();
				});
			});
		</script>



	</div>
	<!-- /#page-wrapper -->



	<!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({responsive : true});
			$(".sidebar-nav").attr("class","sidebar-nav navbar-collapse collapse").attr(
					"aria-expanded", 'false').attr("style", "height:1px");
		});
	</script>
<%@include file="../includes/footer.jsp"%>
</body>

</html>