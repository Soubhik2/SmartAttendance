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
            <li class="breadcrumb-item"><a href="/admin/students">My Students</a></li>
            <li class="breadcrumb-item active">${StudentId}</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>

<section class="content">
    <div class="container-fluid">
      <div class="card">
        <div class="card-body">
          <h3>Name: ${Student.name}</h3>
          <h3>Roll number: ${Student.roll_no}</h3>
          <h3 id="info">
            More info:
           
          </h3>
        </div>
      </div>
      
    </div>
</section>

<script>
  let json = JSON.parse('${Student.info}');
  for (const key in json) {
    if (json.hasOwnProperty.call(json, key)) {
      let p = document.createElement('p');
      p.className = "ml-4";
      p.innerHTML = key+': '+json[key];
      info.appendChild(p);
    }
  }
</script>