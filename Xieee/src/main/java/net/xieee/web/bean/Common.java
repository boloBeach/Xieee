package net.xieee.web.bean;

import java.util.Date;

public class Common {
	private Integer id;
	private Integer resource_id;
	private String ip;
	private String address;
	private String content;
	private Integer top_count;
	private Integer down_count;
	private Date modify_time;
	private String is_delete;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getResource_id() {
		return resource_id;
	}
	public void setResource_id(Integer resource_id) {
		this.resource_id = resource_id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getTop_count() {
		return top_count;
	}
	public void setTop_count(Integer top_count) {
		this.top_count = top_count;
	}
	public Integer getDown_count() {
		return down_count;
	}
	public void setDown_count(Integer down_count) {
		this.down_count = down_count;
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
