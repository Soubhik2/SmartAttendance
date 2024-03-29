<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">My Students</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="/admin">Home</a></li>
            <li class="breadcrumb-item active">My Students</li>
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
              <h3 class="card-title">My Students List</h3>
  
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
                    <th>Student name</th>
                    <th>Roll number</th>
                    <th>View more</th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach var="element" items="${students}">                		
	                  <tr>
	                    <td>${element.sid}</td>
	                    <td>${element.name}</td>
	                    <td>${element.roll_no}</td>
	                    <td><a href="/admin/students/${element.sid}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a></td>
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