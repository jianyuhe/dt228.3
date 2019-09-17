package com.example.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.example.business.student;
import com.example.command.CheckStudentCommand;
import com.example.service.StudentService;
import com.example.service.libraryService;
import com.example.business.library;

public class BorrowCommand implements Command {
StudentService students = new StudentService();
libraryService librarys = new libraryService();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse repsonse){
		HttpSession session = request.getSession();
		String bookid = request.getParameter("borrowId");
		int bookst = Integer.parseInt(request.getParameter("bookStock"));
		String forwardToJsp = "";		
		String info = (String) session.getAttribute("studentid");
		
		String studentId = info;
		String studentName = students.name(info);
		
		String borrowed = students.stateB(info);
		
        if(borrowed.equals("F"))
        {       
        	students.goBorrow(studentId);
            librarys.Borrowbook(studentName,bookst, bookid);
          
        }
        else
        {
        
        	System.out.print("can not borrow more then one book");
        }
		forwardToJsp = "/library.jsp";
		
		
		return forwardToJsp;
	}

}
