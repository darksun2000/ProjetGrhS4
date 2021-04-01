<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Gestion des ressources humaines | Liste Employers</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- DataTables -->
  <link rel="stylesheet" href="plugins/datatables-bs4/css/dataTables.bootstrap4.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
	<!-- SweetAlert2 -->
  <link rel="stylesheet" href="plugins/sweetalert2-theme-bootstrap-4/bootstrap-4.min.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="plugins/toastr/toastr.min.css">
<!-- overlayScrollbars -->
<link rel="stylesheet" href="dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
</head>
<%
	if (session.getAttribute("admin") == null) {
	response.sendRedirect("Login.jsp");
}
%>
<body class="hold-transition sidebar-mini">
	<!-- Site wrapper -->
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
			<a href="HomeAdmin" class="brand-link"> <img
				src="dist/img/logoSite.png" alt="AdminLTE Logo"
				class="brand-image img-circle elevation-3" style="opacity: .8">
				<span class="brand-text font-weight-light">G.R.H</span>
			</a>

			<!-- Sidebar -->
			<div class="sidebar">
				<!-- Sidebar user panel (optional) -->
				<div class="user-panel mt-3 pb-3 mb-3 d-flex">
					<div class="image">
						<img
							src="data:image/jpeg;base64,${Admin.getPhotoAdmin() }" 
							onerror="if (this.src != 'dist/img/person.jpg') this.src = 'dist/img/person.jpg';"
						 class="img-circle elevation-2"
							alt="User Image">
					</div>
					<div class="info">
						<a href="ProfilAdmin?loginAdmin=${admin }" class="d-block">${ admin }</a>
					</div>
				</div>

				<!-- Sidebar Menu -->
				<nav class="mt-2">
					<ul class="nav nav-pills nav-sidebar flex-column"
						data-widget="treeview" role="menu" data-accordion="false">
						<!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
						<li class="nav-item"><a href="HomeAdmin" class="nav-link">
								<i class="nav-icon fas fa-home"></i>
								<p>Home</p>
						</a></li>
						<li class="nav-item">
            <a href="ListeDemande" class="nav-link">
              <i class="nav-icon far fa-envelope"></i>
              <p>
                Demande d'ajout
                <span class="right badge badge-danger">${notifDemandes}</span>
              </p>
            </a>
          </li>
						<li class="nav-item"><a href="listeMessageA"
							class="nav-link"> <i class="nav-icon far fa-envelope"></i>
								<p>
									Message <span class="right badge badge-danger">${notif}</span>
								</p>
						</a></li>
						<li class="nav-item has-treeview menu-open"><a href="#"
							class="nav-link"> <i class="nav-icon fas fa-user-alt"></i>
								<p>
									Employers <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="AjouterEmploye.jsp"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Ajouter un Employer</p>
								</a></li>
								<li class="nav-item"><a href="listeEmploye"
									class="nav-link active"> <i class="far fa-circle nav-icon"></i>
										<p>Liste des Employes</p>
								</a></li>
							</ul></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon far fa-address-book"></i>
								<p>
									Absences <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="AjouterAbsence"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Ajouter absences</p>
								</a></li>
								<li class="nav-item"><a href="listeAbsence"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Liste des absences</p>
								</a></li>
							</ul></li>
						<li class="nav-item has-treeview"><a href="#"
							class="nav-link"> <i class="nav-icon fas fa-table"></i>
								<p>
									Gestion de deploiement <i class="right fas fa-angle-left"></i>
								</p>
						</a>
							<ul class="nav nav-treeview">
								<li class="nav-item"><a href="consempAGeneral"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Général</p>
								</a></li>
								<li class="nav-item"><a href="consempAAcceuil"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Accueil</p>
								</a></li>
								<li class="nav-item"><a href="consempAEPSE"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>EP/SE</p>
								</a></li>
								<li class="nav-item"><a href="consempAAutoEmploi"
									class="nav-link"> <i class="far fa-circle nav-icon"></i>
										<p>Auto-Emploi</p>
								</a></li>
								<li class="nav-item"><a href="consempAARE" class="nav-link">
										<i class="far fa-circle nav-icon"></i>
										<p>ARE</p>
								</a></li>
								<li class="nav-item">
                <a href="ChoixIntervalle" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Historique Employes</p>
                </a>
              </li>
							</ul></li></ul>
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
							<h1>Employers</h1>
						</div>
						<div class="col-sm-6">
							<ol class="breadcrumb float-sm-right">
								<li class="breadcrumb-item"><a href="HomeAdmin">Home</a></li>
								<li class="breadcrumb-item active">Employers</li>
							</ol>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
           
            
               
				<!-- Default box -->
				<div class="card">
					<div class="card-header">
						<h3 class="card-title">Employers</h3>

					</div>
					<div class="card-body">
						<table id="example1" class="table table-bordered table-striped">
							<thead>
								<tr>
									<th style="width: 15%">Photo Employe</th>
									<th style="width: 13%">Nom Employer</th>
									<th style="width: 15%">Email</th>

									<th style="width: 20%"></th>
								</tr>
							</thead>
							
								<tbody>
								<c:forEach var="e" items="${ employes }">
									<tr>
										<td><img alt="Avatar"
													class="table-avatar"
											src="data:image/jpeg;base64,${e.getPhotoEmploye() }" 
											onerror="if (this.src != 'dist/img/person.jpg') this.src = 'dist/img/person.jpg';"
											 style="width:100px; height:100px;border-radius: 8px;"></td>
										<td>${e.nomEmploye}</td>
										<td>${e.emailEmploye}</td>


										<td class="project-actions text-right"><a
											class="btn btn-primary btn-sm"
											href="afficherEmployeA?idEmploye=${e.idEmploye}"> <i
												class="fas fa-folder"> </i> Voir
										</a> <a class="btn btn-info btn-sm"
											href="edit?idEmploye=${e.idEmploye}"> <i
												class="fas fa-pencil-alt"> </i> Modifier
										</a> <a class="btn btn-danger btn-sm"
											href="supprimerEmploye?idEmploye=${e.idEmploye}" onclick="return confirm('Vous êtes sure ?')"> <i
												class="fas fa-trash"> </i> Supprimer
										</a> 
										
										 
										</td>
									</tr>
									</c:forEach>
								</tbody>
							
						</table>
					</div>
					<!-- /.card-body -->
				</div>
				<!-- /.card -->

			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

          <footer class="main-footer">
    
                    <div class="item form-group">
                        <div class="col-md-8 col-sm-8 offset-md-5">
                          <a href="AjouterEmploye.jsp"><button class="btn btn-primary" type="button">ajouter Employer</button></a>
						
                        </div>
                      </div>
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
<!-- DataTables -->
<script src="plugins/datatables/jquery.dataTables.js"></script>
<script src="plugins/datatables-bs4/js/dataTables.bootstrap4.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- SweetAlert2 -->
<script src="plugins/sweetalert2/sweetalert2.min.js"></script>
<!-- Toastr -->
<script src="plugins/toastr/toastr.min.js"></script>
<script type="text/javascript">
  $(function() {
    const Toast = Swal.mixin({
      toast: true,
      position: 'top-end',
      showConfirmButton: false,
      timer: 4000
    });
    if(${i==1}){
    	Toast.fire({
            type: 'success',
            title: 'Employe supprimer correctement .'
          });
          
    }

    $('.swalDefaultSuccess').click(function() {
      Toast.fire({
        type: 'success',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultInfo').click(function() {
      Toast.fire({
        type: 'info',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultError').click(function() {
      Toast.fire({
        type: 'error',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultWarning').click(function() {
      Toast.fire({
        type: 'warning',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.swalDefaultQuestion').click(function() {
      Toast.fire({
        type: 'question',
        title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });

    $('.toastrDefaultSuccess').click(function() {
      toastr.success('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultInfo').click(function() {
      toastr.info('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultError').click(function() {
      toastr.error('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });
    $('.toastrDefaultWarning').click(function() {
      toastr.warning('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.')
    });

    $('.toastsDefaultDefault').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultTopLeft').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'topLeft',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultBottomRight').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'bottomRight',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultBottomLeft').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        position: 'bottomLeft',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultAutohide').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        autohide: true,
        delay: 750,
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultNotFixed').click(function() {
      $(document).Toasts('create', {
        title: 'Toast Title',
        fixed: false,
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultFull').click(function() {
      $(document).Toasts('create', {
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        icon: 'fas fa-envelope fa-lg',
      })
    });
    $('.toastsDefaultFullImage').click(function() {
      $(document).Toasts('create', {
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
        title: 'Toast Title',
        subtitle: 'Subtitle',
        image: '../../dist/img/user3-128x128.jpg',
        imageAlt: 'User Picture',
      })
    });
    $('.toastsDefaultSuccess').click(function() {
      $(document).Toasts('create', {
        class: 'bg-success', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultInfo').click(function() {
      $(document).Toasts('create', {
        class: 'bg-info', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultWarning').click(function() {
      $(document).Toasts('create', {
        class: 'bg-warning', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultDanger').click(function() {
      $(document).Toasts('create', {
        class: 'bg-danger', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
    $('.toastsDefaultMaroon').click(function() {
      $(document).Toasts('create', {
        class: 'bg-maroon', 
        title: 'Toast Title',
        subtitle: 'Subtitle',
        body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
      })
    });
  });

</script>
<!-- page script -->
	<script>
	  $(function () {
		    $("#example1").DataTable();
		    $('#example2').DataTable({
		      "paging": true,
		      "lengthChange": false,
		      "searching": false,
		      "ordering": true,
		      "info": true,
		      "autoWidth": false,
		    });
		  });
</script>
</body>
</html>
