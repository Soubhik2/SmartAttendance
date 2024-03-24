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
            <li class="breadcrumb-item"><a href="/admin">My Classes</a></li>
            <li class="breadcrumb-item"><a href="/admin/students">Add students</a></li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>

<section class="content">
    <div class="container-fluid">
        
        <c:choose>
         <c:when test="${p eq 'add'}">
             <!-- add -->
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
                             <th>Add</th>
                           </tr>
                         </thead>
                         <tbody>
                             <c:forEach var="element" items="${students}" varStatus="loop">                		
                               <tr>
                                 <td>${loop.index}</td>
                                 <td>${element.name}</td>
                                 <td>${element.roll_no}</td>
                                 <td><a href="/admin/students/${element.sid}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a></td>
                                 <td><button id="${loop.index}" onclick="add('${loop.index}')" class="btn btn-success"><i class="bi bi-plus-circle"></i></button></td>
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
         </c:when>
         <c:when test="${p eq 'update'}">
             <!-- update -->
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
                             <th>Remove</th>
                           </tr>
                         </thead>
                         <tbody>
                             <c:forEach var="element" items="${students}" varStatus="loop">                		
                               <tr>
                                 <td>${loop.index+1}</td>
                                 <td>${element.student}</td>
                                 <td>${element.roll_no}</td>
                                 <td><a href="/admin/students/${element.sid}" class="btn btn-primary"><i class="bi bi-eye-fill"></i></a></td>
                                 <td><button id="${loop.index}" onclick="rem('${loop.index}')" class="btn btn-danger"><i class="bi bi-trash"></i></button></td>
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
         </c:when>
        </c:choose>
      
    </div>
</section>

<script>
    let students = '${json}';
    // students.replace('/', '');
    students = students.replaceAll('"{', '{');
    students = students.replaceAll('}"', '}');
    students = JSON.parse(students);

    function add(id){

        // console.log(students[id]);

        // success
        // document.getElementById(id).innerHTML = '<i class="bi bi-check-circle"></i>';

        // error
        // document.getElementById(id).innerHTML = '<i class="bi bi-exclamation-triangle"></i>';
        // document.getElementById(id).className = 'btn btn-warning';

        let json = {
            seid: '${id}',
            sid: students[id].sid,
            student: students[id].name,
            roll_no: students[id].roll_no,
            info: JSON.stringify({status: true}),
            active: 1,
        };

        fetch("http://localhost:8080/admin/classes/addStudents",{
            method: 'POST',
            headers: {
                'Accept': 'application/json, text/plain, */*',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(json)
        }).then(res=>res.json()).then(res=>{
            console.log(res);
            if (!res.error) {
                document.getElementById(id).innerHTML = '<i class="bi bi-check-circle"></i>';
            } else {
                document.getElementById(id).innerHTML = '<i class="bi bi-exclamation-triangle"></i>';
                document.getElementById(id).className = 'btn btn-warning';
            }
        });
    }

    function rem(id){
        // console.log(students[id].aid);
        // success
        // document.getElementById(id).innerHTML = '<i class="bi bi-check-circle"></i>';
        // document.getElementById(id).className = 'btn btn-success';

        // error
        // document.getElementById(id).innerHTML = '<i class="bi bi-exclamation-triangle"></i>';
        // document.getElementById(id).className = 'btn btn-warning';

        let aid = students[id].aid;

        fetch("http://localhost:8080/admin/classes/remStudents?id="+aid).then(res=>res.json()).then(res=>{
            console.log(res);
            if (!res.error) {
                document.getElementById(id).innerHTML = '<i class="bi bi-check-circle"></i>';
                document.getElementById(id).className = 'btn btn-success';
            } else {
                document.getElementById(id).innerHTML = '<i class="bi bi-exclamation-triangle"></i>';
                document.getElementById(id).className = 'btn btn-warning';
            }
        });
    }
</script>