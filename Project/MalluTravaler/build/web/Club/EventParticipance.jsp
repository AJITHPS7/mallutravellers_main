<%-- 
    Document   : EventParticipance
    Created on : Apr 11, 2021, 11:38:59 AM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table align="center" border="1" cellpadding="10" style="border-collapse:collapse;">

    <tr>
        <td>SI.No</td>
      <td>Event id</td>
        <td>Rider Name</td>
        <td>Rider Contact</td>
        <td>Rider Email</td>
        <td>Rvent Bookdate</td>
    </tr>
        
        <%              
            
        int i = 0;
        String sel = "select * from  tbl_eventbook eb inner join tbl_riders r on r.riders_id=eb.rider_id where event_id='"+request.getParameter("eventparticipant")+"'";
        out.println(sel);
        ResultSet rs = con.selectCommand(sel);
        while (rs.next()) {
            i++;
    %>
    
        <tr>
        <td><%=i%></td>
        <td><%=rs.getString("event_id")%></td>
        <td><%=rs.getString("riders_name")%></td>
        <td><%=rs.getString("riders_contact")%></td>
        <td><%=rs.getString("riders_email")%></td>
        <td><%=rs.getString("eventbook_date")%></td>
        </tr>
        
    
    <%
        }
    %>
    </table>
    </body>
</html>
