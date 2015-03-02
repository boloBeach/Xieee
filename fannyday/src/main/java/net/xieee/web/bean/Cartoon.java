package net.xieee.web.bean;

import java.util.Date;

/**
 * cartoon java bean <class description>
 * 
 * @author: royzhang
 * @version: 1.0, 2015年2月27日
 */
public class Cartoon {
	private Integer	id;
	private String	cartoon_name;
	private String	cartoon_title;
	private String	cartoon_user_name;
	private String	cartoon_detail;
	private String	cartoon_image_name;
	private String	cartoon_inter_url;
	private int		image_height;
	private int		image_width;
	private String	cartoon_local_url;
	private String	cartoon_parent_url;
	private Integer	old_cartoon;
	private Integer	down_count;
	private Integer	up_count;
	private String	is_delete;
	private Date	modify_time;



	public Integer getOld_cartoon() {
		return old_cartoon;
	}



	public void setOld_cartoon(Integer pOld_cartoon) {
		old_cartoon = pOld_cartoon;
	}



	public Integer getDown_count() {
		return down_count;
	}



	public void setDown_count(Integer pDown_count) {
		down_count = pDown_count;
	}



	public Integer getUp_count() {
		return up_count;
	}



	public void setUp_count(Integer pUp_count) {
		up_count = pUp_count;
	}



	public Integer getId() {
		return id;
	}



	public void setId(Integer pId) {
		id = pId;
	}



	public String getCartoon_name() {
		return cartoon_name;
	}



	public void setCartoon_name(String pCartoon_name) {
		cartoon_name = pCartoon_name;
	}



	public String getCartoon_title() {
		return cartoon_title;
	}



	public void setCartoon_title(String pCartoon_title) {
		cartoon_title = pCartoon_title;
	}



	public String getCartoon_user_name() {
		return cartoon_user_name;
	}



	public void setCartoon_user_name(String pCartoon_user_name) {
		cartoon_user_name = pCartoon_user_name;
	}



	public String getCartoon_detail() {
		return cartoon_detail;
	}



	public void setCartoon_detail(String pCartoon_detail) {
		cartoon_detail = pCartoon_detail;
	}



	public String getCartoon_image_name() {
		return cartoon_image_name;
	}



	public void setCartoon_image_name(String pCartoon_image_name) {
		cartoon_image_name = pCartoon_image_name;
	}



	public String getCartoon_inter_url() {
		return cartoon_inter_url;
	}



	public void setCartoon_inter_url(String pCartoon_inter_url) {
		cartoon_inter_url = pCartoon_inter_url;
	}



	public int getImage_height() {
		return image_height;
	}



	public void setImage_height(int pImage_height) {
		image_height = pImage_height;
	}



	public int getImage_width() {
		return image_width;
	}



	public void setImage_width(int pImage_width) {
		image_width = pImage_width;
	}



	public String getCartoon_local_url() {
		return cartoon_local_url;
	}



	public void setCartoon_local_url(String pCartoon_local_url) {
		cartoon_local_url = pCartoon_local_url;
	}



	public String getCartoon_parent_url() {
		return cartoon_parent_url;
	}



	public void setCartoon_parent_url(String pCartoon_parent_url) {
		cartoon_parent_url = pCartoon_parent_url;
	}



	public String getIs_delete() {
		return is_delete;
	}



	public void setIs_delete(String pIs_delete) {
		is_delete = pIs_delete;
	}



	public Date getModify_time() {
		return modify_time;
	}



	public void setModify_time(Date pModify_time) {
		modify_time = pModify_time;
	}



	@Override
	public String toString() {
		return "Cartoon [id=" + id + ", cartoon_name=" + cartoon_name + ", cartoon_title=" + cartoon_title
				+ ", cartoon_user_name=" + cartoon_user_name + ", cartoon_detail=" + cartoon_detail
				+ ", cartoon_image_name=" + cartoon_image_name + ", cartoon_inter_url=" + cartoon_inter_url
				+ ", image_height=" + image_height + ", image_width=" + image_width + ", cartoon_local_url="
				+ cartoon_local_url + ", cartoon_parent_url=" + cartoon_parent_url + ", is_delete=" + is_delete
				+ ", modify_time=" + modify_time + "]";
	}

}
