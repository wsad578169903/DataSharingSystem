package cn.nuist.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author libo
 * @version 创建时间：2018年5月30日 下午9:13:51 类说明:模块身体加载
 */

@Controller
public class FrameController {
	// 商品身体
	@RequestMapping(value = "/frame/product_main.do")
	public String productMain() {
		return "frame/product_main";// back_page后面改变
	}

	// 商品作身体
	@RequestMapping(value = "/frame/product_left.do")
	public String productLeft() {
		return "frame/product_left";// back_page后面改变
	}

	// 订单身体
	@RequestMapping(value = "/frame/order_main.do")
	public String ordertMain() {
		return "frame/order_main";// back_page后面改变
	}

	// 订单左身体
	@RequestMapping(value = "/frame/order_left.do")
	public String orderLeft() {
		return "frame/order_left";// back_page后面改变
	}
}
