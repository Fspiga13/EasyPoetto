<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" type="text/css" href="view/css/page_style.css">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script type="text/javascript" src="../../jQuery/jquery-3.4.1.min.js"></script>
		<title>EasyPoetto - Home</title>
	</head>
	
	<body>
		<%-- <c:set var="logged" scope="request" value="${true}"/> Se siamo nella pagina di Home, siamo già loggati quindi per forza true --%>
		<jsp:include page="nav_bar.jsp"></jsp:include>
		<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">
			
			
			
			<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
			</div>
			
			<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle mb-5 rounded">
			
			
			<div class="yb-cover home">


			
				
					<p>Vivi la tua giornata in spiaggia senza stress!</p>
				


				<div class="form-row px-4 mt-3 align-items-center">
					
					<div class="col">
					<p>Scegli la data</p>
					</div>
					
					<div class="col">
						<div class="ol-cover-search">
							<div class="search-input-anchor">
								<div id="search_hint" style="display: none"></div>
							</div>
							<input type="date" name="date" id="search-date" class="date"
								value="2019-07-28">
						</div>
					</div>
					
									
					<div class="col">
					
					  <form action="search.html" method="get">
					  
					   <button type="submit" id="trova" class="btn btn-info rounded">Trova lo stabilimento</button>
					   
				      </form>
				 
					</div>
				</div>
			</div>
		</div>
	</div>
			
			
			<div  id="main" class="align-middle mt-5 rounded p-3">
	    	<img id="homePoetto" src="view/Resources/home-poetto.jpg" class="img-fluid pb-5"> 

			<div class="text-justify">
			<p>	Situata nella costa centro-meridionale della Sardegna, la spiaggia del Poetto ancora oggi e' considerata 
				una delle piu' belle spiagge dell'Isola ed e' la meta preferita di ogni cagliaritano, ma non solo.
				Il Poetto (o Puettu in sardo) e'  infatti uno dei luoghi piu' frequentati e amati, non solo in estate. Si estende per 7 chilometri di arenile, 
				dalle pendici della Sella del Diavolo, dove si trova il porticciolo di Marina Piccola, 
				fino al Margine Rosso (in territorio di Quartu Sant'Elena) separano il mare dall'area umida delle Saline e 
				degli stagni di Molentargius.
			</p>
			
			<p>
				Oltre che per un bagno di sole e per una nuotata, il Poetto e' una location ideale anche per praticare un po' di sport 
				all'aria aperta: un'isola pedonale va dalla prima fermata fino alla quarta ed e' possibile, unendo anche la passeggiata 
				di Marina Piccola e la pista ciclabile che inizia nei pressi dell'Ospedale Marino, fare una pedalata, un po' di jogging 
				o semplicemente una passeggiata fuori dal traffico e dai pericoli.
			</p>
			<p>
				Ma il Poetto non e' frequentato solo di giorno: baretti sulla spiaggia, ristoranti, pizzerie e discoteche movimentano
				 la zona nei mesi da aprile a ottobre e ne fanno il centro di un'intensa movida notturna che richiama giovani  
				di tutto l'hinterland. 
			</p>
			</div>



			</div>
			</div>
			
			<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
			</div>
		</div>
		
		
	</body>
</html>