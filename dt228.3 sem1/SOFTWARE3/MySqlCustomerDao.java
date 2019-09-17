package com.samples.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class MySqlCustomerDao implements CustomerDao {

	private Connection con = null;

	public List<Customer> selectCustomersByName(String name) {
		List<Customer> customers = new ArrayList<Customer>();
		
		try {
			con = this.getConnection();
			
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer WHERE UPPER(customerName) like UPPER('%" + name + "%') ORDER BY customerName");
			
			while (rs.next()) {
				int customerNumber = rs.getInt("CUSTOMERNUMBER");
				String customerName = rs.getString("CUSTOMERNAME");
				String contactLastName = rs.getString("CONTACTLASTNAME");
				String contactFirstName = rs.getString("CONTACTFIRSTNAME");
				String phone = rs.getString("PHONE");
				double creditLimit = rs.getDouble("CREDITLIMIT");
				
				Customer c = new Customer(customerNumber, customerName, contactLastName,
						contactFirstName, phone, creditLimit);
//				c.setCustomerNumber(Integer.parseInt(rs.getString(1)));
//				c.setCustomerName(rs.getString(2));
//				c.setContactLastName(rs.getString(3));
//				c.setContactFirstName(rs.getString(4));
//				c.setPhone(rs.getString(5));
//				c.setAddressLine1(rs.getString(6));
//				c.setAddressLine2(rs.getString(7));
//				c.setCity(rs.getString(8));
//				c.setState(rs.getString(9));
//				c.setPostalCode(rs.getString(10));
//				c.setSalesRepEmployeeNumber(Integer.parseInt(rs.getString(11)));
//				c.setCreditLimit(Double.parseDouble(rs.getString(12)));
				
				customers.add(c);
			}
			
			
			rs.close();
			stmt.close();
			con.close();
			
			return customers;
		} catch (SQLException se) {
			System.out.println( "SQL Exception:" ) ;
			
			// Loop through the SQL Exceptions
			while( se != null ){
				System.out.println( "State  : " + se.getSQLState()  ) ;
				System.out.println( "Message: " + se.getMessage()   ) ;
				System.out.println( "Error  : " + se.getErrorCode() ) ;

				se = se.getNextException() ;
			}
			
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Customer findCustomerById(int customerNo) {
		Customer customer = null;
		
		try {
			con = this.getConnection();
			
			Statement stmt = con.createStatement();
			
			ResultSet rs = stmt.executeQuery("SELECT * FROM customer WHERE customerNumber = '" + customerNo + "';");
			
			while (rs.next()) {
				int customerNumber = rs.getInt("CUSTOMERNUMBER");
				String customerName = rs.getString("CUSTOMERNAME");
				String contactLastName = rs.getString("CONTACTLASTNAME");
				String contactFirstName = rs.getString("CONTACTFIRSTNAME");
				String phone = rs.getString("PHONE");
				double creditLimit = rs.getDouble("CREDITLIMIT");
				
				customer = new Customer(customerNumber, customerName, contactLastName,
						contactFirstName, phone, creditLimit);
				
			}
			
			
			rs.close();
			stmt.close();
			con.close();
			
			return customer;
		} catch (SQLException se) {
			System.out.println( "SQL Exception:" ) ;
			
			// Loop through the SQL Exceptions
			while( se != null ){
				System.out.println( "State  : " + se.getSQLState()  ) ;
				System.out.println( "Message: " + se.getMessage()   ) ;
				System.out.println( "Error  : " + se.getErrorCode() ) ;

				se = se.getNextException() ;
			}
			
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public void updateCustomer(int customerNo, double creditLimit) {
		
		try {
			con = this.getConnection();
			
			String command = "UPDATE CUSTOMER SET"
					+ " CREDITLIMIT=? "
					+ "WHERE CUSTOMERNUMBER=?";		
			
			java.sql.PreparedStatement ps;
			
			ps = con.prepareStatement(command);
			ps.setDouble(1, creditLimit);
			ps.setInt(2, customerNo);
			
			ps.executeUpdate();
			
			System.out.println("Change applied");
			
			con.close();
			
		} catch (SQLException se) {
			System.out.println( "SQL Exception:" ) ;
			
			// Loop through the SQL Exceptions
			while( se != null ){
				System.out.println( "State  : " + se.getSQLState()  ) ;
				System.out.println( "Message: " + se.getMessage()   ) ;
				System.out.println( "Error  : " + se.getErrorCode() ) ;

				se = se.getNextException() ;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}
	
	private Connection getConnection() throws ClassNotFoundException, SQLException {
		// Load the database driver
		Class.forName( "com.mysql.jdbc.Driver" ) ;

		// Get a connection to the database
		Connection conn = DriverManager.getConnection( "jdbc:mysql://localhost:3306/test", "root", "" ) ;

	    return conn;
	}
}
