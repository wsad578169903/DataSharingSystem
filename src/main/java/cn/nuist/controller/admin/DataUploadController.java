package cn.nuist.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author libo
 * @version 创建时间：2018年6月1日 下午3:10:42 类说明:数据管理
 */

@Controller
public class DataUploadController {
	// 数据上传
	@RequestMapping(value ="/data/dataUpload.do")
	public String dataDownload() {
		return "data/dataUpload";
	}

	
	
}
