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
					<form method="post" class="card" name="form" enctype="multipart/form-data" onsubmit="return check()">
					<div class="card-header">
						<h3 class="card-title">
							<font style="vertical-align: inherit;">신발 업로드</font>
						</h3>
					</div>
					<div class="card-body">
						<div class="col-lg-8">
							<div class="form-group">
								<label class="form-label">신발 이름</label>
								<input type="text" class="form-control" id="shoesname" name="shoesname">
							</div>
							<div class="form-group">
								<label class="form-label">가격</label>
								<div class="input-group">
									<input type="text" class="form-control" id="price" name="price" maxlength="8">
								</div>
							</div>
							<div class="form-group">
								<div class="form-label">
									<font style="vertical-align: inherit;">신발 이미지</font>
								</div>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="image" name="image">
									<label class="custom-file-label">사진</label>
								</div>
							</div>
							<div class="form-group">
								<label class="form-label">브랜드</label>
								<div class="selectgroup w-100">
									<label class="selectgroup-item">
										<input type="radio" name="brand" id="brand" value="1" class="selectgroup-input">
										<span class="selectgroup-button">Nike</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="brand" id="brand" value="2" class="selectgroup-input">
										<span class="selectgroup-button">Adidas</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="brand" id="brand" value="3" class="selectgroup-input">
										<span class="selectgroup-button">New Balance</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="brand" id="brand" value="4" class="selectgroup-input">
										<span class="selectgroup-button">Puma</span>
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="form-label">종류</label>
								<div class="selectgroup w-100">
									<label class="selectgroup-item">
										<input type="radio" name="kind" id="kind" value="1" class="selectgroup-input">
										<span class="selectgroup-button">런닝화</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="kind" id="kind" value="2" class="selectgroup-input">
										<span class="selectgroup-button">단화</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="kind" id="kind" value="3" class="selectgroup-input">
										<span class="selectgroup-button">슬리퍼</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="kind" id="kind" value="4" class="selectgroup-input">
										<span class="selectgroup-button">운동화</span>
									</label>
								</div>
							</div>
							<div class="form-group">
								<label class="form-label">
									<font style="vertical-align: inherit;">색상</font>
								</label>
								<div class="row gutters-xs">
									<div class="col-auto">
										<label lass="colorinput">
											<input type="radio" id="color" name="color" class="colorinput-input">
											<span class="colorinput-color bg-blue-lightest"></span>
										</label>
									</div>
									<div class="col-auto">
										<label lass="colorinput">
											<input type="radio" id="color" name="color" class="colorinput-input">
											<span class="colorinput-color bg-blue"></span>
										</label>
									</div>
									<div class="col-auto">
										<label lass="colorinput">
											<input type="radio" id="color" name="color" value="red" class="colorinput-input">
											<span class="colorinput-color bg-red"></span>
										</label>
									</div>
									<div class="col-auto">
										<label lass="colorinput">
											<input type="radio" id="color" name="color" class="colorinput-input">
											<span class="colorinput-color bg-green"></span>
										</label>
									</div>
									<div class="col-auto">
										<label lass="colorinput">
											<input type="radio" id="color" name="color" class="colorinput-input">
											<span class="colorinput-color bg-yellow"></span>
										</label>
									</div>
									<div class="col-auto">
										<label lass="colorinput">
											<input type="radio" id="color" name="color" class="colorinput-input">
											<span class="colorinput-color bg-gray"></span>
										</label>
									</div>
									<div class="col-auto">
										<label lass="colorinput">
											<input type="radio" id="color" name="color" class="colorinput-input">
											<span class="colorinput-color bg-gray-dark"></span>
										</label>
									</div>
								</div>
							</div>
							<div class="form-group mb-0">
								<label class="form-label">상세 설명</label>
								<textarea id="contents" name="contents" rows="5" class="form-control" ></textarea>
							</div>
							<div class="form-footer">
								<button class="btn btn-primary btn-block">
									<font style="vertical-align: inherit;">업로드</font>
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


<script>
comma();
//실시간 콤마 찍기
function comma(){
var price_comma = $("form[name='form']").find("input[name='price']");
price_comma.on("keyup", function(event){
 	    // 입력 된 값을 price_comma에 넣어준다
         var $this = $(this);
         price_comma= $this.val();
         //특수문자, 공백 등 제거하는 정규식
         price_comma = price_comma.replace(/[\D\s\._\-]+/g, "");
         //text를 정수로 변환한다. parseInt함수를 사용하여 Number 타입으로 변환
         price_comma = price_comma ? parseInt( price_comma, 10 ) : 0;
         // 1,000 단위별로 comma를 추가하기 위해 toLocaleString 함수 적용
         //
         $this.val( function() {
             return ( price_comma == 0 ) ? "" : price_comma.toLocaleString( "en" );
         });
 	})
}

/* $(document).ready(function(){
	$("#shoesRegister").submit(function(){
		var price = $("#price").val();

	})
})
 */
function check(){
	var price = $("#price").val();


	$("#price").val(price.replace(/[^\d]+/g, ""));

}

</script>
</body>
</html>