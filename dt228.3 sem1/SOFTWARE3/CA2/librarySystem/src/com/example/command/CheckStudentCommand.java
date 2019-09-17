package com.example.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.business.student;
import com.example.service.StudentService;

public class CheckStudentCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse repsonse){
			
		StudentService userService = new StudentService();
		String forwardToJsp = "";		

		String studentId = request.getParameter("studentId");

		
		//Check we have a username and password...
		if (studentId != null){

			//Make call to the 'Model' using the UserServive class to login...
			student check = userService.checkid(studentId);

			if (check != null){

				//If login successful, store the session id for this client...
				HttpSession session = request.getSession();
				String clientSessionId = session.getId();
				session.setAttribute("loggedSessionId", clientSessionId);
				session.setAttribute("studentid", studentId);
				session.setAttribute("student", check);

				forwardToJsp = "/process.jsp";				
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
