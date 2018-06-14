package cn.nuist.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author libo
 * @version 创建时间：2018年5月30日 下午9:13:51 类说明:后台主界面加载
 */
@Controller

/* 跳转入口页面 */
public class DataBackController {
	@RequestMapping(value = "/index.do")
	public String index() {
		return "index";
	}

	/* 跳转头页面 */
	@RequestMapping(value = "/top.do")
	public String top() {
		return "top";
	}

	/* 跳转身体页面 */
	@RequestMapping(value = "/main.do")
	public String main() {
		return "main";
	}

	/* 跳转左页面 */
	@RequestMapping(value = "/left.do")
	public String left() {
		return "left";
	}

	/* 跳转右页面 */
	@RequestMapping(value = "/right.do")
	public String right() {
		return "right";
	}

	/* 跳转注册页面 */
	@RequestMapping(value = "/register.do")
	public String register() {
		return "register";
	}



	/* 跳转数据下载页面 */
	@RequestMapping(value = "/data/dataDownload.do")
	public String dataDownload() {
		return "data/dataDownload";
	}

	/* 跳转数据查询页面 */
	@RequestMapping(value = "/data/dataQuery.do")
	public String dataQuery() {
		return "data/dataQuery";
	}
	/* 测试页面跳转到login页面 */
	@RequestMapping(value = "/test.do")
	public String test() {
		return "login";
	}
	
}
