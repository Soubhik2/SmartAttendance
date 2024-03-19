package com.example.attendance.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.attendance.dao.StudentRep;

@Controller
public class HomeController {
	
	@Autowired
	StudentRep studentRep;

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("page", "home");
		model.addAttribute("students", studentRep.findAll());
		return "base";
	}
	
	@GetMapping("/about")
	public String about(Model model) {
		model.addAttribute("page", "about");
		return "base";
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		return "pages/login";
	}
	
	@GetMapping("/signup")
	public String signup(Model model) {
		return "pages/signup";
	}
	
	@GetMapping("/checking")
	public String check(Model model) {
		model.addAttribute("page", "check");
		return "base";
	}
}
