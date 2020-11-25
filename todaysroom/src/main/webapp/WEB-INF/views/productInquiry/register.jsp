<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="/main_resource/vendors/bootstrap/bootstrap.min.css">
<script src="/main_resource/vendors/jquery/jquery-3.2.1.min.js"></script>
<script
	src="/main_resource/vendors/bootstrap/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="/main_resource/js/product_inquiry.js"></script> 
</head>
<body>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal">문의하기</button>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="exampleModalLabel">상품 문의하기</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="my-form">
						<div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-default btn-lg"> <input
								type="radio" name="pi_type" value="product"> 상품
							</label> <label class="btn btn-default btn-lg"> <input
								type="radio" name="pi_type" value="shipping"> 배송
							</label> <label class="btn btn-default btn-lg"> <input
								type="radio" name="pi_type" value="return"> 반품
							</label> <label class="btn btn-default btn-lg"> <input
								type="radio" name="pi_type" value="exchange"> 교환
							</label> <label class="btn btn-default btn-lg"> <input
								type="radio" name="pi_type" value="refund"> 환불
							</label> <label class="btn btn-default btn-lg"> <input
								type="radio" name="pi_type" value="etc"> 기타
							</label>
						</div>
						<div class="form-group">
							<label for="message-text" class="control-label">문의내용</label>
							<textarea class="form-control" id="message-text" name="pi_content"></textarea>
						</div>
						<input hidden="hidden" name="member_seq" value="22"> <!-- value 값 추후 조정 필요 -->
						<input hidden="hidden" name="product_seq" value="1">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<!--csrf 토큰 처리 -->
					</form>
					<div>문의내용에 대한 답변은 ‘마이페이지 &gt; 나의 쇼핑 &gt; 나의 문의내역’ 또는 ‘상품
						상세페이지’에서 확인 가능합니다.</div>
				</div>
				<div class="modal-footer">
					<button type="submit" form="my-form" class="btn btn-primary" id="inquiry-submit">문의하기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>