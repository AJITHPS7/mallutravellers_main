<%-- 
    Document   : Event
    Created on : Apr 7, 2021, 2:49:07 PM
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
        
        <form method="post">
  <table border="1" align="center" cellpadding="10" style="border-collapse:collapse; ">
                <tr>
                    <td>SI.No</td>
                    <td>name</td>
                    <td>District</td>
                    <td>Vehicle Type</td>
                    <td>Landmark 1</td>
                    <td>Landmark 2</td>
                    <td>Event Date</td>
                    <td>Rules</td>
                    <td>Entry Fees</td>
                    <td>offroadevent_type</td>
                    <td>Action</td>
                </tr>
                <%                int i = 0;
                    String sel2 = "select * from tbl_offroadevents o inner join tbl_district d on o.district_id=d.district_id inner join tbl_vehicletype vt on o.vehicletype_id=vt.vehicletype_id ";
                    // out.print(sel2);
                    ResultSet rs3 = con.selectCommand(sel2);
                    while (rs3.next()) {
                        i++;
                    
          %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs3.getString("offroadevent_name")%></td>
                    <td><%=rs3.getString("district_name")%></td>
                    <td><%=rs3.getString("vehicletype_name")%></td>
                    <td><%=rs3.getString("district_location1")%></td>
                    <td><%=rs3.getString("district_location2")%></td>
                    <td><%=rs3.getString("offroadevent_date")%></td>
                    <td><img src="../Assets/Offroadeventrules/<%=rs3.getString("offroadevent_rules")%>" width="120" height="120"></td>
                    <td><%=rs3.getString("offroadevent_regfees")%></td>
                    <td><%=rs3.getString("offroadevent_type")%></td>
                    <td><a href="EventDetails.jsp?evid=<%=rs3.getString("offroadevent_id")%>">Join</a></td>
                    <%
                    }
                    %>
               
  </table>
                    
                    </form>           
    </body>
</html>
