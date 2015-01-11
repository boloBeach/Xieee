package net.xieee.web.bean;

import java.util.Date;

public class ParentPicture {
	private Integer id;
	private String name;
	private Integer skim_count;
	private Date modify_time;
	private String is_delete;
	private Integer catalog_id;
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
	public Integer getSkim_count() {
		return skim_count;
	}
	public void setSkim_count(Integer skim_count) {
		this.skim_count = skim_count;
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
	public void setIs_delete(String is_delete) {
		this.is_delete = is_delete;
	}
	public Integer getCatalog_id() {
		return catalog_id;
	}
	public void setCatalog_id(Integer catalog_id) {
		this.catalog_id = catalog_id;
	}
	
}
