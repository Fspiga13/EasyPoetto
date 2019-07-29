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
<title>Easy Poetto - I miei Pacchetti</title>
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

				<div class="form-row align-items-center">
					<h1 class="mr-5 pr-5">I miei Pacchetti</h1>
						<form action="packagemanager.html" method="get">
						<input type="hidden" name="newPackage" value="yes">
						<button type="submit" class="btn btn-outline-info btn-lg ml-5">Crea Nuovo</button>
				</form>
				</div>
				
				<div class="form-row px-4 mt-3 align-items-center">
    				<div class="col">
     					<h6>Nome</h6>
    				</div>
    				<div class="col">
      					<h6>Ombrelloni</h6>
    				</div>
   					<div class="col">
      					<h6>Lettini</h6>
   					</div>
					<div class="col">
      					<h6>Prezzo</h6>
   					</div>
   					<div class="col">
      					<h6>Azioni</h6>
   					</div>
				</div>
				
				 <c:forEach var="beach_package" items="${packageList}">
				
				<div class = "form-row px-3 mt-3 align-items-center">
					<form action="packagemanager.html" method="post">
									<div class = "form-row px-3 mt-3 align-items-center">
					
						<div class="col">
						<input type="text" class="form-control" id="name" name="name" placeholder="Nome" required
							<c:if test= "${not empty beach_package}">value="${beach_package.name}"</c:if> />
						</div>
					
					
					<div class="col">											
						<select name = "num_packag_umbrellas">
							<option <c:if test="${empty beach_package}">selected</c:if>>Num Ombrelloni</option>
							
							<c:forEach begin = "${0}" end="${5}" step="1" var="index">							
								<option value="${index}" <c:if test="${beach_package.includedUmbrellas == index}">selected</c:if>>${index}</option>
							</c:forEach>
						</select>					
					</div>
				
					<div class="col">
									
							<select name = "num_beach_loungers">
								<option <c:if test="${empty beach_package}">selected</c:if>>Num Lettini</option>
				
								<c:forEach begin = "${0}" end="${15}" step="1" var="index">
									<option value="${index}"  <c:if test="${beach_package.includedBeachLoungers == index}">selected</c:if> >${index}</option>
								</c:forEach>
							</select>
							
					</div>	
				
						<div class="col">
							 <input type="text" class="form-control" id="price"name="price" placeholder="Prezzo"
							<c:if test= "${not empty beach_package}">value="${beach_package.price}"</c:if> />
						</div>
					
						<div class="col">
							<input type="hidden" name="idPackage" value="${beach_package.id}">
							<button type="submit" class="btn btn-outline-info btn-sm">Modifica</button>
						</div>
						</div>
				</form>
				<form action="packagemanager.html" action="get">

								<inputype="hidden" name="idPackage" value="${beach_package.id}">
						
							<button type="submit" class="float-right btn btn-outline-info btn-sm">Elimina</button>

				</form>
				</div>

				</c:forEach>
			</div>
			
		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
</body>
</html>