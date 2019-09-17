package com.example.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.business.User;
import com.example.dao.UserDao;
import com.example.exceptions.DaoException;

public class UserService{

	UserDao dao = new UserDao();
	
	public User login(String username, String password){
		
		User u = null;
		try {			
			u = dao.findUserByUsernamePassword(username, password);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return u;
		
	}
	
	public ArrayList<String> listAllUsers() throws SQLException{
      ArrayList<String> l = dao.getAllUsers();
  return l;    
	
	}
}
