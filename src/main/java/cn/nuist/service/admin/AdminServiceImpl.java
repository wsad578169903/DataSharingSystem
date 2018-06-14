package cn.nuist.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.nuist.dao.AdminMapper;
import cn.nuist.pojo.user.Admin;

/**
* @author libo
* @version 创建时间：2018年6月12日 上午11:37:08
* 类说明
*/
@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Override
	public Admin checkLogin(String username, String password) {
		Admin admin = adminMapper.findByUsername(username);
		if(admin != null && admin.getPwd().equals(password)){
			return admin;
		}
		
		return null;
	}


}
