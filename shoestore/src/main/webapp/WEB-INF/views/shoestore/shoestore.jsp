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
									<span class="selectgroup-button">New Balance</span>
								</label>
							</div>
							<div class="selectgroup selectgroup-pills">
								<label class="selectgroup-item">
									<input type="checkbox" name="bno" value="4" class="selectgroup-input">
									<span class="selectgroup-button">Puma</span>
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
					 </form> 
				</div>
				<div class="col-lg-9">
					<form class="card">
						<div class="row row-cards">
							<c:forEach var="list" items="${shoeslist}">
								<div class="col-sm-6 col-lg-4">
									<a href="#" class="mb-3">
										<img src="${pageContext.request.contextPath}/resources/shoesimage/${list.image}" class="rounded">
									</a>
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
//radio 선택 해제
var beforeChecked = -1;
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
   });
});

$(document).ready(function(){

	$(".selectgroup-input, .colorinput-input").click(function(){
		var bno = new Array();
		var kno = new Array();

		if($("input:checkbox[name=bno]").is(":checked")==true){
			$("input[name=bno]:checked").each(function(){
				bno.push($(this).val());
			})
		}else{
				bno.push("")
			}
		
		if($("input:checkbox[name=kno]").is(":checked")==true){
			$("input[name=kno]:checked").each(function(){
				kno.push($(this).val());
			})
		}else{
				kno.push("")
			}
		var color;
		if($("input:radio[name=color]").is(":checked")==true){
			color = $("#color").val();
		}else{
			color = "";
			}
		if($(""))
		var color = $("#color").val();
		
		$.ajax({
				url : "shoestore/shoesselect",
				data : {"bno" : bno,
						   "kno" : kno,
						   "color" : color},
				traditional : true,
				dataType : "json",
				success : function(data){
					$(data).each(function(idx, item){
						alert(item.shoesname)
						console.log(item.shoesname);

						console.log(item.brand);
					
							
						})
}
		})
	})
		
		
})  

   function vali(val){
 
                if (value === null) return true; 
                if (typeof value === 'string' && value === '') return true;
                if (typeof value === 'undefined') return true;
                
                return false;
 
            }
</script>
</body>
</html>

