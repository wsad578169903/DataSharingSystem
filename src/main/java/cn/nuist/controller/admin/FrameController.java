package cn.nuist.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
* @author libo
* @version 创建时间：2018年5月30日 下午9:13:51
* 类说明:模块身体加载
*/

@Controller
public class FrameController {
	//商品身体
	@RequestMapping(value = "/frame/product_main.do")
	public String productMain() {
		return "frame/product_main";
	}
	
}
