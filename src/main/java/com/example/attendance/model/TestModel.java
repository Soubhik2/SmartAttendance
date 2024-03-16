package com.example.attendance.model;

import java.util.HashMap;
import java.util.Map;

public class TestModel {
	public Map<String, String> Test() {
		
		Map<String, String> user = new HashMap<String, String>();
		
		user.put("username", "ram@123");
		user.put("password", "amr11190$");
		user.put("phone", "+91010101010");
		
		return user;
	}
}
