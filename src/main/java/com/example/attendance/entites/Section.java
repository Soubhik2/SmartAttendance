package com.example.attendance.entites;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "section")
public class Section {
	@Id
	private int seid;
	private int uid;
	private String s_name;
	private String info;
	private int active;
	
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date LUP;
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date CT;
	
	public Section() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Section(int seid, int uid, String s_name, String info, int active, Date lUP, Date cT) {
		super();
		this.seid = seid;
		this.uid = uid;
		this.s_name = s_name;
		this.info = info;
		this.active = active;
		LUP = lUP;
		CT = cT;
	}
	
	public int getSeid() {
		return seid;
	}
	public void setSeid(int seid) {
		this.seid = seid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
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
		return "Section [seid=" + seid + ", uid=" + uid + ", s_name=" + s_name + ", info=" + info + ", active=" + active
				+ ", LUP=" + LUP + ", CT=" + CT + "]";
	}
	
	
}
