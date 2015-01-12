package net.xieee.web.bean;

import java.util.Date;

public class Picture {
	private Integer id;
	private String picture_name;
	private String url;
	private String title;
	private String type;
	private Date modify_time;
	private String spark_url; 
	private String detail;
	private Integer width;
	private Integer height;
	private String is_delete;
	private Integer common_id;
	private String author;
	private Integer parent_catalog_id;
	private Integer top_count;
	private Integer down_count;
	private Integer old_count;
	private String key_word;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getPicture_name() {
		return picture_name;
	}
	public void setPicture_name(String picture_name) {
		this.picture_name = picture_name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Date getModify_time() {
		return modify_time;
	}
	public void setModify_time(Date modify_time) {
		this.modify_time = modify_time;
	}
	public String getSpark_url() {
		return spark_url;
	}
	public void setSpark_url(String spark_url) {
		this.spark_url = spark_url;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Integer getWidth() {
		return width;
	}
	public void setWidth(Integer width) {
		this.width = width;
	}
	public Integer getHeight() {
		return height;
	}
	public void setHeight(Integer height) {
		this.height = height;
	}
	public String getIs_delete() {
		return is_delete;
	}
	public void setIs_delete(String is_delete) {
		this.is_delete = is_delete;
	}
	public Integer getCommon_id() {
		return common_id;
	}
	public void setCommon_id(Integer common_id) {
		this.common_id = common_id;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Integer getParent_catalog_id() {
		return parent_catalog_id;
	}
	public void setParent_catalog_id(Integer parent_catalog_id) {
		this.parent_catalog_id = parent_catalog_id;
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
	public Integer getOld_count() {
		return old_count;
	}
	public void setOld_count(Integer old_count) {
		this.old_count = old_count;
	}
	public String getKey_word() {
		return key_word;
	}
	public void setKey_word(String key_word) {
		this.key_word = key_word;
	}
	
}
