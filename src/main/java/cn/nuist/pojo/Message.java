package cn.nuist.pojo;

import java.util.Date;

/**
* @author libo
* @version 创建时间：2018年7月9日 下午9:28:59
* 类说明
*/
public class Message {
	
	
	private Integer id;
	private String username;
	private String xm;
	private String content;
	private String createDateTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreateDateTime() {
		return createDateTime;
	}
	public void setCreateDateTime(String formatDate) {
		this.createDateTime = formatDate;
	}
	
}
