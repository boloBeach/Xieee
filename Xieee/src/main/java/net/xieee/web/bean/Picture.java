package net.xieee.web.bean;

import java.util.Date;

public class Picture {
	private Integer id;
	private String picture_name;
	private String local_url;
	private String inter_url;
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
	private Integer parent_picture;
	private Integer top_count;
	private Integer down_count;
	private Integer old_count;
	private String key_word;
	private String inter_url_title;
	
	public String getInter_url_title() {
		return inter_url_title;
	}
	public void setInter_url_title(String inter_url_title) {
		this.inter_url_title = inter_url_title;
	}
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
	
	public String getLocal_url() {
		return local_url;
	}
	public void setLocal_url(String local_url) {
		this.local_url = local_url;
	}
	public String getInter_url() {
		return inter_url;
	}
	public void setInter_url(String inter_url) {
		this.inter_url = inter_url;
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
	
	
	public Integer getParent_picture() {
		return parent_picture;
	}
	public void setParent_picture(Integer parent_picture) {
		this.parent_picture = parent_picture;
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
	@Override
	public String toString() {
		return "Picture [id=" + id + ", picture_name=" + picture_name
				+ ", local_url=" + local_url + ", inter_url=" + inter_url
				+ ", title=" + title + ", type=" + type + ", modify_time="
				+ modify_time + ", spark_url=" + spark_url + ", detail="
				+ detail + ", width=" + width + ", height=" + height
				+ ", is_delete=" + is_delete + ", common_id=" + common_id
				+ ", author=" + author + ", parent_picture=" + parent_picture
				+ ", top_count=" + top_count + ", down_count=" + down_count
				+ ", old_count=" + old_count + ", key_word=" + key_word + "]";
	}
	
	
}
