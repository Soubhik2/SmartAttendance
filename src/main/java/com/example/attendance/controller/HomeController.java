package com.example.attendance.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.attendance.dao.StudentRep;
import com.example.attendance.dao.UsersRep;
import com.example.attendance.entites.Users;
import com.example.attendance.model.PasswordHashing;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	UsersRep usersRep;

	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("page", "home");
//		model.addAttribute("users", usersRep.findAll());
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
	
	@PostMapping("/login")
	public String login(Model model, @ModelAttribute Users users, HttpServletRequest request) {
		Users email = usersRep.findByEmail(users.getEmail());
		Map<String, String> alert = new HashMap<String, String>();
		HttpSession session = request.getSession();
		
//		System.out.println(email);
		if (email!=null) {	
			if (new PasswordHashing().verifyPassword(users.getPassword(), email.getPassword())) {
				alert.put("isOn", "true");
				alert.put("type", "success");
				alert.put("title", "Success !!!");
				alert.put("message", "Done");
				try {
					session.setAttribute("isLoggedin", true);
					session.setAttribute("user", new ObjectMapper().writeValueAsString(email));
				} catch (JsonProcessingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				alert.put("isOn", "true");
				alert.put("type", "warning");
				alert.put("title", "Warning !!!");
				alert.put("message", "The password id is not found");
			}
		}else {
			alert.put("isOn", "true");
			alert.put("type", "warning");
			alert.put("title", "Warning !!!");
			alert.put("message", "The email is not found");
		}
		model.addAttribute("alert", alert);
		return "pages/login";
	}
	
	@GetMapping("/signup")
	public String signup(Model model) {
		return "pages/signup";
	}
	
	@PostMapping("/signup")
	public String signup(Model model, @ModelAttribute Users users) {
		users.setActive(1);
		users.setPassword(new PasswordHashing().hashPassword(users.getPassword()));
		Map<String, String> alert = new HashMap<String, String>();
		
		try {
			usersRep.save(users);
			alert.put("isOn", "true");
			alert.put("type", "success");
			alert.put("title", "Success !!!");
			alert.put("message", "Sign up successfully");
		} catch (Exception e) {
			alert.put("isOn", "true");
			alert.put("type", "warning");
			alert.put("title", "Warning !!!");
			alert.put("message", "This email id is already used");
		}
		model.addAttribute("alert", alert);
		return "pages/signup";
	}
	
	@GetMapping("/checking")
	public String check(Model model) {
		model.addAttribute("page", "check");
		return "base";
	}
}

// soubhik1234
