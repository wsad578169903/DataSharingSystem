package cn.nuist.dao;

import java.util.List;

import cn.nuist.pojo.Customer;
import cn.nuist.pojo.QueryVo;

public interface CustomerMapper {

	public List<Customer> findCustomerByVo(QueryVo vo);
	public Integer findCustomerByVoCount(QueryVo vo);
	
	public Customer findCustomerById(Long id);
	
	public void updateCustomerById(Customer customer);
	
	public void delCustomerById(Long id);
}
