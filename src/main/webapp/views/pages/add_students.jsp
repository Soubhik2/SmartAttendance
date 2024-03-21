<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0">Add Students</h1>
        </div><!-- /.col -->
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="/admin">Home</a></li>
            <li class="breadcrumb-item active">Add Students</li>
          </ol>
        </div><!-- /.col -->
      </div><!-- /.row -->
    </div><!-- /.container-fluid -->
</div>

<section class="content">
    <div class="container-fluid">

        <div class="card card-primary">
            <div class="card-header">
            <h3 class="card-title">Quick Example</h3>
            </div>
            
            
            <form>
                <div class="card-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Student name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Student name">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Roll number</label>
                        <input type="text" class="form-control" id="roll" name="roll" placeholder="Roll number">
                    </div>
                    <label>More info</label>
                    <div id="inForm">
                        <div class="row mb-3">
                            <div class="col-sm-5">
                                <div class="form-group mb-0">
                                    <input type="text" name="key_1" class="form-control" placeholder="Key">
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group mb-0">
                                    <input type="text" name="value_1" class="form-control" placeholder="Value">
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <button type="button" onclick="add()" class="btn btn-success w-100"><i class="bi bi-plus-lg"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
            </div>
      
    </div>
</section>

<script>

    let form_num = 1;

    function add(){
        form_num++;
        let div = document.createElement('div');
        div.className = "row mb-3";
        div.innerHTML = `
            <div class="col-sm-5">
                <div class="form-group mb-0">
                    <input type="text" name="key_`+form_num+`" class="form-control" placeholder="Key">
                </div>
            </div>
            <div class="col-sm-5">
                <div class="form-group mb-0">
                    <input type="text" name="value_`+form_num+`" class="form-control" placeholder="Value">
                </div>
            </div>
            <div class="col-sm-2">
                <button type="button" onclick="add()" class="btn btn-success w-100"><i class="bi bi-plus-lg"></i></button>
            </div>
        `;
        inForm.appendChild(div);
    }

</script>