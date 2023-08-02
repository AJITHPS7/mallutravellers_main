<%-- 
    Document   : HomePage
    Created on : 8 Feb, 2020, 5:28:56 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>

<jsp:useBean class="DatabaseConnection.ConnectionClass" id="obj"></jsp:useBean>
<!DOCTYPE html>
<%
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
            <%@include file="Links.jsp" %>

    </head>
    <body>
                <%@include file="Header.jsp" %>

        <h1> Welcome Comet</h1>
        
                  <%@include file="Footer.jsp" %>

    </body>
</html>
