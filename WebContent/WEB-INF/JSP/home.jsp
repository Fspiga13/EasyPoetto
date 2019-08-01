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
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<title>EasyPoetto - Home</title>

<link href="https://fonts.googleapis.com/css?family=Kaushan+Script&display=swap" rel="stylesheet">
</head>

<body>
	<%-- <c:set var="logged" scope="request" value="${true}"/> Se siamo nella pagina di Home, siamo già loggati quindi per forza true --%>
	<jsp:include page="nav_bar.jsp"></jsp:include>

	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">



		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>

		<div
			class="col-xl-8 col-lg-8 col-md-8 col-sm-8 align-middle mb-5 rounded">


			<div class="yb-cover">

				<p id="slogan">Goditi la giornata al Poetto!</p>

				<form action="search.html" method="get">
					<div
						class="form-row d-flex justify-content-center align-items-center mt-4 pb-1">

						

						<div class="form-group col-auto ol-cover-search">
							<input type="date" class="form-control" id="search_date"
								name="search_date" value="${today_date}" min="${today_date}" />
						</div>

						<div class="col-auto">
							<button type="submit" id="trova"
								class="btn btn-info rounded mb-2">Trova lo
								stabilimento</button>
						</div>

					</div>
				</form>

			</div>


			<div id="main" class="align-middle mt-5 rounded p-3">
				<img id="homePoetto" src="view/Resources/home-poetto.jpg"
					class="img-fluid pb-5">

				<div class="text-justify">
					<p>La nostra Applicazione Web è pensata per tutti i turisti o
						cittadini che vogliano organizzare la loro giornata al mare nella
						meravigliosa spiaggia del Poetto, godendo di tutti i servizi messi
						a disposizione dagli stabilimenti balneari presenti. Estendendosi
						per 7 km di arenile dalle pendici della Sella del Diavolo fino al
						Margine Rosso(in territorio di Quartu Sant'Elena), il Poetto
						propone una serie di possobilità per rendere uniche le vacanze in
						una spiaggia da sogno baciata da un mare cristallino.</p>

					<p>La nostra spiaggia, oltre che per un bagno di sole e per una
						nuotata, e' una location ideale anche per praticare un po' di
						sport all'aria aperta o fare una passeggiata fuori dal traffico e
						dai pericoli nell'isola pedonale che va dalla prima fermata fino
						alla quarta.</p>
						
					<p>Il Poetto, o su Poettu in sardo, ancora oggi e' considerata
						una delle piu' belle dell'Isola ed e' uno dei luoghi piu'
						frequentati e amati, non solo in estate e non solo di giorno.
						I baretti sulla spiaggia, i ristoranti, le pizzerie e le discoteche 
						che movimentano la zona nei mesi da aprile a ottobre e fanno del Poetto
						il centro di un'intensa movida notturna che richiama giovani di tutto
						l'hinterland.</p>
						
						<p>Che aspetti?
						Scegli la data e trova lo stabilimento perfetto per la tua giornata al Poetto!</p>
				</div>



			</div>
		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>