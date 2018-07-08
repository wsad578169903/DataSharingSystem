package cn.nuist.dao;

import cn.nuist.pojo.user.Admin;


public interface RegisterMapper {
	
	
	public void addAdmin(Admin admin);

	public String checkRegister(String usernmae);
}
