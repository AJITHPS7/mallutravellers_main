<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DatabaseConnection.ConnectionClass" id="obj"></jsp:useBean>

  <%@include file="Links.jsp" %>
    <%@include file="Header.jsp" %>

<%
         if(request.getParameter("rideid")!=null)
         {
           String del="update tbl_ride set ride_status='1' where ride_id='"+request.getParameter("rideid")+"'";
           obj.executeCommand(del);
           response.sendRedirect("View-RideList.jsp");
         
         }
         

%>
  


<table align="center" border="1">
           

                        <tr>
                            <th>Name</th>
                          
                              <th>Starting date</th> 
                              <th>Time</th>
                               <th>District</th>
                              <th>Ride Members Count </th>
                              <th>Rules</th>
                              <th>Action</th>
                        </tr>
                        
                        <%
                            String sel="select * from tbl_ride rc inner join tbl_district dis on rc.district_id=dis.district_id";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <tr>
                                    <td><%= rs.getString("ride_name") %></td>
                                    
                                    <td><%= rs.getString("ride_sdate") %></td>
                                    <td><%= rs.getString("ride_stime") %></td>
                                    <td><%= rs.getString("district_name") %></td>
                                    <td><%= rs.getString("ride_memberscount") %></td>
                                    <td><a href="../Club/Clubrules/<%= rs.getString("ride_rules") %>"download>Download</a></td>
                                  
                                    <td><a href="View-RideList.jsp?rideid=<%= rs.getString("ride_id") %>">Ban Or Remove</a></td>
                                    
                                </tr>
                                
                            <%
                                    }
                            %>
                                     

                    </table>
                            
                            
                               <%@include file="Footer.jsp" %>