package com.example.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.business.librarian;
import com.example.service.librarianService;

public class LoginCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse repsonse){
			
		librarianService userService = new librarianService();
		String forwardToJsp = "";		

		String librarainId = request.getParameter("librarianId");
		String librarainName = request.getParameter("librarianName");


		//Check we have a username and password...
		if (librarainId != null && librarainName != null){

			//Make call to the 'Model' using the UserServive class to login...
			librarian check = userService.checkid(librarainId, librarainName);

			if (check != null){

				//If login successful, store the session id for this client...
				HttpSession session = request.getSession();
				String clientSessionId = session.getId();
				session.setAttribute("loggedSessionIdLibrarian", clientSessionId);

				session.setAttribute("librarian", check);

				forwardToJsp = "/login.html";				
			}
			else{
				forwardToJsp = "/loginFailure.jsp";	
			}
		}
		else {
			forwardToJsp = "/loginFailure.jsp";	
		}
		return forwardToJsp;
	}

}
