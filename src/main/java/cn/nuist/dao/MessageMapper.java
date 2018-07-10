package cn.nuist.dao;

import java.math.BigInteger;
import java.util.List;

import cn.nuist.pojo.Message;
import cn.nuist.pojo.MessageVo;

/**
* @author libo
* @version 创建时间：2018年7月9日 下午10:12:04
* 类说明
*/
public interface MessageMapper {
	//添加留言
	public void insertMessage(Message msg);
	
	//查询留言
	public List<Message> findMessageAll(MessageVo vo);
	
	//留言查询分页用
	public Integer findMessageCount();
	
	//删除留言
	public void deleteMessageById(BigInteger id);
	
	//批量删除留言
	public void deleteMessageByIds(BigInteger[] ids);
	
}
