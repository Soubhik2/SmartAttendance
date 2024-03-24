package com.example.attendance.entites;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "attendance")
public class Attendance {
	@Id
	private int aid;
	private int seid;
	private int sid;
	private String student;
	private String roll_no;
	private String info;
	private int active;
	
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date LUP;
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date CT;
	
	public Attendance() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Attendance(int aid, int seid, int sid, String student, String roll_no, String info, int active, Date lUP,
			Date cT) {
		super();
		this.aid = aid;
		this.seid = seid;
		this.sid = sid;
		this.student = student;
		this.roll_no = roll_no;
		this.info = info;
		this.active = active;
		LUP = lUP;
		CT = cT;
	}
	
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
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
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public Date getLUP() {
		return LUP;
	}
	public void setLUP(Date lUP) {
		LUP = lUP;
	}
	public Date getCT() {
		return CT;
	}
	public void setCT(Date cT) {
		CT = cT;
	}
	
	@Override
	public String toString() {
		return "Attendance [aid=" + aid + ", seid=" + seid + ", sid=" + sid + ", student=" + student + ", roll_no="
				+ roll_no + ", info=" + info + ", active=" + active + ", LUP=" + LUP + ", CT=" + CT + "]";
	}
	
	
}
