<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div class="page-main">
	<div class="my-3 my-md-5">
		<div class="container">
			<div class="row">
				<div class="col-8">
					<form method="post" class="card" name="form" enctype="multipart/form-data" 
						     action='<c:url value="/commendShoesRegister?${_csrf.parameterName}=${_csrf.token}"/>' onsubmit="return check()">
					<div class="card-header">
						<h3 class="card-title">
							신발추천 업로드
						</h3>
					</div>
					<div class="card-body"> 
						<div class="col-lg-8">
							<div class="form-group">
								<label class="form-label">아이디</label>
								<input type="text" class="form-control" id="id" name="id" value='<sec:authentication property="Principal"/>' readonly>
							</div>
							
							<div class="form-group">
								<label class="form-label">제목</label>
								<input type="text" class="form-control" id="title" name="title" required="required">
							</div>
							
							<div class="form-group">
								<label class="form-label">신발 이미지</label>
								<div class="custom-file"> 
									<input type="file" class="custom-file-input" id="image" name="image" required="required">
									<label class="custom-file-label">사진</label>
									<div class="card p-3">
										<img id="img" class="rounded">
									</div>
								</div>
							</div>
						
							<div class="form-group mb-0">
								<label class="form-label">상세 설명</label>
								<textarea id="contents" name="contents" rows="5" class="form-control" required="required"></textarea>
							</div>
							
							<div class="form-footer">
								<button type="submit" class="btn btn-primary btn-block">
									업로드
								</button>
							</div>
						</div>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>