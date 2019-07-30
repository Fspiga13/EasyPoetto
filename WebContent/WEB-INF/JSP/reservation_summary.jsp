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
		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">		
		</div>
			<div id="main" class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle mb-5 rounded">		
				<div id="main" class="shadow-lg border border-light p-5 rounded">
					<c:if test="${not empty error}">
						<div class="alert alert-danger" role="alert">${error}</div>
					</c:if>
	
					<c:if test="${not empty success}">
						<div class="alert alert-success" role="alert">${success}</div>
					</c:if>
	
						<h1 class="mr-5 pr-5">Prenota e paga</h1>
	
								
					 	<div class="rounded border p-3">
					 		<h5>Riepilogo</h5>
								
						 	<div>
								<label for="num_umbrella">Numero ombrelloni:</label> <input type="number" readonly
									class="form-control mb-4" id="num_umbrella" name="num_umbrella" required value="${umbrellasQty}" />
							</div>
							
							<div>
								<label for="num_beach_lounger">Numero lettini:</label> <input type="number" readonly
									class="form-control mb-4" id="num_beach_lounger" name="num_beach_lounger" required value="${beachLoungersQty}" />
							</div>
							
						 	<div>
								<label for="total_price">Prezzo totale:</label> <input type="number" readonly
									class="form-control mb-4" id="total_price" name="total_price" required value="${totalPrice}" />
							</div>
						</div>	
					<div class="col-auto">		  
					   <button type="submit" id="prenota" class="btn btn-info rounded">Prenota e paga</button>
					</div>
				</div>			
			</div>
		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
</body>
</html>