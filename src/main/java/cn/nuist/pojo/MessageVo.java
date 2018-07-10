package cn.nuist.pojo;
/**
* @author libo
* @version 创建时间：2018年7月10日 下午3:45:01
* 类说明
*/
public class MessageVo {
	
	private String id;
	private String username;
	private String xm;
	private Integer page = 1;
	private Integer start;
	private Integer size = 10;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
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
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	
	
	
	
}
