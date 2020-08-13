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
<div class="page-single">
	<div class="container">
		<div class="row">
			<div class="col col-login mx-auto">
				<form class="card" method="post" action='<c:url value="/login"/>'>
					<div class="card-body p-6">
						<div class="card-title">로그인</div>
						<div class="form-group">
							<label class="form-label">
								<font style="vertical-align: inherit;">아이디</font>
							</label>
							<input type="text" class="form-control" id="id" name="id" placeholder="아이디 입력">
						</div>
						<div class="form-group">
							<label class="form-label">
								<font style="vertical-align: inherit;">비밀번호</font>
							</label>
							<input type="password" class="form-control" id="pw" name="pw" placeholder="비밀번호 입력">
						</div>
						<div class="form-footer">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
							<button type="submit" class="btn btn-primary btn-block">
								<font style="vertical-align: inherit;">로그인</font>
							</button>
							<button type="button" class="btn btn-primary btn-block" id="signupModal">
								<font style="vertical-align: inherit;">회원가입</font>
							</button>
							
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

				





<!-- Modal -->
<div class="modal fade" id="signup_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <!-- <span aria-hidden="true">&times;</span> -->
        </button>
      </div>
      <div class="modal-body">
      <form class="contactForm" id="signupForm">
      <input type="hidden" id="authority_name" value="ROLE_USER"> 
      		<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label class="label">
							<font style="vertical-align: inherit;">
								아이디
							</font>
						</label>
						<input type="text" class="form-control" id="signup_id" placeholder="아이디" onblur="confirmId()">
						<div id="id_div"></div>
					</div>
					<div class="form-group">
						<label class="label">
							<font style="vertical-align: inherit;">
								비밀번호
							</font>
						</label>
						<input type="password" class="form-control" id="signup_pw" placeholder="비밀번호">
					</div>
					<div class="form-group">
						<label class="label">
							<font style="vertical-align: inherit;">
								비밀번호 확인
							</font>
						</label>
						<input type="password" class="form-control" id="confirmpw" placeholder="비밀번호 확인">
					</div>
					<div class="form-group">
						<label class="label">
							<font style="vertical-align: inherit;">
								주소
							</font>
						</label>
						<input type="text" class="form-control" id="signup_address" placeholder="주소">
					</div>

					<div class="form-group">
						<font style="vertical-align: inherit;">
							<input type="button" class="btn btn-primary" id="signup" value="회원 등록" data-target="#staticBackdrop">
						</font>
					</div>
				</div>
			</div>
      </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
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

/* 회원가입 모달 창 오픈 */
$("#signupModal").click(function(){
	$("#signup_modal").modal();
})

/* 모달창 초기화 */
$("#signup_modal").on("hide.bs.modal", function(){
	$("#signupForm")[0].reset();
})

/* id 중복 체크 */
var idCheck = false;
function confirmId(){
	var id = $("#signup_id").val();

	if(id.search(/\s/) != -1){
		alert("아이디에 공백은 사용할 수 없습니다.");
	}else{
		$.ajax({
				url : "user/id_check",
				data : {"id" : id},
				dataType : "json",
				success : function(data){
					alert(id);
						if(data.result == true){
							idCheck = true;
						}else{
							alert("중복된 아이디입니다.");
							idCheck = false;
						}
					}
			})	
	}
}

/* 회원 등록 */
$("#signup").click(function(){
	var id = $("#signup_id").val();
	var pw = $("#signup_pw").val();	
	var confirmpw = $("#confirmpw").val();
	var address = $("#signup_address").val();
	var authority_name = $("#authority_name").val();
	if(idCheck == false || id < 1){
		alert("아이디를 입력 하셔야 합니다.");
	}else if(pw.length < 1){
		alert("비밀번호를 입력 하셔야 합니다.");
	}else if(pw.length < 5){
		alert("비밀번호는 5자이상 이여야 합니다.");
	}else if(pw != confirmpw){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	}else if(address.length < 1){
		alert("주소를 입력 하셔야 합니다.")
	}else
		$.ajax({
				url : "user/signup",
				type : "post",
				data : {"id" : id,
						   "pw" : pw,
						   "address" : address,
						   "authority_name" : authority_name},
				dataType : "text",
				success : function(){
					$("#signupForm")[0].reset();
					$("#signup_modal").modal("hide");
					alert("회원가입 완료 !");	
				}
		})
})



</script>
</body>
</html>