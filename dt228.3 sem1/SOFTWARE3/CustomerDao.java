package com.samples.jdbc;

import java.util.List;

public interface CustomerDao{

	public List<Customer> selectCustomersByName(String name);
	public Customer findCustomerById(int customerNumber);
}
