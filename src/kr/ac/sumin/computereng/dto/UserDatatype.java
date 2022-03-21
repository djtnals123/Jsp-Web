package kr.ac.sumin.computereng.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UserDatatype {
	private String id;
	private String pass;
	private String email;
	private String name;
	private String hospital;
	private String[] roles;
	private Date date;
	
	public UserDatatype(String id, String pass, String email, String name, String hospital, String[] roles, Date date) {
		this.id=id;
		this.pass=pass;
		this.email=email;
		this.name=name;
		this.hospital=hospital;
		this.roles=roles;
		this.date=date;
	}
	
	public String getFormatDate() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		return simpleDateFormat.format(this.date);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getHospital() {
		return hospital;
	}
	public void setHospital(String hospital) {
		this.hospital = hospital;
	}
	public String[] getRoles() {
		return roles;
	}
	public void setRoles(String[] roles) {
		this.roles = roles;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public boolean hasRole(String role) {
		for(String r:this.roles) {
			if(role.equals(r))
				return true;
		}
		return false;
	}
}
