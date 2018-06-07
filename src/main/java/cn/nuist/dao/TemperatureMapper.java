package cn.nuist.dao;

import java.math.BigInteger;
import java.util.List;

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
		/*数据下载*/
		public List<Temperature> downloadTemperatureBydataStation(String dataStation);
		/*数据删除*/
		public void deleteTemperatureById(BigInteger id);
		/*批量删除数据*/
		public void deleteTemperatureByIds(BigInteger[] ids);
		
}
