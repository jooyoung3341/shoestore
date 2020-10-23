<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>
<meta charset="UTF-8">
<title>Insert title here</title>
<%--
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
--%>

</head>
<body>
<div class="page-main">
	<div class="my-3 my-md-5">
		<div class="container">
			<div class="row">
				<div class="col-8"> 
					<form method="post" class="card" name="form" enctype="multipart/form-data" 
						     action='<c:url value="/shoesRegister?${_csrf.parameterName}=${_csrf.token}"/> ' onsubmit="return check()">
					<div class="card-header">
						<h3 class="card-title">
							신발 업로드
						</h3>
					</div>
					<div class="card-body">
						<div class="col-lg-8">
							<div class="form-group">
								<label class="form-label">신발 이름</label>
								<input type="text" class="form-control" id="shoesname" name="shoesname" required="required">
							</div>
							
							<div class="form-group">
								<label class="form-label">가격</label>
								<div class="input-group">
									<input type="text" class="form-control" id="price" name="price" maxlength="8" required="required">
								</div>
							</div>
							
							<div class="form-group">
								<div class="form-label">신발 이미지</div>
								<div class="custom-file">
									<input type="file" class="custom-file-input" id="image" name="image" required="required">
									<label class="custom-file-label">사진</label>
									<div class="card p-3">
										<img id="img" class="rounded">
									</div>
								</div>
							</div>
							
							<div class="form-group">
								<label class="form-label">브랜드</label>
								<div class="selectgroup w-100">
									<label class="selectgroup-item">
										<input type="radio" name="bno" id="bno" value="1" class="selectgroup-input" required="required">
										<span class="selectgroup-button">Nike</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="bno" id="bno" value="2" class="selectgroup-input">
										<span class="selectgroup-button">Adidas</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="bno" id="bno" value="3" class="selectgroup-input">
										<span class="selectgroup-button">New Balance</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="bno" id="bno" value="4" class="selectgroup-input">
										<span class="selectgroup-button">Puma</span>
									</label>
								</div>
							</div>
							
							<div class="form-group">
								<label class="form-label">종류</label>
								<div class="selectgroup w-100">
									<label class="selectgroup-item">
										<input type="radio" name="kno" id="kno" value="1" class="selectgroup-input" required="required"> 
										<span class="selectgroup-button">런닝화</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="kno" id="kno" value="2" class="selectgroup-input">
										<span class="selectgroup-button">단화</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="kno" id="kno" value="3" class="selectgroup-input">
										<span class="selectgroup-button">슬리퍼</span>
									</label>
									<label class="selectgroup-item">
										<input type="radio" name="kno" id="kno" value="4" class="selectgroup-input">
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
										<label class="colorinput">
											<input type="radio" id="color" name="color"  value="white" class="colorinput-input" required="required">
											<span class="colorinput-color bg-blue-lightest"></span>
										</label>
									</div>
									
									<div class="col-auto">
										<label class="colorinput">
											<input type="radio" id="color" name="color" value="blue" class="colorinput-input">
											<span class="colorinput-color bg-blue"></span>
										</label>
									</div>
									
									<div class="col-auto">	
										<label class="colorinput">
											<input type="radio" id="color" name="color" value="red" class="colorinput-input">
											<span class="colorinput-color bg-red"></span>
										</label>
									</div>
									
									<div class="col-auto">
										<label class="colorinput">
											<input type="radio" id="color" name="color" value="green" class="colorinput-input">
											<span class="colorinput-color bg-green"></span>
										</label>
									</div>
									
									<div class="col-auto">
										<label class="colorinput">
											<input type="radio" id="color" name="color" value="yellow" class="colorinput-input">
											<span class="colorinput-color bg-yellow"></span>
										</label>
									</div>
									
									<div class="col-auto">
										<label class="colorinput">
											<input type="radio" id="color" name="color" value="gray" class="colorinput-input">
											<span class="colorinput-color bg-gray"></span>
										</label>
									</div>
									
									<div class="col-auto">
										<label class="colorinput">
											<input type="radio" id="color" name="color" value="black" class="colorinput-input">
											<span class="colorinput-color bg-gray-dark"></span>
										</label>
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


<script>
$(document).ready(function(){
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	$(document).ajaxSend(function(e, xhr, options){
		xhr.setRequestHeader(header, token);
	});
})

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


 /* 신발 업로드 전 체크 */
function check(){
	//가격에 콤마 제거
	var price = $("#price").val();
	$("#price").val(price.replace(/[^\d]+/g, ""));
	
}


 
var filename = "";
//이미지 변경 될떄마다 실행
$("#image").on("change", function(){
	//미리보기 함수 호출
	preview(this);
})
function preview(input){
	if(input.files && input.files[0]){
		filename = input.files[0].name;
		//사진 뒤 3글자 가져와서 jpg, gif, png인지 확인
		var ext = filename.substr(filename.length - 3, filename.length);
		var isCheck = false;
		if((ext.toLowerCase() == "jpg" || ext.toLowerCase() == "gif" || ext.toLowerCase() == "png")){
				isCheck = true;
			};
			if(isCheck == false){
				alert("jpg나 gif, png 만 업로드가 가능합니다.");
				return;
			};
		//load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료되었을 떄마다 발생한다.	
		var reader = new FileReader();				
		//읽기가 성공하면 읽기 결과를 표시한다.
		reader.onload = function(e){
			$("#img").attr("src", e.target.result);
				/* document.getElementById("img").src = e.target.result; */
			}
		//readAsDataURL : 컨텐츠를 특정 Blob이나 File에서 읽어 오는 역할
		reader.readAsDataURL(input.files[0]);
		}	
	};

</script>
</body>
</html>