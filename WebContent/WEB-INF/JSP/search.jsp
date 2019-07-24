<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="view/css/page_style.css">
		<link rel="stylesheet" type="text/css" href="view/css/button_style.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script type="text/javascript" src="../../jQuery/jquery-3.4.1.min.js"></script>
		<title>EasyPoetto - Search Beach Resort</title>
	</head>
	<body>
		<%-- <c:set var="logged" scope="request" value="${true}"/> Se siamo nella pagina di Home, siamo già loggati quindi per forza true --%>
		<jsp:include page="nav_bar.jsp"></jsp:include>
		<div class="row col-lg-12 col-md-12 col-sm-12">
			
			<div class="col-lg-2 col-md-2 col-sm-2">
			</div>
			
			<div class="col-lg-8 col-md-8 col-sm-8 align-middle">
	    
				<c:forEach var="beachResort" items="${beachResorts}"> 
		
				<form action="search.html"  method="get">
	        	<button type="submit" class="btn btn-outline-info btn-lg btn-block shadow m-4">
	        	
	        	<div class="m-1">
	        		<img src = "${beachResort.image}" height="200" width="200" class="float-left">
	        		<h4>${beachResort.name}</h4>
	        		<p>
	        			
	        		</p>
	        	</div>
	        	
	        	</button>	
				</form>
				</c:forEach>
		
			</div>
			
			<div class="col-lg-2 col-md-2 col-sm-2">
			</div>
		</div>
		
		
	</body>
</html>