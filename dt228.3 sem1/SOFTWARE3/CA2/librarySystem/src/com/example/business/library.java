package com.example.business;

import java.io.Serializable;

public class library implements Serializable{


	private static final long serialVersionUID = 1L;
	private String bookid;
	private String booktitle;
	private int bookstock;
	private String borrower;

	
	
	public library(String bookid, String booktitle, int bookstock,
			String borrower) {
		
		setId(bookid);
		setBookTitle(booktitle);
		setBookStock(bookstock);
		setBorrower(borrower);
	
	}
	
	public String getId() {
		return bookid;
	}
	public void setId(String bookid) {
		this.bookid = bookid;
	}
	public String getBookTitle() {
		return booktitle;
	}
	public void setBookTitle(String booktitle) {
		this.booktitle = booktitle;
	}
	public int getBookStock() {
		return bookstock;
	}
	public void setBookStock(int bookstock) {
		this.bookstock = bookstock;
	}
	public String getBorrower() {
		return borrower;
	}
	public void setBorrower(String borrower) {
		this.borrower = borrower;
	}

	
}
