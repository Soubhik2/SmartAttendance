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
            <li class="breadcrumb-item"><a href="/admin/check">Check Attendance</a></li>
            <li class="breadcrumb-item active">${TableId}</li>
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
                    <th>Value</th>
                    <th>Attendance</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="element" items="${students}" varStatus="loop">                		
                    <tr>
                      <td>${loop.index+1}</td>
                      <td>${element.student}</td>
                      <td>${element.roll_no}</td>
                      <td><input type="text" class="form-control w-auto" id="${loop.index}" value="none" disabled></td>
                      <td>
                        <button onclick="P('${loop.index}')" class="btn btn-success mr-3">P</button>
                        <button onclick="A('${loop.index}')" class="btn btn-danger">A</button>
                      </td>
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

<script>
  let log = [];
  let students = '${json}';
  // students.replace('/', '');
  students = students.replaceAll('"{', '{');
  students = students.replaceAll('}"', '}');
  students = JSON.parse(students);

  let time = new Date().getFullYear()+"-"+num_prefix(new Date().getMonth()+1)+"-"+num_prefix(new Date().getDate());
  console.log(time);
  // let time = new Date().getFullYear()+"-0"+(new Date().getMonth()+1)+"-25";

  fetch("http://localhost:8080/get/attendance/log?id=${TableId}&t="+time).then(res=>res.json()).then(res=>{
    console.log(res);
    log = res;
    res.forEach((element, index) => {
      document.getElementById(index).value = element.attendance;
    });
  });

  function P(id){
    let json = {
        seid: '${id}',
        sid: students[id].sid,
        student: students[id].student,
        roll_no: students[id].roll_no,
        attendance: "P",
        active: 1,
    };

    if (document.getElementById(id).value == "none") {
      // console.log("set");
      fetch("http://localhost:8080/set/attendance/log",{
          method: 'POST',
          headers: {
              'Accept': 'application/json, text/plain, */*',
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(json)
      }).then(res=>res.json()).then(res=>{
          console.log(res);
          if (!res.error) {
            document.getElementById(id).value = "P";
          }
      });
    }else{
      // console.log('update');
      log[id].attendance = "P";
      fetch("http://localhost:8080/update/attendance/log",{
          method: 'POST',
          headers: {
              'Accept': 'application/json, text/plain, */*',
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(log[id])
      }).then(res=>res.json()).then(res=>{
          console.log(res);
          if (!res.error) {
            document.getElementById(id).value = "P";
          }
      });
    }

  }

  function A(id){
    let json = {
        seid: '${id}',
        sid: students[id].sid,
        student: students[id].student,
        roll_no: students[id].roll_no,
        attendance: "A",
        active: 1,
    };

    if (document.getElementById(id).value == "none") {
      // console.log("set");
      fetch("http://localhost:8080/set/attendance/log",{
          method: 'POST',
          headers: {
              'Accept': 'application/json, text/plain, */*',
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(json)
      }).then(res=>res.json()).then(res=>{
          console.log(res);
          if (!res.error) {
            document.getElementById(id).value = "A";
          }
      });
    }else{
      // console.log('update');
      log[id].attendance = "A";
      fetch("http://localhost:8080/update/attendance/log",{
          method: 'POST',
          headers: {
              'Accept': 'application/json, text/plain, */*',
              'Content-Type': 'application/json'
          },
          body: JSON.stringify(log[id])
      }).then(res=>res.json()).then(res=>{
          console.log(res);
          if (!res.error) {
            document.getElementById(id).value = "A";
          }
      });
    }
  }

  function num_prefix(num){
    if (num.toString().length<2)
      return '0'+num;
    else
      return num.toString();
  }
</script>