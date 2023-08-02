<%-- 
    Document   : EventDetails
    Created on : Apr 7, 2021, 3:04:05 PM
    Author     : Ajay P S
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<%
     
     if(request.getParameter("btnsub")!=null){
     
     
         String ins="insert into tbl_eventbook(event_id,rider_id,eventbook_date)value('"+request.getParameter("evid")+"','"+session.getAttribute("rid")+"',curdate())";
        out.println(ins);
         if(con.executeCommand(ins))
         {
          
             out.print("Data Saved");
         
         }else{
         
         
             out.print("Insertion Failed");
         }
     
     
     
     
     }
     %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post">
            <table>
        
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
                    
                </tr>
                <%                int i = 0;
            String evid=request.getParameter("evid");
            String sel2 = "select * from tbl_offroadevents o inner join tbl_district d on o.district_id=d.district_id inner join tbl_vehicletype vt on o.vehicletype_id=vt.vehicletype_id where offroadevent_id='"+evid+"'";
          
                    //                     out.print(sel2);
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
                    <%
                    }
                    %>
                     <tr>
                    <td><input type="submit" name="btnsub" value="Book Now"></td>
                </tr>
            </table>
        </form>
    </body>
</html>
