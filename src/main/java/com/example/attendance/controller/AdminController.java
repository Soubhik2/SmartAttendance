package com.example.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.attendance.dao.StudentRep;

@Controller
public class AdminController {

	@Autowired
	StudentRep studentRep;

	@GetMapping("/admin/dashboard")
	public String index(Model model) {
		model.addAttribute("page", "dashboard");
		model.addAttribute("students", studentRep.findAll());
		return "admin";
	}
	
}
