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
<title>Easy Poetto - Prenotazioni</title>
</head>
<body>
	<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
	<c:set var="logged" scope="request" value="${true}" />

	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
		
		</div>

		<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle">

		<c:if test="${role ==1}">
			<c:set var="cash_collection" scope="request" value="${0}" />
		</c:if>

			<div id="main" class="shadow-lg border border-light p-5 rounded">
			
				<h1 class="mr-5 pr-5">Prenotazioni</h1>
			
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>

				<c:if test="${not empty success}">
					<div class="alert alert-success" role="alert">${success}</div>
				</c:if>

				
				
				<div class="form-row mt-3 align-items-center">
    				<div class="col-2">
     					<h6>Data</h6>
    				</div>
    				<c:if test="${role == 2 }">
    				<div class="col-4">
     					<h6>Stabilimento</h6>
    				</div>
    				</c:if>
    				<c:if test="${role == 1 }">
    				<div class="col-2">
     					<h6>Nome</h6>
    				</div>
    				<div class="col-2">
     					<h6>Cognome</h6>
    				</div>
    				</c:if>
    				<div class="col">
      					<h6>Ombrelloni</h6>
    				</div>
   					<div class="col">
      					<h6>Lettini</h6>
   					</div>
					<div class="col">
      					<h6>Prezzo</h6>
   					</div>
				</div>
				
				<ul class="list-group list-group-flush">
					 <c:forEach var="reservation" items="${reservationList}">
						<li class="list-group-item">
							<div class = "form-row align-items-center">
							
								<div class="col">
									${reservation.dateString}
								</div>
			    				<c:if test="${role == 2 }">
								<div class="col-4">											
									${reservation.beachResortName}			
								</div>
								</c:if>
								<c:if test="${role == 1 }">
								<div class="col-2">											
									${reservation.clientName}			
								</div>
								<div class="col-2">											
									${reservation.clientSurname}			
								</div>
								</c:if>
								<div class="col">
									${reservation.umbrellasQty}					
								</div>	
						
								<div class="col">
									${reservation.beachLoungersQty}	
								</div>
								<div class="col">
									${reservation.totalPrice} €	
									<c:if test="${role ==1}">
										<c:set var="cash_collection" scope="request" value="${cash_collection + reservation.totalPrice}" />
									</c:if>
								</div>	
								
							</div>
						</li>
					</c:forEach>
				</ul>
				
				<c:if test="${ role == 1}">
					<div class="mt-3 mr-3 text-right align-items-center">
						<h5>Incasso totale</h5><c:out value="${cash_collection}"/> €
					</div>
				</c:if>
			</div>
			
		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>
</html>