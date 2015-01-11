package net.xieee.web.bean;

import java.util.Date;

public class Users {
	private Integer id;
	private String name;
	private String email;
	private String password;
	private Date regist_date;
	private String login_count;
	private String last_login_date;
	private Date modify_time;
	private String is_delete;
	
	public Date getRegist_date() {
		return regist_date;
	}
	public void setRegist_date(Date regist_date) {
		this.regist_date = regist_date;
	}
	public Date getModify_time() {
		return modify_time;
	}
	public void setModify_time(Date modify_time) {
		this.modify_time = modify_time;
	}
	public String getIs_delete() {
		return is_delete;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getLogin_count() {
		return login_count;
	}
	public void setLogin_count(String login_count) {
		this.login_count = login_count;
	}
	public String getLast_login_date() {
		return last_login_date;
	}
	public void setLast_login_date(String last_login_date) {
		this.last_login_date = last_login_date;
	}
	
	public void setIs_delete(String is_delete) {
		this.is_delete = is_delete;
	}
	
}
