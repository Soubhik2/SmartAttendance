<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Tempusdominus Bootstrap 4 -->
  <link rel="stylesheet" href="/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
  <!-- JQVMap -->
  <link rel="stylesheet" href="/plugins/jqvmap/jqvmap.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">
  <!-- overlayScrollbars -->
  <link rel="stylesheet" href="/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="/plugins/daterangepicker/daterangepicker.css">
  <!-- Toastr -->
  <link rel="stylesheet" href="/plugins/toastr/toastr.min.css">
  <!-- summernote -->
  <link rel="stylesheet" href="/plugins/summernote/summernote-bs4.min.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <!-- <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div> -->

  <!-- Navbar -->  
  <jsp:include page="uitil/admin_header.jsp"/>
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
  <jsp:include page="uitil/admin_sidebar.jsp"/>
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <jsp:include page="pages/${page}.jsp"/>  
  </div>
  
  <!-- /.content-wrapper -->
  <jsp:include page="uitil/admin_footer.jsp"/>
  
  <!-- Control Sidebar -->
  <!-- <aside class="control-sidebar control-sidebar-dark">
    Control sidebar content goes here
  </aside> -->
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button)
</script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- ChartJS -->
<script src="/plugins/chart.js/Chart.min.js"></script>
<!-- Sparkline -->
<script src="/plugins/sparklines/sparkline.js"></script>
<!-- JQVMap -->
<script src="/plugins/jqvmap/jquery.vmap.min.js"></script>
<script src="/plugins/jqvmap/maps/jquery.vmap.usa.js"></script>
<!-- jQuery Knob Chart -->
<script src="/plugins/jquery-knob/jquery.knob.min.js"></script>
<!-- daterangepicker -->
<script src="/plugins/moment/moment.min.js"></script>
<script src="/plugins/daterangepicker/daterangepicker.js"></script>
<!-- Tempusdominus Bootstrap 4 -->
<script src="/plugins/tempusdominus-bootstrap-4/js/tempusdominus-bootstrap-4.min.js"></script>
<!-- Summernote -->
<script src="/plugins/summernote/summernote-bs4.min.js"></script>
<!-- Toastr -->
<script src="/plugins/toastr/toastr.min.js"></script>
<!-- overlayScrollbars -->
<script src="/plugins/overlayScrollbars/js/jquery.overlayScrollbars.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.js"></script>
<!-- AdminLTE for demo purposes -->
<!-- <script src="/dist/js/demo.js"></script> -->
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="/dist/js/pages/dashboard.js"></script>

<script>
  $(function() {
    // var Toast = Swal.mixin({
    //   toast: true,
    //   position: 'top-end',
    //   showConfirmButton: false,
    //   timer: 3000
    // });

    // $('.swalDefaultSuccess').click(function() {
    //   Toast.fire({
    //     icon: 'success',
    //     title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.swalDefaultInfo').click(function() {
    //   Toast.fire({
    //     icon: 'info',
    //     title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.swalDefaultError').click(function() {
    //   Toast.fire({
    //     icon: 'error',
    //     title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.swalDefaultWarning').click(function() {
    //   Toast.fire({
    //     icon: 'warning',
    //     title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.swalDefaultQuestion').click(function() {
    //   Toast.fire({
    //     icon: 'question',
    //     title: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });

    $('.toastrDefaultSuccess').click(function() {
      toastr.success('Lorem ipsum dolor sit amet, consetetur sadipscing elitr.1')
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

    // $('.toastsDefaultDefault').click(function() {
    //   $(document).Toasts('create', {
    //     title: 'Toast Title',
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultTopLeft').click(function() {
    //   $(document).Toasts('create', {
    //     title: 'Toast Title',
    //     position: 'topLeft',
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultBottomRight').click(function() {
    //   $(document).Toasts('create', {
    //     title: 'Toast Title',
    //     position: 'bottomRight',
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultBottomLeft').click(function() {
    //   $(document).Toasts('create', {
    //     title: 'Toast Title',
    //     position: 'bottomLeft',
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultAutohide').click(function() {
    //   $(document).Toasts('create', {
    //     title: 'Toast Title',
    //     autohide: true,
    //     delay: 750,
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultNotFixed').click(function() {
    //   $(document).Toasts('create', {
    //     title: 'Toast Title',
    //     fixed: false,
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultFull').click(function() {
    //   $(document).Toasts('create', {
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
    //     title: 'Toast Title',
    //     subtitle: 'Subtitle',
    //     icon: 'fas fa-envelope fa-lg',
    //   })
    // });
    // $('.toastsDefaultFullImage').click(function() {
    //   $(document).Toasts('create', {
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.',
    //     title: 'Toast Title',
    //     subtitle: 'Subtitle',
    //     image: '../../dist/img/user3-128x128.jpg',
    //     imageAlt: 'User Picture',
    //   })
    // });
    // $('.toastsDefaultSuccess').click(function() {
    //   $(document).Toasts('create', {
    //     class: 'bg-success',
    //     title: 'Toast Title',
    //     subtitle: 'Subtitle',
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultInfo').click(function() {
    //   $(document).Toasts('create', {
    //     class: 'bg-info',
    //     title: 'Toast Title',
    //     subtitle: 'Subtitle',
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultWarning').click(function() {
    //   $(document).Toasts('create', {
    //     class: 'bg-warning',
    //     title: 'Toast Title',
    //     subtitle: 'Subtitle',
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultDanger').click(function() {
    //   $(document).Toasts('create', {
    //     class: 'bg-danger',
    //     title: 'Toast Title',
    //     subtitle: 'Subtitle',
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
    // $('.toastsDefaultMaroon').click(function() {
    //   $(document).Toasts('create', {
    //     class: 'bg-maroon',
    //     title: 'Toast Title',
    //     subtitle: 'Subtitle',
    //     body: 'Lorem ipsum dolor sit amet, consetetur sadipscing elitr.'
    //   })
    // });
  });
</script>
</body>
</html>