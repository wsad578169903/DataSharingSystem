package cn.nuist.service;

import java.io.InputStream;
import java.math.BigInteger;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import cn.nuist.pojo.BaseDict;
import cn.nuist.pojo.QueryVo;
import cn.nuist.pojo.Temperature;


public interface DataService {

	//下拉列表
	public List<BaseDict> findDictByCode(String code);
	
	//分类查询
	public List<Temperature> findTemperatureByVo (QueryVo vo);
	//分页用
	public Integer findTemperatureByVoCount (QueryVo vo);
	//修改详情页
	public Temperature findTemperatureById(BigInteger id);
	//修改保存页
	public void updateTemperatureById(Temperature t);
	//删除
	public void  deleteTemperatureById(BigInteger id);
	/*批量删除数据*/
	public void deleteTemperatureByIds(BigInteger[] ids);
	
	//导入
	public void importExcelInfo(InputStream in, MultipartFile file, String salaryDate) throws Exception;
	//根据d站点名称下载
	public XSSFWorkbook exportExcelInfo(String dataStation) throws Exception;

	
}
