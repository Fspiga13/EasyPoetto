<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="view/css/page_style.css">
	<link rel="stylesheet" type="text/css" href="view/css/button_style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script type="text/javascript" src="../../jQuery/jquery-3.4.1.min.js"></script>
	<title>Easy Poetto - Profilo</title>
</head>
<body>
				<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
		<c:set var="logged" scope="request" value="${true}"/>
		<c:choose>
			<c:when test= "${not empty client}"> 
				<c:set var="logged" scope="request" value="${true}"/><%-- Se esiste un utente imposto la variabile logged a true --%>
			</c:when>
			<c:otherwise>
				<c:set var="logged" scope="request" value="${false}"/><%-- Se non esiste un utente imposto la variabile logged a false --%>
			</c:otherwise>
		</c:choose>
				
		
		<jsp:include page="nav_bar.jsp"></jsp:include>
		<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">
			
			<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
			</div>
			
			<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8  align-middle mb-5">
			
			
				<div id="form" class="shadow-lg border border-light p-5 rounded">
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
		 				
		 			<h1>Amministra account</h1>
		 			<div class="p-3">
		 			   <h3>Stabilimenti</h3>
		 			       <div class="rounded border shadow p-3">
		 			           <c:forEach var="beachResortEmail" items="${beachResortEmailList}">
		 			           <div class="row mx-3">
			 			           <form action="profile.html" method="post">
			 			           		<label for="email">${beachResortEmail}</label>
			 			           		<input type="hidden" name="emailBeachResort" value="${beachResortEmail}">
			 			           		<button type="submit" class="btn btn-outline-info btn-sm shadow mt-5">Cancella</button> 	
			 			           </form>	
		 			           </div>	           		 			           
		 			           </c:forEach>	 			
		 			       </div>
		 			</div>
		 			
		 			<div class="p-3">
		 			   <h3>Clienti</h3>
		 			       <div class="rounded border shadow p-3">
		 			           <c:forEach var="clientEmail" items="${clientEmailList}">
		 			           <div class="row mx-3">
			 			           <form action="profile.html" method="post">
			 			           		<label for="email">${clientEmail}</label>
			 			           		<input type="hidden" name="emailClient" value="${clientEmail}">
			 			           		<button type="submit" class="btn btn-outline-info btn-sm shadow mt-5">Cancella</button> 	
			 			           	</form>	
		 			           	</div>	           		 			           
		 			           </c:forEach>	 			
		 			       </div>
		 			</div>
		 			
	 			</div>
			</div>
			
			<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
			</div>
		</div>
</body>
</html>