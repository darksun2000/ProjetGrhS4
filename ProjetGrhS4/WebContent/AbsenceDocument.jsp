<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">


<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Gestion des ressources humaines | Absence Employe</title>
	<meta name="description" content="Cardio is a free one page template made exclusively for Codrops by Luka Cvetinovic" />
	<meta name="keywords" content="html template, css, free, one page, gym, fitness, web design" />
	<meta name="author" content="Luka Cvetinovic for Codrops" />
	<!-- Favicons (created with http://realfavicongenerator.net/)-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="apple-touch-icon" sizes="57x57" href="Cardio/img/favicons/apple-touch-icon-57x57.png">
	<link rel="apple-touch-icon" sizes="60x60" href="Cardio/img/favicons/apple-touch-icon-60x60.png">
	<link rel="icon" type="image/png" href="Cardio/img/favicons/favicon-32x32.png" sizes="32x32">
	<link rel="icon" type="image/png" href="Cardio/img/favicons/favicon-16x16.png" sizes="16x16">
	<link rel="manifest" href="Cardio/img/favicons/manifest.json">
	<link rel="shortcut icon" href="Cardio/img/favicons/favicon.ico">
	<meta name="msapplication-TileColor" content="#00a8ff">
	<meta name="msapplication-config" content="Cardio/img/favicons/browserconfig.xml">
	<meta name="theme-color" content="#ffffff">
	<!-- Normalize -->
	<link rel="stylesheet" type="text/css" href="Cardio/css/normalize.css">
	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="Cardio/css/bootstrap.css">
	<!-- Owl -->
	<link rel="stylesheet" type="text/css" href="Cardio/css/owl.css">
	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="Cardio/css/animate.css">
	<!-- Font Awesome -->
	<link rel="stylesheet" type="text/css" href="Cardio/fonts/font-awesome-4.1.0/css/font-awesome.min.css">
	<!-- Elegant Icons -->
	<link rel="stylesheet" type="text/css" href="Cardio/fonts/eleganticons/et-icons.css">
	<!-- Main style -->
	<link rel="stylesheet" type="text/css" href="Cardio/css/cardio.css">
	<!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
</head>
<% if(session.getAttribute("Employe")==null){ 
        response.sendRedirect("Login.jsp");} 
   	 %>

<body>
	<div class="preloader">
		<img src="Cardio/img/loader.gif" alt="Preloader image">
	</div>
	<nav class="navbar">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="Cardio/img/logo-active.png" data-active-url="Cardio/img/logo-active.png" alt=""></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right main-nav">
					<li><a href="HomeEmploye.jsp">Home</a></li>
					<li><a href="MessageEmploye?nomEmploye=${Employe.nomEmploye}">Message</a></li>
					<li><a href="afficherAbsenceE?nomEmploye=${Employe.nomEmploye }">Absence</a></li>
					<li><a href="afficherEmploye?idEmploye=${Employe.idEmploye }">Profil</a></li>
					<li><a href="listeEmployeE?nomEmploye=${Employe.nomEmploye }">Employes</a></li>
					<li><a href="consemp?nomEmploye=${Employe.nomEmploye }">Emploi</a></li>
					<li><a href="profilAdminE">Admin</a></li>
					<li><a href="logout" class="btn btn-blue">Log out</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<section id="services" class="section section-padded">
		<div class="container">
			<div class="row title text-center" style="margin-top:150px">
				<h2>Absences</h2>
				<h4 class="light muted">Document absences</h4>
			</div>
			<form role="form" action="EnvoyerDemande?IdAbsence=${absence.getIdAbsences()}&nomEmploye=${Employe.getNomEmploye()}" method="post" enctype='multipart/form-data'>
			
			<div class="row services">
			
			<label for="exampleInputFile" style="margin-left:450px;">Upload Document (pas obligatoire)</label> <input
											type="file" class="custom-file-input" name="photoEmploye"
											id="customFile" style="margin-left:450px;"> 
			
										
				<button class="btn btn-blue" type="submit" style="margin-left:455px; margin-top:100px">Envoyer demande</button>						
										
		</div>
		</form>
		<div class="cut cut-bottom"></div>
	</section>

		<footer>
		<div class="container">
			<div class="row">
				
				<div class="col-sm-6 text-center-mobile">
					<h3 class="white">Heures de travaille <span class="open-blink"></span></h3>
					<div class="row opening-hours">
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Lundi - Jeudi</h5>
							<h3 class="regular white">9:00 - 18:00</h3>
						</div>
						<div class="col-sm-6 text-center-mobile">
							<h5 class="light-white light">Vendredi</h5>
							<h3 class="regular white">9:00 - 12:00</h3>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</footer>
	<!-- Holder for mobile navigation -->
	<div class="mobile-nav">
		<ul>
		</ul>
		<a href="#" class="close-link"><i class="arrow_up"></i></a>
	</div>
	<!-- Scripts -->
	<script src="Cardio/js/jquery-1.11.1.min.js"></script>
	<script src="Cardio/js/owl.carousel.min.js"></script>
	<script src="Cardio/js/bootstrap.min.js"></script>
	<script src="Cardio/js/wow.min.js"></script>
	<script src="Cardio/js/typewriter.js"></script>
	<script src="Cardio/js/jquery.onepagenav.js"></script>
	<script src="Cardio/js/main.js"></script>
	
</body>

</html>
