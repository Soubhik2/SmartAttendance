<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!-- Content Header (Page header) -->
<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">Dashboard</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="/admin">Home</a></li>
          <li class="breadcrumb-item active">Dashboard</li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>
<!-- /.content-header -->

<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <!-- Small boxes (Stat box) -->
    
    <!-- <script>let json = '${json}';</script> -->

    <div class="row">
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-info">
          <div class="inner">
            <h3>150</h3>

            <p>My students</p>
          </div>
          <div class="icon">
            <i class="bi bi-clipboard-check" style="font-size: 65px;"></i>
          </div>
          <a href="/admin/students" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-success">
          <div class="inner">
            <h3>53<sup style="font-size: 20px">%</sup></h3>

            <p>Check Attendance</p>
          </div>
          <div class="icon">
            <i class="bi bi-bar-chart" style="font-size: 65px;"></i>
          </div>
          <a href="/admin/check" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-warning">
          <div class="inner">
            <h3>44</h3>

            <p>My Classes</p>
          </div>
          <div class="icon">
            <i class="bi bi-aspect-ratio" style="font-size: 65px;"></i>
          </div>
          <a href="/admin/classes" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <!-- ./col -->
      <div class="col-lg-3 col-6">
        <!-- small box -->
        <div class="small-box bg-danger">
          <div class="inner">
            <h3>65</h3>

            <p>Add students</p>
          </div>
          <div class="icon">
            <i class="bi bi-plus-circle" style="font-size: 65px;"></i>
          </div>
          <a href="/admin/add" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
        </div>
      </div>
      <!-- ./col -->
    </div>
    <!-- /.row -->
    <!-- Main row -->
    <div class="table-s">
      <div class="col-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Recent Veiw tables</h3>

            <div class="card-tools">
              <div class="input-group input-group-sm" style="width: 150px;">
                <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                <div class="input-group-append">
                  <button type="submit" class="btn btn-default">
                    <i class="fas fa-search"></i>
                  </button>
                </div>
              </div>
            </div>
          </div>
          <!-- /.card-header -->
          <div class="card-body table-responsive p-0">
            <table class="table table-hover text-nowrap">
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Class name</th>
                  <th>Attendance</th>
                  <th>Add students</th>
                  <th>Update students</th>
                </tr>
              </thead>
              <tbody id="trb">          		
                <!-- <tr>
                  <td>${value.seid}</td>
                  <td>${value.s_name}</td>
                  <td>${value.LUP}</td>
                  <td><button id="${loop.index}" onclick="save('${loop.index}', '${value.seid}')" class="btn btn-primary"><i class="bi bi-pencil-square"></i></button></td>
                  <td><a href="/admin/classes/adds?id=${value.seid}&p=add" class="btn btn-success"><i class="bi bi-plus-circle"></i></a></td>
                  <td><a href="/admin/classes/adds?id=${value.seid}&p=update" class="btn btn-secondary"><i class="bi bi-arrow-clockwise"></i></a></td>
                </tr> -->
              </tbody>
            </table>
          </div>
          <!-- /.card-body -->
        </div>
        <!-- /.card -->
      </div>
    </div>
    <!-- /.row (main row) -->
  </div><!-- /.container-fluid -->
</section>
<!-- /.content -->

<script>
  // json = JSON.parse(json);
  let classes = JSON.parse(localStorage.getItem('classes'));
  classes.forEach((element, index) => {
    let tr = document.createElement('tr');
    tr.innerHTML = `
      <tr>
        <td>`+element.seid+`</td>
        <td>`+element.s_name+`</td>
        <td><button id="`+index+`" onclick="save('`+index+`', '`+element.seid+`')" class="btn btn-primary"><i class="bi bi-pencil-square"></i></button></td>
        <td><a href="/admin/classes/adds?id=`+element.seid+`&p=add" class="btn btn-success"><i class="bi bi-plus-circle"></i></a></td>
        <td><a href="/admin/classes/adds?id=`+element.seid+`&p=update" class="btn btn-secondary"><i class="bi bi-arrow-clockwise"></i></a></td>
      </tr>
    `;
    trb.appendChild(tr);
  });

  function save(id, seid){
    window.location = '/admin/classes/'+seid;
  }
</script>