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
<title>EasyPoetto - Search Beach Resort</title>
</head>
<body>

	<%-- <c:set var="logged" scope="request" value="${true}"/> Se siamo nella pagina di Home, siamo già loggati quindi per forza true --%>
	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>

		<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 mb-5">

			<div class="rounded border shadow p-3">
				<h3>Scegli le tue preferenze</h3>
				<form action="search.html" method="get">
					<div class="row">
						<div class=" px-4 py-2">
							Parcheggio <input type="checkbox" name="service" value="parking" class="check">
						</div><div class="px-4 py-2">
							Pedalò <input type="checkbox" name="service" value="pedalo" class="check">
						</div><div class="px-4 py-2">
							Docce <input type="checkbox" name="service" value="shower" class="check">
						</div><div class="px-4 py-2"> 
							Toilette <input type="checkbox" name="service" value="toilette" class="check">
						</div>
					</div>
					<div class="row">
						<div class="px-4 py-2">
							Punto ristoro <input type="checkbox" name="service"value="restaurant" class="check"> 
						</div><div class="px-4 py-2">
							Servizi per disabili <input type="checkbox" name="service" value="disabled_facilities" class="check">
						</div><div class="px-4 py-2">
							Area bambini <input type="checkbox" name="service"value="children_area" class="check"> 
						</div><div class="px-4 py-2">
							Dog area <input type="checkbox"name="service" value="dog_area" class="check">
						</div>
					</div>
					<button type="submit"
						class="btn btn-outline-info shadow m-4">Filtra
					</button>					
				</form>
			</div>

			<c:forEach var="beachResort" items="${beachResorts}">
				<div class="pt-4 px-4">
					<form action="search.html" method="post">
						<button type="submit"
							class="btn btn-outline-info btn-lg btn-block shadow">
	
							<div class="m-1 p-2">
								<div >
								<img src="${beachResort.image}" height="200" width="200" class="float-left">
								</div>	
								
								<div class="p-2">
									<h4>${beachResort.name}</h4>
									<p class=" border-bottom">${beachResort.description}</p>
									
									<p class="text-dark">
										<c:if test="${beachResort.parking==true}">
											Parcheggio
										</c:if>
										<c:if test="${beachResort.pedalo==true}">
											Pedalò
										</c:if>
										<c:if test="${beachResort.shower==true}">
											Docce
										</c:if>
										<c:if test="${beachResort.toilette==true}">
											Toilette
										</c:if>
										<c:if test="${beachResort.restaurant==true}">
											Punto ristoro
										</c:if>
										<c:if test="${beachResort.disabledFacilities==true}">
											Servizi per disabili
										</c:if>
										<c:if test="${beachResort.childrenArea==true}">
											Area bambini
										</c:if>
										<c:if test="${beachResort.dogArea==true}">
											Dog area
										</c:if>
									</p>
								</div>
							</div>
							
						</button>
						 <input type="hidden" name="beachResortId" value="${beachResort.id}"/>
					</form>
				</div>
			</c:forEach>

		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>


</body>
</html>