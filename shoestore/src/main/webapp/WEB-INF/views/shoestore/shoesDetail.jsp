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
			<div class="card card-aside">
			<input type="hidden" id="id" value='<sec:authentication property="Principal"/>'> 
			<input type="hidden" id="sno" value="${shoes.sno}">
				<img class="rounded" src="/shoestore${pagaContext.request.contextPath}/resources/shoesimage/${shoes.image}" width="300" height="500">
				<%-- <a class="card-aside-column" href="#" style="background-image: url(/shoestore${pagaContext.request.contextPath}/resources/shoesimage/${shoes.image})"></a>
				 --%>
				<div class="card-body d-flex flex-column">
					<h4>${shoes.shoesname}(${shoes.brand})</h4>
					<div class="text-default">${shoes.price}</div>
					<div class="text-muted">${shoes.contents}</div>
					<div class="d-flex align-items-center pt-5 mt-auto">
						<div>
							<button type="button" class="btn btn-square btn-secondary">구매하기</button>
							<button type="button" id="basket" class="btn btn-square btn-secondary">장바기누</button>
						</div>
					</div>
				</div>
			</div>

<%-- 			<div class="card">
							<h4>${shoes.shoesname}</h4>
							<small class="d-block text-muted">${shoes.brand}</small>				
									 <img src="${pageContext.request.contextPath}/resources/shoesimage/${list.image}" class="rounded">	
				<img class="rounded" src="/shoestore${pagaContext.request.contextPath}/resources/shoesimage/${shoes.image}" width="300" height="500">
				
				<div class="card-body d-flex flex-column">
	 
					<small class="d-block text-muted">${shoes.kind}</small>
					<div class="text-muted">${shoes.contents }</div>
					
				</div>
				<div>
					<button type="button" class="btn btn-primary">목록,수정,삭제</button>
				</div>
			</div> --%>
		</div>
	</div>
</div>
<script>
$("#basket").click(function(){
	var id = $("#id").val();
	var sno = $("#sno").val();
	$.ajax({
		url : "basket/basketcheck",
		data : {"id" : id,
				   "sno" : sno},
		dataType : "json",
		success : function(data){
				if(data.result == true){
					$.ajax({
						url : "basket/basketinsert",
						data : {"id" : id,
								   "sno" : sno},
						success : function(data){
								alert("장바구니 넣기 성공");
							}
					})
				}else{
					alert("이미 장바구니에 등록된 상품입니다.")
				}
			}
		})

})
	
</script>
</body>
</html>