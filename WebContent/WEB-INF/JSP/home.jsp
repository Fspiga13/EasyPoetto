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
			
			<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle mb-5">
		
	    	<img id="homePoetto" src="view/Resources/HomePoetto.jpg" class="img-fluid py-5"> 

			<div class="text-justify">
			<p>	Situata nella costa centro-meridionale della Sardegna, la spiaggia del Poetto ancora oggi e' considerata 
				una delle piu' belle spiagge dell'Isola ed e' la meta preferita di ogni cagliaritano, ma non solo.
				Il Poetto (o Puettu in sardo) e'  infatti uno dei luoghi piu' frequentati e amati, non solo in estate. Si estende per 7 chilometri di arenile, 
				dalle pendici della Sella del Diavolo, dove si trova il porticciolo di Marina Piccola, 
				fino al Margine Rosso (in territorio di Quartu Sant'Elena) separano il mare dall'area umida delle Saline e 
				degli stagni di Molentargius.
			</p>
			<p>
				Fino alla fine del XIX secolo la spiaggia del Poetto non era frequentata dagli abitanti di Cagliari, 
				che preferivano andare al mare nella zona di Giorgino (sud-ovest dell'abitato), piu' vicina ai quartieri 
				storici e facilmente raggiungibile anche a piedi. Agli inizi del '900, con la costruzione della linea 
				tramviaria e dei primi stabilimenti balneari (il D'Aquila e il Lido, aperti rispettivamente nel 1913 e nel 1914), 
				la sabbia candida e le acque cristalline del Poetto iniziarono invece ad esercitare un fascino irresistibile 
				sui cagliaritani.
			</p>
			<p>	
				Tra le bianche dune allora esistenti furono edificati i famosi casotti, sorta di palafitte 
				realizzate con legni policromi: queste caratteristiche costruzioni divennero parte del paesaggio 
				del Poetto e nei mesi estivi ospitavano numerose famiglie di Cagliari e dell'hinterland che spesso 
				le utilizzavano come vere e proprie seconde case; tutto cio' ebbe fine nel 1985, quando la Capitaneria 
				di Porto decreto' tra le polemiche l'abbattimento dei casotti del Poetto per problemi di natura igienico-sanitaria.
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

				<form action="search.html"  method="get">
	        	<button type="submit" class="btn btn-outline-info btn-lg btn-block shadow mt-5 mb-5 ">Trova Stabilimento</button>	
				</form>

		
			</div>
			
			<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2">
			</div>
		</div>
		
		
	</body>
</html>