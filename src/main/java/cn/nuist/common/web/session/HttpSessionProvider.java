package cn.nuist.common.web.session;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
* @author libo
* @version 创建时间：2018年6月7日 下午11:19:47
* 类说明
*/
public class HttpSessionProvider implements SessionProvider{

	@Override
	public void setAttribute(HttpServletRequest request, String name, Serializable value) {
		
		HttpSession session = request.getSession();
		session.setAttribute(name, value);
		
	}

	@Override
	public Serializable getAttribute(HttpServletRequest request, String name) {
		
		HttpSession session = request.getSession(false);
		if(session !=null){
			return (Serializable) session.getAttribute(name);
		}
		return null;
	}

	@Override
	public void logout(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session !=null){
			session.invalidate();
		}
		//Cookie JSESSIONID
		
	}

	@Override
	public String getSessionId(HttpServletRequest request) {
		
		return request.getSession().getId();
	}

}
