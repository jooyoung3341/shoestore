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
<sec:authorize access="isAuthenticated()">  
    
     <a href="commendshoesregister">	
	 <button type="button" class="btn btn-primary btn-block" id="commend_register">신발 추천 글 작성</button>
	</a>
	</sec:authorize>
	<div class="page-main">
		<div class="my-3 my-md-5">
			<div class="container">
				<c:forEach var="list" items="${commendShoesList}">
					<div class="card card-aside">																															  
						 <a href="#" class="card-aside-column" style="background-image: url(${pageContext.request.contextPath}/resources/commendimage/${list.image})"> </a>
						 	<img src="${pagaContext.request.contextPath}/resources/commendimage/${list.image}" class="rounded">
						 
						 <div class="card-body d-flex flex-column">
						 <a href="#">
						   	<h4>${list.title}</h4>
						</a>	
							<div class="text-muted">${list.contents}</div>
					   		<div class="d-flex align-items-center pt-5 mt-auto">
					     		<div>
					       			<div class="text-default">${list.id}</div>
					       			<small class="d-block text-muted">${list.insert_date}</small>
					     		</div>
					     		<div class="ml-auto text-red">
					       			<a href="#" class="icon d-none d-md-inline-block ml-3"><i class="fe fe-heart mr-1"></i></a>
					     		</div>
					   		</div>
					 	</div>
					</div>
				</c:forEach>
		 	</div>
	 	</div>
	 </div>

<!-- Register Modal -->
<div class="modal fade" id="register_modal" data-backdrop="static" data-keyboard="false" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <!-- <span aria-hidden="true">&times;</span> -->
        </button>
      </div>
      <div class="modal-body">
      <form class="contactForm" id="register_form" method="post" enctype="multipart/form-data" >
      <input type="hidden" id="authority_name" value="ROLE_USER"> 
      		<div class="row">
				<div class="col-md-12">
					<div class="form-group">
						<label class="label">
							<font style="vertical-align: inherit;">
								아이디
							</font>
						</label>
						<%-- <sec:authorize access="isAuthenticated()">  
        <strong><sec:authentication property="id"/></strong>
    </sec:authorize>--%>
							<%-- <sec:authentication property="principal.username" var=""/> --%>
						<%-- 	  <sec:authorize access="isAuthenticated()">  
    </sec:authorize>--%>
    

							<input type="text" class="form-control" id="register_id" value='<sec:authentication property="Principal"/>' readonly>

					</div>
					<div class="form-group">
						<label class="label">
							<font style="vertical-align: inherit;">
								제목 
							</font>
						</label>
						<input type="text" class="form-control" id="register_title" placeholder="제목" >
					</div>
					<div class="form-group">
						<label class="label">
							<font style="vertical-align: inherit;">
								신발 이미지
							</font>
						</label>
						<input type="file" class="custom_file_input" id="register_image">
					</div>

					<div class="form-group">
						<label class="form-label">추천 설명?</label>
						<textarea id="register_contents" rows="5" cols="30" class="form_control"></textarea>
					</div>
					<div class="form-group">
						<font style="vertical-align: inherit;">
							<input type="button" class="btn btn-primary" id="register" value="게시글 작성" data-target="#staticBackdrop">
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
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(function() {
    $(document).ajaxSend(function(e, xhr, options) {
        xhr.setRequestHeader(header, token);
    });
});

/* 추천글 작성 버튼 클릭 모달 */
$("#commend").click(function(){
	$("#register_modal").modal();
})
$("#register").click(function(){
	var id = $("#register_id").val();
	var contents = $("#register_contents").val();
	var image = $("#register_image").val();
	var title = $("#register_title").val();
	
	$.ajax({
		url : "commendshoes/commend_register",
		type : "post",
		data : {"id" : id,
				   "contents" : contents,
				   "image" : image,
				   "title" : title},
		dataType : "json",
		processData: false,
		contentType: false,
		success : function(data){
				alert("성공?");
			}
})
})

</script>

</body>
</html>