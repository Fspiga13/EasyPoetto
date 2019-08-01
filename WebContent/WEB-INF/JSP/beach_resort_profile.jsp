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

		<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle">


			<div id="main" class="shadow-lg border border-light p-5 rounded">
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
						<label for="email">E-mail</label> <input type="email"
							class="form-control mb-4" id="email" name="email"
							pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"
							<c:choose><c:when test= "${not empty client}">value="${client.email}"</c:when> 
							<c:when test= "${not empty email}">value="${email}"</c:when>
							</c:choose> />
					</div>

					<%--inserisci vecchia password, inserisci nuova password --%>

					<div>
						<label for="password">Password</label> <input type="password"
							class="form-control mb-4" id="password" name="password" />
					</div>
					
					<div>
						<label for="description">Descrizione</label> 
						<textarea name="description" id="description" rows="5" cols="50" class="form-control mb-4"
						maxlength="2000" style="resize:none" required><c:if test= "${not empty beachResort}">${beachResort.description}</c:if></textarea> 
		
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
							class="form-control mb-4" id="address" name="address" <c:choose>
							<c:when test= "${not empty beachResort}">value="${beachResort.address}"</c:when>
															<c:otherwise>required</c:otherwise>
															</c:choose> >
					</div>

					<div>
						<label for="telephone">Numero di telefono</label> <input
							type="text" class="form-control mb-4" id="telephone"
							name="telephone" <c:choose>
							<c:when test= "${not empty beachResort}">value="${beachResort.telephone}"</c:when>
															<c:otherwise>required</c:otherwise>
															</c:choose> >
					</div>


				<label>Servizi del tuo stabilimento</label>
				<div class="border px-4 rounded">
					<div class="form-row align-items-center">
					
						<div class="col">
								<input type="checkbox" name="service" id="service1" value="parking" class="check form-check-input"
								<c:if test= "${beachResort.parking == true}">checked</c:if> />
								<label class="form-check-label" for="service1">Parcheggio</label>
							</div><div class="col">
								<input type="checkbox" name="service" id="service2" value="pedalo" class="check form-check-input"
								<c:if test= "${beachResort.pedalo == true}">checked</c:if> />
								<label class="form-check-label" for="service2">Pedalò</label>
							</div><div  class="col">
								<input type="checkbox" name="service" id="service3" value="shower" class="check form-check-input"
								<c:if test= "${beachResort.shower == true}">checked</c:if> />
								<label class="form-check-label" for="service3">Docce</label>
							</div><div class="col"> 
								<input type="checkbox" name="service" id="service4" value="toilette" class="check form-check-input"
								<c:if test= "${beachResort.toilette == true}">checked</c:if> />
								<label class="form-check-label" for="service4">Toilette</label>
							</div>
					</div>
					<div class="form-row align-items-center">
							<div  class="col">
								<input type="checkbox" name="service" id="service5" value="restaurant" class="check form-check-input"
								<c:if test= "${beachResort.restaurant == true}">checked</c:if> />
								<label class="form-check-label" for="service5">Punto ristoro</label>
							</div><div  class="col">
								<input type="checkbox" name="service" id="service6" value="disabled_facilities" class="check form-check-input"
								<c:if test= "${beachResort.disabledFacilities == true}">checked</c:if> />
								<label class="form-check-label" for="service6">Strutture accessibili</label>
							</div><div  class="col">
								<input type="checkbox" name="service" id="service7" value="children_area" class="check form-check-input"
								<c:if test= "${beachResort.childrenArea == true}">checked</c:if> /> 
								<label class="form-check-label" for="service7">Area bambini</label>
							</div><div class="col">
								<input type="checkbox" name="service" id="service8" value="dog_area" class="check form-check-input"
								<c:if test= "${beachResort.dogArea == true}">checked</c:if> />
								<label class="form-check-label" for="service8">Area cani</label>
							</div>
						
					</div>
					
				</div>	
					<div class = "form-row mt-4">
						<div class="col">
							<label class="form-check-label" for="num_umbrellas">Numero di ombrelloni </label>
							<c:choose>
							<c:when test="${not empty beachResort}">
								<input type="number" class="form-control mr-3" readonly name="num_umbrellas" value="${beachResort.numUmbrellas}">
							</c:when>
							<c:otherwise>
							<select name = "num_umbrellas">
								
								<c:forEach begin = "10" end="500" step="10" var="index">
								
									<option value="${index}">${index}</option>
								</c:forEach>
							</select>
							</c:otherwise>
							</c:choose>
						</div>
						<div class="col">					
							<label class="form-check-label" for="price_umbrella">Prezzo per ombrellone </label>
							<input type="number" class="form-control" name="price_umbrella" step='0.1' placeholder='0.0' 
										<c:choose>
										<c:when test= "${not empty beachResort}">value="${beachResort.priceUmbrella}"</c:when>
										<c:otherwise>required</c:otherwise>
										</c:choose> >
						</div>
					</div>
					
					<div class = "form-row mt-4 mb-5">
						<div class="col">
							<label for="num_beach_loungers">Numero di lettini </label>
							<c:choose>
							<c:when test="${not empty beachResort}">
								<input type="number" readonly class="form-control" name="num_beach_loungers" value="${beachResort.numBeachLoungers}">
							</c:when>
							<c:otherwise>
							<select name = "num_beach_loungers">
								
								<c:forEach begin ="30" end="1500" step="30" var="index">
									<option value="${index}">${index}</option>
								</c:forEach>
							</select>
							</c:otherwise>
							</c:choose>
						</div>
						<div class="col">
							<label for="price_beach_lounger">Prezzo per lettino </label>
							<input type="number" class="form-control" name="price_beach_lounger" step='0.1' placeholder='0.0'  
									<c:choose> 
									<c:when test= "${not empty beachResort}">value="${beachResort.priceBeachLounger}"</c:when>
									<c:otherwise>required</c:otherwise>
									</c:choose> >
						</div>
					</div>
					

					<button type="submit" class="btn btn-outline-info btn-lg btn-block mt-2"><c:choose> <c:when test= "${not empty beachResort}">Modifica</c:when><c:otherwise>Salva</c:otherwise></c:choose></button>
				</form>
			</div>
		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>