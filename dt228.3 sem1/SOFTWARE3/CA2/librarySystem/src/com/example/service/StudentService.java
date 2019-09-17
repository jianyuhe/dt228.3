package com.example.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.business.student;
import com.example.dao.StudentDao;
import com.example.exceptions.DaoException;

public class StudentService{

	StudentDao dao = new StudentDao();
	
	public student checkid(String sid){
		
		student u = null;
		try {			
			u = dao.findStudentId(sid);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return u;
		
	}
	
public void goBorrow(String sid){
		
		
		try {			
		 dao.doBorrow(sid);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		
		
	}

public void goReturn(String sid){
	
	
	try {			
	 dao.returned(sid);
	} 
	catch (DaoException e) {
		e.printStackTrace();
	}
	
	
}

public String stateB(String sid){
	String borrow = null;
	
	try {			
	 borrow = dao.stateB(sid);
	} 
	catch (DaoException e) {
		e.printStackTrace();
	}
	return borrow;
	
}

public String stateR(String sid){
	String returned = null;
	
	try {			
	 returned = dao.stateR(sid);
	} 
	catch (DaoException e) {
		e.printStackTrace();
	}
	return returned;
	
}

public String name(String sid){
	String name = null;
	
	try {			
	 name = dao.name(sid);
	} 
	catch (DaoException e) {
		e.printStackTrace();
	}
	return name;
	
}
	
	}

