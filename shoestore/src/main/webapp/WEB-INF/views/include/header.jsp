<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="Content-Language" content="en">
<meta name="msapplication-TileColor" content="#2d89ef">
<meta name="theme-color" content="#4188c9">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="mobile-web-app-capable" content="yes">
<meta name="HandheldFriendly" content="True">
<meta name="MobileOptimized" content="320">
<meta id="_csrf" name="_csrf" content="${_csrf.token}" />
<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName}" />
<title>Insert title here</title>
<!-- <script src="./resources/template/assets/js/require.min.js"></script>
 <script>
      requirejs.config({
          baseUrl: '.'
      });
      win = new BrowserWindow({
    	    webPreferences: {
    	        nodeIntegration: true
    	    }
    	});
    </script> -->
    
<!-- jQuery 설정 -->
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous"> -->
<link href="${pageContext.request.contextPath}/resources/template/assets/favicon.ico" rel="icon" >
<link href="${pageContext.request.contextPath}/resources/template/assets/favicon.ico" rel="shortcut icon" >
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"><!-- 
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,300i,400,400i,500,500i,600,600i,700,700i&amp;subset=latin-ext" rel="stylesheet"> -->
<link href="${pageContext.request.contextPath}/resources/template/assets/css/dashboard.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/template/assets/plugins/charts-c3/plugin.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/template/assets/plugins/maps-google/plugin.css" rel="stylesheet">

<!-- bootstrap -->
<script src="${pageContext.request.contextPath}/resources/template/assets/js/vendors/bootstrap.bundle.min.js"></script>
 <!-- core -->
<script src="${pageContext.request.contextPath}/resources/template/assets/js/core.js"></script>
 <!-- d3 -->
<script src="${pageContext.request.contextPath}/resources/template/assets/plugins/charts-c3/js/d3.v3.min.js"></script>
 <!-- c3 -->
<script src="${pageContext.request.contextPath}/resources/template/assets/plugins/charts-c3/js/c3.min.js"></script>
 <!-- circle-progress -->
<script type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="circle-progress" src="${pageContext.request.contextPath}/resources/template/assets/js/vendors/circle-progress.min.js"></script>

 <!-- type="text/javascript" charset="utf-8" async="" data-requirecontext="_" data-requiremodule="circle-progress"  -->
</head>
<body>

	<div class="page-main">
		<div class="header py-4">
			<div class="container">
				<div class="d-flex">
					<a href="home" class="header-brand">shoestore</a>
					<div class="d-flex order-lg-2 ml-auto">
						<sec:authorize access="isAnonymous()">
						<div class="nav-item d-none d-md-flex">
							<a href="login" class="btn btn-lg btn-outline-primary">로그인</a>
						</div>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
						<div class="d-flex order-lg-2 ml-auto">
						<form action='<c:url value="/login"/>' method="post">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
							<button type="submit" class="btn btn-lg btn-outline-primary">로그아웃 </button>
						</form>
						</div>
					</sec:authorize>
					</div>
				
					<a href="#" class="header-toggler d-lg-none ml-3 ml-lg-0" data-toggle="collapse" data-target="#headerMenuCollapse" aria-expended="false">
						<span class="header-toggler-icon"></span>
					</a>
				</div>
			</div>
		</div>
		
		<div class="header collapse d-lg-flex p-0" id="headerMenuCollapse">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg order-lg-first">
						<ul class="nav nav-tabs border-0 fiex-column flex-lg-row">
							<li class="nav-item">
								<a href="home" class="nav-link">홈</a>
							</li>
							<li class="nav-item">
								<a href="shoestore" class="nav-link">신발</a>
							</li>
							<li class="nav-item">
								<a href="commendshoes" class="nav-link">회원 추천 신발</a>
							</li>
							<li class="nav-item">
								<a href="#" class="nav-link">중고 매장</a>
							</li>
							<li class="nav-item">
								<a href='basket?id=<sec:authentication property="Principal"/>' class="nav-link">장바구니</a>
							</li>
						
							
						</ul>
					</div>
				</div>
			</div>
			
		</div>
		
	</div>

<!-- <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
	    <div class="container-fluid">
	    
	      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
	        <span class="fa fa-bars"></span> Menu
	      </button>
	      <div class="collapse navbar-collapse" id="ftco-nav">
	        <ul class="navbar-nav m-auto">
	        	<li class="nav-item"><a href="index.html" class="nav-link">홈</a></li>
	        	<li class="nav-item"><a href="shoestore" class="nav-link">신발</a></li>
	        	<li class="nav-item"><a href="about.html" class="nav-link">회원 추천 신발</a></li>
	        	<li class="nav-item"><a href="coming-soon.html" class="nav-link">중고매장</a></li>
	        	<li class="nav-item"><a href="top-seller.html" class="nav-link">고객 센터</a></li>
	        	<li class="nav-item"><a href="author.html" class="nav-link">장바구니</a></li>
	        	<li class="nav-item"><a href="login" class="nav-link">로그인</a></li>
	        </ul>
	      </div>
	    </div>
	  </nav>
 -->




</body>
</html>