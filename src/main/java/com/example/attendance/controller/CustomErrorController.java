package com.example.attendance.controller;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class CustomErrorController implements ErrorController{
	@RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
		
		// Get the error message
        Object errorMessage = request.getAttribute(RequestDispatcher.ERROR_MESSAGE);
        if (errorMessage != null) {
            model.addAttribute("errorMessage", errorMessage.toString());
            System.out.println(errorMessage.toString());
        } else {
            model.addAttribute("errorMessage", "Unknown error occurred");
        }
        
		 // Redirect to custom error pages based on the error status
        int statusCode = HttpStatus.INTERNAL_SERVER_ERROR.value(); // Default to 500
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            statusCode = Integer.parseInt(status.toString());
        }
        if (statusCode == HttpStatus.NOT_FOUND.value()) {
            return "error/404"; // Handle 404 error (page not found)
        } else {
            return "error/500"; // Handle 500 error (internal server error)
        }
    }

    public String getErrorPath() {
        return "/error";
    }
}
