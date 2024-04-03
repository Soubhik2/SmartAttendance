<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page isELIgnored="false" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<div class="container my-5">
    <form id="form1">
        <div class="mb-3">
          <label for="exampleInputEmail1" class="form-label">Roll Number</label>
          <input type="text" class="form-control" id="roll" aria-describedby="emailHelp" required>
        </div>
        <div class="mb-3">
          <label for="exampleInputPassword1" class="form-label">Section Id</label>
          <input type="text" class="form-control" id="sec">
        </div>
        <div class="mb-3 form-check">
          <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
          <label class="form-check-label" for="exampleCheck1">Show all details</label>
        </div>
        <button type="submit" class="btn btn-primary">Search</button>
    </form>

    <div class="" id="data">
      <p id="timetitle" class="mt-5"></p>
      <div class="card">
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
      <div class="d-flex justify-content-between mt-3">
        <button onclick="prev()" class="btn btn-secondary"><i class="bi bi-caret-left-fill"></i></button>
        <button onclick="next()" class="btn btn-secondary"><i class="bi bi-caret-right-fill"></i></button>
      </div>
    </div>
</div>

<script>

  data.style.display = "none";

  let date = new Date().getDate();
  let month = new Date().getMonth()+1;
  let year = new Date().getFullYear();

  timetitle.innerHTML = year+'-'+num_prefix(month)+'-'+num_prefix(date);

  function prev(){
    month--;
    if (month == 0) {
      month = 12;
      year--;
    }
    TimeSet();
    // getData(month, year);
    getAtt()
  }

  function next(){
    month++;
    if (month == 13) {
      month = 1;
      year++;
    }
    TimeSet();
    // getData(month, year);
    getAtt()
  }

    // let data = [
    //     ["id","First","Last","Handle"],
    //     ["1","Mark","Otto","@mdo"],
    //     ["2","Jacob","Thornton","@twitter"]
    // ];

    // table create and add
    // table(data);

    function getAtt(){
      fetch('http://localhost:8080/get/attendance/info?roll='+roll.value+'&id='+sec.value+'&t='+year+'-'+num_prefix(month)).then(res=>res.json()).then(res=>{
        table(res);
        data.style.display = "block";
      });
    }

    document.getElementById('form1').addEventListener('submit',event=>{
      event.preventDefault();
      getAtt()
    });

  function TimeSet(){
    timetitle.innerHTML = year+'-'+num_prefix(month)+'-'+num_prefix(date);
    return year+'-'+month;
  }

  function num_prefix(num){
    if (num.toString().length<2)
      return '0'+num;
    else
      return num.toString();
  }
    
    function table(data) {
        head.innerHTML = '';
        body.innerHTML = '';
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