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
<%@page import="com.example.service.UserService"%> 
<%@page import="java.util.Iterator"%>  
<%      ArrayList<String> list = (ArrayList) request.getAttribute("users");%>
<table cellspacing="1" cellpadding="4" border="3">
        <tr>
            <TH>
                ID
            </TH>
            <TH>
                FirstName
            </TH>
            <TH>
                LastName
            </TH>
            <TH>
                Username
            </TH>
            <TH>
                Password
            </TH>
        </tr>

        <tr>
            <% for (int i = 0; i < list.size(); i++) {
                for (int j = 0; j < 4; j++) {
            %>
            <td>
                <center>
                    <% out.println(list.get(i)); %>
                </center>
            </td>
            <% } %>
        </tr>
        <% } %>
</table>

</body>
</html>