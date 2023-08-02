<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DatabaseConnection.ConnectionClass" id="obj"></jsp:useBean>


  <%
         if(request.getParameter("shopid")!=null)
         {
           String del="update tbl_shop set shop_status='1' where shop_id='"+request.getParameter("shopid")+"'";
           obj.executeCommand(del);
           response.sendRedirect("ViewShops.jsp");
         
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
                              <th>Place</th>
                              <th>Action</th>
                              <th>Action</th>
                        </tr>
                        
                        <%
                            String sel="select * from tbl_shop sh inner join tbl_place pl on sh.place_id=pl.place_id inner join tbl_district dis on pl.district_id=dis.district_id where sh.shop_status='0' ";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <tr>
                                    <td><%= rs.getString("shop_name") %></td>
                                    <td><%= rs.getString("shop_emailid") %></td>
                                    <td><%= rs.getString("shop_contact") %></td>
                                    <td><%= rs.getString("shop_address") %></td>
                                    <td><%= rs.getString("district_name") %></td>
                                    <td><%= rs.getString("place_name") %></td>
                                    <td><a href="../Guest/Shopproof/<%= rs.getString("shop_proof") %>"download>Download</a></td>
                                  
                                    <td><a href="ViewShops.jsp?shopid=<%= rs.getString("shop_id") %>">Ban Or Remove</a></td>
                                    
                                </tr>
                                
                            <%
                                    }
                            %>
                                      

                    </table>
                              <%@include file="Footer.jsp" %>