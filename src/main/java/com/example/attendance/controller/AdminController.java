package com.example.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.attendance.dao.StudentRep;

@Controller
public class AdminController {

	@Autowired
	StudentRep studentRep;
	
	@GetMapping("/admin")
//	@ResponseBody
	public String index(Model model) {
		return "redirect:/admin/dashboard";
	}

	@GetMapping("/admin/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("page", "dashboard");
//		model.addAttribute("students", studentRep.findAll());
		return "admin";
	}
	
	@GetMapping("/admin/students")
	public String Mystudents(Model model) {
		model.addAttribute("page", "my_students");
		return "admin";
	}
	
	@GetMapping("/admin/students/{id}")
	public String Viewstudent(Model model, @PathVariable("id") String StudentId) {
		model.addAttribute("page", "student_view");
		model.addAttribute("StudentId", StudentId);
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
		return "admin";
	}
	
	@GetMapping("/admin/classes/{id}")
	public String Attendance(Model model, @PathVariable("id") String TableId) {
		model.addAttribute("page", "attendance");
		model.addAttribute("TableId", TableId);
		return "admin";
	}
	
	@GetMapping("/admin/add")
	public String Addstudents(Model model) {
		model.addAttribute("page", "add_students");
		return "admin";
	}
}
