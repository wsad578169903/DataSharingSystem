package cn.nuist.common.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import cn.nuist.common.session.SessionProvider;
import cn.nuist.pojo.user.Admin;

/**
* @author libo
* @version 创建时间：2018年6月15日 下午8:55:01
* 类说明:拦截器实现类
*/
public class LoginInterceptor implements HandlerInterceptor {
	
	@Autowired
	private SessionProvider sessionProvider;
	//常量
	private static final String INTERCEPTOR_URL= "/back_page/";
	
	//页面渲染后
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}
	
	//方法后
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}
	
	//方法前
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		Admin admin = (Admin) sessionProvider.getAttribute(request, Constants.ADMIN_SESSION);
		/*是否拦截
		URL和URI区别
		URL:http://localhost:8080/back_page/index.jsp
		URI: /back_page/index.jsp*/
		String requestURI = request.getRequestURI();
		if(requestURI.indexOf("login") < 0){
			//必须登录
			if(null == admin ){
				response.sendRedirect("/login.do");
				return false;
			}
		}
		
		return true;
		
		
		/*// 获取请求的URL
		String url = request.getRequestURI(); 
		// URL:test.jsp是公开的;这个demo是除了test.jsp是可以公开访问的，其它的URL都进行拦截控制  
        // 注意：一些静态文件不能拦截，否则会死循环，知道内存耗尽  
		if (url.indexOf("test") >= 0) {  
            return true;  
        }  
		// 获取Session  
        HttpSession session = request.getSession();  
        String username = (String) session.getAttribute("username"); 
        if (admin != null) {  
            return true;  
        }  
       
        response.sendRedirect("/back_page/test");  
		return false;
		false:方法不走    true:方法走*/
		
	}

}
