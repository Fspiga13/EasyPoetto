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
<title>Easy Poetto - Prenotazione</title>
</head>
<body>
	<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
	<c:set var="logged" scope="request" value="${true}" />

	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">
		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">		
		</div>
			<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle mb-5 rounded">		
				
				<div id="main" class="shadow-lg border border-light p-5 rounded">
					<c:if test="${not empty error}">
						<div class="alert alert-danger" role="alert">${error}</div>
					</c:if>
	
					<c:if test="${not empty success}">
						<div class="alert alert-success" role="alert">${success}</div>
					</c:if>
	
						<h1>Prenotazione per il ${reservation_date}</h1>
						
						<form action="reservation.html" method="post">
						
						<input type="hidden" name="reservation_date" value="${reservation_date }">
						
						<div class="my-3">
							<h3>Stabilimento: ${beachResort.name}</h3> 
							<input type="hidden" name="beach_resort_name" value="${beachResort.name}">
						</div>	
									 				 								
					 	<div class="rounded border p-3 mb-4">
					 	
					 		<h5>Ombrellone</h5>
								
							<div class="row">
							 	<div class="col">
									<label for="price_umbrella">Prezzo per unità:</label> ${beachResort.priceUmbrella} €
									<input type="hidden" name="price_umbrella" value="${beachResort.priceUmbrella }">
								</div>
							
								<div class = "col align-middle px-3">
									<label for="num_umbrellas">Quantità: </label>
									<select name = "num_umbrellas">									
										<c:forEach begin = "1" end="3" step="1" var="index">							
											<c:if test="${beachResort.availableUmbrellas == 0 || index <= beachResort.availableUmbrellas}"> 									
												<option value="${index}">${index}</option>
											</c:if>
										</c:forEach>
									</select>		
								</div>
							</div>
						</div>
						
						<div class="rounded border p-3 mb-5">
						
					 		<h5>Lettino</h5>
								
							<div class="row">
								
							 	<div class="col">
									<label for="price_beach_lounger">Prezzo per unità:</label> ${beachResort.priceBeachLounger} €
									<input type="hidden" name="price_beach_lounger" value="${beachResort.priceBeachLounger }">
								
								</div>
								
								<div class = "col align-middle px-3">
									<label for="num_beach_loungers">Quantità: </label>
									<select name = "num_beach_loungers">									
										<c:forEach begin = "0" end="9" step="1" var="index">									
											<c:if test="${beachResort.availableBeachLoungers == 0 || index <= beachResort.availableBeachLoungers}"> 
												<option value="${index}">${index}</option>
											</c:if>
										</c:forEach>
									</select>		
								</div>
							</div>
						</div>
						
						<div class="col-auto m-3">	
						
							<input type="hidden" name="beach_resort_id" value="${beachResort.id}">  
					   		<button type="submit" id="prenota" class="btn btn-info btn-lg btn-block rounded">Prenota</button>
		   				</div>
					</form>	
				</div>			
			</div>
		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>