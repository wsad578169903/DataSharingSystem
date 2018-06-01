package cn.nuist.controller.admin;


import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.nuist.service.DataService;


/**
 * @author libo
 * @version 创建时间：2018年6月1日 下午3:10:42 类说明:数据管理
 */

@Controller
public class DataDownloadController {
	//数据下载
	@RequestMapping(value ="/data/dataDownload.do")
	public String dataDownload() {
		return "data/dataDownload";
	}
	
	@Autowired
	private DataService dataService;
	@RequestMapping("/download")   //导出
	public void export(HttpServletRequest request, HttpServletResponse response) throws Exception {  
	    String dataStation = request.getParameter("dataStation");  
	    if(dataStation!=""){  
	        response.reset(); //清除buffer缓存  
	        Map<String,Object> map = new HashMap<String,Object>();  
	        // 指定下载的文件名  
	        response.setHeader("Content-Disposition", "attachment;filename="+dataStation+".xlsx");  
	        response.setContentType("application/vnd.ms-excel;charset=UTF-8");  
	        response.setHeader("Pragma", "no-cache");  
	        response.setHeader("Cache-Control", "no-cache");  
	        response.setDateHeader("Expires", 0);  
	        XSSFWorkbook workbook=null;  
	        //导出Excel对象  
	        workbook = dataService.exportExcelInfo(dataStation);  
	        OutputStream output;  
	        try {  
	            output = response.getOutputStream();  
	            BufferedOutputStream bufferedOutPut = new BufferedOutputStream(output);  
	            bufferedOutPut.flush();  
	            workbook.write(bufferedOutPut);  
	            bufferedOutPut.close();  
	        } catch (IOException e) {  
	            e.printStackTrace();  
	        }  
	    } 
	    System.out.println("Success!");
	}   
	
}
