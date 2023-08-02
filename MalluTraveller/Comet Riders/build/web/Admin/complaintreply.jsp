<%-- 
    Document   : Place
    Created on : 19 Jan, 2020, 2:26:44 PM
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
          if(request.getParameter("compid")!=null)
        {
          session.setAttribute("compid",request.getParameter("compid"));
        }
             String reply="";
        
        reply=request.getParameter("txtreply");
         
         if(request.getParameter("btnsave")!=null)
        {
           
                    String Update="update tbl_complaints set complaint_reply='"+request.getParameter("txtreply")+"'where complaints_id='"+session.getAttribute("compid")+"'";
                    boolean b=obj.executeCommand(Update);
                    //out.print("InsQry"+InsQry);
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
                    %>
      
        <form>
            <table>
                 <tr>
                    <td>
                       Reply
                    </td>
                    <td>
                        <textarea name="txtreply" required="" ></textarea>
                     

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
                                <%@include file="Footer.jsp" %>

    </body>
</html>
