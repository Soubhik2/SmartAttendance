package com.example.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.attendance.dao.AttendanceRep;
import com.example.attendance.dao.SectionRef;
import com.example.attendance.dao.StudentRep;
import com.example.attendance.entites.Users;
import com.example.attendance.model.Auth;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController {

	@Autowired
	StudentRep studentRep;
	@Autowired
	SectionRef sectionRef;
	@Autowired
	AttendanceRep attendanceRep;
	
	Auth auth;
	
	public AdminController(HttpServletRequest req) {
		this.auth = new Auth(req);
	}
	
	@GetMapping("/admin")
//	@ResponseBody
	public String index(Model model) {
		if (auth.isLoggedin()) {
			return "redirect:/admin/dashboard";
		}else {
			return "redirect:/login";
		}
	}

	@GetMapping("/admin/dashboard")
	public String dashboard(Model model) {
		if (!auth.isLoggedin()) {
			return "redirect:/";
		}
		
		Users users = auth.getUser();
		
		System.out.println(users.getName());
		
		model.addAttribute("page", "dashboard");
		model.addAttribute("json", users);
		
//		model.addAttribute("students", studentRep.findAll());
		return "admin";
	}
	
	@GetMapping("/admin/students")
	public String Mystudents(Model model) {
		model.addAttribute("page", "my_students");
		model.addAttribute("students", studentRep.findByUid(auth.getUser().getUid()));
		return "admin";
	}
	
	@GetMapping("/admin/students/{id}")
	public String Viewstudent(Model model, @PathVariable("id") int StudentId) {
		model.addAttribute("page", "student_view");
		model.addAttribute("Student", studentRep.findBySid(StudentId));
		return "admin";
	}
	
	@GetMapping("/admin/check")
	public String CheckAttendance(Model model) {
		model.addAttribute("page", "check_attendance");
		return "admin";
	}
	
	@GetMapping("/admin/check/{id}")
	public String TablesAttendance(Model model, @PathVariable("id") String TableId) {
		model.addAttribute("page", "tables_attendance");
		model.addAttribute("TableId", TableId);
		return "admin";
	}
	
	@GetMapping("/admin/check/view")
	public String ViewAttendance(Model model, @RequestParam("roll") String roll, @RequestParam("sec") String sec) {
		model.addAttribute("page", "view_attendance");
		model.addAttribute("roll", roll);
		model.addAttribute("sec", sec);
		return "admin";
	}
	
	@GetMapping("/admin/classes")
	public String MyClasses(Model model) {
		model.addAttribute("page", "my_classes");
		model.addAttribute("classes", sectionRef.findByUid(auth.getUser().getUid()));
		return "admin";
	}
	
	@GetMapping("/admin/classes/adds")
	public String addClasses(Model model, @RequestParam("id") int id, @RequestParam("p") String p) {
		model.addAttribute("page", "add_classes_student");
		model.addAttribute("p", p);
		model.addAttribute("id", id);
		if (p.equals("add")) {			
			model.addAttribute("students", studentRep.findByUid(auth.getUser().getUid()));
		}else {
			model.addAttribute("students", attendanceRep.findBySeid(id));		
		}
		try {
			if (p.equals("add")) {				
				model.addAttribute("json", new ObjectMapper().writeValueAsString(studentRep.findByUid(auth.getUser().getUid())));
			}else {
				model.addAttribute("json", new ObjectMapper().writeValueAsString(attendanceRep.findBySeid(id)));				
			}
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
//			e.printStackTrace();
			System.out.println(e);
		}
		return "admin";
	}
	
	@GetMapping("/admin/classes/{id}")
	public String Attendance(Model model, @PathVariable("id") int TableId) {
		model.addAttribute("page", "attendance");
		model.addAttribute("TableId", TableId);
		return "admin";
	}
	
	@GetMapping("/admin/classes/add")
	public String Addclasses(Model model) {
		if (!auth.isLoggedin()) {
			return "redirect:/";
		}
		
		model.addAttribute("page", "add_classes");
		return "admin";
	}
	
	@GetMapping("/admin/add")
	public String Addstudents(Model model) {
		if (!auth.isLoggedin()) {
			return "redirect:/";
		}
		
		model.addAttribute("page", "add_students");
		return "admin";
	}
	
	
	@GetMapping("/logout")
    public String clearSession() {
        auth.logout();
        return "redirect:/";
    }
}
