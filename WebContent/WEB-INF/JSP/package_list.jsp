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
	<title>Easy Poetto - I tuoi Pacchetti</title>
</head>
<body>
				<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
		<c:set var="logged" scope="request" value="${true}"/>
		
		<jsp:include page="nav_bar.jsp"></jsp:include>
		<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">
			
			<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
			</div>
			
			<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8  align-middle mb-5">
			
			
				<div id="main" class="shadow-lg border border-light p-5 rounded">
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
		 				
		 			<h1 class="pb-3">I tuoi pacchetti</h1>
		 			<div class="p-3">
		 			  
		 			       <div class="rounded border p-3">
		 			           <c:forEach var="package" items="${packageList}">
		 			            <div class="row mx-3">
			 			           <form action="{packagelist.html" method="post">
			 			           		<label for="email">${package.name}</label>
			 			           		<input type="hidden" name="id" value="${package.id}">
			 			           		<button type="submit" class="btn btn-outline-info btn-sm mt-5">Ripristina</button> 
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