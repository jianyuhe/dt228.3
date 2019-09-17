package com.samples.jdbc;

import java.util.*;

public class JDBCExercise {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		MySqlCustomerDao cd = new MySqlCustomerDao();
		
		System.out.println("Customer ID with 347");
		Customer c = cd.findCustomerById(347);
		System.out.println(c);

		List<Customer> listC = cd.selectCustomersByName("Mini");
		
		System.out.println("\nList of customers that contains Mini: ");
		for(Customer cust : listC) {
			System.out.println(cust);
		}
		
		System.out.println("\nChanging 347's creditLimit ");
		
		cd.updateCustomer(347, 60000);
		
		System.out.println("Printing updated version of customer 347 ");
		Customer c347 = cd.findCustomerById(347);
		System.out.println(c347);
		
	}

}
