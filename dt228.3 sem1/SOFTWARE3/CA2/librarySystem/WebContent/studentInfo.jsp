<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.util.ArrayList"%>  
<%@page import="com.example.service.StudentService"%> 
 <%@page import="com.example.business.student"%> 
 <% StudentService student = new StudentService();%>
 
<%     String info = (String) session.getAttribute("studentid");%>
<% String borrow = student.stateB(info); %> 
<% String returned = student.stateR(info); %> 
<% String name = student.name(info); %> 

<table>
<tr>
                        <td> Student ID  : </td><td> <% out.println(info); %></td> 
                    </tr>
                    <tr>
                        <td> Student Name  : </td><td> <% out.println(name); %></td> 
                    </tr>
                    <tr>
                        <td> Student Borrow Book?  : </td><td> <% out.println(borrow); %></td> 
                    </tr>
                    
                    <tr>
                        <td> Student Return Book?  : </td><td> <% out.println(returned); %></td> 
                    </tr>
       <tr>             
 <form action="FrontController" method="post">
                 
                <input type="hidden" name="action" value="borrowBook" />
                <input type="submit" value="Go to Library" />
            </form>

<form action="FrontController" method="post">
                 
                <input type="hidden" name="action" value="returnBook" />
                <input type="submit" value="Show Books Already borrow" />
            </form>
</tr>
</table>
<br/><br/>
  <a  align="center" href="process.jsp">Return to Process Page</a>
</body>
</html>