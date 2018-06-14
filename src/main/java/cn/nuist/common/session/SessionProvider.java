package cn.nuist.common.session;

import java.io.Serializable;

import javax.servlet.http.HttpServletRequest;

/**
 * @author libo
 * @version 创建时间：2018年6月7日 下午11:18:34 类说明:session供应类
 */
public interface SessionProvider {

	// 往Session设置值
	// name Constants buyer_session
	// value 用户对象
	public void setAttribute(HttpServletRequest request, String name, Serializable value);

	// 从Session中取值
	public Serializable getAttribute(HttpServletRequest request, String name);

	// 退出登陆
	public void logout(HttpServletRequest request);

	// 获取SessionID
	public String getSessionId(HttpServletRequest request);

}
