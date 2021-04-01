<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Gestion des ressources humaines | Modidier profil Employer</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/adminlte.min.css">
  <!-- Google Font: Source Sans Pro -->
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<% if(session.getAttribute("admin")==null){ 
        response.sendRedirect("Login.jsp");} 
   	 %>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
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
            <a href="#" class="nav-link has-treeview menu-open">
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
                <a href="listeEmploye" class="nav-link active">
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
          <li class="nav-item has-treeview">
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
                <a href="consempAARE" class="nav-link">
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
        <div class="row mb-2" >
          <div class="col-sm-6">
            <h1>Profile</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="HomeAdmin">Home</a></li>
              <li class="breadcrumb-item active">Modifier profil</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-7" style="margin-left:220px">

            <!-- Profile Image -->
            <div class="card card-primary card-outline">
            <form method="post" id="demo-form2" action="updateEmploye?photoEmploye=${idEmploye.photoEmploye}" data-parsley-validate>
              <div class="card-body box-profile">
                <div class="text-center">
                <a href="editphoto?id1=${idEmploye.idEmploye}">
                <img class="profile-user-img img-fluid img-circle"
                       src="data:image/jpeg;base64,${idEmploye.photoEmploye }" 
						onerror="if (this.src != 'dist/img/person.jpg') this.src = 'dist/img/person.jpg';"
                       alt="User profile picture">
                       </a>
                </div>

                <h3 class="profile-username text-center"><input type="text" size="10" class="form-control" style="text-align:center;" value="${ idEmploye.nomEmploye}" name="nomEmploye"></h3>
                

                <p class="text-muted text-center">Employer</p>
         
                <ul class="list-group list-group-unbordered mb-3">
                  <li class="list-group-item">
                    <b>Email</b> <a class="float-right"><input type="text" size="20"  value="${ idEmploye.emailEmploye}" class="form-control" name="emailEmploye"></a>
                  </li>
                  <li class="list-group-item">
                    <b>Date de naissance</b> <a class="float-right"><input type="date" size="30"  value="${idEmploye.dateNaissanceEmploye}" class="form-control" name="dateNaissanceEmploye"></a>
                  </li>
                  <li class="list-group-item">
                    <b>Salaire</b> <a class="float-right"><select name="salaireEmploye"  class="form-control select2" style="width: 100%;">
                    <option value="${ idEmploye.salaireEmploye}" selected >${ idEmploye.salaireEmploye}</option>
                    <option>4000</option>
                    <option>5000</option>
                    <option>10000</option>
                    <option>15000</option>
                    <option>20000</option>
                    <option>25000</option>
                    <option>30000</option>
                  </select></a>
                  </li>
                  <li class="list-group-item">
                    <b>Mot de passe</b> <a class="float-right"><input type="text" size="20"  value="${ idEmploye.mdpEmploye}" class="form-control" name="mdpEmploye"></a>
                  </li>
                  <li class="list-group-item">
                    <b>CNI</b> <a class="float-right"><input type="text" size="20"  value="${ idEmploye.cniEmploye}" class="form-control" name="cniEmploye"></a>
                  </li>
                </ul>
            <div class="item form-group">
                        <div class="col-md-8 col-sm-8 offset-md-4">
                          <a href="listeEmploye"><button class="btn btn-primary" type="button">Annuler</button></a>
						  <button class="btn btn-primary" type="reset">Reset</button>
                          <button type="submit" class="btn btn-success">Sauvgarder</button>
                        </div>
                      </div>
                
              </div>
              </form>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->

            <!-- About Me Box -->
                        </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  

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
