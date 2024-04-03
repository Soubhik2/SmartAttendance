package com.example.attendance.entites;

public class Alog {
	private int day;
	private String attendance;
	
	public Alog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Alog(int day, String attendance) {
		super();
		this.day = day;
		this.attendance = attendance;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getAttendance() {
		return attendance;
	}

	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}
	
	
}
