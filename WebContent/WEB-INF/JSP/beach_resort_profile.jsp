<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="view/css/page_style.css">
<link rel="stylesheet" type="text/css" href="view/css/button_style.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="../../jQuery/jquery-3.4.1.min.js"></script>
<title>Easy Poetto - Profilo</title>
</head>
<body>
	<%-- Imposto le variabili che servono alla navbar per essere visualizzata nel modo corretto --%>
	<c:set var="logged" scope="request" value="${true}" />
	<c:choose>
		<c:when test="${not empty client}">
			<c:set var="logged" scope="request" value="${true}" />
			<%-- Se esiste un utente imposto la variabile logged a true --%>
		</c:when>
		<c:otherwise>
			<c:set var="logged" scope="request" value="${false}" />
			<%-- Se non esiste un utente imposto la variabile logged a false --%>
		</c:otherwise>
	</c:choose>


	<jsp:include page="nav_bar.jsp"></jsp:include>
	<div class="row col-xl-12 col-lg-12 col-md-12 col-sm-12">

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>

		<div class="col-xl-8 col-lg-8 col-md-8 col-sm-8">


			<div id="form" class="shadow-lg border border-light p-5 rounded">
				<c:if test="${not empty error}">
					<div class="alert alert-danger" role="alert">${error}</div>
				</c:if>

				<c:if test="${not empty success}">
					<div class="alert alert-success" role="alert">${success}</div>
				</c:if>
				<h1>My Profile</h1>

				<form action="profile.html" method="post">

					<%--CREATE TABLE BEACH_RESORTS( 
id NUMBER(38,0),
user_id NUMBER (38,0),
name VARCHAR2(200CHAR)NOT NULL,
description VARCHAR2(2000CHAR)NOT NULL,
image VARCHAR2(2000CHAR),
logo VARCHAR2(2000CHAR),
address VARCHAR2(200CHAR),
telephone VARCHAR2(15CHAR),
num_umbrellas NUMBER(3,0),
num_beach_loungers NUMBER(4,0),
parking CHAR(1)CHECK (parking in ('Y','N')),
pedalo CHAR(1)CHECK (pedalo in ('Y','N')),
shower CHAR(1)CHECK (shower in ('Y','N')),
toilette CHAR(1)CHECK (toilette in ('Y','N')),
restaurant CHAR(1)CHECK (restaurant in ('Y','N')),
disabled_facilities CHAR(1)CHECK (disabled_facilities in ('Y','N')),
children_area CHAR(1)CHECK (children_area in ('Y','N')),
dog_area CHAR(1)CHECK (dog_area in ('Y','N')),

CONSTRAINT pk_beach_resorts_id PRIMARY KEY(id),
CONSTRAINT fk_beach_resorts_user_id FOREIGN KEY (user_id) REFERENCES users(id)
); --%>

					<div>
						<label for="name">Nome Stabilimento</label> <input type="text"
							class="form-control mb-4" id="name" name="name" required
							<c:if test= "${not empty client.name}">value="${client.name}"</c:if> />
					</div>
					<div>
						<label for="surname">Descrizione</label> <input type="text"
							class="form-control mb-4" id="surname" name="surname" required
							<c:if test= "${not empty client}">value="${client.surname}"</c:if> />
					</div>
					<div>
						<label for="email">E-mail</label> <input type="email"
							class="form-control mb-4" id="email" name="email"
							pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$"
							<c:if test= "${not empty client}">value="${client.email}"</c:if> />
					</div>

					<%--inserisci vecchia password, inserisci nuova password --%>

					<div>
						<label for="password">Password</label> <input type="password"
							class="form-control mb-4" id="password" name="password" />
					</div>

					<div>
						<label for="image">Immagine</label> <input type="text"
							class="form-control mb-4" id="image" name="image"
							<c:if test= "${not empty client}">value="${client.image}"</c:if> />
					</div>

					<div>
						<label for="logo">Logo</label> <input type="text"
							class="form-control mb-4" id="logo" name="logo"
							<c:if test= "${not empty client}">value="${client.logo}"</c:if> />
					</div>

					<div>
						<label for="address">Indirizzo</label> <input type="text"
							class="form-control mb-4" id="address" name="address"
							<c:if test= "${not empty client}">value="${client.address}"</c:if> />
					</div>

					<div>
						<label for="telephone">Numero di telefono</label> <input
							type="text" class="form-control mb-4" id="telephone"
							name="telephone"
							<c:if test= "${not empty client}">value="${client.telephone}"</c:if> />
					</div>

					<div>
						<select name = "num_umbrellas" size = "5" multiple>
							
							<c:forEach begin = "${10}" end="${500}" step="10" var="index">
							
								<option value="${index}">${index}</option>
							</c:forEach>
						</select>
					</div>
					
					<div>
						<select name = "num_beach_loungers" size = "5" multiple>
							
							<c:forEach begin = "${10}" end="${1500}" step="50" var="index">
							
								<option value="${index}">${index}</option>
							</c:forEach>
						</select>
					</div>
					
					

					<button type="submit" class="rounded btn-sample btn-block btn-lg">Modifica</button>
				</form>
			</div>
		</div>

		<div class="col-xl-2 col-lg-2 col-md-2 col-sm-2"></div>
	</div>
</body>
</html>