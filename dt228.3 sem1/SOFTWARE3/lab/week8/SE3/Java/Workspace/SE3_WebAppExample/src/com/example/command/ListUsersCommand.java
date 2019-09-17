package com.example.command;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.business.User;
import com.example.service.UserService;
public class ListUsersCommand implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse repsonse){
		UserService userService = new UserService();
		
		String forwardToJsp = "";
		 ArrayList<String> listUser;
		try {

			listUser = userService.listAllUsers();
			 
			 request.setAttribute("users", listUser);
			 
			 forwardToJsp = "/listuser.jsp";

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		 
		 
		return forwardToJsp;
		
		
		
		
	}

}
