<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Check Attendance</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="/admin">Home</a></li>
            <li class="breadcrumb-item active">Check Attendance</li>
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
                        <th>Table name</th>
                        <th>Time</th>
                        <th>Display</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>Class name</td>
                        <td>11-7-2014</td>
                        <td><a href="/admin/check/500001" class="btn btn-success">View</button></td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>Class name</td>
                        <td>11-7-2014</td>
                        <td><a href="/admin/check/500002" class="btn btn-success">View</button></td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>Class name</td>
                        <td>11-7-2014</td>
                        <td><a href="/admin/check/500003" class="btn btn-success">View</button></td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td>Class name</td>
                        <td>11-7-2014</td>
                        <td><a href="/admin/check/500004" class="btn btn-success">View</button></td>
                      </tr>
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