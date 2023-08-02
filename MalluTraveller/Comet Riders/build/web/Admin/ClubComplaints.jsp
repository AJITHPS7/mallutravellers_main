<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DatabaseConnection.ConnectionClass" id="obj"></jsp:useBean>






    <%@include file="Links.jsp" %>
    <%@include file="Header.jsp" %>


<table align="center" border="1">
           

                        <tr>
                            <th>Complaint </th>
                          
                              <th>Date</th> 
                              <th>Club Name</th>
                               <th>Contact</th>
                              
                        </tr>
                        
                        <%
                            String sel="select * from tbl_complaints cm inner join tbl_riderclub rc on cm.club_id=rc.club_id";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <tr>
                                    <td><%= rs.getString("complaint_content") %></td>
                                    
                                    <td><%= rs.getString("complaint_date") %></td>
                                    <td><%= rs.getString("club_name") %></td>
                                    <td><%= rs.getString("club_contact") %></td>
                                    <td>   <a href="complaintreply.jsp?compid=<%=rs.getString("complaints_id") %>">Reply</a>

                                    </td>
                                    
                                </tr>
                                
                            <%
                                    }
                            %>
                                     

                    </table>
                            
                            
                               <%@include file="Footer.jsp" %>