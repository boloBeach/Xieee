package net.xieee.web.bean;

import java.util.Date;

public class Catalog {
	private Integer id;
	private String name;
	private Integer parent_catalog_id;// this is catalog id
	private String url;
	private Date modify_time;
	private String is_delete;
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
	
	public Integer getParent_catalog_id() {
		return parent_catalog_id;
	}
	public void setParent_catalog_id(Integer parent_catalog_id) {
		this.parent_catalog_id = parent_catalog_id;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
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
	
}
