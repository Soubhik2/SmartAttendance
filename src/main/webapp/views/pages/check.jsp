<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<div class="container my-5">
    <form>
        <div class="mb-3">
          <label for="exampleInputEmail1" class="form-label">Roll Number</label>
          <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
          <label for="exampleInputPassword1" class="form-label">Section Id</label>
          <input type="password" class="form-control" id="exampleInputPassword1">
        </div>
        <div class="mb-3 form-check">
          <input type="checkbox" class="form-check-input" id="exampleCheck1">
          <label class="form-check-label" for="exampleCheck1">Show all details</label>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <div class="card mt-5">
        <div class="card-body">
            <div class="naeme">
                <h2>Name: <span class="h3">Student name</span></h2>
                <h2>Roll: <span class="h3">34600120005</span></h2>
            </div>

            <table class="table table-striped">
                <thead id="head">
                  <!-- <tr>
                    <th scope="col">#</th>
                    <th scope="col">First</th>
                    <th scope="col">Last</th>
                    <th scope="col">Handle</th>
                  </tr> -->
                </thead>
                <tbody id="body">
                  <!-- <tr>
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                  </tr>
                  <tr>
                    <th scope="row">2</th>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                  </tr>
                  <tr>
                    <th scope="row">3</th>
                    <td colspan="2">Larry the Bird</td>
                    <td>@twitter</td>
                  </tr> -->
                </tbody>
              </table>
        </div>
    </div>
</div>

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