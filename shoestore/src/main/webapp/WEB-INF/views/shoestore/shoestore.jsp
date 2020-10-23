<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../include/header.jsp" %>
	<title>Home</title>
</head>
<body>
<a href="shoesRegister">
<button type="button" class="btn btn-primary btn-block">신발 올리기</button>
</a>

<div class="page-main">
	
	<div class="my-3 my-md-5">
	
		<div class="container">
			<div class="page-header">
			</div>
			<div class="row">
				<div class="col-lg-3 order-lg-1 mb-4">
					<form class="card">
						<div class="form-group">
							<label class="form-label">브랜드</label>
							<div class="selectgroup selectgroup-pills">
								<label class="selectgroup-item">
									<input type="checkbox" name="bno" value="1" class="selectgroup-input">
									<span class="selectgroup-button">Nike</span>
								</label>
							</div>
								<div class="selectgroup selectgroup-pills">
								<label class="selectgroup-item">
									<input type="checkbox" name="bno" value="2" class="selectgroup-input">
									<span class="selectgroup-button">Adidas</span>
								</label>
							</div>
								<div class="selectgroup selectgroup-pills">
								<label class="selectgroup-item">
									<input type="checkbox" name="bno" value="3" class="selectgroup-input">
									<span class="selectgroup-button">Puma</span>
								</label>
							</div>
							<div class="selectgroup selectgroup-pills">
								<label class="selectgroup-item">
									<input type="checkbox" name="bno" value="4" class="selectgroup-input">
									<span class="selectgroup-button">New Balance</span>
								</label>
							</div>
						</div>
						<div class="form-group">
						<label class="form-label">종류</label>
							<div class="selectgroup selectgroup-pills">
								<label class="selectgroup-item">
									<input type="checkbox" name="kno" value="1" class="selectgroup-input">
									<span class="selectgroup-button">런닝화</span>
								</label>
							</div>
							<div class="selectgroup selectgroup-pills">
								<label class="selectgroup-item">
									<input type="checkbox" name="kno" value="2" class="selectgroup-input">
									<span class="selectgroup-button">단화</span>
								</label>
							</div>
							<div class="selectgroup selectgroup-pills">
								<label class="selectgroup-item">
									<input type="checkbox" name="kno" value="3" class="selectgroup-input">
									<span class="selectgroup-button">슬리퍼</span>
								</label>
							</div>
							<div class="selectgroup selectgroup-pills">
								<label class="selectgroup-item">
									<input type="checkbox" name="kno" value="4" class="selectgroup-input">
									<span class="selectgroup-button">운동화</span>
								</label>
							</div>
						</div>
						<div class="form-group">
						<font style="vertical-align: inherit;">색상</font>
						<div class="row gutters-xs">
							<div class="col-auto">
								<label class="colorinput">
									<input type="checkbox" name="color" value="white" class="colorinput-input">
									<span class="colorinput-color bg-blue-lightest"></span>
								</label>
							</div>
						<div class="col-auto">
							<label class="colorinput">
								<input type="checkbox" name="color" value="blue" class="colorinput-input">
								<span class="colorinput-color bg-blue"></span>
							</label>
						</div>
						<div class="col-auto">
							<label class="colorinput">
								<input type="checkbox" name="color" value="red" class="colorinput-input">
								<span class="colorinput-color bg-red"></span>
							</label>
						</div>
						<div class="col-auto">
							<label class="colorinput">
								<input type="checkbox" name="color" value="green" class="colorinput-input">
								<span class="colorinput-color bg-green"></span>
							</label>
						</div>
						<div class="col-auto">
							<label class="colorinput">
								<input type="checkbox" name="color" value="yellow" class="colorinput-input">
								<span class="colorinput-color bg-yellow"></span>
							</label>
						</div>
						<div class="col-auto">
							<label class="colorinput">
								<input type="checkbox" name="color" value="gray" class="colorinput-input">
								<span class="colorinput-color bg-gray"></span>
							</label>
						</div>
						<div class="col-auto">
							<label class="colorinput">
								<input type="checkbox" name="color" value="black" class="colorinput-input">
								<span class="colorinput-color bg-gray-dark"></span>
							</label>
						</div>
						</div>
						</div>
					 </form> 
				</div>
				<div class="col-lg-9">
					<form class="card" id="shoeStore">
						<div class="row row-cards">
							<c:forEach var="list" items="${shoesList}">
								<div class="col-sm-6 col-lg-4">
									<a href="shoesDetail?sno=${list.sno}" class="mb-3">
										<img src="${pageContext.request.contextPath}/resources/shoesimage/${list.image}" class="rounded">
									<div class="d-flex align-items-center px-2">
										<div>
										<div>										
											<font style="vertical-align: inherit;">${list.shoesname}  </font>
										</div>
										<smail class="d-block text-muted">
											<font style="vertical-align: inherit;"><fmt:formatNumber value="${list.price}" pattern="#,###"/>원</font>
										</smail>
										</div>
										<div class="ml-auto text-muted">
											<font style="vertical-align: inherit;">${list.brand}</font>
										</div>
									</div>
									</a>
								</div>
							</c:forEach>
						</div>
					</form>
				</div>	
			</div>
		</div>
	</div>
</div>
<script>




/*
var beforeChecked = -1;
//radio 선택 해제
		$(function(){
			   $(document).on("click", "input[name=color]", function(e) {
				  //parent : 해당요소 바로 위에 존재하는 하나의 부모 요소를 반환
				  //클릭한 라디오 박스가 각각 다른값을 가지도록, index만 하면 다른 라디오 박스 클릭시 체크가 안됨.
			      var index = $(this).parent().index("label");

			      if(beforeChecked == index) {
			      beforeChecked = -1;
			      $(this).prop("checked", false);
			      }else{
			      beforeChecked = index;
			      }    
				 console.log(beforeChecked);
			      
			   });
			});*/
	


	$(".selectgroup-input, .colorinput-input").click(function(){
		var bno = new Array();
		var kno = new Array();
		var color = new Array();
		/* if($("input:checkbox[name=bno]").is(":checked")==true){
			$("input[name=bno]:checked").each(function(){
				bno.push($(this).val());
			})
		}
		if($("input:checkbox[name=kno]").is(":checked")==true){
			$("input[name=kno]:checked").each(function(){
				kno.push($(this).val());
			})
		}
		 */
		 
	/* 브랜드 가져오기 */
	$("input[name=bno]:checked").each(function(){
		bno.push($(this).val());
		})
	/* 신발 종류 가져오기 */		
	$("input[name=kno]:checked").each(function(){
		kno.push($(this).val());
		})
	$("input[name=color]:checked").each(function(){
		color.push($(this).val());
		})

	$.ajax({
			url : "shoestore/shoesselect",
			data : {"bno" : bno,
					   "kno" : kno,
					   "color" : color},
			traditional : true,
			dataType : "json",
			success : function(data){
				shoesSelect(data);
	
			}
		})
	})		
	
//$(document).ready(function(){
//})  

function shoesSelect(data){
	var shoesDisp = "";
	shoesDisp += "<div class='row row-cards'>";
	$(data).each(function(idx, item){
		shoesDisp += "<div class='col-sm-6 col-lg-4'>";
		shoesDisp += "<a href='shoesDetail' class='mb-3'>";
		shoesDisp += "<img src='${pageContext.request.contextPath}/resources/shoesimage/"+item.image+"' class='rounded'>";
		shoesDisp += "<div class='d-flex align-items-center px-2'>";
		shoesDisp += "<div><div>";
		shoesDisp += "<font style='vertical-align: inherit;'>"+item.shoesname+"</font>";
		shoesDisp += "</div>";
		shoesDisp += "<smail class='d-block text-muted'>";
		shoesDisp += "<font style='vertical-align: inherit;'>"+Number(item.price).toLocaleString('en')+"</font>";
		shoesDisp += "</smail>";
		shoesDisp += "</div>";
		shoesDisp += "<div class='ml-auto text-muted'>";
		shoesDisp += "<font style='vertical-align: inherit;'>"+item.brand+"</font>";
		shoesDisp += "</div></div></a></div>";
		})
		shoesDisp += "</div>";
	$("#shoeStore").html(shoesDisp);
}


</script>
</body>
</html>

