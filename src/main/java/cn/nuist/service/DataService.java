package cn.nuist.service;

import java.io.InputStream;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;

import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import cn.nuist.pojo.BaseDict;
import cn.nuist.pojo.DownloadVo;
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
	public void importTemperatureData(InputStream in, MultipartFile file) throws Exception;
	//根据d站点名称下载
	public XSSFWorkbook exportExcelInfo(String dataStation) throws Exception;
	//根据数据年份下载
	public XSSFWorkbook exportExcelInfo2(String dataYear) throws Exception;
	//根据条件选择下载
	public XSSFWorkbook exportExcelInfo3(DownloadVo vo) throws Exception;
	//检查年份是否有数据
	public List<Temperature> checkDataYear(String dataYear);
	//检查月份是否有数据
	public List<Temperature> checkDataMonth(String dataMonth);
	//检查月城市是否有数据
	public List<Temperature> checkDataCity(String dataCity);
	//检查要素是否有数据
	public List<Temperature> checkDataElement(String dataElement);
	
	
	
}
