<%-- 
    Document   : Ajax.place
    Created on : Mar 9, 2021, 2:51:05 PM
    Author     : Ajay P S
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
          <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <option>-------Select Place------</option>
         <%
                                        String sel3="select * from tbl_place where district_id='"+request.getParameter("disid")+"'";
                                        ResultSet rs3=con.selectCommand(sel3);
                                        while(rs3.next())
                                        {
                                            %>
                                           
                                    <option value="<%= rs3.getString("place_id") %>"><%= rs3.getString("place_name") %></option>
                                         <%  
                                        }
                                %>
    </body>
</html>