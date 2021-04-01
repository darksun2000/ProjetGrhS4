<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Gestion des Ressources Humaines | Gestion de deploiement</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bbootstrap 4 -->
  <link rel="stylesheet" href="plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- summernote -->
  <link rel="stylesheet" href="plugins/summernote/summernote-bs4.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
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
<body class="hold-transition sidebar-mini layout-fixed">
<% if(session.getAttribute("admin")==null){ 
        response.sendRedirect("Login.jsp");} 
   	 %>
<div class="wrapper">

  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-dark navbar-gray-dark">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" data-widget="pushmenu" href="#"><i class="fas fa-bars"></i></a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="HomeAdmin" class="nav-link">Home</a>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="ecrireMessage" class="nav-link">Contact</a>
      </li>
      
    </ul>

    <!-- SEARCH FORM -->
     <ul class="navbar-nav ml-auto">
      <!-- Messages Dropdown Menu -->
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-comments"></i>
          <span class="badge badge-danger navbar-badge">${notif}</span>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <c:if test="${Messagenotif.isEmpty() }">
        <div class="media" >
              
              <div class="media-body" style="height:40px">
                
                <p class="text-md" style="margin-left:40px;margin-top:10px">Vous n'avez aucun message</p>
              </div>
            </div>
        </c:if>
          <c:forEach var = "msg" items="${Messagenotif}">
          <a href="#" class="dropdown-item">
         
          
            <!-- Message Start -->
            <div class="media" onclick="window.location.href='afficherMessage?idMessage=${msg.idMessage}'">
<img src="dist/img/${messageMetier.getEmployeMessage(msg).getPhotoEmploye() }" onerror="if (this.src != 'dist/img/person.jpg') this.src = 'dist/img/person.jpg';" class="img-circle elevation-2" alt="User Image">
              <div class="media-body">
                <h3 class="dropdown-item-title">
                  ${msg.nomEmploye }
                  <span class="right badge badge-danger">${msg.notification}</span>
                </h3>
                <p class="text-sm">${msg.sujetMessage }</p>
                <p class="text-sm text-muted"><i class="far fa-clock mr-1"></i> ${msg.dateMessage }</p>
              </div>
            </div>
            <!-- Message End -->
          </a>
          </c:forEach>
          <div class="dropdown-divider"></div>
          <a href="listeMessageA" class="dropdown-item dropdown-footer">See All Messages</a>
        </div>
      </li>
      <li class="nav-item d-none d-sm-inline-block">
        <a href="logout" class="nav-link">Log out</a>
      </li>
      </ul>

  </nav>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <aside class="main-sidebar sidebar-dark-danger elevation-4">
    <!-- Brand Logo -->
    <a href="HomeAdmin" class="brand-link">
      <img src="dist/img/logoSite.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3"
           style="opacity: .8">
      <span class="brand-text font-weight-light">G.R.H</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="data:image/jpeg;base64,${Admin.getPhotoAdmin() }" onerror="if (this.src != 'dist/img/person.jpg') this.src = 'dist/img/person.jpg';" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="ProfilAdmin?loginAdmin=${admin }" class="d-block">${ admin }</a>
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
          <li class="nav-item">
            <a href="HomeAdmin" class="nav-link">
              <i class="nav-icon fas fa-home"></i>
              <p>
                Home
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="ListeDemande" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                Demande d'ajout
                <span class="right badge badge-danger">${notifDemandes}</span>
              </p>
            </a>
          </li>
          <li class="nav-item">
            <a href="listeMessageA" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                Message
                <span class="right badge badge-danger">${notif}</span>
              </p>
            </a>
          </li>
          <li class="nav-item has-treeview">
            <a href="listeMessage" class="nav-link">
              <i class="nav-icon fas fa-user-alt"></i>
              <p>
                Employers
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="AjouterEmploye.jsp" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ajouter un Employer</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="listeEmploye" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Liste des Employes</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview">
            <a href="#" class="nav-link">
              <i class="nav-icon far fa-address-book"></i>
              <p>
                Absences
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="AjouterAbsence" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Ajouter absences</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="listeAbsence" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Liste des absences</p>
                </a>
              </li>
            </ul>
          </li>
          <li class="nav-item has-treeview menu-open">
            <a href="#" class="nav-link">
              <i class="nav-icon fas fa-table"></i>
              <p>
                Gestion de deploiement
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="consempAGeneral" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Général</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="consempAAcceuil" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Accueil</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="consempAEPSE" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>EP/SE</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="consempAAutoEmploi" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Auto-Emploi</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="consempAARE" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>ARE</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="ChoixIntervalle" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Historique Employes</p>
                </a>
              </li>
            </ul>
          </li>
                </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Emploi general</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Emploi general</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->
      <div class="card">
        <div class="card-header">
          <h3 class="card-title">ARE</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body">
        
        <div class="container">
        <div align="center">
        
          <div class="row">
            
        <table  id="datatable-buttons" class="table table-striped table-bordered" style="width:100%"  >
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
				<td width="146" colspan="2" align="center"><font face="Calibri"
					size="2" color="#000000"><b>ARE</b></font></td>
				<td width="136" colspan="2" align="center" style="background-color: #7D833E;"><font face="Calibri"
					size="2" color="#000000"><b>${l[4]}</b><b>${caseTab[37].getNomEmploye()}</b></font></td>
				<td width="153" colspan="2" align="center" style="background-color: #A2FB05;"><font face="Calibri"
					size="2" color="#000000"><b>${l[2]}</b><b>${caseTab[38].getNomEmploye()}</b></font></td>
				<td width="143" colspan="2" align="center" style="background-color: #CA7826;"><font face="Calibri"
					size="2" color="#000000"><b>${l[5]}</b><b>${caseTab[39].getNomEmploye()}</b></font></td>
				<td width="145" colspan="2" align="center" style="background-color: #FFCA8A;"><font face="Calibri"
					size="2" color="#000000"><b>${l[6]}</b><b>${caseTab[40].getNomEmploye()}</b></font></td>
				<td width="86" align="center" style="background-color: #A2FB05;"><font face="Calibri" size="2"
					color="#000000"><b>${l[2]}</b><b>${caseTab[41].getNomEmploye()}</b></font></td>
				<td width="68"  align="center"><font
					face="Calibri" size="1" color="#000000"></font></td>
			</tr>
			<tr>
			</tr>
		</tbody>
	</table>
          </div>
          <br />


          <button id="button" class="btn btn-primary" onclick="printEmploi()">
								<i class="fa fa-print"></i> Print
							</button>
							<script>
								function printEmploi(){
									var tabletoprint = document.getElementById('datatable-buttons');
									newWin = window.open("ARE");
									newWin.document.write(tabletoprint.outerHTML);
									
									newWin.print();
									newWin.close();
								
									
								}
								
							</script>

</div>
                
                
              </div>

        </div>
        <!-- /.card-body -->
        <div class="card-footer">
          
        </div>
        <!-- /.card-footer-->
      </div>
      <!-- /.card -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
</body>
</html>
