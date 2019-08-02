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
	
	<link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet">

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

<symbol id="icon-travel-car" viewBox="0 0 20 20">
<title>travel-car</title>
<path d="M2 14v-3h-1c-0.552 0-1-0.448-1-1v0c0-0.552 0.448-1 1-1v0h1l4-7h8l4 7h1c0.552 0 1 0.448 1 1v0c0 0.552-0.448 1-1 1v0h-1v6c0 0.552-0.448 1-1 1v0h-1c-0.552 0-1-0.448-1-1v0-1h-10v1c0 0.552-0.448 1-1 1v0h-1c-0.552 0-1-0.448-1-1v0-3zM15.86 9l-2.86-5h-6l-2.86 5h11.72zM5.5 14c0.828 0 1.5-0.672 1.5-1.5s-0.672-1.5-1.5-1.5v0c-0.828 0-1.5 0.672-1.5 1.5s0.672 1.5 1.5 1.5v0zM14.5 14c0.828 0 1.5-0.672 1.5-1.5s-0.672-1.5-1.5-1.5v0c-0.828 0-1.5 0.672-1.5 1.5s0.672 1.5 1.5 1.5v0z"></path>
</symbol>

<symbol id="icon-child" viewBox="0 0 20 28">
<title>child</title>
<path d="M18.562 8.563l-4.562 4.562v12.875c0 0.969-0.781 1.75-1.75 1.75s-1.75-0.781-1.75-1.75v-6h-1v6c0 0.969-0.781 1.75-1.75 1.75s-1.75-0.781-1.75-1.75v-12.875l-4.562-4.562c-0.578-0.594-0.578-1.531 0-2.125 0.594-0.578 1.531-0.578 2.125 0l3.563 3.563h5.75l3.563-3.563c0.594-0.578 1.531-0.578 2.125 0 0.578 0.594 0.578 1.531 0 2.125zM13.5 6c0 1.937-1.563 3.5-3.5 3.5s-3.5-1.563-3.5-3.5 1.563-3.5 3.5-3.5 3.5 1.563 3.5 3.5z"></path>
</symbol>

<symbol id="icon-wheelchair" viewBox="0 0 25 28">
<title>wheelchair</title>
<path d="M15.984 18.547l1.594 3.187c-1.203 3.719-4.672 6.266-8.578 6.266-4.953 0-9-4.047-9-9 0-3.781 2.375-7.156 5.922-8.453l0.266 2.047c-2.547 1.125-4.188 3.625-4.188 6.406 0 3.859 3.141 7 7 7 4.016 0 7.266-3.437 6.984-7.453zM24.547 20.109l0.906 1.781-4 2c-0.141 0.078-0.297 0.109-0.453 0.109-0.375 0-0.734-0.219-0.891-0.547l-3.734-7.453h-7.375c-0.5 0-0.938-0.391-1-0.891l-1.5-12.172c-0.016-0.156 0.047-0.5 0.094-0.656 0.297-1.078 1.297-1.781 2.406-1.781 1.375 0 2.5 1.125 2.5 2.5 0 1.422-1.25 2.641-2.688 2.484l0.578 4.516h6.609v2h-6.359l0.25 2h7.109c0.375 0 0.734 0.219 0.891 0.547l3.563 7.109z"></path>
</symbol>

<symbol id="icon-shower" viewBox="0 0 30 28">
<title>shower</title>
<path d="M22.391 3.891c0.203 0.203 0.203 0.516 0 0.719l-9.781 9.781c-0.203 0.203-0.516 0.203-0.719 0l-1.281-1.281c-0.203-0.203-0.203-0.516 0-0.719l0.688-0.688c-1.516-1.906-1.703-4.516-0.547-6.594-0.719-0.688-1.687-1.109-2.75-1.109-2.203 0-4 1.797-4 4v20h-4v-20c0-4.406 3.594-8 8-8 2.25 0 4.281 0.938 5.734 2.438 1.969-0.797 4.25-0.5 5.969 0.859l0.688-0.688c0.203-0.203 0.516-0.203 0.719 0zM21 8c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM25 10c-0.547 0-1-0.453-1-1s0.453-1 1-1 1 0.453 1 1-0.453 1-1 1zM29 8c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM19 10c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM22 11c0-0.547 0.453-1 1-1s1 0.453 1 1-0.453 1-1 1-1-0.453-1-1zM27 10c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM17 12c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM21 14c-0.547 0-1-0.453-1-1s0.453-1 1-1 1 0.453 1 1-0.453 1-1 1zM25 12c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM19 16c-0.547 0-1-0.453-1-1s0.453-1 1-1 1 0.453 1 1-0.453 1-1 1zM23 14c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM17 16c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM21 16c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM19 18c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1zM17 20c0.547 0 1 0.453 1 1s-0.453 1-1 1-1-0.453-1-1 0.453-1 1-1z"></path>
</symbol>

<symbol id="icon-paw" viewBox="0 0 26 28">
<title>paw</title>
<path d="M12.187 7.375c0 1.75-0.906 3.828-2.922 3.828-2.531 0-4.062-3.187-4.062-5.375 0-1.75 0.906-3.828 2.922-3.828 2.547 0 4.062 3.187 4.062 5.375zM6.844 14.922c0 1.516-0.797 3.094-2.516 3.094-2.5 0-4.328-3.063-4.328-5.328 0-1.516 0.812-3.109 2.516-3.109 2.5 0 4.328 3.078 4.328 5.344zM13 14.5c3.828 0 9 5.516 9 9.203 0 1.984-1.625 2.297-3.219 2.297-2.094 0-3.781-1.406-5.781-1.406-2.094 0-3.875 1.391-6.141 1.391-1.516 0-2.859-0.516-2.859-2.281 0-3.703 5.172-9.203 9-9.203zM16.734 11.203c-2.016 0-2.922-2.078-2.922-3.828 0-2.188 1.516-5.375 4.062-5.375 2.016 0 2.922 2.078 2.922 3.828 0 2.188-1.531 5.375-4.062 5.375zM23.484 9.578c1.703 0 2.516 1.594 2.516 3.109 0 2.266-1.828 5.328-4.328 5.328-1.719 0-2.516-1.578-2.516-3.094 0-2.266 1.828-5.344 4.328-5.344z"></path>
</symbol>

<symbol id="icon-spoon-knife" viewBox="0 0 32 32">
<title>spoon-knife</title>
<path d="M7 0c-3.314 0-6 3.134-6 7 0 3.31 1.969 6.083 4.616 6.812l-0.993 16.191c-0.067 1.098 0.778 1.996 1.878 1.996h1c1.1 0 1.945-0.898 1.878-1.996l-0.993-16.191c2.646-0.729 4.616-3.502 4.616-6.812 0-3.866-2.686-7-6-7zM27.167 0l-1.667 10h-1.25l-0.833-10h-0.833l-0.833 10h-1.25l-1.667-10h-0.833v13c0 0.552 0.448 1 1 1h2.604l-0.982 16.004c-0.067 1.098 0.778 1.996 1.878 1.996h1c1.1 0 1.945-0.898 1.878-1.996l-0.982-16.004h2.604c0.552 0 1-0.448 1-1v-13h-0.833z"></path>
</symbol>

<symbol id="icon-man-woman" viewBox="0 0 32 32">
<title>man-woman</title>
<path d="M8 3c0 1.657-1.343 3-3 3s-3-1.343-3-3c0-1.657 1.343-3 3-3s3 1.343 3 3z"></path>
<path d="M26 3c0 1.657-1.343 3-3 3s-3-1.343-3-3c0-1.657 1.343-3 3-3s3 1.343 3 3z"></path>
<path d="M8 8h-6c-1.105 0-2 0.895-2 2v10h2v12h2.5v-12h1v12h2.5v-12h2v-10c0-1.105-0.895-2-2-2z"></path>
<path d="M30.469 16l1.531-1.109-4.165-6.441c-0.185-0.281-0.499-0.45-0.835-0.45h-8c-0.336 0-0.65 0.169-0.835 0.45l-4.165 6.441 1.531 1.109 3.458-4.487 1.202 2.804-4.191 7.683h3.833l0.667 10h2v-10h1v10h2l0.667-10h3.833l-4.191-7.683 1.202-2.804 3.458 4.487z"></path>
</symbol>

</defs>
</svg>

	<%-- <c:set var="logged" scope="request" value="${true}"/> Se siamo nella pagina di Home, siamo già loggati quindi per forza true --%>
	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>

		<div id="main" class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle mb-5 rounded">
			
			
				<p id="beach_resort_title">
						${beachResort.name}</p>
			
			<div class="row" >
				<div class="center-cropped-logo">
					<img src="${beachResort.logo}" class="float-left mx-3 my-2 rounded border">
				</div>
				<div class="float-left m-3" >
					<div class="row" >
	                    <svg class="icon icon-position"><use xlink:href="#icon-position"></use></svg>
						<p class="ml-2">${beachResort.address}</p>
					</div>
					<div class="row" >
						<svg class="icon icon-phone"><use xlink:href="#icon-phone"></use></svg>
						<p class="ml-2">${beachResort.telephone}</p>
					</div>
					<div class="row" >
						<svg class="icon icon-envelope"><use xlink:href="#icon-envelope"></use></svg>
						<p class="ml-2">${beachResort.email}</p>
					</div>
				</div>
			</div>
			
			<div class="center-cropped-img">
			<img src="${beachResort.image}" class="img-fluid py-3">
			</div>
			
			<div class="text-justify">
				<p>${beachResort.description}</p>
			</div>

			<div class="ml-3">

				<div class="row ml-3">
					<c:if test="${beachResort.parking==true}">
						<svg class="icon icon-travel-car"><use xlink:href="#icon-travel-car"></use></svg>					
						<p  class="ml-3">Parcheggio</p>
					</c:if>
				</div>
				<div class="row ml-3">						
					<c:if test="${beachResort.pedalo==true}">
						<img src="view/Resources/pedalò-icon.svg" alt="Integrare SVG con il tag image" title="pedalo" width="30" class="icon">
						<p class="ml-3">Pedalò</p>
					</c:if>
				</div>
				<div class="row ml-3">		
					<c:if test="${beachResort.shower==true}">
                		<svg class="icon icon-shower"><use xlink:href="#icon-shower"></use></svg>
						<p class="ml-3">Docce</p>
					</c:if>
				</div>
				<div class="row ml-3">	
					<c:if test="${beachResort.toilette==true}">
						<svg class="icon icon-man-woman"><use xlink:href="#icon-man-woman"></use></svg>  
						<p class="ml-3">Toilette</p>
					</c:if>
				</div>
				<div class="row ml-3">	
					<c:if test="${beachResort.restaurant==true}">
                		<svg class="icon icon-spoon-knife"><use xlink:href="#icon-spoon-knife"></use></svg>
						<p class="ml-3">Punto ristoro</p>
					</c:if>				
				</div>
				<div class="row ml-3">	
					<c:if test="${beachResort.disabledFacilities==true}">
                		<svg class="icon icon-wheelchair"><use xlink:href="#icon-wheelchair"></use></svg>
						<p class="ml-3">Servizi per disabili</p>
					</c:if>
				</div>
				<div class="row ml-3">	
					<c:if test="${beachResort.childrenArea==true}">
						<svg class="icon icon-child"><use xlink:href="#icon-child"></use></svg>
						<p class="ml-3">Area bambini</p>
					</c:if>
				</div>
				<div class="row ml-3">	
					<c:if test="${beachResort.dogArea==true}">
						<svg class="icon icon-paw"><use xlink:href="#icon-paw"></use></svg>
						<p class="ml-3">Area cani</p>
					</c:if>
				</div>
				
				<c:if test="${logged==false}">
					<div class="alert alert-warning" role="alert">
	  					Per effettuare una prenotazione <a href="signup.html">Registrati</a> o effettua il <a href="login.html">Login</a>
					</div>
				</c:if>
				<c:if test="${complete_profile == true}">
					<div class="alert alert-warning" role="alert">
	  					Per effettuare una prenotazione devi completare il tuo <a href="profile.html">Profilo</a>
					</div>
				</c:if>
				<c:if test="${not empty role && role != 2}">
					<div class="alert alert-warning" role="alert">
	  					Solo i clienti possono effettuare prenotazioni
					</div>
				</c:if>
				
					<form action="reservation.html" method="get">
						<input type="hidden" name="beach_resort_id" value="${beachResort.id}">
						<input type="hidden" name="reservation_date" value="${reservation_date}">
					
						<button type="submit" class="btn btn-outline-info btn-lg btn-block mt-2" <c:if test="${logged==false || role != 2 || complete_profile == true}">disabled</c:if>>
						Scegli la tua offerta!</button>
					</form>
				</div>


      <%--Se l'utente è loggato vede il bottone e sceglie la sua offerta --%>
      

		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
	
	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>