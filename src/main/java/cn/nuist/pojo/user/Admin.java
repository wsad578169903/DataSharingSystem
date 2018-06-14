package cn.nuist.pojo.user;

import java.io.Serializable;
import java.math.BigInteger;

/**
 * @author libo
 * @version 创建时间：2018年6月13日 下午6:08:34 类说明
 */
public class Admin implements Serializable {

	private BigInteger id;

	private String username;

	private String pwd;

	private String xm;

	/**
	 * 序列化ID
	 */
	private static final long serialVersionUID = 1L;

	public BigInteger getId() {
		return id;
	}

	public void setId(BigInteger id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getXm() {
		return xm;
	}

	public void setXm(String xm) {
		this.xm = xm;
	}

	@Override
	public String toString() {
		return "Admin [username=" + username + ", password=" + pwd + "]";
	}

}
