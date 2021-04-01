<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Gestion des Ressources Humaines | Ajouter Support</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="plugins/fontawesome-free/css/all.min.css">
  <!-- Select2 -->
  <link rel="stylesheet" href="plugins/select2/css/select2.min.css">
  <link rel="stylesheet" href="plugins/select2-bootstrap4-theme/select2-bootstrap4.min.css">
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
                <a href="consempAGeneral" class="nav-link active">
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
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Ajouter Support</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Ajouter Support</li>
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
          <h3 class="card-title">Ajouter Support</h3>

          <div class="card-tools">
            <button type="button" class="btn btn-tool" data-card-widget="collapse" data-toggle="tooltip" title="Collapse">
              <i class="fas fa-minus"></i></button>
            <button type="button" class="btn btn-tool" data-card-widget="remove" data-toggle="tooltip" title="Remove">
              <i class="fas fa-times"></i></button>
          </div>
        </div>
        <div class="card-body">
        <form method="Post" action="AjouterSupp?idcaseTab=${idcaseTab}">
           <div class="col-sm-6" style="margin-left:200px">
           
           <div class="form-group">
                  <label>Minimal</label>
                  <select name="nomEmploye" class="form-control select2bs4" style="width: 100%;">
                    <option value='' selected disabled>Choisir employe</option>
                            <c:forEach var="em" items="${ emp }">
                            <option>${em.nomEmploye }</option>
                            </c:forEach>
                  </select>
                </div>
                </div>
           
           <div class="col-sm-3" style="margin-left:320px;margin-top:50px">
                      <button type="submit"  class="btn btn-block btn-outline-success">Ajouter Employe</button>
                    </div>
                    
          </form>
           
          

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
<!-- Select2 -->
<script src="plugins/select2/js/select2.full.min.js"></script>
<!-- Bootstrap4 Duallistbox -->
<script src="plugins/bootstrap4-duallistbox/jquery.bootstrap-duallistbox.min.js"></script>
<!-- InputMask -->
<script src="plugins/moment/moment.min.js"></script>
<script src="plugins/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<!-- date-range-picker -->
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- bootstrap color picker -->
<script src="plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Bootstrap Switch -->
<script src="plugins/bootstrap-switch/js/bootstrap-switch.min.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
<!-- Page script -->
<script>
  $(function () {
    //Initialize Select2 Elements
    $('.select2').select2()

    //Initialize Select2 Elements
    $('.select2bs4').select2({
      theme: 'bootstrap4'
    })

    //Datemask dd/mm/yyyy
    $('#datemask').inputmask('dd/mm/yyyy', { 'placeholder': 'dd/mm/yyyy' })
    //Datemask2 mm/dd/yyyy
    $('#datemask2').inputmask('mm/dd/yyyy', { 'placeholder': 'mm/dd/yyyy' })
    //Money Euro
    $('[data-mask]').inputmask()

    //Date range picker
    $('#reservation').daterangepicker()
    //Date range picker with time picker
    $('#reservationtime').daterangepicker({
      timePicker: true,
      timePickerIncrement: 30,
      locale: {
        format: 'MM/DD/YYYY hh:mm A'
      }
    })
    //Date range as a button
    $('#daterange-btn').daterangepicker(
      {
        ranges   : {
          'Today'       : [moment(), moment()],
          'Yesterday'   : [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
          'Last 7 Days' : [moment().subtract(6, 'days'), moment()],
          'Last 30 Days': [moment().subtract(29, 'days'), moment()],
          'This Month'  : [moment().startOf('month'), moment().endOf('month')],
          'Last Month'  : [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        },
        startDate: moment().subtract(29, 'days'),
        endDate  : moment()
      },
      function (start, end) {
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      }
    )

    //Timepicker
    $('#timepicker').datetimepicker({
      format: 'LT'
    })
    
    //Bootstrap Duallistbox
    $('.duallistbox').bootstrapDualListbox()

    //Colorpicker
    $('.my-colorpicker1').colorpicker()
    //color picker with addon
    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    });

    $("input[data-bootstrap-switch]").each(function(){
      $(this).bootstrapSwitch('state', $(this).prop('checked'));
    });

  })
</script>
                  
</body>
</html>
