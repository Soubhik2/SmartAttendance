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
            <li class="breadcrumb-item"><a href="/admin/check">Check Attendance</a></li>
            <li class="breadcrumb-item active">view</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>

<section class="content">
    <div class="container-fluid">

        <h4>${roll}</h4>
        <h4>${sec}</h4>

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
                    <thead id="head">
                      
                    </thead>
                    <tbody id="body">
                      
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

<script>
    let data = [
        ["id","First","Last","Handle"],
        ["1","Mark","Otto","@mdo"],
        ["2","Jacob","Thornton","@twitter"]
    ];

    fetch('http://localhost:8080/api/getList').then(res=>res.json()).then(res=>{
        table(res);
    })

    // table create and add
    // table(data);
    
    function table(data) {
        data.forEach((items, index) => {
            let tr = document.createElement("tr");
            if (index > 0) {
                items.forEach((value, index) => {
                    if (index == 0) {
                        var t = document.createElement("th");
                        t.scope = "row";
                        t.innerHTML = value;
                    } else {
                        var t = document.createElement("td");
                        t.innerHTML = value;
                    }
                    tr.appendChild(t);
                });
                body.appendChild(tr);
            } else {
                items.forEach(element => {
                    let th = document.createElement("th");
                    th.scope = "col";
                    th.innerHTML = element;
                    tr.appendChild(th);
                });
                head.appendChild(tr);
            }
        });
    }

</script>