<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DatabaseConnection.ConnectionClass" id="obj"></jsp:useBean>


<%
         if(request.getParameter("ridersid")!=null)
         {
           String del="update tbl_userregistration set user_status='1' where user_reg_id='"+request.getParameter("ridersid")+"'";
          out.print("del"+del);
           obj.executeCommand(del);
           
           //response.sendRedirect("View-RidersList.jsp");
         
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
                            String sel="select * from tbl_userregistration rc inner join tbl_place pl on pl.place_id=rc.place_id where rc.user_status=0";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <tr>
                                    <td><%= rs.getString("user_name") %></td>
                                    <td><%= rs.getString("user_email") %></td>
                                    <td><%= rs.getString("user_contact") %></td>
                                    <td><%= rs.getString("user_address") %></td>
                                    <td><%= rs.getString("place_name") %></td>
                                    <td><%= rs.getString("user_vregno") %></td>
                                    <td><a href="../Guest/lProof/<%= rs.getString("user_lproof") %>"download>Download</a></td>
                                  
                                    <td><a href="View-RidersList.jsp?ridersid=<%= rs.getString("user_reg_id") %>">Ban Or Remove</a></td>
                                    
                                </tr>
                                
                            <%
                                    }
                            %>
                                       

                    </table>
                            
                             <%@include file="Footer.jsp" %>