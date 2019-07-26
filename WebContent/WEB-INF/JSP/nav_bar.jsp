<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; pageEncoding=UTF-8"%><!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="view/css/nav_style.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript" src="../../jQuery/jquery-3.4.1.min.js"></script>
	
	<link href='https://fonts.googleapis.com/css?family=Amatic+SC&display=swap' rel='stylesheet'>
	<style>
		#title{
			font-family: 'Amatic SC', cursive;
			font-size: 35px;
			font-weight: bold;
			color:white!important;
		}
	</style>
	
	<title></title>
</head>
<body>
	<nav class="navbar navbar-inverse mynav">
	<div class="container-fluid mynav">
		<div class="navbar-header myheader">
			<a id="title" href="home.html" class="navbar-brand" style="color:black">
			<img class="navbar-brand" id="logo" src="view/Resources/logo.png" width="60" alt="logo EasyPoetto" title="logoEasyPoetto">
				EasyPoetto
			</a>
		</div>
	<%--INSERIRE IL LOGO A SINISTRA DELLA NAVBAR --%>
		<ul class="nav navbar-right row" id="mylinks">
		<li>
			<a href="home.html" class="mynavlink pr-4">Home</a>
		</li>
		<c:choose>
		<c:when test="${logged == true}">
			<li>
				<a href="profile.html" class="mynavlink pr-4"> 
					Profilo
				</a>
			</li>
		</c:when>
		<c:otherwise>			
			<li>
				<a href="signup.html" class="mynavlink pr-4"> 
					Registrati
				</a>
			</li></c:otherwise>
		</c:choose>

		<li class="mynavlink pr-4" >
			<form 
					<c:choose>
					<c:when test="${logged==false}">action="login.html"</c:when>
					<c:otherwise>action="home.html"</c:otherwise>
					</c:choose> 
			method="get">
				<input type="hidden" name="logout" value="yes">
				<button type="submit" class="btn btn-outline-info rounded" id="loginButton"> 
					<c:choose>
					<c:when test="${logged==false}">Login</c:when>
					<c:otherwise>Logout</c:otherwise>
					</c:choose>
				</button>
			</form>
		</li>
	</ul>
	</div>
	</nav>
</body>
</html>