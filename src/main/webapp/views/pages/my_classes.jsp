<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">My Classes</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="/admin">Home</a></li>
            <li class="breadcrumb-item active">My Classes</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>

<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0">Add Classes</h1>
      </div><!-- /.col -->
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a class="btn btn-success" href="/admin/classes/add">Add</a></li>
        </ol>
      </div><!-- /.col -->
    </div><!-- /.row -->
  </div><!-- /.container-fluid -->
</div>

<section class="content">
    <div class="container-fluid">
     

        <div class="table-s">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">My Tables</h3>
      
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
                        <th>Time</th>
                        <th>Attendance</th>
                        <th>Add students</th>
                        <th>Update students</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                    	<c:forEach var="value" items="${classes}">                    		
	                      <tr>
	                        <td>${value.seid}</td>
	                        <td>${value.s_name}</td>
	                        <td>${value.LUP}</td>
	                        <td><a href="/admin/classes/${value.seid}" class="btn btn-primary"><i class="bi bi-pencil-square"></i></a></td>
	                        <td><a href="/admin/classes/adds?id=${value.seid}&p=add" class="btn btn-success"><i class="bi bi-plus-circle"></i></a></td>
	                        <td><a href="/admin/classes/adds?id=${value.seid}&p=update" class="btn btn-secondary"><i class="bi bi-arrow-clockwise"></i></a></td>
	                      </tr>
                    	</c:forEach>
                      
                    </tbody>
                  </table>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
            </div>
        </div>
    </div>
</section>