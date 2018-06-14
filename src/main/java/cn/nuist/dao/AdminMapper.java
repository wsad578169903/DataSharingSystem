package cn.nuist.dao;

import cn.nuist.pojo.user.Admin;

/**
* @author libo
* @version 创建时间：2018年6月13日 下午8:33:07
* 类说明
*/
public interface AdminMapper {
	
	 public Admin findByUsername(String username);
}
