<%-- 
    Document   : District
    Created on : 19 Jan, 2020, 1:02:43 PM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean class="DatabaseConnection.ConnectionClass" id="obj"></jsp:useBean>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MalluTraveller::Disrict</title>
            <%@include file="Links.jsp" %>

    </head>
    <body>
                <%@include file="Header.jsp" %>

      <%
             String district_name="";
             String disName="",disId="";
        district_name=request.getParameter("txtdistrict");
        
         if(request.getParameter("btnsave")!=null)
        {
           if(request.getParameter("txthid")!="")
                {

                String up="update tbl_district set district_name='"+request.getParameter("txtdistrict")+"' where district_id='"+request.getParameter("txthid")+"'";
               // out.print("Update"+up);
                obj.executeCommand(up);
                response.sendRedirect("District.jsp");

                }
           else
                            {
                                     String InsQry="insert into tbl_district(district_name)values('"+district_name+"')";
                                     //out.print("Insert"+InsQry);
                                     boolean b=obj.executeCommand(InsQry);
                                     if(b==true)
                                     {
                                     %>
                                         <script>alert('success')</script>
                                   <%

                                     }
                                     else
                                     {
                                         out.println("fail");
                                     }
            }
        }
         
         if(request.getParameter("delid")!=null)
         {
           String del="delete from tbl_district where district_id='"+request.getParameter("delid")+"'";
           obj.executeCommand(del);
           response.sendRedirect("District.jsp");
         
         }
         
         if(request.getParameter("edid")!=null)
         {
           
           String sel="select * from tbl_district where district_id='"+request.getParameter("edid")+"'";
           System.out.println("hii"+sel);
           ResultSet rs=obj.selectCommand(sel);
           if(rs.next())
           {
           disId=rs.getString("district_id");
           disName=rs.getString("district_name");
           }
         
         }
                    %>
      
        <form>
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>
                       District
                    </td>
                    <td>
                        <input type="text" name="txtdistrict" value="<%= disName %>" required="" autocomplete="off" pattern="[a-zA-Z. ]{4,20}" title="please fill correctly" >
                        <input type="hidden" name="txthid" value="<%= disId %>" >
                    </td>
                </tr>
                
                <tr>
                <td>
                   
                    <input type="submit" name="btnsave" value="SAVE">
                </td>
           
                <td>
                   
                    <input type="submit" name="btncancel" value="CANCEL">
                </td>
            </tr>
            </table>
        </form>
                    <br>
                    <br>
                    <HR>
                    <table align="center" border="1">
                        <tr>
                            <th>District</th>
                            <th colspan="2">Action</th>
                        </tr>
                        
                        <%
                            String sel="select * from tbl_district";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <tr>
                                    <td><%= rs.getString("district_name") %></td>
                                    <td><a href="District.jsp?edid=<%= rs.getString("district_id") %>">Edit</a></td>
                                    <td><a href="District.jsp?delid=<%= rs.getString("district_id") %>"><img src="../Assets/icons/delete.png" width="60" height="60" title="Delete Now"></a></td>
                                    
                                </tr>
                                
                            <%
                                    }
                            %>
                    </table>
                                <%@include file="Footer.jsp" %>

    </body>
</html>
