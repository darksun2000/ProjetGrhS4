<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Gestion des ressources humaines | Emploi</title>
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
	<!-- Main style -->
	<link rel="stylesheet" type="text/css" href="Cardio/css/cardio.css">
	<style>
a {
    text-decoration: none;
    display: inline-block;
    padding: 8px 16px;
}

a:hover {
    background-color: #ddd;
    color: black;
}

.previous {
    background-color: #f1f1f1;
    color: black;
}

.next {
    background-color: #097FB4;
    color: white;
}

.round {
    border-radius: 50%;
}
</style>
</head>
<% if(session.getAttribute("Employe")==null){ 
        response.sendRedirect("Login.jsp");} 
   	 %>

<body>
	
	<nav class="navbar">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#v-pills-1">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img src="Cardio/img/logo.png" data-active-url="Cardio/img/logo-active.png" alt=""></a>
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
	
	<section id="team" class="section gray-bg">
	<div class="container">
	<div class="row title text-center">
				<h2 class="margin-top">Emploi</h2>
				<h4 class="light muted">Consultez votre emploi</h4>
			</div>
	<div class="service_area" style=" margin-top:210px">
        <div class="container" style="margin-top:-200px">
        <div align="center">
               <c:if test="${i>=2}">
                <a href="rotationLeftEview?i=${i}&nomEmploye=${Employe.nomEmploye}" class="previous round" style="background-color:black; color:white;">&#8249;</a> 
				</c:if>
				<c:if test="${i<10}">
				<a href="rotationRightEview?i=${i}&nomEmploye=${Employe.nomEmploye}" class="next round">&#8250;</a>
				</c:if>
				</div>
            <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-start" data-scrollax-parent="true">
          <div class="col-xl-10 ftco-animate mb-5 pb-5" data-scrollax=" properties: { translateY: '70%' }">
          	
						<div class="ftco-search">
							<div class="row">
							
							<div class="col-md-12 nav-link-wrap">
			            <div class="nav nav-pills text-center" id="v-pills-tab" role="tablist" aria-orientation="vertical">
			              <a class="nav-link active mr-md-1" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">Général</a>

			              <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">Acceuil</a>

                          <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">EP / SE</a>
                           
                          <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false">AUTO-EMPLOI</a>
                          
                          <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-5" aria-selected="false">ARE</a>
                          
			            </div>
			          </div>
			          <div class="col-md-12 tab-wrap">
			            
			            <div class="tab-content p-4" id="v-pills-tabContent">
                           <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab" style="margin-left:100px">
			              
			             
			              	<form action="#" class="search-job">
			              		<div class="row" style="margin-left : auto ; margin-right: auto">
			              		<table  id="datatable-buttons" border="1" >
		<tbody>
			<tr>
				<td width="63" align="left"><font face="Calibri" size="2"
					color="#000000">&nbsp;</font></td>
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000">&nbsp;</font></td>
				<td width="68" align="left"><font face="Calibri" size="2"
					color="#000000">&nbsp;</font></td>
				<td width="67" align="left"><font face="Calibri" size="2"
					color="#1F497D"><b>&nbsp;</b></font></td>
				<td width="78" align="left"><font face="Calibri" size="2"
					color="#1F497D" ><b>&nbsp;</b></font></td>
				<td width="296" colspan="4" align="center" style="background-color: #A6DFF9;"><font face="Calibri"
					size="2" color="#FFFFFF"  ><b>SEMAINE  ${i} </b></font></td>
				<td width="67" align="left"><font face="Calibri" size="2"
					color="#1F497D"><b>&nbsp;</b></font></td>
				<td width="86" align="left"><font face="Calibri" size="2"
					color="#1F497D"><b>&nbsp;</b></font></td>
				<td width="64" align="left"><font face="Calibri" size="2"
					color="#000000">&nbsp;</font></td>
			</tr>
			<tr>
				<td width="63" align="left"><font face="Calibri" size="2"
					color="#000000" ><b>&nbsp;</b></font></td>
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000" ><b>&nbsp;</b></font></td>
				<th width="136" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Lundi</b></font></th>
				<th width="153" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Mardi</b></font></th>
				<th width="143" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Mercredi</b></font></th>
				<th width="145" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Jeudi</b></font></th>
				<th width="145" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Vendredi</b></font></th>
			</tr>
			<tr>
				<td width="63" rowspan="3" align="center"><font face="Calibri"
					size="2" color="#000000"><b>ACCEUIL</b></font></td>
				<td width="83" align="center"><font face="Calibri" size="1"
					color="#000000">09h00 A 11h20</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #32C319;"><font face="Calibri"
					size="2" color="#000000"><b>${l[0]}${caseTab[0].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #24EFE9;"><font face="Calibri"
					size="2" color="#000000"><b>${l[1]}${caseTab[1].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}${caseTab[02].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #E5FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[3]}${caseTab[3].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri" size="2"
					color="#000000"><b>${l[4]}${caseTab[4].getNomEmploye()}</b></font></td>
				
			</tr>
			<tr>
				<td width="83" align="center"><font face="Calibri" size="1"
					color="#000000">11h20 A 13h40</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}${caseTab[5].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri"
					size="2" color="#000000"><b>${l[5]}${caseTab[6].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #32C319;"><font face="Calibri"
					size="2" color="#000000"><b>${l[0]}${caseTab[7].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #24EFE9;"><font face="Calibri"
					size="2" color="#000000"><b>${l[1]}${caseTab[8].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}${caseTab[9].getNomEmploye()}</b></font></td>
			</tr>
			<tr>
				<td width="83" align="center"><font face="Calibri" size="1"
					color="#000000">13h40 A 16h00</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #FFCA8A;"><font face="Calibri"
					size="2" color="#000000"><b>${l[6]}${caseTab[10].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #E5FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[3]}${caseTab[11].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #FA0A06;"><font face="Calibri"
					size="2" color="#000000"><b>${l[7]}${caseTab[12].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri"
					size="2" color="#000000"><b>${l[4]}${caseTab[13].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" ><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
			</tr>
			<tr>
				<td width="63" align="left"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
			</tr>
			<tr>
				<td width="146" rowspan="2" colspan="2" align="center"><font
					face="Calibri" size="2" color="#000000"><b>E P/ SE</b></font></td>
				<td width="68" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}${caseTab[14].getNomEmploye()}</b></font></td>
				<td width="67" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}${caseTab[15].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}${caseTab[16].getNomEmploye()}</b></font></td>
				<td width="75" align="center" style="background-color: #32C319;"><font face="Calibri" size="2"
					color="#000000"><b> ${l[0]}${caseTab[17].getNomEmploye()}</b></font></td>
				<td width="65" align="center" style="background-color: #E5FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[3]}${caseTab[18].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}${caseTab[19].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #A2FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[2]}${caseTab[20].getNomEmploye()}</b></font></td>
				<td width="67" align="center" style="background-color: #32C319;"><font face="Calibri" size="2"
					color="#000000"><b>${l[0]}${caseTab[21].getNomEmploye()}</b></font></td>
				<td width="86" align="center" style="background-color: #FFCA8A;"><font face="Calibri" size="2"
					color="#000000"><b>${l[6]}${caseTab[22].getNomEmploye()}</b></font></td>
				<td width="68"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
				<td width="68" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}${caseTab[23].getNomEmploye()}</b></font></td>
				<td width="67" align="center" style="background-color: #E5FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[3]}${caseTab[24].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #FA0A06;"><font face="Calibri" size="2"
					color="#000000"><b>${l[7]}${caseTab[25].getNomEmploye()}</b></font></td>
				<td width="75" align="center" style="background-color: #FFCA8A;"><font face="Calibri" size="2"
					color="#000000"><b>${l[6]}${caseTab[26].getNomEmploye()}</b></font></td>
				<td width="65" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}${caseTab[27].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #7D833E;"><font face="Calibri" size="2"
					color="#000000"><b>${l[4]}${caseTab[28].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}${caseTab[29].getNomEmploye()}</b></font></td>
				<td width="67" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}${caseTab[30].getNomEmploye()}</b></font></td>
				<td width="86" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}${caseTab[31].getNomEmploye()}</b></font></td>
				<td width="68"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
				<td width="146" colspan="2" align="center"><font face="Calibri"
					size="1" color="#000000"><b>AUTO-EMPLOI</b></font></td>
				<td width="136" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}${caseTab[32].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}${caseTab[33].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}${caseTab[34].getNomEmploye()}</b></font></td>
				<td width="78" align="center"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<td width="67" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}${caseTab[35].getNomEmploye()}</b></font></td>
				<td width="86" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}${caseTab[36].getNomEmploye()}</b></font></td>
				<td width="68"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
				<td width="146" colspan="2" align="center"><font face="Calibri"
					size="2" color="#000000"><b>ARE</b></font></td>
				<td width="136" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri"
					size="2" color="#000000"><b>${l[4]}${caseTab[37].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}${caseTab[38].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri"
					size="2" color="#000000"><b>${l[5]}${caseTab[39].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #FFCA8A;"><font face="Calibri"
					size="2" color="#000000"><b>${l[6]}${caseTab[40].getNomEmploye()}</b></font></td>
				<td width="86" align="center" style="background-color: #A2FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[2]}${caseTab[41].getNomEmploye()}</b></font></td>
				<td width="68"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
			</tr>
		</tbody>
	</table>
			              		</div>
			              		</form>
			              		</div>
			              		
			              
			               <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab" style="margin-bottom:100px;margin-left:170px;margin-top:-200px">
			                    	<form action="#" class="search-job">
			              		<div class="row">
			              			
			              			<table border="1" >
		<tbody>
			
			<tr>
				
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<th width="136" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Lundi</b></font></th>
				<th width="153" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Mardi</b></font></th>
				<th width="143" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Mercredi</b></font></th>
				<th width="145" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Jeudi</b></font></th>
				<th width="150" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Vendredi</b></font></th>
			</tr>
			<tr>
				
				<td width="100" align="center"><font face="Calibri" size="1"
					color="#000000">09h00 A 11h20</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #32C319;"><font face="Calibri"
					size="2" color="#000000"><b>${l[0]}${caseTab[0].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #24EFE9;"><font face="Calibri"
					size="2" color="#000000"><b>${l[1]}${caseTab[1].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}${caseTab[2].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #E5FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[3]}${caseTab[3].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri" size="2"
					color="#000000"><b>${l[4]}${caseTab[4].getNomEmploye()}</b></font></td>
				
			</tr>
			<tr>
				<td width="83" align="center"><font face="Calibri" size="1"
					color="#000000">11h20 A 13h40</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}${caseTab[5].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri"
					size="2" color="#000000"><b>${l[5]}${caseTab[6].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #32C319;"><font face="Calibri"
					size="2" color="#000000"><b>${l[0]}${caseTab[7].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #24EFE9;"><font face="Calibri"
					size="2" color="#000000"><b>${l[1]}${caseTab[8].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}${caseTab[9].getNomEmploye()}</b></font></td>
			</tr>
			<tr>
				<td width="83" align="center"><font face="Calibri" size="1"
					color="#000000">13h40 A 16h00</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #FFCA8A;"><font face="Calibri"
					size="2" color="#000000"><b>${l[6]}${caseTab[10].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #E5FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[3]}${caseTab[11].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #FA0A06;"><font face="Calibri"
					size="2" color="#000000"><b>${l[7]}${caseTab[12].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri"
					size="2" color="#000000"><b>${l[4]}${caseTab[13].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
			</tr>
		
		</tbody>
	</table>
			              		</div>
			              	</form>
			              </div>
			              

			              <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-performance-tab" style="margin-bottom:100px;margin-left:170px;margin-top:-200px">
			              	<form action="#" class="search-job">
			              		<div class="row">
			              			
			              			<table border="1" >
		<tbody>
		
		<tr>
				
				<td width="63" align="left"><font face="Calibri" size="2"
					color="#000000" ><b>&nbsp;</b></font></td>
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000" ><b>&nbsp;</b></font></td>
				<th width="136" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Lundi</b></font></th>
				<th width="153" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Mardi</b></font></th>
				<th width="143" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Mercredi</b></font></th>
				<th width="145" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Jeudi</b></font></th>
				<th width="145" colspan="2" align="center" style="background-color: #FFFFFF;"><font face="Calibri"
					size="2" color="#000000"><b>Vendredi</b></font></th>
			</tr>
		
			
			<tr>
				
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="67" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="78" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="75" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="65" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="78" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="78" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="67" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="86" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="67" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
			</tr>
			<tr>
				<td width="83"   align="center"><font
					face="Calibri" size="2" color="#000000"><b></b></font></td>
				<td width="68" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}${caseTab[14].getNomEmploye()}</b></font></td>
				<td width="67" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}${caseTab[15].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}${caseTab[16].getNomEmploye()}</b></font></td>
				<td width="75" align="center" style="background-color: #32C319;"><font face="Calibri" size="2"
					color="#000000"><b>${l[0]}${caseTab[17].getNomEmploye()}</b></font></td>
				<td width="65" align="center" style="background-color: #E5FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[3]}${caseTab[18].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}${caseTab[19].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #A2FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[2]}${caseTab[20].getNomEmploye()}</b></font></td>
				<td width="67" align="center" style="background-color: #32C319;"><font face="Calibri" size="2"
					color="#000000"><b>${l[0]}${caseTab[21].getNomEmploye()}</b></font></td>
				<td width="86" align="center" style="background-color: #FFCA8A;"><font face="Calibri" size="2"
					color="#000000"><b>${l[6]}${caseTab[22].getNomEmploye()}</b></font></td>
				<td width="67"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
			    <td width="83"   align="center"><font
					face="Calibri" size="2" color="#000000"><b></b></font></td>
				<td width="68" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}${caseTab[23].getNomEmploye()}</b></font></td>
				<td width="67" align="center" style="background-color: #E5FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[3]}${caseTab[24].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #FA0A06;"><font face="Calibri" size="2"
					color="#000000"><b>${l[7]}${caseTab[25].getNomEmploye()}</b></font></td>
				<td width="75" align="center" style="background-color: #FFCA8A;"><font face="Calibri" size="2"
					color="#000000"><b>${l[6]}${caseTab[26].getNomEmploye()}</b></font></td>
				<td width="65" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}${caseTab[27].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #7D833E;"><font face="Calibri" size="2"
					color="#000000"><b>${l[4]}${caseTab[28].getNomEmploye()}</b></font></td>
				<td width="78" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}${caseTab[29].getNomEmploye()}</b></font></td>
				<td width="67" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}${caseTab[30].getNomEmploye()}</b></font></td>
				<td width="86" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}${caseTab[31].getNomEmploye()}</b></font></td>
				<td width="68"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			
			
			<tr>
			</tr>
		</tbody>
	</table>
			              			
			              			
			              			</div>
			              			
			              	</form>
			              </div>
			              
			              <div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-performance-tab" style="margin-bottom:100px;margin-left:170px;margin-top:-200px">
			              	<form action="#" class="search-job">
			              		<div class="row">
			              
			              <table border="1" >
		<tbody>
		
		<tr>
				
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<th width="136" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Lundi</b></font></th>
				<th width="153" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Mardi</b></font></th>
				<th width="143" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Mercredi</b></font></th>
				<th width="145" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Jeudi</b></font></th>
				<th width="150" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Vendredi</b></font></th>
			</tr>
		
			
			<tr>
				
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="67" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="78" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="75" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="65" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="78" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="78" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="67" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="86" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="67" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
			</tr>
			
			<tr>
				<td width="87" align="center"><font face="Calibri"
					size="1" color="#000000"><b></b></font></td>
				<td width="136" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}${caseTab[32].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}${caseTab[33].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}${caseTab[34].getNomEmploye()}</b></font></td>
				<td width="78" align="center"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<td width="67" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}${caseTab[35].getNomEmploye()}</b></font></td>
				<td width="86" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}${caseTab[36].getNomEmploye()}</b></font></td>
				<td width="67"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			
			<tr>
			</tr>
		</tbody>
	</table>
			              
			              
			              </div>		
			              	</form>
			              </div>
			              
			              <div class="tab-pane fade" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-performance-tab" style="margin-bottom:100px;margin-left:170px;margin-top:-200px">
			              	<form action="#" class="search-job">
			              		<div class="row">
			              
			              
			              <table border="1">
		<tbody>
		
		<tr>
				
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<th width="136" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Lundi</b></font></th>
				<th width="153" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Mardi</b></font></th>
				<th width="143" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Mercredi</b></font></th>
				<th width="145" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Jeudi</b></font></th>
				<th width="150" colspan="2" align="center"><font face="Calibri"
					size="2" ><b>Vendredi</b></font></th>
			</tr>
		
			
			<tr>
				
				<td width="83" align="left"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<td width="68" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="67" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="78" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="75" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="65" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="78" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="78" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="67" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
				<td width="86" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">AM</font></td>
				<td width="67" bgcolor="#D9D9D9" align="center"><font
					face="Calibri" size="1" color="#000000">PM</font></td>
			</tr>
			
			
			
			<tr>
				<td width="87" align="center"><font face="Calibri"
					size="2" color="#000000"><b></b></font></td>
				<td width="136" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri"
					size="2" color="#000000"><b>${l[4]}${caseTab[37].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}${caseTab[38].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri"
					size="2" color="#000000"><b>${l[5]}${caseTab[39].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #FFCA8A;"><font face="Calibri"
					size="2" color="#000000"><b>${l[6]}${caseTab[40].getNomEmploye()}</b></font></td>
				<td width="86" align="center" style="background-color: #A2FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[2]}${caseTab[41].getNomEmploye()}</b></font></td>
				<td width="67"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
			</tr>
		</tbody>
	</table>
	                
			               </div>
			               
			               		
			              	</form>
			              </div>
			              
			              
			            </div>
			          </div>
			        </div>
		        </div>
          </div>
        </div>
                    
							<a class="btn btn-blue" onclick="printEmploi()" style="border-radius: 12px; margin-left:500px;margin-top:40px" ><i class="fa fa-print"></i>Imprimer
										</a>
							<script>
								function printEmploi(){
									var tabletoprint = document.getElementById('datatable-buttons');
									newWin = window.open("Imprimer Emploi");
									newWin.document.write(tabletoprint.outerHTML);
									
									newWin.print();
									newWin.close();
								
									
								}
								
							</script>
                     
        </div>
    </div>
    </div>
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
	</div>
	<!-- Scripts -->
	<script type="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
	<script type="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
	<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
	<script src="Cardio/js/jquery-1.11.1.min.js"></script>
	<script src="Cardio/js/owl.carousel.min.js"></script>
	<script src="Cardio/js/bootstrap.min.js"></script>
	<script src="Cardio/js/typewriter.js"></script>
	<script src="Cardio/js/jquery.onepagenav.js"></script>
	<script src="Cardio/js/main.js"></script>
	
	
</body>

</html>
