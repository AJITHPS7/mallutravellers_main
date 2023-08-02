<%-- 
    Document   : vehicletype
    Created on : 29 Jan, 2020, 7:10:48 PM
    Author     : dell
--%>

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
             String vehicletype="";
        vehicletype=request.getParameter("txtvehicletype");
        
         if(request.getParameter("btnsave")!=null)
        {
           
                    String InsQry="insert into tbl_vehicletype(vehicle_type_name)values('"+vehicletype+"')";
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
                    %>
      
        <form>
            <table>
                <tr>
                    <td>
                       Vehicle Type
                    </td>
                    <td>
                        <input type="text" name="txtvehicletype" required="" autocomplete="off" pattern="[a-zA-Z. ]{4,20}" title="please fill correctly" >
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
