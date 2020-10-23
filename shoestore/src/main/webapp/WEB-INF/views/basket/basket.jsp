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
				<table class="table table-hover table-outline table-vcenter text-nowrap card-table">
					<thead>
						<tr>
							<th class="text-center w-1">
							</th>
							<th>
								상품(브랜드)
							</th>
							<th>
								가격
							</th>
							<th>
								<input type="checkbox">
							</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="list" items="${basketList}">
							<tr>
								<td class="text-center">
									<span class="avatar avatar-xxl" style="background-image:url(${pageContext.request.contextPath}/resources/shoesimage/${list.image})">
										
									</span>
									<%-- <div class="avatar d-block" style="background-image:url(${pageContext.request.contextPath}/resources/shoesimage/${list.image})"></div> --%>
								</td>	
								<td>
									<div>${list.shoesname}</div>
									<div class="small text-muted">(${list.brand})</div>
								</td>
								<td>
									<div>${list.price}</div>
								</td>
								<td>
											<input type="checkbox" name="aa" value="opta">
								</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			
		 	</div>
	 	</div>
	 </div>
</body>
</html>