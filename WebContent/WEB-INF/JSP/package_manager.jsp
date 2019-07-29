<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="view/css/page_style.css">
<link rel="stylesheet" type="text/css" href="view/css/button_style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="../../jQuery/jquery-3.4.1.min.js"></script>
<title>Easy Poetto - Pacchetto</title>
</head>
<body>
	<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
	<c:set var="logged" scope="request" value="${true}" />

	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>

		<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle">


			<div id="main" class="shadow-lg border border-light p-5 rounded">
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>

				<c:if test="${not empty success}">
					<div class="alert alert-success" role="alert">${success}</div>
				</c:if>

				<h1 class="pb-3">Pacchetto</h1>
				
				<form action="package.html" method="post">
	
					<div>
						<label for="name">Nome Pacchetto</label> <input type="text"
							class="form-control mb-4" id="name" name="name" required
							<c:if test= "${not empty package}">value="${package.name}"</c:if> />
					</div>
					
					<div class = "row align-middle px-3 mt-3">
					<label for="num_package_umbrellas">Numero di ombrelloni: </label>
						<c:choose>
							<c:when test="${not empty package}">
								<p> ${package.numPackageUmbrellas}
								</p>
								<input type="hidden" name="num_package_umbrellas" value="${package.numPackageUmbrellas}">
							</c:when>
							<c:otherwise>
							<select name = "num_packag_umbrellas">
								
								<c:forEach begin = "${0}" end="${5}" step="1" var="index">							
									<option value="${index}">${index}</option>
								</c:forEach>
							</select>
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class = "row align-middle px-3">
					<label for="num_package_loungers">Numero di lettini: </label>
						<c:choose>
								<c:when test="${not empty package}">
									<p> ${package.numPackageLoungers}
									</p>
									<input type="hidden" name="num_beach_loungers" value="${package.numPackageLoungers}">
								</c:when>
								<c:otherwise>
							<select name = "num_beach_loungers">
								
								<c:forEach begin = "${0}" end="${5}" step="1" var="index">
									<option value="${index}">${index}</option>
								</c:forEach>
							</select>
							</c:otherwise>
						</c:choose>
					</div>
					
					<div>
						<label for="price">Prezzo</label> <input type="text" 
							class="form-control mb-4" id="price"name="price"
							<c:if test= "${not empty package}">value="${package.price}"</c:if> />
					</div>
					
						<button type="submit" class="btn btn-outline-info btn-lg btn-block mt-5"><c:choose> <c:when test= "${not empty package}">Modifica</c:when><c:otherwise>Salva</c:otherwise></c:choose></button>
				</form>
			</div>
		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
</body>
</html>