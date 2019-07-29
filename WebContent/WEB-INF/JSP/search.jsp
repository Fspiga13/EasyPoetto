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

<svg aria-hidden="true" style="position: absolute; width: 0; height: 0; overflow: hidden;" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
<defs>
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

		<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3">
		
		<div id="main" class="rounded border shadow p-3">
				<h3>Servizi</h3>
				<form action="search.html" method="get">
					<div class="row align-middle">
						<div class=" px-4 py-2">
					      <div class="glyph fs1">
					            <div class="clearfix pbs">
					            <input type="checkbox" name="service" value="parking" class="check"
					            <c:if test= "${ not empty servicesMap['parking']}">checked</c:if> />
					                <svg class="icon icon-travel-car"><use xlink:href="#icon-travel-car"></use></svg>
					                <span class="name">Parcheggio </span>
					            </div>
					        </div>
					      
						</div><div class="px-4 py-2">
							<input type="checkbox" name="service" value="pedalo" class="check"
							<c:if test= "${ not empty servicesMap['pedalo']}">checked</c:if> />
							<img src="view/Resources/pedalò-icon.svg" alt="Integrare SVG con il tag image" title="pedalo" width="30" class="icon">Pedalò 
						</div><div class="px-4 py-2">
					        <div class="glyph fs2">
            					<div class="clearfix pbs">
            						<input type="checkbox" name="service" value="shower" class="check"
            						<c:if test= "${ not empty servicesMap['shower']}">checked</c:if> />
                					<svg class="icon icon-shower"><use xlink:href="#icon-shower"></use></svg>
                					<span class="name">Docce</span>
            					</div>
        					</div>
						</div><div class="px-4 py-2"> 
					        <div class="glyph fs3">
            					<div class="clearfix pbs">
            					<input type="checkbox" name="service" value="toilette" class="check"
            					<c:if test= "${ not empty servicesMap['toilette']}">checked</c:if> />
               						<svg class="icon icon-man-woman"><use xlink:href="#icon-man-woman"></use></svg>
               						<span class="name">Toilette</span>
            					</div>
       						 </div>
						</div>
					</div>
					<div class="row">
						<div class="px-4 py-2">
							<div class="glyph fs3">
            					<div class="clearfix pbs">
            					<input type="checkbox" name="service"value="restaurant" class="check"
            					<c:if test= "${ not empty servicesMap['restaurant']}">checked</c:if> />
                				<svg class="icon icon-spoon-knife"><use xlink:href="#icon-spoon-knife"></use></svg>
                				<span class="name">Punto ristoro</span>
           					 </div>
       					 </div>
						</div><div class="px-4 py-2">
							<div class="glyph fs2">
            					<div class="clearfix pbs">
            					<input type="checkbox" name="service" value="disabled_facilities" class="check"
            					<c:if test= "${ not empty servicesMap['disabled_facilities']}">checked</c:if> />
                					<svg class="icon icon-wheelchair"><use xlink:href="#icon-wheelchair"></use></svg>
                					<span class="name">Servizi per disabili</span>
            					</div>
       						 </div>
						</div><div class="px-4 py-2">
							<div class="glyph fs2">
            					<div class="clearfix pbs">
            					<input type="checkbox" name="service"value="children_area" class="check"
            					<c:if test= "${ not empty servicesMap['children_area']}">checked</c:if> />
                				<svg class="icon icon-child"><use xlink:href="#icon-child"></use></svg>
                				<span class="name">Area bambini</span>
            					</div>
       						</div>
							 
						</div><div class="px-4 py-2">
						<div class="item"></div>	
							<div class="glyph fs2">
           						<div class="clearfix pbs">
           						<input type="checkbox"name="service" value="dog_area" class="check"
           						<c:if test= "${ not empty servicesMap['dog_area']}">checked</c:if> />
                					<svg class="icon icon-paw"><use xlink:href="#icon-paw"></use></svg>
                					<span class="name">Area cani</span>
           						 </div>
      						 </div>			
						</div>
					</div>
					<button type="submit"
						class="btn btn-outline-info m-2">Filtra
					</button>					
				</form>
			</div>
		
		
		
		</div>

		<div id="main" class="col-xl-8 col-lg-8 col-md-8 col-sm-8 mb-5 rounded" style="overflow:auto">

			
			
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
											Area cani
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

		<div class="col-xl-1 col-lg-1 col-md-1 col-sm-1"></div>
	</div>


</body>
</html>