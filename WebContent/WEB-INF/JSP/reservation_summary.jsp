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
<title>Easy Poetto - Pagamento</title>
</head>
<body>
	<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
	<c:set var="logged" scope="request" value="${true}" />

	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">
		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3">		
		</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 align-middle mb-5 rounded">		
			
				<div id="main" class="shadow-lg border border-light p-5 rounded">
	
					<h1>Riepilogo prenotazione</h1>
					
					<form action="myreservations.html" method="post">	
							
						<div class="rounded border p-3">
						
							<div>
								<label class="font-weight-bold" for="beach_resort_name">Stabilimento:</label> ${beach_resort_name}
								<input type="hidden" id="beach_resort_name" name="beach_resort_name" value="${beach_resort_name}" />
							</div>
						
							<div>
								<label class="font-weight-bold" for="reservation_date">Data:</label> ${reservation_date}
								<input type="hidden" id="reservation_date" name="reservation_date" value="${reservation_date}" />
							</div>
						
						 	<div>
								<label class="font-weight-bold" for="num_umbrellas">Numero ombrelloni:</label> ${num_umbrellas}
								<input type="hidden" id="num_umbrellas" name="num_umbrellas" value="${num_umbrellas}" />
							</div>
							
							<div>
								<label class="font-weight-bold" for="num_beach_loungers">Numero lettini:</label> ${num_beach_loungers}
								<input type="hidden" id="num_beach_loungers" name="num_beach_loungers" value="${num_beach_loungers}" />
							</div>
							
						 	<div> 
								<label class="font-weight-bold" for="total_price">Prezzo totale:</label> ${total_price} €
								<input type="hidden" id="total_price" name="total_price" value="${total_price}" />
							</div>
							
						</div>	
						<div class="m-3">		  
						   <button type="submit" id="prenota" class="btn btn-info btn-lg rounded">Prenota e paga</button>
						</div>
					</form>
				</div>			
			</div>
		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3"></div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>
	
</body>



</html>