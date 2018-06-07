package cn.nuist.controller.admin;

import java.math.BigInteger;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.itcast.utils.Page;
import cn.nuist.pojo.BaseDict;
import cn.nuist.pojo.QueryVo;
import cn.nuist.pojo.Temperature;
import cn.nuist.service.DataService;

/**
 * @author libo
 * @version 创建时间：2018年6月1日 下午3:10:42 类说明:数据管理
 */

@Controller
public class DataQueryController {
	// 数据查询
	@RequestMapping(value = "/data/dataQuery.do")
	public String dataManage() {
		return "data/dataQuery";
	}

	@Autowired
	private DataService dataService;

	@Value("${data.dict.city}")
	private String city;
	@Value("${data.dict.element}")
	private String element;
	@Value("${data.dict.year}")
	private String year;
	@Value("${data.dict.month}")
	private String month;

	@RequestMapping(value = "/dataQuery/list.do")
	public String list(QueryVo vo, Model model) throws Exception {
		// 数据台站
		List<BaseDict> cityList = dataService.findDictByCode(city);
		// 数据要素
		List<BaseDict> elementList = dataService.findDictByCode(element);
		// 数据来源
		List<BaseDict> yearList = dataService.findDictByCode(year);
		// 数据级别
		List<BaseDict> monthList = dataService.findDictByCode(month);

		if (vo.getDataStation() != null) {
			vo.setDataStation(new String(vo.getDataStation().getBytes("iso8859-1"), "utf-8"));
		}

		if (vo.getPage() == null) {
			vo.setPage(1);
		}

		// 设置查询的起始记录条数
		vo.setStart((vo.getPage() - 1) * vo.getSize());

		// 查询数据列表和数据总数
		List<Temperature> resultList = dataService.findTemperatureByVo(vo);
		Integer count = dataService.findTemperatureByVoCount(vo);

		Page<Temperature> page = new Page<Temperature>();
		page.setPage(vo.getPage()); // 数据总数
		page.setSize(vo.getSize()); // 每页显示条数
		page.setTotal(count); // 当前页数
		page.setRows(resultList);// 数据列表

		model.addAttribute("page", page);

		// 查询下拉列表数据
		model.addAttribute("cityType", cityList);
		model.addAttribute("elementType", elementList);
		model.addAttribute("yearType", yearList);
		model.addAttribute("monthType", monthList);

		// 查询选中数据回显
		model.addAttribute("dataStation", vo.getDataStation());
		model.addAttribute("dataElement", vo.getDataElement());
		model.addAttribute("dataCity", vo.getDataCity());
		model.addAttribute("dataYear", vo.getDataYear());
		model.addAttribute("dataMonth", vo.getDataMonth());
		return "data/dataQuery";
	}

	// 修改详情页
	@RequestMapping(value = "/dataQuery/detail.do")
	@ResponseBody
	public Temperature detail(BigInteger id) throws Exception {
		Temperature temperature = dataService.findTemperatureById(id);
		return temperature;
	}

	// 修改保存页面
	@RequestMapping(value = "/dataQuery/update.do")
	public String update(Temperature t) throws Exception {
		dataService.updateTemperatureById(t);
		return "data/dataQuery";
	}

	// 删除数据
	@RequestMapping(value = "/dataQuery/delete.do")
	public String delete(BigInteger id) throws Exception {
		dataService.deleteTemperatureById(id);
		return "data/dataQuery";
	}

	// 批量删除数据
	@RequestMapping(value = "/dataQuery/deletes.do")
	public String deletes(BigInteger[] ids) throws Exception {
		dataService.deleteTemperatureByIds(ids);
		return "data/dataQuery";
	}
}
