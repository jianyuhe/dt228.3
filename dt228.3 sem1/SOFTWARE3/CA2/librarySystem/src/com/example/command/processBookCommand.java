package com.example.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class processBookCommand implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse repsonse){
		
		String forwardToJsp = "";	
		return forwardToJsp = "/allBook.jsp";
	}
}
