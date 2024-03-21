package com.example.attendance.entites;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "users")
public class Users {

	@Id
	private int uid;
	private String name;
	private String email;
	private String role;
	private String password;
	private int active;
	
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date LUP;
	@Column(insertable = false, updatable = false, columnDefinition = "TIMESTAMP DEFAULT CURRENT_TIMESTAMP")
	private Date CT;
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Users(int uid, String name, String email, String role, String password, int active, Date lUP, Date cT) {
		super();
		this.uid = uid;
		this.name = name;
		this.email = email;
		this.role = role;
		this.password = password;
		this.active = active;
		LUP = lUP;
		CT = cT;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
		return "Users [uid=" + uid + ", name=" + name + ", email=" + email + ", role=" + role + ", password=" + password
				+ ", active=" + active + ", LUP=" + LUP + ", CT=" + CT + "]";
	}
	
}
