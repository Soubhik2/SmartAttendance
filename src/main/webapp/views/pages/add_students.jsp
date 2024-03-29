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

        <!-- <div class="card card-warning card-outline">
            <div class="card-header">
              <h3 class="card-title">
                <i class="fas fa-edit"></i>
                Toastr Examples
              </h3>
            </div>
            <div class="card-body">
              <button type="button" class="btn btn-success toastrDefaultSuccess">
                Launch Success Toast
              </button>
              <button type="button" class="btn btn-info toastrDefaultInfo">
                Launch Info Toast
              </button>
              <button type="button" class="btn btn-danger toastrDefaultError">
                Launch Error Toast
              </button>
              <button type="button" class="btn btn-warning toastrDefaultWarning">
                Launch Warning Toast
              </button>
              <div class="text-muted mt-3">
                For more examples look at <a href="https://codeseven.github.io/toastr/">https://codeseven.github.io/toastr/</a>
              </div>
            </div>
          </div> -->

        <div class="card card-primary">
            <div class="card-header">
            <h3 class="card-title">Quick Example</h3>
            </div>
            
            
            <form id="addData">
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

        // for (let i = 1; document.getElementById('key_'+i) != null; i++) {
        //     // eval('info.'+document.getElementById('key_'+i).value+' = '+document.getElementById('value_'+i).value);
        //     console.log(document.getElementById('key_'+i).value);
        //     // eval
        // }

        for (let i = 0; i < document.getElementsByClassName('key').length; i++) {
            const key = document.getElementsByClassName('key')[i];
            const value = document.getElementsByClassName('value')[i];
            // console.log(element.value);
            eval('info.'+key.value+' = "'+value.value+'"');
        }

        let json = {
            name: document.getElementById('name').value,
            roll_no: roll.value,
            info: JSON.stringify(info)
        }

        fetch("http://localhost:8080/admin/add",{
            method: 'POST',
            headers: {
                'Accept': 'application/json, text/plain, */*',
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(json)
        }).then(res=>res.json()).then(res=>{
            console.log(res);
            if (!res.error) {
                toastr.success('Student added successfully');
            } else {
                toastr.warning('Some problem to add student');
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