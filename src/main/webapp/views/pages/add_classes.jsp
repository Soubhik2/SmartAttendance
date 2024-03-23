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
            <li class="breadcrumb-item"><a href="/admin/classes">My Classes</a></li>
            <li class="breadcrumb-item active">Add Classes</li>
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
            
            
            <form id="addData">
                <div class="card-body">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Class name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Class name">
                    </div>
                    <label>More info</label>
                    <div id="inForm">
                        <div class="row mb-3">
                            <div class="col-sm-5">
                                <div class="form-group mb-0">
                                    <input type="text" id="key_1" class="form-control key" placeholder="Key">
                                </div>
                            </div>
                            <div class="col-sm-5">
                                <div class="form-group mb-0">
                                    <input type="text" id="value_1" class="form-control value" placeholder="Value">
                                </div>
                            </div>
                            <div class="col-sm-2">
                                <button type="button" onclick="add()" class="btn btn-success w-100"><i class="bi bi-plus-lg"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            
                <div class="card-footer">
                    <button type="submit" class="btn btn-primary">Add</button>
                </div>
            </form>
        </div>

    </div>
</section>

<script>

    document.getElementById('addData').addEventListener('submit', event=>{
        event.preventDefault();

        let info = {};

        for (let i = 0; i < document.getElementsByClassName('key').length; i++) {
            const key = document.getElementsByClassName('key')[i];
            const value = document.getElementsByClassName('value')[i];
            // console.log(element.value);
            eval('info.'+key.value+' = "'+value.value+'"');
        }

        let json = {
            s_name: document.getElementById('name').value,
            info: JSON.stringify(info)
        }

        fetch("http://localhost:8080/admin/classes/add",{
            method: 'POST',
            headers: {
                'Accept': 'application/json, text/plain, */*',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(json)
        }).then(res=>res.json()).then(res=>{
            console.log(res);
            if (!res.error) {
                toastr.success('Class added successfully');
            } else {
                toastr.warning('Some problem to add Class');
            }
        })
        // console.log(json);
    });

    let form_num = 1;

    function add(){
        form_num++;
        let div = document.createElement('div');
        div.className = "row mb-3";
        div.innerHTML = `
            <div class="col-sm-5">
                <div class="form-group mb-0">
                    <input type="text" name="key_`+form_num+`" class="form-control key" placeholder="Key">
                </div>
            </div>
            <div class="col-sm-5">
                <div class="form-group mb-0">
                    <input type="text" name="value_`+form_num+`" class="form-control value" placeholder="Value">
                </div>
            </div>
            <div class="col-sm-2">
                <button type="button" onclick="add()" class="btn btn-success w-100"><i class="bi bi-plus-lg"></i></button>
            </div>
        `;
        inForm.appendChild(div);
    }

</script>