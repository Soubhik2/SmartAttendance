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
        <p>${count}</p>

        <div class="table-s">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title" id="timetitle">2024-03-25</h3>
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
      <div class="d-flex justify-content-between">
        <button onclick="prev()" class="btn btn-secondary"><i class="bi bi-caret-left-fill"></i></button>
        <button onclick="next()" class="btn btn-secondary"><i class="bi bi-caret-right-fill"></i></button>
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
    getData(month, year);
  }

  function next(){
    month++;
    if (month == 13) {
      month = 1;
      year++;
    }
    TimeSet();
    getData(month, year);
  }

  getData(month, year);

  function getData(month, year){
    fetch("http://localhost:8080/get/attendance/all?roll=${roll}&id=${sec}&t="+year+'-'+num_prefix(month)).then(res=>res.json()).then(res=>{
      res = correctAttendanceList(res, getDaysInMont(month,year));
      console.log(res);
      display(res, month, year);
    })
  }


  // let alog = JSON.parse('${alog}');
  // date = correctAttendanceList(date, getDaysInMont(3,2024));

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

  function display(date, day, month){
    tset.innerHTML = '';
    let count = 0;
  
    for (let i = 0; i < mod(getDaysInMont(day,month)/7); i++) {
      let tr = document.createElement('tr');
      for (let j = 0; j < 7; j++) {
        if (count < getDaysInMont(day,month)) {
          let td = document.createElement('td');
          td.className = "text-center";
          // console.log(date[count].day == (count+1));
          
          if (date[count].attendance == "P") {
            td.innerHTML = '<button class="border border-1 border-black bg-success" style="width: 50px; height: 50px; font-size: 22px;">'+date[count].day+'</button>';
          }
          if (date[count].attendance == "A") {
            td.innerHTML = '<button class="border border-1 border-black bg-danger" style="width: 50px; height: 50px; font-size: 22px;">'+date[count].day+'</button>';
          }
          if (date[count].attendance == "none") {
            td.innerHTML = '<button class="border border-1 border-black bg-light" style="width: 50px; height: 50px; font-size: 22px;">'+date[count].day+'</button>';
          }
  
          // td.innerHTML = '<button class="border border-1 border-black py-2 px-3 bg-light">'+date[count].day+'</button>';
  
          tr.appendChild(td);
          count++;
          
        }else{break;}
      }
      tset.appendChild(tr);
    }
  
    // console.log(mod(date/7));
  }


  function mod(num){
    if (parseInt(num)<num) {
      return parseInt(num)+1;
    }
    return parseInt(num);
  }

  function getDaysInMont (month, year) {
    // Get the number of days in the specified month and year
    return new Date(year, month, 0).getDate();
    // Here January is 0 based
    // return new Date(year, month+1, 0).getDate();
  }

  function correctAttendanceList1(list) {
    let correctedDate = [];
    let maxDay = Math.max(...list.map(item => item.day));
    
    for (let i = 1; i <= maxDay; i++) {
      let existingDay = list.find(item => item.day === i);
      if (existingDay) {
        correctedDate.push(existingDay);
      } else {
        correctedDate.push({ day: i, attendance: 'none' });
      }
    }
    
    return correctedDate;
  }

  function correctAttendanceList(list, days) {
    let correctedDate = [];
    let truncatedList = list.slice(0, days); // Limiting the list to the first 30 days
    
    for (let i = 1; i <= days; i++) {
      let existingDay = truncatedList.find(item => item.day === i);
      if (existingDay) {
        correctedDate.push(existingDay);
      } else {
        correctedDate.push({ day: i, attendance: 'none' });
      }
    }
    
    return correctedDate;
  }

  // console.log(correctAttendanceList1(date, getDaysInMont(3,2024)));
  // console.log(getDaysInMont(2,2024));

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

<!-- 
  SELECT * FROM `attendance_log` WHERE `roll_no` = 34600120015 AND `seid` = 500004
  SELECT * FROM `attendance_log` WHERE `roll_no` = 34600120015 AND `seid` = 500004 AND `attendance` = "P";
  SELECT * FROM `attendance_log` WHERE `roll_no` = 34600120015 AND `seid` = 500004 AND `ATT` LIKE "%2024-02%"
  SELECT * FROM `attendance_log` WHERE `roll_no` = 34600120015 AND `seid` = 500004 AND `ATT` LIKE "%2024-02%" AND `attendance` = "P"
 -->