package net.xieee.web.bean;

import java.util.Arrays;

public class PictureBean {
	private String parentOneId;
	private String parentTwoId;
	private String[] pictureIds;
	private String types;
	public String getParentOneId() {
		return parentOneId;
	}
	public void setParentOneId(String parentOneId) {
		this.parentOneId = parentOneId;
	}
	public String getParentTwoId() {
		return parentTwoId;
	}
	public void setParentTwoId(String parentTwoId) {
		this.parentTwoId = parentTwoId;
	}
	public String[] getPictureIds() {
		return pictureIds;
	}
	public void setPictureIds(String[] pictureIds) {
		this.pictureIds = pictureIds;
	}
	public String getTypes() {
		return types;
	}
	public void setTypes(String types) {
		this.types = types;
	}
	@Override
	public String toString() {
		return "PictureBean [parentOneId=" + parentOneId + ", parentTwoId="
				+ parentTwoId + ", pictureIds=" + Arrays.toString(pictureIds)
				+ ", types=" + types + "]";
	}
	
	
}
