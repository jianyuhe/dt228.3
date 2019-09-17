package com.example.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.business.librarian;
import com.example.dao.librarianDao;
import com.example.exceptions.DaoException;

public class librarianService{

	librarianDao dao = new librarianDao();
	
	public librarian checkid(String lid, String lname){
		
		librarian u = null;
		try {			
			u = dao.login(lid, lname);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		return u;
		
	}
	  
	
	}

