<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <form action="FrontController" method="post">
                 
                <input type="hidden" name="action" value="studentInfo" />
                <input type="submit" value="Check Student Information" />
            </form>

<form action="FrontController" method="post">
                 
                <input type="hidden" name="action" value="processBook" />
                <input type="submit" value="Procee Books for Student" />
            </form>
</body>
</html>