package com.example.attendance.model;

public class CalculateAttendancePercentage {
	
	public String calculate(Long totalClassesAttended, Long totalClassesConducted) {
        if (totalClassesConducted == 0) {
            return "0"; // Handle division by zero
        }
        String p = Double.toString(((double)totalClassesAttended / totalClassesConducted) * 100);
        if (p.length()<5)
        	return p;
        else return (String) p.subSequence(0,5);
    }
}
