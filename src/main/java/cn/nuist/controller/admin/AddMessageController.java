package cn.nuist.controller.admin;

import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.itcast.utils.Page;
import cn.nuist.pojo.Message;
import cn.nuist.pojo.MessageVo;
import cn.nuist.service.DataService;

/**
 * @author libo
 * @version 创建时间：2018年7月9日 下午10:02:21 类说明
 */
@Controller
public class AddMessageController {
	@Autowired
	private DataService dataService;

	@RequestMapping(value = "addMessage.do")
	public String insert(Message msg) throws Exception {
		Date dt =new Date();
		DateFormat dFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); //HH表示24小时制；  
	    String formatDate = dFormat.format(dt); 
        msg.setCreateDateTime(formatDate);
		dataService.insertMessage(msg);
		return "message/message_manage";
	}

	@RequestMapping(value = "listMessage.do")
	public String list(MessageVo vo, Model model) throws Exception {

		if (vo.getPage() == null) {
			vo.setPage(1);
		}
		// 设置查询的起始记录条数
		vo.setStart((vo.getPage() - 1) * vo.getSize());
		// 查询留言列表和数据总数
		List<Message> resultList = dataService.findMessageAll(vo);
		Integer count = dataService.findMessageCount();
		Page<Message> Messagepage = new Page<Message>();
		Messagepage.setPage(vo.getPage()); // 数据总数
		Messagepage.setSize(vo.getSize()); // 每页显示条数
		Messagepage.setTotal(count); // 当前页数
		Messagepage.setRows(resultList);// 数据列表
		model.addAttribute("page", Messagepage);
		System.out.println(vo.getStart());
		return "message/message_manage";
	}

	// 删除留言
	@RequestMapping(value = "deleteMessage.do")
	public String delete(BigInteger id) throws Exception {
		dataService.deleteMessageById(id);
		return "message/message_manage";
	}

	// 批量删除留言
	@RequestMapping(value = "deleteMessages.do")
	public String deletes(BigInteger[] ids) throws Exception {
		dataService.deleteMessageByIds(ids);
		return "message/message_manage";
	}

}
