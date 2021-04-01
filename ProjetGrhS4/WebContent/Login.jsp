<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="Login_v18/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="Login_v18/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="Login_v18/css/util.css">
	<link rel="stylesheet" type="text/css" href="Login_v18/css/main.css">
<!--===============================================================================================-->
</head>


<body style="background-color: #666666;">
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" method="post" action="login">
					<span class="login100-form-title p-b-43">
						Login to continue
					</span>
					
					
					<div class="wrap-input100 validate-input" >
						<input class="input100" type="text" name="nom">
						<span class="focus-input100"></span>
						<span class="label-input100">Nom d'utilisateur</span>
					</div>
					
					
					<div class="wrap-input100 validate-input" data-validate="Password is required">
						<input class="input100" type="password" name="mdp">
						<span class="focus-input100"></span>
						<span class="label-input100">Mot de passe</span>
					</div>

					<div class="group">
					<c:if test="${test1==1}">
					<div class="container-login100-form-btn m-t-32">
					<strong style="color : #F6323E ">Nom d'utilisateur incorrecte</strong>
					</div>
					</c:if>
				</div>
			      <div class="flex-sb-m w-full p-t-3 p-b-32">
						

						<div>
							<a href="forgot-password.jsp" class="txt1">
								Mot de passe oublié? </a> ou <a href="Sinscrire.jsp" class="txt1">
								S'inscrire </a>
						</div>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="submit">
							Login
						</button>
					</div>
					
					
				</form>

				<div class="login100-more" style="background-image: url('Login_v18/images/bg-01.jpg');">
				</div>
			</div>
		</div>
	</div>
	
	

	
	
<!--===============================================================================================-->
	<script src="Login_v18/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/bootstrap/js/popper.js"></script>
	<script src="Login_v18/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/daterangepicker/moment.min.js"></script>
	<script src="Login_v18/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="Login_v18/js/main.js"></script>

</body>
</html>