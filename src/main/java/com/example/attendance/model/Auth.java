package com.example.attendance.model;

import com.example.attendance.entites.Users;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public class Auth {
	
	HttpServletRequest req;
	
	public Auth(HttpServletRequest req) {
		super();
		this.req = req;
	}

	public Users getUser() {
		HttpSession session = this.req.getSession();
		String user = (String) session.getAttribute("user");
		try {
			return new ObjectMapper().readValue(user, Users.class);
//			return users;
		} catch (JsonMappingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new Users();
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return new Users();
		}
		
	}
	
	public boolean isLoggedin() {
		HttpSession session = this.req.getSession();
		if (session.getAttribute("isLoggedin") != null && session.getAttribute("user") != null) {
			boolean isLoggedin = (boolean) session.getAttribute("isLoggedin");
			if (isLoggedin) {				
				return true;
			}else {				
				return false;
			}
		}else {			
			return false;
		}
	}
	
	public void logout() {
		HttpSession session = req.getSession();
        // Invalidate the session
        session.invalidate();
	}
}
