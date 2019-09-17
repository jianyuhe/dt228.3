<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP List Users Records</title>
</head>
<body>
    <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/test"
        user="root" password=""
    />
<%@page import="java.util.ArrayList"%>  
<%@page import="com.example.command.CheckStudentCommand"%> 
 <%@page import="com.example.business.student"%> 
 <%     student info = (student) session.getAttribute("student");%>
  
   <% String studentid = info.getId(); %>
        
    <sql:query var="listBooks"   dataSource="${myDS}">
        SELECT * FROM Library where borrower is not null;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of Books</h2></caption>
            <tr>
                <th>Book Id</th>
                <th>Book Title</th>

                <th>Book Borrower</th>
            </tr>
            <c:forEach var="Library" items="${listBooks.rows}">
                <tr>
                    <td><c:out value="${Library.bookId}" /></td>
                    <td><c:out value="${Library.bookTitle}" /></td>

                    <td><c:out value="${Library.borrower}" /></td>
                 <td> <form action="FrontController" method="post">     
                    <input type="hidden" name="action" value="return" />
                    <input type="hidden" name="returnId" value="${Library.bookId}" />
                    <input type="hidden" name="studentIn" value="${info}" />
                <input type="submit" value="Return" />
                 </form> </td>
                 
                </tr>
            </c:forEach>
        </table>
    </div>
    
  <br/>
  <br/>
  
  <a align="center" href="studentInfo.jsp">Return to Student Infomation Page</a>
</body>
</html>