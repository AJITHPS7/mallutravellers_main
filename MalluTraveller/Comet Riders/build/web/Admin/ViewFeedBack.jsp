<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DatabaseConnection.ConnectionClass" id="obj"></jsp:useBean>






    <%@include file="Links.jsp" %>
    <%@include file="Header.jsp" %>


<table align="center" border="1">
           

                        <tr>
                            <th>Feed Back </th>
                          
                              <th>Date</th> 
                              <th>User Name</th>
                               <th>Contact</th>
                              
                        </tr>
                        
                        <%
                            String sel="select * from tbl_feedback cm inner join tbl_userregistration ur on cm.user_reg_id=ur.user_reg_id";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <tr>
                                    <td><%= rs.getString("feedback") %></td>
                                    
                                    <td><%= rs.getString("curdate") %></td>
                                    <td><%= rs.getString("user_name") %></td>
                                    <td><%= rs.getString("user_contact") %></td>
                                 

                                      
                                </tr>
                                
                            <%
                                    }
                            %>
                                     

                    </table>
                            
                            
                               <%@include file="Footer.jsp" %>