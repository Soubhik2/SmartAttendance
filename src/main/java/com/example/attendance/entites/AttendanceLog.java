package com.example.attendance.entites;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "attendance_log")
public class AttendanceLog {
	@Id
	private int lid;
	private int seid;
	private int sid;
	private String student;
	private String roll_no;
	private String attendance;
	private int active;
	
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date AUP;
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date ATT;
	
	public AttendanceLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AttendanceLog(int lid, int seid, int sid, String student, String roll_no, String attendance, int active,
			Date aUP, Date aTT) {
		super();
		this.lid = lid;
		this.seid = seid;
		this.sid = sid;
		this.student = student;
		this.roll_no = roll_no;
		this.attendance = attendance;
		this.active = active;
		AUP = aUP;
		ATT = aTT;
	}

	public int getLid() {
		return lid;
	}

	public void setLid(int lid) {
		this.lid = lid;
	}

	public int getSeid() {
		return seid;
	}

	public void setSeid(int seid) {
		this.seid = seid;
	}

	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public String getStudent() {
		return student;
	}

	public void setStudent(String student) {
		this.student = student;
	}

	public String getRoll_no() {
		return roll_no;
	}

	public void setRoll_no(String roll_no) {
		this.roll_no = roll_no;
	}

	public String getAttendance() {
		return attendance;
	}

	public void setAttendance(String attendance) {
		this.attendance = attendance;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public Date getAUP() {
		return AUP;
	}

	public void setAUP(Date aUP) {
		AUP = aUP;
	}

	public Date getATT() {
		return ATT;
	}

	public void setATT(Date aTT) {
		ATT = aTT;
	}

	@Override
	public String toString() {
		return "AttendanceLog [lid=" + lid + ", seid=" + seid + ", sid=" + sid + ", student=" + student + ", roll_no="
				+ roll_no + ", attendance=" + attendance + ", active=" + active + ", AUP=" + AUP + ", ATT=" + ATT + "]";
	}
	
	
	
}
