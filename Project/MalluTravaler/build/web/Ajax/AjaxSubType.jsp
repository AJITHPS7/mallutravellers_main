<%-- 
    Document   : Ajaxsubtype
    Created on : Mar 20, 2021, 11:36:01 AM
    Author     : Ajay P S
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
          <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ajaxsubtype</title>
    </head>
    <body>
    <option>-------Select Subtype------</option>
         <%
                                        String sel3="select * from tbl_productsubtype where producttype_id='"+request.getParameter("disid")+"'";
                                        ResultSet rs3=con.selectCommand(sel3);
                                        while(rs3.next())
                                        {
                                            %>
                                           
                                    <option value="<%= rs3.getString("productsubtype_id") %>"><%= rs3.getString("productsubtype_name") %></option>
                                         <%  
                                        }
                                %>
    </body>
</html>
