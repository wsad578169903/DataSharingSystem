package cn.nuist.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.octo.captcha.service.image.ImageCaptchaService;

import cn.nuist.common.encode.Md5Pwd;
import cn.nuist.common.session.SessionProvider;
import cn.nuist.common.web.Constants;
import cn.nuist.pojo.user.Admin;
import cn.nuist.pojo.user.Buyer;
import cn.nuist.service.admin.AdminService;

/**
 * @author libo
 * @version 创建时间：2018年6月8日 上午11:46:16 类说明
 */
@Controller
// 这里用了@SessionAttributes，可以直接把model中的admin(也就key)放入其中
// 这样保证了session中存在admin这个对象
@SessionAttributes("admin")
public class AdminLoginController {
	@Autowired
	private SessionProvider sessionProvider;
	@Autowired
	private Md5Pwd md5Pwd;
	@Autowired
	private AdminService adminService;
	@Autowired
	private ImageCaptchaService imageCaptchaService;

	/* 跳转登录页面 */
	/****
	 * 1:验证码是否为null 2:验证码 是否正确 3:用户是否为NUll 4:密码是否为NUll 5:用户是否正确 6密码是否正确 Md5
	 * 纯生Md5 放进Session 
	 * 
	 * @param buyer
	 * @param captcha
	 * @return
	 */

	@RequestMapping(value = "login.do")
	public String login(Admin admin, String captcha, ModelMap model, HttpServletRequest request) {
		// 验证码是否为null
		if (StringUtils.isNotBlank(captcha)) {
			// 第一个参数：JSESSIONID。第二个参数：验证码
			if (imageCaptchaService.validateResponseForID(sessionProvider.getSessionId(request), captcha)) {
				if (null != admin && StringUtils.isNotBlank(admin.getUsername())) {
					if (null != admin && StringUtils.isNotBlank(admin.getPwd())) {
						// userService.getBuyerByKey(buyer.getUsername());
						Admin a = adminService.checkLogin(admin.getUsername(), admin.getPwd());
						if (null != a && a.getPwd().equals(admin.getPwd())) {
							//将用户信息放入session中
							model.addAttribute("admin", a);
							sessionProvider.setAttribute(request, Constants.BUYER_SESSION, a);
							return "index";
						} else {
							model.addAttribute("error", "用户名或密码输入错误，请重新输入");
						}
					} else {
						model.addAttribute("error", "请输入密码");
					}
				} else {
					model.addAttribute("error", "请输入用户名");
				}
			} else {
				model.addAttribute("error", "验证码输入错误");
			}
		} else {
			model.addAttribute("error", "请填写验证码");
		}

		return "login";
	}

	// 注销方法
	@RequestMapping(value = "outLogin.do")
	public String outLogin(HttpSession session) {
		// 通过session.invalidate()方法来注销当前的session
		session.invalidate();
		return "login";
	}

}
