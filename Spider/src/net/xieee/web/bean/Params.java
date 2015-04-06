package net.xieee.web.bean;

public class Params {
	private Integer id;
	private String param;
	private String paramValue;
	private String descript;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
	public String getParamValue() {
		return paramValue;
	}
	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	@Override
	public String toString() {
		return "Params [id=" + id + ", param=" + param + ", paramValue="
				+ paramValue + ", descript=" + descript + "]";
	}
	
	
	
}
