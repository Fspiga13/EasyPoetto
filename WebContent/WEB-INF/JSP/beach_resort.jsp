<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="view/css/page_style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="../../jQuery/jquery-3.4.1.min.js"></script>
<title>EasyPoetto - Beach Resort</title>
</head>
<body>

<svg aria-hidden="true" style="position: absolute; width: 0; height: 0; overflow: hidden;" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<defs>
<symbol id="icon-position" viewBox="0 0 32 32">
<title>position</title>
<path d="M16.5 24.447v-0.996c3.352 0.099 5.993 1.174 5.993 2.487 0 1.379-2.906 2.56-6.492 2.56s-6.492-1.181-6.492-2.56c0-1.313 2.641-2.389 5.992-2.487v0.996c-2.799 0.069-4.993 0.71-4.993 1.491 0 0.827 2.459 1.623 5.493 1.623 3.033 0 5.492-0.796 5.492-1.623-0.001-0.781-2.194-1.421-4.993-1.491zM10.516 8.995c0-3.033 2.521-5.493 5.556-5.493 3.034 0 5.493 2.46 5.493 5.493 0 2.607-1.818 4.786-4.256 5.348l-1.309 13.219-1.313-13.256c-2.362-0.615-4.171-2.756-4.171-5.311zM16 7.524c0-0.828-0.671-1.498-1.498-1.498s-1.499 0.67-1.499 1.498c0 0.827 0.671 1.498 1.499 1.498s1.498-0.67 1.498-1.498z"></path>
</symbol>

<symbol id="icon-envelope" viewBox="0 0 32 32">
<title>envelope</title>
<path d="M29 4h-26c-1.657 0-3 1.343-3 3v18c0 1.656 1.343 3 3 3h26c1.657 0 3-1.344 3-3v-18c0-1.657-1.343-3-3-3zM2.741 25.99l-0.731-0.732 8.249-8.248 0.731 0.732-8.249 8.248zM29.259 25.99l-8.249-8.248 0.731-0.732 8.249 8.248-0.731 0.732zM17 19.325v0.675h-2v-0.675l-12.997-12.050 1.272-1.272 12.725 11.798 12.725-11.798 1.272 1.272-12.997 12.050z"></path>
</symbol>

<symbol id="icon-phone" viewBox="0 0 32 32">
<title>phone</title>
<path d="M22 20c-2 2-2 4-4 4s-4-2-6-4-4-4-4-6 2-2 4-4-4-8-6-8-6 6-6 6c0 4 4.109 12.109 8 16s12 8 16 8c0 0 6-4 6-6s-6-8-8-6z"></path>
</symbol>
</defs>
</svg>

	<%-- <c:set var="logged" scope="request" value="${true}"/> Se siamo nella pagina di Home, siamo già loggati quindi per forza true --%>
	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>

		<div id="main" class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle mb-5 rounded">
			
			<h1>
				<u>${beachResort.name}</u>
			</h1>
			
			<div class="row">
				<img src="${beachResort.logo}" height="130" width="130" class="float-left m-3">
				<div class="float-left m-3" >
					<div class="row" >
	                    <svg class="icon icon-position" width="30"><use xlink:href="#icon-position"></use></svg>
						<p class="ml-2">${beachResort.address}</p>
					</div>
					<div class="row" >
						<svg class="icon icon-phone" width="30"><use xlink:href="#icon-phone"></use></svg>
						<p class="ml-2">${beachResort.telephone}</p>
					</div>
					<div class="row" >
						<svg class="icon icon-envelope" width="30"><use xlink:href="#icon-envelope"></use></svg>
						<p class="ml-2">${beachResort.email}</p>
					</div>
				</div>
			</div>

			<img src="${beachResort.image}" class="img-fluid py-3">
			
			<div class="text-justify">
				<p>${beachResort.description}</p>
			</div>

			<div class="row ml-3">

				<ul>
					<c:if test="${beachResort.parking==true}">
						<li>Parcheggio</li>
					</c:if>
					<c:if test="${beachResort.pedalo==true}">
						<li>Pedalò</li>
					</c:if>
					<c:if test="${beachResort.shower==true}">
						<li>Docce</li>
					</c:if>
					<c:if test="${beachResort.toilette==true}">
						<li>Toilette</li>
					</c:if>
					<c:if test="${beachResort.restaurant==true}">
						<li>Punto ristoro</li>
					</c:if>
					<c:if test="${beachResort.disabledFacilities==true}">
						<li>Servizi per disabili</li>
					</c:if>
					<c:if test="${beachResort.childrenArea==true}">
						<li>Area bambini</li>
					</c:if>
					<c:if test="${beachResort.dogArea==true}">
						<li>Area cani</li>
					</c:if>
				</ul>
			</div>



      <%--Se l'utente è loggato vede il bottone e sceglie la sua offerta --%>
      
	
				<form action="reservation.html" method="get">
					<button type="submit"
						class="btn btn-outline-info btn-lg btn-block shadow mt-2 ">Scegli
						la tua offerta!</button>
				</form>
		
			
			
			
			


		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>


</body>
</html>