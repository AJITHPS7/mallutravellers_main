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
        <title>JSP Page</title>
            <%@include file="Links.jsp" %>

    </head>
    <body>
                <%@include file="Header.jsp" %>

      <%
             String eventtype="";
             String typeName="",typeId="";
        eventtype=request.getParameter("txttype");
        
         if(request.getParameter("btnsave")!=null)
        {
           if(request.getParameter("txthid")!="")
                {

                String up="update tbl_eventtype set event_typename='"+request.getParameter("txttype")+"' where event_typeid='"+request.getParameter("txthid")+"'";
               // out.print("Update"+up);
                obj.executeCommand(up);
                response.sendRedirect("EventType.jsp");

                }
           else
                            {
                                     String InsQry="insert into tbl_eventtype(event_typename)values('"+eventtype+"')";
                                     out.print("Insert"+InsQry);
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
           String del="delete from tbl_eventtype where event_typeid='"+request.getParameter("delid")+"'";
           obj.executeCommand(del);
           response.sendRedirect("EventType.jsp");
         
         }
         
         if(request.getParameter("edid")!=null)
         {
           
           String sel="select * from tbl_eventtype where event_typeid='"+request.getParameter("edid")+"'";
           System.out.println("hii"+sel);
           ResultSet rs=obj.selectCommand(sel);
           if(rs.next())
           {
           typeId=rs.getString("event_typeid");
           typeName=rs.getString("event_typename");
           }
         
         }
                    %>
      
        <form>
            <table align="center" border="1" cellpadding="10">
                <tr>
                    <td>
                       Event Type
                    </td>
                    <td>
                        <input type="text" name="txttype" value="<%= typeName %>" required="" autocomplete="off" pattern="[a-zA-Z. ]{4,20}" title="please fill correctly" >
                        <input type="hidden" name="txthid" value="<%= typeId %>" >
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
                            <th>Event Type</th>
                            <th colspan="2">Action</th>
                        </tr>
                        
                        <%
                            String sel="select * from tbl_eventtype";
                            ResultSet rs=obj.selectCommand(sel);
                            while(rs.next())
                            {
                                %>
                                <tr>
                                    <td><%= rs.getString("event_typename") %></td>
                                    <td><a href="EventType.jsp?edid=<%= rs.getString("event_typeid") %>">Edit</a></td>
                                    <td><a href="EventType.jsp?delid=<%= rs.getString("event_typeid") %>"><img src="../Assets/icons/delete.png" width="60" height="60" title="Delete Now"></a></td>
                                    
                                </tr>
                                
                            <%
                                    }
                            %>
                    </table>
                                <%@include file="Footer.jsp" %>

    </body>
</html>
