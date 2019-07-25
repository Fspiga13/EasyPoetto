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
<title>Easy Poetto - Profilo</title>
</head>
<body>
	<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
	<c:set var="logged" scope="request" value="${true}" />

	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>

		<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle mb-5">


			<div id="form" class="shadow-lg border border-light p-5 rounded">
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>

				<c:if test="${not empty success}">
					<div class="alert alert-success" role="alert">${success}</div>
				</c:if>
				<h1 class="pb-3">Profilo</h1>

				<form action="profile.html" method="post">

	
					<div>
						<label for="name">Nome Stabilimento</label> <input type="text"
							class="form-control mb-4" id="name" name="name" required
							<c:if test= "${not empty beachResort}">value="${beachResort.name}"</c:if> />
					</div>
					<div>
						<label for="description">Descrizione</label> <input type="text"
							class="form-control mb-4" id="description" name="description" required
							<c:if test= "${not empty beachResort}">value="${beachResort.description}"</c:if> />
					</div>
					<div>
						<label for="email">E-mail</label> <input type="email"
							class="form-control mb-4" id="email" name="email"
							pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"
							<c:if test= "${not empty beachResort}">value="${beachResort.email}"</c:if> />
					</div>

					<%--inserisci vecchia password, inserisci nuova password --%>

					<div>
						<label for="password">Password</label> <input type="password"
							class="form-control mb-4" id="password" name="password" />
					</div>

					<div>
						<label for="image">Immagine</label> <input type="text"
							class="form-control mb-4" id="image" name="image"
							<c:if test= "${not empty beachResort}">value="${beachResort.image}"</c:if> />
					</div>

					<div>
						<label for="logo">Logo</label> <input type="text"
							class="form-control mb-4" id="logo" name="logo"
							<c:if test= "${not empty beachResort}">value="${beachResort.logo}"</c:if> />
					</div>

					<div>
						<label for="address">Indirizzo</label> <input type="text"
							class="form-control mb-4" id="address" name="address"
							<c:if test= "${not empty beachResort}">value="${beachResort.address}"</c:if> />
					</div>

					<div>
						<label for="telephone">Numero di telefono</label> <input
							type="text" class="form-control mb-4" id="telephone"
							name="telephone"
							<c:if test= "${not empty beachResort}">value="${beachResort.telephone}"</c:if> />
					</div>


					
					
				<div class="rounded border shadow p-3">
								
				<h3>Seleziona i servizi del tuo stabilimento</h3>
				
				
					<div class="row">
						<div class=" px-4 py-2">
							Parcheggio <input type="checkbox" name="service" value="parking" class="check">
						</div><div class="px-4 py-2">
							Pedalò <input type="checkbox" name="service" value="pedalo" class="check">
						</div><div class="px-4 py-2">
							Docce <input type="checkbox" name="service" value="shower" class="check">
						</div><div class="px-4 py-2"> 
							Toilette <input type="checkbox" name="service" value="toilette" class="check">
						</div>
					</div>
					<div class="row">
						<div class="px-4 py-2">
							Punto ristoro <input type="checkbox" name="service"value="restaurant" class="check"> 
						</div><div class="px-4 py-2">
							Servizi per disabili <input type="checkbox" name="service" value="disabled_facilities" class="check">
						</div><div class="px-4 py-2">
							Area bambini <input type="checkbox" name="service"value="children_area" class="check"> 
						</div><div class="px-4 py-2">
							Area cani <input type="checkbox"name="service" value="dog_area" class="check">
						</div>
					</div>
					
										<div class = "row align-middle mb-5">
					<label for="num_umbrellas">Numero di ombrelloni </label>
						<c:choose>
						<c:when test="${not empty beachResort}">
							<p> ${beachResort.numUmbrellas}
							</p>
						</c:when>
						<c:otherwise>
						<select name = "num_umbrellas">
							
							<c:forEach begin = "${10}" end="${500}" step="10" var="index">
							
								<option value="${index}">${index}</option>
							</c:forEach>
						</select>
						</c:otherwise>
						</c:choose>
					</div>
					
					
						
						<div class = "row align-middle mb-5">
						<label for="num_beach_loungers">Numero di lettini </label>
							<c:choose>
							<c:when test="${not empty beachResort}">
								<p> ${beachResort.numBeachLoungers}
								</p>
							</c:when>
							<c:otherwise>
							<select name = "num_beach_loungers">
								
								<c:forEach begin = "${30}" end="${1500}" step="30" var="index">
								
									<option value="${index}">${index}</option>
								</c:forEach>
							</select>
							</c:otherwise>
							</c:choose>
						</div>
								
				<button type="submit" class="btn btn-outline-info btn-lg btn-block shadow mt-5">Crea i tuoi pacchetti</button>
			</div>
					
					

					<button type="submit" class="btn btn-outline-info btn-lg btn-block shadow mt-5">Modifica</button>
				</form>
			</div>
		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
</body>
</html>