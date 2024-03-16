package com.example.attendance.restcontroller;

import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.attendance.model.TestModel;

@RestController
public class ApiController {
	
	@GetMapping("/api/get")
	public Map<String, String> getdata() {
		TestModel testModel = new TestModel();
		return testModel.Test();
	}
	
}
