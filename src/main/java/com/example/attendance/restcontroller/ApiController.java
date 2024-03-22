package com.example.attendance.restcontroller;

import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.attendance.dao.StudentRep;
import com.example.attendance.entites.Student;
import com.example.attendance.entites.Users;
import com.example.attendance.model.Auth;
import com.example.attendance.model.TestModel;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RestController
public class ApiController {
	
	@Autowired
	StudentRep studentRep;
	
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
	public Student Addstudents(@RequestBody Student student) {
		if (!auth.isLoggedin()) {
			return student;
		}
		student.setActive(1);
		student.setUid(auth.getUser().getUid());
		studentRep.save(student);
		return student;
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
	
}
