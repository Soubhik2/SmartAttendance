package com.example.attendance.restcontroller;

import java.lang.reflect.Array;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.attendance.dao.AttendanceLogRep;
import com.example.attendance.dao.AttendanceRep;
import com.example.attendance.dao.SectionRef;
import com.example.attendance.dao.StudentRep;
import com.example.attendance.entites.Alog;
import com.example.attendance.entites.Attendance;
import com.example.attendance.entites.AttendanceLog;
import com.example.attendance.entites.Section;
import com.example.attendance.entites.Student;
import com.example.attendance.entites.Users;
import com.example.attendance.model.Auth;
import com.example.attendance.model.JsonRes;
import com.example.attendance.model.TestModel;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class ApiController {
	
	@Autowired
	StudentRep studentRep;
	@Autowired
	SectionRef sectionRef;
	@Autowired
	AttendanceRep attendanceRep;
	@Autowired
	AttendanceLogRep attendanceLogRep;
	
	Auth auth;
	
	public ApiController(HttpServletRequest req) {
		this.auth = new Auth(req);
	}
	
	@GetMapping("/api/get")
	public Map<String, String> getdata() {
		TestModel testModel = new TestModel();
		return testModel.Test();
	}
	
	@PostMapping("/admin/add")
	public JsonRes Addstudents(@RequestBody Student student) {
		if (!auth.isLoggedin()) {
			return new JsonRes(true, "user is not login");
		}
		
		try {			
			student.setActive(1);
			student.setUid(auth.getUser().getUid());
			studentRep.save(student);
			return new JsonRes(false, "done");
		} catch (Exception e) {
			// TODO: handle exception
			return new JsonRes(true, "save error");
		}
	}
	
	@PostMapping("/admin/classes/add")
	public JsonRes Addclasses(@RequestBody Section section) {
		if (!auth.isLoggedin()) {
			return new JsonRes(true, "user is not login");
		}
		
		try {			
			section.setUid(auth.getUser().getUid());
			section.setActive(1);
			sectionRef.save(section);
			return new JsonRes(false, "done");
		} catch (Exception e) {
			// TODO: handle exception
			return new JsonRes(true, "save error");
		}
//		System.out.println(section);
//		return "admin";
	}
	
	@GetMapping("/getSessionData")
    public Map<String, String> getSessionData(HttpServletRequest request) {
        // Get the session object from the request
        HttpSession session = request.getSession();
        Map<String, String> json = new HashMap<String, String>();

        // Retrieve session attribute
        if (session.getAttribute("isLoggedin") != null && session.getAttribute("user") != null) {			
        	boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
        	String user = (String) session.getAttribute("user");
        	json.put("isLoggedin", Boolean.toString(isLoggedin));
        	json.put("user", user);
		}else {
			json.put("isLoggedin", Boolean.toString(false));
		}

        // You can now use jsonData as needed

        // Redirect to another page or return a view name
        return json;
    }
	
	@PostMapping("/admin/classes/addStudents")
	public JsonRes addClasses(@RequestBody Attendance attendance) {
		try {
			attendanceRep.save(attendance);
			return new JsonRes(false, "done");
		} catch (Exception e) {
			// TODO: handle exception
			return new JsonRes(true, "ERROR: "+e);
		}
		
	}
	
	@GetMapping("/admin/classes/remStudents")
	public JsonRes remClasses(@RequestParam("id") int id) {
//		System.out.println(id);
		try {
			attendanceRep.deleteById(id);
			return new JsonRes(false, "done");
		} catch (Exception e) {
			// TODO: handle exception
			return new JsonRes(true, "ERROR: "+e);
		}
//		return new JsonRes(false, "ERROR: ");
	}
	
	@GetMapping("/get/attendance/log")
	public List<AttendanceLog> getAttendanceLog(@RequestParam ("id") int tableId, @RequestParam ("t") String date) {
		return attendanceLogRep.getAttendance(tableId, date);
	}
	
	@GetMapping("/get/attendance/all")
	public List<Alog> getAttendanceLog(@RequestParam ("roll") String roll, @RequestParam ("id") int tableId, @RequestParam ("t") String date) {
		List<AttendanceLog> attendance = attendanceLogRep.getAttendance(roll, tableId, date);
		List<Alog> alogs = new ArrayList<Alog>();
		
		attendance.forEach(value->{
			alogs.add(new Alog(value.getAUP().getDate(), value.getAttendance()));
		});
		
		return alogs;
	}
	
	@PostMapping("/update/attendance/log")
	public JsonRes getAttendanceLog(@RequestBody AttendanceLog attendanceLog) {
//		System.out.println(attendanceLog);
		try {			
			attendanceLogRep.save(attendanceLog);
			return new JsonRes(false, "done");
		} catch (Exception e) {
			// TODO: handle exception
			return new JsonRes(false, "ERROR: "+e);
		}
	}
	
	@PostMapping("/set/attendance/log")
	public JsonRes setAttendanceLog(@RequestBody AttendanceLog attendanceLog) {
		System.out.println(attendanceLog);
		try {			
			attendanceLogRep.save(attendanceLog);
			return new JsonRes(false, "done");
		} catch (Exception e) {
			// TODO: handle exception
			return new JsonRes(false, "ERROR: "+e);
		}
		
	}
	
}
