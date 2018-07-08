package cn.nuist.controller.admin;

import java.io.InputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import cn.nuist.service.DataService;

/**
 * @author libo
 * @version 创建时间：2018年6月1日 下午3:10:42 类说明:数据管理
 */

@Controller
public class DataUploadController {
	@Autowired
	private DataService dataService;
	@RequestMapping(value = "/upload.do")
	public String impotr(HttpServletRequest request, Model model) throws Exception {
		// 获取上传的文件
		MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
		MultipartFile file = multipart.getFile("filename");
		InputStream in = file.getInputStream();
		// 数据导入
		dataService.importTemperatureData(in, file);
		in.close();
		return "dataUploadSuccess";
	}

}
