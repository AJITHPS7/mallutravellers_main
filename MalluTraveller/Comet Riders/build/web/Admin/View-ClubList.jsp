<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DatabaseConnection.ConnectionClass" id="obj"></jsp:useBean>


<%
         if(request.getParameter("clubid")!=null)
         {
           String del="update tbl_riderclub set club_pstatus='1' where club_id='"+request.getParameter("clubid")+"'";
           obj.executeCommand(del);
           response.sendRedirect("View-ClubList.jsp");
         
         }
         
       %>



    <%@include file="Links.jsp" %>

<%@include file="Header.jsp" %>

<table align="center" border="1">
            

                        <tr>
                            <th>Name</th>
                             <th>Email</th>
                              <th>Contact</th> 
                              <th>Address</th>
                               <th>District</th>
                              <th>Vehicle Details</th>
                              <th>Proof</th>
                              <th>Action</th>
                        </tr>
                        
                        <%
                            String sel="select * from tbl_riderclub rc inner join tbl_district dis on rc.district_id=dis.district_id inner join tbl_vehicledetails vd on rc.vehicle_detail_id=vd.vehicle_detail_id where rc.club_pstatus='0'";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <tr>
                                    <td><%= rs.getString("club_name") %></td>
                                    <td><%= rs.getString("club_email") %></td>
                                    <td><%= rs.getString("club_contact") %></td>
                                    <td><%= rs.getString("club_address") %></td>
                                    <td><%= rs.getString("district_name") %></td>
                                    <td><%= rs.getString("vehicle_name") %></td>
                                    <td><a href="../Guest/clubProof/<%= rs.getString("club_proof") %>"download>Download</a></td>
                                  
                                    <td><a href="View-ClubList.jsp?clubid=<%= rs.getString("club_id") %>">Ban Or Remove</a></td>
                                    
                                </tr>
                                
                            <%
                                    }
                            %>
                                        <%@include file="Footer.jsp" %>

                    </table>