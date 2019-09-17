package com.example.business;

import java.io.Serializable;

public class librarian implements Serializable{


	private static final long serialVersionUID = 1L;
	private String librarianId;
	private String librarianName;
	private String isStudent;

	
	
	public librarian(String librarianId, String librarianName, String isStudent
			) {
		
		setId(librarianId);
		setlibrarianName(librarianName);
		setisStudent(isStudent);
		
	
	}
	
	public String getId() {
		return librarianId;
	}
	public void setId(String librarianId) {
		this.librarianId = librarianId;
	}
	public String getlibrarianName() {
		return librarianName;
	}
	public void setlibrarianName(String librarianName) {
		this.librarianName = librarianName;
	}
	public String getisStudent() {
		return isStudent;
	}
	public void setisStudent(String isStudent) {
		this.isStudent = isStudent;
	}


	
}
