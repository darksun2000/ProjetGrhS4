<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Gestion des ressources humaines | Messages</title>
	<meta name="description" content="Cardio is a free one page template made exclusively for Codrops by Luka Cvetinovic" />
	<meta name="keywords" content="html template, css, free, one page, gym, fitness, web design" />
	<meta name="author" content="Luka Cvetinovic for Codrops" />
	<!-- Favicons (created with http://realfavicongenerator.net/)-->
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
	 <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
	<!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
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
				<a class="navbar-brand" href="#"><img src="Cardio/img/logo.png" data-active-url="Cardio/img/logo-active.png" alt=""></a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="container">
                  <div class="row title text-center">
				<h1 class="light muted">Affichage de votre messages :</h1>
			</div>
	<section id="services" class="section section-padded">
		<div class="container">
		<div class="card card-primary card-outline" >
            
            <!-- /.card-header -->
            <div class="card-body p-0" >
		 <div class="mailbox-read-info" >
                <h2>${message.getSujetMessage() }</h2>
                <h4>From: ${Admin.getEmailAdmin() }
                  <span class="mailbox-read-time float-right">le :${message.getDateMessage() }</span></h4>
              </div>
			<div class="mailbox-read-message">
                <h3><p>Bonjour ${Employe.nomEmploye },</p>

                <p>${message.getMessage() }</p>

               

                <p>Merci,<br>${Admin.loginAdmin }</p></h3>
              </div>
              <c:if test="${message.getAttachement()!=''}">
              <div class="card-footer bg-white">
              <ul class="mailbox-attachments d-flex align-items-stretch clearfix">
                <li>
                  <span class="mailbox-attachment-icon"><i class="far fa-file-pdf"></i></span>

                  <div class="mailbox-attachment-info">
                    <a  class="mailbox-attachment-name"><i class="fas fa-paperclip"></i> ${message.getNomAttachement() }</a>
                        <span class="mailbox-attachment-size clearfix mt-1">
                          <span>${message.getSizeAtt()} KB</span>
                          <a href="data:${message.getType() };base64,${message.getAttachement()}"  class="btn btn-default btn-sm float-right" download="${message.getNomAttachement() }"><i class="fas fa-cloud-download-alt"></i></a>
                        </span>
                  </div>
                </li>
                </ul>
                </div>
                </c:if>
              </div>
              <div class="card-footer">
              <div class="float-right">
		<a href="MessageEmploye?nomEmploye=${Employe.nomEmploye}" style="font-size:24px" class="btn btn-primary btn-block mb-3">Retour</a></div></div>
		</div>
		</div>
		
	</section>
</div>
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
