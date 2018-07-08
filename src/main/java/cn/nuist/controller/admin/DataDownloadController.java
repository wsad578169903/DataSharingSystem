package cn.nuist.controller.admin;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.nuist.pojo.DownloadVo;
import cn.nuist.service.DataService;

/**
 * @author libo
 * @version 创建时间：2018年6月1日 下午3:10:42 类说明:数据管理
 */

@Controller
public class DataDownloadController {

	@Autowired
	private DataService dataService;

	@RequestMapping("/downloadByDataStation") // 导出
	public void export(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dataStation = request.getParameter("dataStation");
		if (dataStation != "") {
			response.reset(); // 清除buffer缓存
			Map<String, Object> map = new HashMap<String, Object>();
			// 指定下载的文件名
			response.setHeader("Content-Disposition", "attachment;filename=" + dataStation + ".xlsx");
			response.setContentType("application/vnd.ms-excel;charset=UTF-8");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			XSSFWorkbook workbook = null;
			// 导出Excel对象
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

	@RequestMapping("/downloadByYear") // 导出
	public void export2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String dataYear = request.getParameter("dataYear");
		if (dataYear != "") {
			response.reset(); // 清除buffer缓存
			Map<String, Object> map = new HashMap<String, Object>();
			// 指定下载的文件名
			response.setHeader("Content-Disposition", "attachment;filename=" + dataYear + ".xlsx");
			response.setContentType("application/vnd.ms-excel;charset=UTF-8");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			XSSFWorkbook workbook = null;
			// 导出Excel对象
			workbook = dataService.exportExcelInfo2(dataYear);
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

	@RequestMapping("/downloadBySelect") // 导出
	public String export3(HttpServletRequest request, HttpServletResponse response, DownloadVo vo, ModelMap model)
			throws Exception {
		String dataYear = vo.getDataYear();
		String dataMonth = vo.getDataMonth();
		String dataCity = vo.getDataCity();
		String dataElement = vo.getDataElement();

		if (dataYear != null) {
			if (dataMonth != null) {
				if (dataCity != null) {
					if (dataElement != null) {
						if (dataService.checkDataYear(dataYear).size() != 0) {
							if (dataService.checkDataMonth(dataMonth).size() != 0) {
								if (dataService.checkDataCity(dataCity).size() != 0) {
									if (dataService.checkDataElement(dataElement).size() != 0) {
										response.reset(); // 清除buffer缓存
										Map<String, Object> map = new HashMap<String, Object>();
										// 指定下载的文件名
										response.setHeader("Content-Disposition",
												"attachment;filename=" + dataYear + ".xlsx");
										response.setContentType("application/vnd.ms-excel;charset=UTF-8");
										response.setHeader("Pragma", "no-cache");
										response.setHeader("Cache-Control", "no-cache");
										response.setDateHeader("Expires", 0);
										XSSFWorkbook workbook = null;
										// 导出Excel对象
										workbook = dataService.exportExcelInfo3(vo);
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

									} else {
										response.setContentType("text/html; charset=UTF-8"); // 转码
										PrintWriter out = response.getWriter();
										out.flush();
										out.println("<script>");
										out.println("alert('抱歉，暂无此要素数据！可下载2017年7月份佛山市温度数据');");
										out.println("history.back();");
										out.println("</script>");
										return "data/dataDownload";
									}
								} else {
									response.setContentType("text/html; charset=UTF-8"); // 转码
									PrintWriter out = response.getWriter();
									out.flush();
									out.println("<script>");
									out.println("alert('抱歉，暂无此城市数据！可下载2017年7月份佛山市温度数据');");
									out.println("history.back();");
									out.println("</script>");
									return "data/dataDownload";
								}
							} else {
								response.setContentType("text/html; charset=UTF-8"); // 转码
								PrintWriter out = response.getWriter();
								out.flush();
								out.println("<script>");
								out.println("alert('抱歉，暂无此月份数据！可下载2017年7月份佛山市温度数据');");
								out.println("history.back();");
								out.println("</script>");
								return "data/dataDownload";
							}
						} else {
							response.setContentType("text/html; charset=UTF-8"); // 转码
							PrintWriter out = response.getWriter();
							out.flush();
							out.println("<script>");
							out.println("alert('抱歉，暂无此年份数据！可下载2017年7月份佛山市温度数据');");
							out.println("history.back();");
							out.println("</script>");
							return "data/dataDownload";
						}

					} else {
						response.setContentType("text/html; charset=UTF-8"); // 转码
						PrintWriter out = response.getWriter();
						out.flush();
						out.println("<script>");
						out.println("alert('请选择要素！');");
						out.println("history.back();");
						out.println("</script>");
						return "data/dataDownload";

					}
				} else {
					response.setContentType("text/html; charset=UTF-8"); // 转码
					PrintWriter out = response.getWriter();
					out.flush();
					out.println("<script>");
					out.println("alert('请选择城市！');");
					out.println("history.back();");
					out.println("</script>");
					return "data/dataDownload";

				}

			} else {
				response.setContentType("text/html; charset=UTF-8"); // 转码
				PrintWriter out = response.getWriter();
				out.flush();
				out.println("<script>");
				out.println("alert('请选择月份！');");
				out.println("history.back();");
				out.println("</script>");
				return "data/dataDownload";
			}
		} else {
			response.setContentType("text/html; charset=UTF-8"); // 转码
			PrintWriter out = response.getWriter();
			out.flush();
			out.println("<script>");
			out.println("alert('请选择年份！');");
			out.println("history.back();");
			out.println("</script>");
			return "data/dataDownload";

		}
		return  null;

		
	}

}
