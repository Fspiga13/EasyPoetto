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
<title>Easy Poetto - Le mie Prenotazioni</title>
</head>
<body>
	<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
	<c:set var="logged" scope="request" value="${true}" />

	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
		
		</div>

		<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle">


			<div id="main" class="shadow-lg border border-light p-5 rounded">
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>

				<c:if test="${not empty success}">
					<div class="alert alert-success" role="alert">${success}</div>
				</c:if>

				<h1 class="mr-5 pr-5">Prenotazioni</h1>
				
				<div class="form-row px-4 mt-3 align-items-center">
    				<div class="col">
     					<h6>Data</h6>
    				</div>
    				<c:if test="${role == 2 }">
    				<div class="col">
     					<h6>Stabilimento</h6>
    				</div>
    				</c:if>
    				<c:if test="${role == 1 }">
    				<div class="col">
     					<h6>Nome</h6>
    				</div>
    				<div class="col">
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
							<div class = "form-row px-3 mt-3 align-items-center">
							
								<div class="col">
									${reservation.dateString}
								</div>
			    				<c:if test="${role == 2 }">
								<div class="col">											
									${reservation.beachResortName}			
								</div>
								</c:if>
								<c:if test="${role == 1 }">
								<div class="col">											
									${reservation.clientName}			
								</div>
								<div class="col">											
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
									${reservation.totalPrice}	
								</div>	
								
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			
		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
</body>
</html>