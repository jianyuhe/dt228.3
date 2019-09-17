package com.example.business;

import java.io.Serializable;

public class student implements Serializable{


	private static final long serialVersionUID = 1L;
	private String studentId;
	private String studentName;
	private String borrow;
	private String returned;

	
	
	public student(String studentId, String studentName, String borrow,
			String returned) {
		
		setId(studentId);
		setStudentName(studentName);
		setBorrow(borrow);
		setReturn(returned);
	
	}
	
	public String getId() {
		return studentId;
	}
	public void setId(String studentId) {
		this.studentId = studentId;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getBorrow() {
		return borrow;
	}
	public void setBorrow(String borrow) {
		this.borrow = borrow;
	}
	public String getReturn() {
		return returned;
	}
	public void setReturn(String returned) {
		this.returned = returned;
	}

	
}
