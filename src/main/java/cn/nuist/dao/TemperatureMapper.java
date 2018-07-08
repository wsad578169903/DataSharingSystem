package cn.nuist.dao;

import java.math.BigInteger;
import java.util.List;

import cn.nuist.pojo.DownloadVo;
import cn.nuist.pojo.QueryVo;
import cn.nuist.pojo.Temperature;

public interface TemperatureMapper {
		//分类查询
		public List<Temperature> findTemperatureByVo(QueryVo vo); 
		//分页用，输入是vo,输出是int
		public Integer findTemperatureByVoCount(QueryVo vo);
		/*修改详情页*/
		public Temperature findTemperatureById(BigInteger id);
		/*修改保存*/
		public void updateTemperatureById(Temperature temperature);
		/*按数据站点下载*/
		public List<Temperature> downloadTemperatureBydataStation(String dataStation);
		/*按数据年份下载*/
		public List<Temperature> downloadTemperatureBydataYear(String dataYear);
		/*按条件选择下载*/
		public List<Temperature> downloadTemperatureBySelect(DownloadVo vo);
		/*按检查年份数据是否为空*/
		public List<Temperature> checkDataYear(String dataYear);
		/*按检查月份数据是否为空*/
		public List<Temperature> checkDataMonth(String dataMonth);
		/*按检查城市数据是否为空*/
		public List<Temperature> checkDataCity(String dataCity);
		/*按检查要素数据是否为空*/
		public List<Temperature> checkDataElement(String dataElement);
		/*数据删除*/
		public void deleteTemperatureById(BigInteger id);
		/*批量删除数据*/
		public void deleteTemperatureByIds(BigInteger[] ids);
		/*导入数据*/
		public void insertTemperatureData(List<Temperature> temlist);
		
		
		
		
}
