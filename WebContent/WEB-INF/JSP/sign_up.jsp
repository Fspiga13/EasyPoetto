<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<link rel="stylesheet" type="text/css" href="view/css/page_style.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script type="text/javascript" src="../../jQuery/jquery-3.4.1.min.js"></script>
	<title>Easy Poetto - Registrati </title>
</head>
<body>
		<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
		<c:set var="logged" scope="request" value="${false}"/> <%-- Il login viene mostrato solo se l'utente è loggato, quindi se arriviamo a questo punto non possiamo essere loggati --%>
		<jsp:include page="nav_bar.jsp"></jsp:include>
		<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">
			
			<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
			</div>
			
			<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 ">
				

	 			<div id="form"  class="shadow-lg border border-light p-5 rounded" >
	 				 			<h1>Registrati</h1>
		 			<c:if test="${not empty error}">
		 				<div  class="alert alert-danger" role="alert">
		 					${error}
		 				</div>
		 			</c:if>
	 				<c:if test="${not empty success}">
		 				<div  class="alert alert-success" role="alert">
		 					${success}
		 				</div>
 					</c:if>
		 			
					<form action="signup.html" method="post"style="display:inline">
						<div>
					  		<label for="email">Email</label>
					  		<input type="email" id="email" name="email" class="form-control mb-4" pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" /> 
					  	</div>
					  	<div>
					  		<label for="password">Password</label>
					  		<input type="password" id="password" name="password" class="form-control mb-4"/>
					  	</div>
					  	<div>
					  		<label for="confirm_password">Conferma Password</label>
					  		<input type="password" id="confirm_password" name="confirm_password" class="form-control mb-4"/>
					  	</div>
					  	<div class="text-center">
					  		
					  		<label for="client">Cliente</label>
							<input type="radio" name="role" id="client" value="client" checked="checked" >
							<label for="beach_resort" class="ml-5" >Stabilimento</label>
							<input type="radio" name="role" id="beach_resort" value="beach_resort">
					  	</div>
					  	
					  	
					  	<div>
							<button type="submit" class="btn btn-outline-info btn-lg btn-block mt-3" formaction="signup.html">Registrati</button>
			 			</div>
					</form>	 			
	 			</div>
			</div>
			
			<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
			</div>
		</div>
</body>
</html>