package cn.nuist.dao;

import java.util.List;

import cn.nuist.pojo.BaseDict;

public interface DictMapper {

	
	public List<BaseDict> findDictByCode(String code);
}
