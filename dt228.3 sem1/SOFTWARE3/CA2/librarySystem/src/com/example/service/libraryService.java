package com.example.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.example.business.library;
import com.example.business.student;
import com.example.dao.libraryDao;
import com.example.exceptions.DaoException;

public class libraryService{

	libraryDao dao = new libraryDao();
	

	
public void Borrowbook(String borrower,int bs, String bid){
		
		
		try {			
		 dao.borrowed(borrower,bs, bid);
		} 
		catch (DaoException e) {
			e.printStackTrace();
		}
		
		
	}

public void doreturned(String bid){
	
	
	try {			
	 dao.returned(bid);
	} 
	catch (DaoException e) {
		e.printStackTrace();
	}
	
	
}

public library listBook(){
	
	library u = null;
	try {			
		u = dao.allBook();
	} 
	catch (DaoException e) {
		e.printStackTrace();
	}
	return u;
	
}
}
	  
	

