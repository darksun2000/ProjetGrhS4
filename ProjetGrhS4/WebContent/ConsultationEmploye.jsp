<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="zxx">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Gestion des Ressources Humaines</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- <link rel="manifest" href="site.webmanifest"> -->
    <!-- Place favicon.ico in the root directory -->
<!-- Bootstrap -->
    <link href="vendors/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="vendors/vendors/nprogress/nprogress.css" rel="stylesheet">
    
    <!-- iCheck -->
    <link href="vendors/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- Datatables -->
    
    <link href="vendors/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css" rel="stylesheet">
    <link href="vendors/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css" rel="stylesheet">
    
    
    <!-- Custom styling plus plugins -->
    <link href="build/build1/css/custom.min.css" rel="stylesheet">
    <!-- CSS here -->
    <link rel="stylesheet" href="CSSs/css5/bootstrap.min.css">
    <link rel="stylesheet" href="CSSs/css5/owl.carousel.min.css">
    <link rel="stylesheet" href="CSSs/css5/magnific-popup.css">
    <link rel="stylesheet" href="CSSs/css5/font-awesome.min.css">
    <link rel="stylesheet" href="CSSs/css5/themify-icons.css">
    <link rel="stylesheet" href="CSSs/css5/nice-select.css">
    <link rel="stylesheet" href="CSSs/css5/flaticon.css">
    <link rel="stylesheet" href="CSSs/css5/gijgo.css">
    <link rel="stylesheet" href="CSSs/css5/animate.css">
    <link rel="stylesheet" href="CSSs/css5/slick.css">
    <link rel="stylesheet" href="CSSs/css5/slicknav.css">
    <link rel="stylesheet" href="CSSs/css5/style.css">
    <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="CSSs/css7/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="CSSs/css7/animate.css">
    
    <link rel="stylesheet" href="CSSs/css7/owl.carousel.min.css">
    <link rel="stylesheet" href="CSSs/css7/owl.theme.default.min.css">
    <link rel="stylesheet" href="CSSs/css7/magnific-popup.css">
    <link href="vendors/vendors1/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/vendors1/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <link rel="stylesheet" href="CSSs/css7/aos.css">

    <link rel="stylesheet" href="CSSs/css7/ionicons.min.css">

    <link rel="stylesheet" href="CSSs/css7/bootstrap-datepicker.css">
    <link rel="stylesheet" href="CSSs/css7/jquery.timepicker.css">

    
    <link rel="stylesheet" href="CSSs/css7/flaticon.css">
    <link rel="stylesheet" href="CSSs/css7/icomoon.css">
    <link rel="stylesheet" href="CSSs/css7/style.css">
    <link rel="stylesheet" href="CSSs/css5/bootstrap.min.css">
    <link rel="icon" type="image/png"
	href="images/images4/icons/GRH.png" />
</head>
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
<body>
   <% if(session.getAttribute("Employe")==null){ 
        response.sendRedirect("Login.jsp");} 
   	 %>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!-- header-start -->
    <header>
        <div class="header-area ">
            <div class="header-top_area d-none d-lg-block">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-md-5 ">
                            <div class="header_left">
                                <p>Welcome to GRH</p>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
            <div id="sticky-header" class="main-header-area">
                <div class="container">
                    <div class="header_bottom_border">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-2">
                                <div class="logo">
                                    <a href="HomeEmploye.jsp">
                                        <img src="images/images7/Logo (2).png" >
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-6 col-lg-7">
                                <div class="main-menu  d-none d-lg-block">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a  href="HomeEmploye.jsp">home</a></li>
                                            <li><a href="about.jsp">about us </a></li>
                                            <li><a class="active" href="services.jsp">Services</a></li>
                                            <li><a href="ContactUS.jsp">Contact us</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-3 d-none d-lg-block">
								<div class="Appointment">
									<h3 style="color:#FDFDFE">Bonjour, <br> 
									 Mr. ${Employe}</h3>
									<div class="book_btn d-none d-lg-block">
										<a href="logout">Logout</a>
									</div>
								</div>
							</div>
                            
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </header>
    <!-- header-end -->

    <!-- bradcam_area  -->
    <div class="bradcam_area bradcam_bg_1"
    style="background-image: url(images/img5/banner/bradcam.png);">
            <div class="container">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="bradcam_text">
                            <h3>Consultation</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/ bradcam_area  -->

    <!-- service_area_start -->
    
    
    
    <div class="service_area" style="background-color:#B3B5C9 ;">
        <div class="container">
        <div align="center">
               <c:if test="${i>=2}">
                <a href="rotationLeft?i=${i}" class="previous round">&#8249;</a> 
				</c:if>
				<a href="rotationRight?i=${i}" class="next round">&#8250;</a>
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
                           <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-nextgen-tab">
			              
			             
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
					size="2" color="#000000"><b>${l[0]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #24EFE9;"><font face="Calibri"
					size="2" color="#000000"><b>${l[1]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #E5FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[3]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri" size="2"
					color="#000000"><b>${l[4]}</b></font></td>
				
			</tr>
			<tr>
				<td width="83" align="center"><font face="Calibri" size="1"
					color="#000000">11h20 A 13h40</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri"
					size="2" color="#000000"><b>${l[5]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #32C319;"><font face="Calibri"
					size="2" color="#000000"><b>${l[0]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #24EFE9;"><font face="Calibri"
					size="2" color="#000000"><b>${l[1]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}</b></font></td>
			</tr>
			<tr>
				<td width="83" align="center"><font face="Calibri" size="1"
					color="#000000">13h40 A 16h00</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #FFCA8A;"><font face="Calibri"
					size="2" color="#000000"><b>${l[6]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #E5FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[3]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #FA0A06;"><font face="Calibri"
					size="2" color="#000000"><b>${l[7]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri"
					size="2" color="#000000"><b>${l[4]}</b></font></td>
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
					color="#000000"><b>${l[8]}</b></font></td>
				<td width="67" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}</b></font></td>
				<td width="78" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}</b></font></td>
				<td width="75" align="center" style="background-color: #32C319;"><font face="Calibri" size="2"
					color="#000000"><b> ${l[0]} </b></font></td>
				<td width="65" align="center" style="background-color: #E5FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[3]}</b></font></td>
				<td width="78" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}</b></font></td>
				<td width="78" align="center" style="background-color: #A2FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[2]}</b></font></td>
				<td width="67" align="center" style="background-color: #32C319;"><font face="Calibri" size="2"
					color="#000000"><b>${l[0]}</b></font></td>
				<td width="86" align="center" style="background-color: #FFCA8A;"><font face="Calibri" size="2"
					color="#000000"><b>${l[6]}</b></font></td>
				<td width="68"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
				<td width="68" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}</b></font></td>
				<td width="67" align="center" style="background-color: #E5FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[3]}</b></font></td>
				<td width="78" align="center" style="background-color: #FA0A06;"><font face="Calibri" size="2"
					color="#000000"><b>${l[7]}</b></font></td>
				<td width="75" align="center" style="background-color: #FFCA8A;"><font face="Calibri" size="2"
					color="#000000"><b>${l[6]}</b></font></td>
				<td width="65" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}</b></font></td>
				<td width="78" align="center" style="background-color: #7D833E;"><font face="Calibri" size="2"
					color="#000000"><b>${l[4]}</b></font></td>
				<td width="78" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}</b></font></td>
				<td width="67" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}</b></font></td>
				<td width="86" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}</b></font></td>
				<td width="68"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
				<td width="146" colspan="2" align="center"><font face="Calibri"
					size="1" color="#000000"><b>AUTO-EMPLOI</b></font></td>
				<td width="136" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}</b></font></td>
				<td width="78" align="center"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<td width="67" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}</b></font></td>
				<td width="86" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}</b></font></td>
				<td width="68"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
				<td width="146" colspan="2" align="center"><font face="Calibri"
					size="2" color="#000000"><b>ARE</b></font></td>
				<td width="136" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri"
					size="2" color="#000000"><b>${l[4]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri"
					size="2" color="#000000"><b>${l[5]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #FFCA8A;"><font face="Calibri"
					size="2" color="#000000"><b>${l[6]}</b></font></td>
				<td width="86" align="center" style="background-color: #A2FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[2]}</b></font></td>
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
			              		
			              
			               <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-performance-tab">
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
					size="2" color="#000000"><b>${l[0]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #24EFE9;"><font face="Calibri"
					size="2" color="#000000"><b>${l[1]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #E5FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[3]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri" size="2"
					color="#000000"><b>${l[4]}</b></font></td>
				
			</tr>
			<tr>
				<td width="83" align="center"><font face="Calibri" size="1"
					color="#000000">11h20 A 13h40</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri"
					size="2" color="#000000"><b>${l[5]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #32C319;"><font face="Calibri"
					size="2" color="#000000"><b>${l[0]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #24EFE9;"><font face="Calibri"
					size="2" color="#000000"><b>${l[1]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}</b></font></td>
			</tr>
			<tr>
				<td width="83" align="center"><font face="Calibri" size="1"
					color="#000000">13h40 A 16h00</font></td>
				<td width="136" colspan="2" align="center" style="background-color: #FFCA8A;"><font face="Calibri"
					size="2" color="#000000"><b>${l[6]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #E5FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[3]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #FA0A06;"><font face="Calibri"
					size="2" color="#000000"><b>${l[7]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri"
					size="2" color="#000000"><b>${l[4]}</b></font></td>
				<td width="145" colspan="2" align="center"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
			</tr>
		
		</tbody>
	</table>
			              		</div>
			              	</form>
			              </div>
			              

			              <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-performance-tab">
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
					color="#000000"><b>${l[8]}</b></font></td>
				<td width="67" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}</b></font></td>
				<td width="78" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}</b></font></td>
				<td width="75" align="center" style="background-color: #32C319;"><font face="Calibri" size="2"
					color="#000000"><b> ${l[0]} </b></font></td>
				<td width="65" align="center" style="background-color: #E5FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[3]}</b></font></td>
				<td width="78" align="center" style="background-color: #F76308;"><font face="Calibri" size="2"
					color="#000000"><b>${l[8]}</b></font></td>
				<td width="78" align="center" style="background-color: #A2FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[2]}</b></font></td>
				<td width="67" align="center" style="background-color: #32C319;"><font face="Calibri" size="2"
					color="#000000"><b>${l[0]}</b></font></td>
				<td width="86" align="center" style="background-color: #FFCA8A;"><font face="Calibri" size="2"
					color="#000000"><b>${l[6]}</b></font></td>
				<td width="67"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
			    <td width="83"   align="center"><font
					face="Calibri" size="2" color="#000000"><b></b></font></td>
				<td width="68" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}</b></font></td>
				<td width="67" align="center" style="background-color: #E5FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[3]}</b></font></td>
				<td width="78" align="center" style="background-color: #FA0A06;"><font face="Calibri" size="2"
					color="#000000"><b>${l[7]}</b></font></td>
				<td width="75" align="center" style="background-color: #FFCA8A;"><font face="Calibri" size="2"
					color="#000000"><b>${l[6]}</b></font></td>
				<td width="65" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}</b></font></td>
				<td width="78" align="center" style="background-color: #7D833E;"><font face="Calibri" size="2"
					color="#000000"><b>${l[4]}</b></font></td>
				<td width="78" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}</b></font></td>
				<td width="67" align="center" style="background-color: #CA7826;"><font face="Calibri" size="2"
					color="#000000"><b>${l[5]}</b></font></td>
				<td width="86" align="center" style="background-color: #24EFE9;"><font face="Calibri" size="2"
					color="#000000"><b>${l[1]}</b></font></td>
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
			              
			              <div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-performance-tab">
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
					size="2" color="#000000"><b>${l[9]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #9908F7;"><font face="Calibri"
					size="2" color="#000000"><b>${l[9]}</b></font></td>
				<td width="78" align="center"><font face="Calibri" size="2"
					color="#000000"><b>&nbsp;</b></font></td>
				<td width="67" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}</b></font></td>
				<td width="86" align="center" style="background-color: #9908F7;"><font face="Calibri" size="2"
					color="#000000"><b>${l[9]}</b></font></td>
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
			              
			              <div class="tab-pane fade" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-performance-tab">
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
					size="2" color="#000000"><b>${l[4]}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri"
					size="2" color="#000000"><b>${l[5]}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #FFCA8A;"><font face="Calibri"
					size="2" color="#000000"><b>${l[6]}</b></font></td>
				<td width="86" align="center" style="background-color: #A2FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[2]}</b></font></td>
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
                    <button id="button" class="btn btn-primary" onclick="printEmploi()">
								<i class="fa fa-print"></i> Print
							</button>
							<script>
								function printEmploi(){
									var tabletoprint = document.getElementById('datatable-buttons');
									newWin = window.open("");
									newWin.document.write(tabletoprint.outerHTML);
									
									newWin.print();
									newWin.close();
								
									
								}
								
							</script>
                     
        </div>
    </div>
    
    <!-- service_area_end -->

    

   

    

    <!-- link that opens popup -->


    <!-- JS here -->
    <script src="JSs/js5/vendor/modernizr-3.5.0.min.js"></script>
    <script src="JSs/js5/vendor/jquery-1.12.4.min.js"></script>
    <script src="JSs/js5/popper.min.js"></script>
    <script src="JSs/js5/bootstrap.min.js"></script>
    <script src="JSs/js5/owl.carousel.min.js"></script>
    <script src="JSs/js5/isotope.pkgd.min.js"></script>
    <script src="JSs/js5/ajax-form.js"></script>
    <script src="JSs/js5/waypoints.min.js"></script>
    <script src="JSs/js5/jquery.counterup.min.js"></script>
    <script src="JSs/js5/imagesloaded.pkgd.min.js"></script>
    <script src="JSs/js5/scrollIt.js"></script>
    <script src="JSs/js5/jquery.scrollUp.min.js"></script>
    <script src="JSs/js5/wow.min.js"></script>
    <script src="JSs/js5/nice-select.min.js"></script>
    <script src="JSs/js5/jquery.slicknav.min.js"></script>
    <script src="JSs/js5/jquery.magnific-popup.min.js"></script>
    <script src="JSs/js5/plugins.js"></script>
    <script src="JSs/js5/gijgo.min.js"></script>
    <script src="JSs/js5/slick.min.js"></script>
    <!--contact js-->
    <script src="JSs/js5/contact.js"></script>
    <script src="JSs/js5/jquery.ajaxchimp.min.js"></script>
    <script src="JSs/js5/jquery.form.js"></script>
    <script src="JSs/js5/jquery.validate.min.js"></script>
    <script src="JSs/js5/mail-script.js"></script>

    <script src="JSs/js5/main.js"></script>
    <script src="JSs/js7/jquery.min.js"></script>
  <script src="JSs/js7/jquery-migrate-3.0.1.min.js"></script>
  <script src="JSs/js7/popper.min.js"></script>
  <script src="JSs/js7/bootstrap.min.js"></script>
  <script src="JSs/js7/jquery.easing.1.3.js"></script>
  <script src="JSs/js7/jquery.waypoints.min.js"></script>
  <script src="JSs/js7/jquery.stellar.min.js"></script>
  <script src="JSs/js7/owl.carousel.min.js"></script>
  <script src="JSs/js7/jquery.magnific-popup.min.js"></script>
  <script src="JSs/js7/aos.js"></script>
  <script src="JSs/js7/jquery.animateNumber.min.js"></script>
  <script src="JSs/js7/bootstrap-datepicker.js"></script>
  <script src="JSs/js7/jquery.timepicker.min.js"></script>
  <script src="JSs/js7/scrollax.min.js"></script>
  <script src="JSs/https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="JSs/js7/google-map.js"></script>
  <script src="JSs/js7/main.js"></script>
  <!-- jQuery -->
    <script src="vendors/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
   <script src="vendors/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/vendors/nprogress/nprogress.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="build/build1/js/custom.min.js"></script>
    <script src="vendors/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
   <script src="vendors/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="vendors/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="vendors/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="vendors/vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="vendors/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="vendors/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="vendors/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="vendors/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="vendors/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="vendors/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="vendors/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="vendors/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="vendors/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="vendors/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="vendors/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="vendors/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="vendors/vendors/jszip/dist/jszip.min.js"></script>
    <script src="vendors/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="vendors/vendors/pdfmake/build/vfs_fonts.js"></script>

    
</body>

</html>