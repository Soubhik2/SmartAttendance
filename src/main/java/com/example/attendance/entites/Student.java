package com.example.attendance.entites;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "students")
public class Student {
	@Id
	private int sid;
	private int uid;
	private String name;
	private String roll_no;
	private String info;
	private int active;
	
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date LUP;
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date CT;
	
	
	public Student() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Student(int sid, int uid, String name, String roll_no, String info, int active, Date lUP, Date cT) {
		super();
		this.sid = sid;
		this.uid = uid;
		this.name = name;
		this.roll_no = roll_no;
		this.info = info;
		this.active = active;
		LUP = lUP;
		CT = cT;
	}


	public int getSid() {
		return sid;
	}


	public void setSid(int sid) {
		this.sid = sid;
	}


	public int getUid() {
		return uid;
	}


	public void setUid(int uid) {
		this.uid = uid;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
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
		return "Student [sid=" + sid + ", uid=" + uid + ", name=" + name + ", roll_no=" + roll_no + ", info=" + info
				+ ", active=" + active + ", LUP=" + LUP + ", CT=" + CT + "]";
	}
	
	
}
