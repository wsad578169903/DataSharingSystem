package cn.nuist.controller.admin;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.nuist.pojo.user.Admin;
import cn.nuist.service.admin.AdminService;
import freemarker.core.ReturnInstruction.Return;


@Controller
public class AdminRegisterController {
	@Autowired
	private AdminService adminService;
	
@RequestMapping(value="/adminRegister",method=RequestMethod.POST)
public String addAdmin(Model model,Admin admin) {

	    if(StringUtils.isNotBlank(admin.getUsername())) {
	    	if(StringUtils.isNotBlank(admin.getPwd())) {
	    		if(adminService.checkRegister(admin.getUsername())==null) {
	    			adminService.addAdmin(admin);
	    			model.addAttribute("msg","注册成功！");
	    		    return "RegisterSuccess";
	    		}else {
	    			model.addAttribute("error","该用户名已存在");
	    			return "register";
	    		}
	    	}else {
	    		model.addAttribute("error","密码不能为空");
	    		 return "register";
	    	}
	    }else {
	    	model.addAttribute("error","用户名不能为空");
	    	 return "register";
	    }
		
	}

}
