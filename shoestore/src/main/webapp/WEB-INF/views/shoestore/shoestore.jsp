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
			<form class="card">
			
			<div class="row row-cards">
				<c:forEach var="list" items="${shoeslist}">
					<div class="col-sm-6 col-lg-4">
						<a href="#" class="mb-3">
							<img src="${pageContext.request.contextPath}/resources/shoesimage/${list.image}" class="rounded">
						</a>
					</div>
				</c:forEach>
			</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>

