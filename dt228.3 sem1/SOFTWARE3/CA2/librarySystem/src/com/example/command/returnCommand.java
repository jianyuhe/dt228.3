package com.example.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.business.student;
import com.example.command.CheckStudentCommand;
import com.example.service.StudentService;
import com.example.service.libraryService;
import com.example.business.library;

public class returnCommand implements Command {
StudentService students = new StudentService();
libraryService librarys = new libraryService();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse repsonse){
		HttpSession session = request.getSession();
		String bookid = request.getParameter("returnId");
	
		String forwardToJsp = "";		
		String info = (String) session.getAttribute("studentid");
		 
		String studentId = info;

		
		students.goReturn(studentId);
        librarys.doreturned(bookid);
		forwardToJsp = "/borrowed.jsp";
		
		return forwardToJsp;
	}

}
