<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Gestion des ressources humaines | Ecrire message</title>
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

	<!-- Bootstrap -->
	<link rel="stylesheet" type="text/css" href="Cardio/css/bootstrap.css">

	<!-- Animate.css -->
	<link rel="stylesheet" type="text/css" href="Cardio/css/animate.css">
	 <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
	<!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
	
	 <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
	<!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- icheck bootstrap -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
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
	<div class="col-md-9">
		<form method="post" action="EnvoyerMessageE?nomEmploye=${Employe.nomEmploye }" enctype="multipart/form-data">
            <div class="card card-primary card-outline" style="height:500px; margin-left:300px">
              <div class="card-header" style="height:40px">
                <h1 class="card-title" style="font-size:24px">Ecrire Message au Admin</h1>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                
                <div class="form-group">
                  <input class="form-control" name="sujetMessage" placeholder="Subject:" style="font-size:24px; height:40px" height=130px>
                </div>
                <div class="form-group">
                <textarea class="textarea" placeholder="Ecrire votre message..." name="message"
                          style="width: 100%; height: 400px; font-size: 34px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" required></textarea>
              </div>
                <div class="form-group">
                  <div class="btn btn-default btn-file" style="font-size:24px">
                    <i class="fas fa-paperclip"></i> Attachment
                    <input type="file" name="attachment" value="dist/img/Upload fichier">
                  </div>
                  <p class="help-block" style="font-size:20px">Max. 32MB</p>
                </div>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
                <div class="float-right">
                  <button type="submit" class="btn btn-primary" style="font-size:24px"><i class="far fa-envelope"></i> Envoyer</button>
                </div>
                <button type="reset" class="btn btn-default" style="font-size:24px"><i class="fas fa-undo"></i> Annuler</button>
                 <div class="card-footer">
		<a href="MessageEmploye?nomEmploye=${Employe.nomEmploye}" style="font-size:24px" class="btn btn-danger btn-block mb-3"><i class="fas fa-arrow-circle-left"></i>Retour</a>
		</div>
              </div>
              <!-- /.card-footer -->
            </div>
            </form>
          </div>
	
	<!-- Holder for mobile navigation -->
	
	<!-- Scripts -->
	<script src="Cardio/js/jquery-1.11.1.min.js"></script>
	<script src="Cardio/js/bootstrap.min.js"></script>
	<script src="Cardio/js/jquery.onepagenav.js"></script>
	<script src="Cardio/js/main.js"></script>
	<!-- Summernote -->
<script src="plugins/summernote/summernote-bs4.min.js"></script>

<script>
  $(function () {
    // Summernote
    $('.textarea').summernote()
  })
</script>
</body>

</html>
