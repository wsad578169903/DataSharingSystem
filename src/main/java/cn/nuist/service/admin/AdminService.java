package cn.nuist.service.admin;

import cn.nuist.pojo.user.Admin;

/**
 * @author libo
 * @version 创建时间：2018年6月12日 上午11:36:20 类说明
 */
public interface AdminService {

	// 检验用户登录
	public Admin checkLogin(String username, String password);

	// 注册
	public void addAdmin(Admin admin);

	// 判断用户名是否重复
	public String checkRegister(String username);
	
	
}
