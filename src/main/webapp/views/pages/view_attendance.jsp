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
                  <h3 class="card-title">2024-03-25</h3>
                </div>
                <!-- /.card-header -->
                <div class="card-body table-responsive p-0">
                  <table class="table table-hover text-nowrap">
                    <thead>
                      <tr>
                        <th class="text-center">Monday</th>
                        <th class="text-center">Tuesday</th>
                        <th class="text-center">Wednesday</th>
                        <th class="text-center">Thursday</th>
                        <th class="text-center">Friday</th>
                        <th class="text-center">Saturday</th>
                        <th class="text-center">Sunday</th>
                      </tr>
                    </thead>
                    <tbody id="tset">
                      <!-- <tr>
                        <td class="text-center"><button class="border border-1 border-black py-2 px-3 bg-light">1</button></td>
                        <td class="text-center"><button class="border border-1 border-black py-2 px-3 bg-light">2</button></td>
                        <td class="text-center"><button class="border border-1 border-black py-2 px-3 bg-light">3</button></td>
                        <td class="text-center"><button class="border border-1 border-black py-2 px-3 bg-light">4</button></td>
                        <td class="text-center"><button class="border border-1 border-black py-2 px-3 bg-light">5</button></td>
                        <td class="text-center"><button class="border border-1 border-black py-2 px-3 bg-light">6</button></td>
                        <td class="text-center"><button class="border border-1 border-black py-2 px-3 bg-light">7</button></td>
                      </tr> -->
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

<!-- 
<thead id="head">
                      
</thead>
<tbody id="body">
  
</tbody> 
-->

<script>

  let date = [
      { day: 1, attendance: 'P' },
      { day: 2, attendance: 'P' },
      { day: 3, attendance: 'A' },
      { day: 4, attendance: 'P' },
      { day: 5, attendance: 'P' },
      { day: 6, attendance: 'P' },
      { day: 7, attendance: 'P' },
      { day: 8, attendance: 'A' },
      { day: 9, attendance: 'A' },
      { day: 10, attendance: 'P' },
      { day: 11, attendance: 'P' },
      { day: 12, attendance: 'A' },
      { day: 13, attendance: 'P' },
      { day: 14, attendance: 'A' },
      { day: 15, attendance: 'P' },
      { day: 16, attendance: 'P' },
      { day: 17, attendance: 'A' },
      { day: 18, attendance: 'A' },
      { day: 19, attendance: 'P' },
      { day: 20, attendance: 'A' },
      { day: 21, attendance: 'P' },
      { day: 22, attendance: 'P' },
      { day: 23, attendance: 'P' }
  ];

  for (let i = 0; i < mod(date.length/7); i++) {
    let tr = document.createElement('tr');
    for (let j = i; j <= 7; j++) {
      let td = document.createElement('td');
      td.className = "text-center";
      td.innerHTML = '<button class="border border-1 border-black py-2 px-3 bg-light">'+j+'</button>';
      tr.appendChild(td);
    }
    tset.appendChild(tr);
  }

  // console.log(mod(date/7));

  function mod(num){
    if (parseInt(num)<num) {
      return parseInt(num)+1;
    }
    return parseInt(num);
  }

</script>

<script>
    // let data = [
    //     ["id","First","Last","Handle"],
    //     ["1","Mark","Otto","@mdo"],
    //     ["2","Jacob","Thornton","@twitter"]
    // ];

    // fetch('http://localhost:8080/api/getList').then(res=>res.json()).then(res=>{
    //     table(res);
    // })

    // table(data);

    // table create and add
    // table(data);
    
    // function table(data) {
    //     data.forEach((items, index) => {
    //         let tr = document.createElement("tr");
    //         if (index > 0) {
    //             items.forEach((value, index) => {
    //                 if (index == 0) {
    //                     var t = document.createElement("th");
    //                     t.scope = "row";
    //                     t.innerHTML = value;
    //                 } else {
    //                     var t = document.createElement("td");
    //                     t.innerHTML = value;
    //                 }
    //                 tr.appendChild(t);
    //             });
    //             body.appendChild(tr);
    //         } else {
    //             items.forEach(element => {
    //                 let th = document.createElement("th");
    //                 th.scope = "col";
    //                 th.innerHTML = element;
    //                 tr.appendChild(th);
    //             });
    //             head.appendChild(tr);
    //         }
    //     });
    // }

</script>