<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<br/> <br/>
 <form align="center" action="FrontController" method="post">
                 
                <input type="hidden" name="action" value="studentInfo" />
                <input type="submit" value="Check Student Information" />
            </form>
<br/><br/> 
<form align="center" action="FrontController" method="post">
                 
                <input type="hidden" name="action" value="processBook" />
                <input type="submit" value="View All Book" />
            </form>
            <br/><br/>
              <a  align="center" href="login.html">Return to Check Student ID Page</a>
</body>
</html>